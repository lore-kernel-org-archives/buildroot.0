From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Apr 2018 08:30:39 +0200
Subject: [Buildroot] [RFC PATCH] download/git: fix basename for files
 inside tarballs
In-Reply-To: <20180405031600.18831-1-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Thu, 5 Apr 2018 00:16:00 -0300")
References: <20180405031600.18831-1-ricardo.martincoski@gmail.com>
Message-ID: <87zi2imagg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Commit "6d938bcb52 download: git: introduce cache feature" introduced a
 > typo that makes the tarball to contain files without the package
 > basename:
 > $ tar -tvf good-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
 > -rw-r--r-- 0/0               8 2017-10-14 02:10 ./file

 > Historically, all tarballs are generated with the basename:
 > $ tar -tvf good-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
 > -rw-r--r-- 0/0               8 2017-10-14 02:10 good-a238b1dfcd825d47d834af3c5223417c8411d90d/file

 > The hashes in the tree were calculated with the basename.

 > In the most common scenario, after the download ends the tarball is
 > generated, the hash mismatches and the download mechanism falls back to
 > use the tarball from http://sources.buildroot.net .

 > The problem can be reproduced by forcing the download of any git package
 > PKG that has a hash file to check against:
 > $ make defconfig
 > $ ./utils/config --set-str BR2_BACKUP_SITE ""
 > $ BR2_DL_DIR=$(mktemp -d) make PKG-dirclean PKG-source

 > Fix the typo so the basename is really added to the files, that was
 > clearly the intention of the code.

Argh, indeed. Verified on the tremor package by moving the .hash file
and my old tarball. Without the patch I get:

tar -tvf tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8.tar.gz | head
-rw-r--r-- 0/0             467 2018-03-19 21:08 ./CHANGELOG
-rw-r--r-- 0/0            1466 2018-03-19 21:08 ./COPYING
-rw-r--r-- 0/0            1553 2018-03-19 21:08 ./Makefile.am
-rw-r--r-- 0/0            1941 2018-03-19 21:08 ./README
-rw-r--r-- 0/0            1186 2018-03-19 21:08 ./Version_script.in
-rw-r--r-- 0/0            6534 2018-03-19 21:08 ./asm_arm.h
-rwxr-xr-x 0/0            3657 2018-03-19 21:08 ./autogen.sh
-rw-r--r-- 0/0            4639 2018-03-19 21:08 ./backends.h
-rw-r--r-- 0/0           14547 2018-03-19 21:08 ./block.c
-rw-r--r-- 0/0            1109 2018-03-19 21:08 ./block.h

And with the patch:

tar -tvf tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8.tar.gz | head
-rw-r--r-- 0/0             467 2018-03-19 21:08 tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8/CHANGELOG
-rw-r--r-- 0/0            1466 2018-03-19 21:08 tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8/COPYING
-rw-r--r-- 0/0            1553 2018-03-19 21:08 tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8/Makefile.am
-rw-r--r-- 0/0            1941 2018-03-19 21:08 tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8/README
-rw-r--r-- 0/0            1186 2018-03-19 21:08 tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8/Version_script.in
-rw-r--r-- 0/0            6534 2018-03-19 21:08 tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8/asm_arm.h
-rwxr-xr-x 0/0            3657 2018-03-19 21:08 tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8/autogen.sh
-rw-r--r-- 0/0            4639 2018-03-19 21:08 tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8/backends.h
-rw-r--r-- 0/0           14547 2018-03-19 21:08 tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8/block.c
-rw-r--r-- 0/0            1109 2018-03-19 21:08 tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8/block.h

And the sha256sum matches our hash file.

Committed, thanks.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 > NOTICE: linux-firmware is NOT fixed by this. I don't know why.
 > I tried in my local computer a few other (other than the ones tested in
 > Gitlab CI) git packages and they are fixed by this patch as well:
 > libuci
 > squashfs
 > ubus
 > x264
 > Could it be related to my setup?
 > tar (GNU tar) 1.29
 > git version 2.14.1

Hmm, it works here. I again moved my old tarball and .hash file:


>>> linux-firmware 65b1c68c63f974d72610db38dfae49861117cae2 Downloading
Initialized empty Git repository in /var/lib/downloads/linux-firmware/git/.git/
Fetching all references
remote: Counting objects: 6321, done.
remote: Compressing objects: 100% (23/23), done.
remote: Total 6321 (delta 13), reused 0 (delta 0)
Receiving objects: 100% (6321/6321), 167.76 MiB | 1.80 MiB/s, done.
Resolving deltas: 100% (3925/3925), done.
From http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware
 * [new branch]      master     -> origin/master
warning: refname '65b1c68c63f974d72610db38dfae49861117cae2' is ambiguous.
Git normally never creates a ref that ends with 40 hex characters
because it will be ignored when you just specify 40-hex. These refs
may be created by mistake. For example,

  git checkout -b $br $(git rev-parse ...)

where "$br" is somehow empty and a 40-hex ref is created. Please
examine these refs and maybe delete them. Turn this message off by
running "git config advice.objectNameWarning false"
WARNING: no hash file for linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2.tar.gz

>>> linux-firmware 65b1c68c63f974d72610db38dfae49861117cae2 Extracting
gzip -d -c /var/lib/downloads/linux-firmware/linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2.tar.gz | tar --strip-components=1 -C /home/peko/source/buildroot/output-git/build/linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2   -xf -

sha256sum ~download/linux-firmware/linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2.tar.gz
246a0de9ef9de5076e7695c9e9399b5358bb77278ef375ed9360466d00a1a39b  /var/lib/downloads/linux-firmware/linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2.tar.gz

Which matches the .hash file and my old tarball.

So I guess there is something else going on. I'm using tar 1.29 and git 2.11.0.

-- 
Bye, Peter Korsgaard
