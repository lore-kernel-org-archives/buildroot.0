From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Apr 2018 14:17:03 +0200
Subject: [Buildroot] Per-package download folders and Git caching
Message-ID: <20180403141703.21cd24fe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As was noted in Buildroot Hackathon day 3 highlights e-mail, the patch
series changing the download infrastructure to support Git caching was
merged. This brings a number of changes visible to the Buildroot user
that are worth explaining.

Per-package download folders
============================

The first visible change is that your DL_DIR will no longer have all
files stored flat in DL_DIR, but organized into sub-folders, one per
package:

 + dl/
   + linux/
     + linux-v4.16.tar.bz2
   + busybox/
     + busybox-1.28.1.tar.bz2
     + busybox-1.28.2.tar.bz2

The benefit of such a new organization is that if two packages need to
download a file with the same name, they won't conflict anymore.

So today, if you use the latest Buildroot master and start with an
empty DL_DIR, everything will be stored in sub-folders, one per
package.

However, it is likely that many users already have a DL_DIR with a
number of files. What the new Buildroot will do is that it will first
check if the requested file is in the per-package sub-folder. If it is
not found there, it will then try to see if it is in the main DL_DIR,
and if that's the case, it will create a hard link of this file into
the per-package sub-folder. Therefore, you will see something like:

 + dl/
   + linux-v4.16.tar.bz2
   + linux/
     + linux-v4.16.tar.bz2

But the Linux tarball is not duplicated, it is only hard-linked.

This organization with per-package subfolders is also used when
getting files from the BR2_PRIMARY_SITE or the BR2_BACKUP_SITE
(sources.buildroot.net). We could therefore summarize the search logic
of Buildroot as follows:

 - Try to find the file in DL_DIR/<package>/. If found, we're good.

 - If not found, try to find the file in DL_DIR/, and if found, create
   a hard link into DL_DIR/<package>/, and then we're good.

 - If not found, go to BR2_PRIMARY_SITE/<package>/. If found, store
   the file in DL_DIR/<package>/, and we're good.

 - If not found, go to BR2_PRIMARY_SITE/. If found, store the file in
   DL_DIR/<package>/, and we're good.

 - If not found, go to the upstream location. If found, store the file
   in DL_DIR/<package>/ and we're good.

 - If not found, go to BR2_BACKUP_SITE/<package>/. If found, store the
   file in DL_DIR/<package>/, and we're good.

 - If not found, go to BR2_BACKUP_SITE/. If found, store the file in
   DL_DIR/<package>/ and we're good.

 - If not found, well, bail out with an error.

It is worth mentioning that a few packages share the same source code
(linux and linux-headers, gcc-initial and gcc-final, mesa3d and
mesa3d-headers), and even if we have per-package download folders, we
wanted to avoid downloading the tarballs for such packages twice,
especially considering that gcc and linux are quite large. To solve
this those packages have a special <pkg>_DL_SUBDIR variable, which
they use to override the name of the download sub-folder. Hence, the
tarballs for the gcc-initial and gcc-final packages are stored in
DL_DIR/gcc/, because both of those packages define <pkg>_DL_SUBDIR =
gcc.

Git caching
===========

Git caching is the primary and original motivation for this patch
series. Before getting into this, let's summarize what Buildroot was
doing to download source code from Git:

 1. Clone the Git repository. Buildroot tries hard to download only
    what's needed using a "shallow clone" but depending on the type of
    reference (tag or full SHA1) and other parameters, a "shallow
    clone" is not always possible, in which case Buildroot fell back
    to a regular full clone.

 2. Create a tarball out of the source code that has been checked out,
    without the .git/ metadata. This tarball is stored in DL_DIR/

 3. The Git clone is completely removed.

The obvious drawback is that each time you bump the version of a
package fetched from Git, you have to do a full clone of the upstream
Git repository to re-create the new tarball. This is slow and
inefficient, especially for large projects like the Linux kernel.

Therefore, what Buildroot does now is that it keeps in
DL_DIR/<package>/git/ a Git clone. This Git clone is re-used whenever
a new download from Git of the same package is done.

Let's say you start with an empty DL_DIR/linux/git/, and you start a
build with a Linux kernel fetched from the official Linux Git repo
from Linus Torvalds. Buildroot will clone it into DL_DIR/linux/git/,
and use that to create a tarball in DL_DIR/linux/ containing the Linux
source code at the version you specified. The next day, you build a
different Buildroot configuration that uses a Linux kernel fetched
from the RaspberryPi Github repository. Buildroot will see it already
has a Git clone in DL_DIR/linux/git/, and it will simply fetch the
missing Git objects from the RaspberryPi Github repository, and then
generate the tarball.

This obviously increases the disk space being used, since we keep a
clone instead of removing it after the download, but it greatly
reduces the download time. If you think that your DL_DIR has grown too
large, you can just remove whatever you want from there, including
specifically the DL_DIR/<package>/git/. Buildroot will re-clone as
needed.

It is worth mentioning that we continue to generate a tarball stored
in DL_DIR/<package>/. One might think that we could just copy/rsync
the code from DL_DIR/<package>/git/ into the package build directory,
instead of creating a tarball, and re-extracting it later in the
package build directory. However, there are a number of reasons why a
tarball is still needed:

 - Tarball is the mechanism we use to interact with the
   BR2_PRIMARY_SITE and BR2_BACKUP_SITE. BR2_PRIMARY_SITE and
   BR2_BACKUP_SITE don't backup a Git clone of the upstream project,
   but a tarball. Therefore, continuing to use tarballs make sense to
   keep this logic unchanged.

 - Tarball is the unit on which we do the hash file verification. We
   certainly don't want to store a hash of all the source files of a
   project in the package .hash file.

   Even if the SHA1 of a Git commit normally guarantees that we're
   really fetching what we think, and therefore would remove the need
   for a hash file, we still have the case of the BR2_PRIMARY_SITE and
   BR2_BACKUP_SITE that store tarballs, and we want to be sure those
   tarballs haven't been modified (maliciously or not).

 - Tarballs are needed for legal-info. We could generate them only for
   legal-info, but because of the two other reasons above, we continue
   to generate tarballs from Git repositories.

Concurrency handling
====================

Until now, all downloads were made into a temporary folder, and only
when the final tarball was ready it was moved to DL_DIR/. Thanks to
the atomic property of "mv", this allowed multiple parallel Buildroot
builds to access and populate a common DL_DIR/ without any problem.

However, with Git caching in place, the folder DL_DIR/<package>/git/
becomes shared, and can be used by multiple parallel Buildroot
builds. This required some locking, with is achieved by using
"flock". All download operations are now protected by a lock taken on
the per-package download folder, i.e DL_DIR/<package>/.

This means that parallel Buildroot builds can continue to download
files in parallel as long as they download files for different
packages. If they download files for the same package at the same
time, the lock will ensure that those operations will be
serialized. Typically this means that if you start two Buildroot
builds, and one starts cloning the Linux kernel, the other Buildroot
build will be blocked if it tries to download the Linux kernel (even
from HTTP), until the other Buildroot instance has finished cloning
the Linux kernel. You will simply see the message ">>> linux 1.2.3
downloading" and nothing happening, until the lock gets released.

For now, the lock is taken for all download methods, even if some
methods such as HTTP, do not require a lock. This is something that
might be improved in the future (patches welcome!).

Conclusion
==========

Hopefully this e-mail has been useful to people who wanted to
understand better the changes that we have brought to the download
infrastructure recently. All credits for this work obviously go to
Yann E. Morin, Maxime Hadjinlian, and Peter Seiderer.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
