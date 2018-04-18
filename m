From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 18 Apr 2018 10:28:24 -0300
Subject: [Buildroot] [PATCH 0/4] support/download: make the git backend
 more robust
References: <20180418105225.747e611e@windsurf.numericable.fr>
Message-ID: <5ad747f83aa3d_4f402af5fb1a8ea4724ef@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Apr 18, 2018 at 05:52 AM, Thomas Petazzoni wrote:

> On Wed, 18 Apr 2018 10:40:21 +0200, Thomas Petazzoni wrote:
> 
>> I have not yet tested with this patch series applied, but with the
>> current master, I see a difference in behavior between what happens on
>> my machine (recent Fedora system) and my build server (ancient Debian).
> 
> No change with the patch series applied. It does a full clone, but
> fails after that:
> 
> test at build:~/buildroot$ rm -rf ~/dl/squashfs/
> test at build:~/buildroot$ make host-squashfs-extract
>>>> host-squashfs e38956b92f738518c29734399629e7cdb33072d3 Downloading
> Initialized empty Git repository in /home/test/dl/squashfs/git/.git/
> Fetching all references 
> remote: Counting objects: 8972, done.
> remote: Total 8972 (delta 0), reused 0 (delta 0)
> Receiving objects: 100% (8972/8972), 1.56 MiB | 2.51 MiB/s, done.
> Resolving deltas: 100% (6544/6544), done.
> From https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools
>  * [new branch]      lz4        -> origin/lz4
>  * [new branch]      master     -> origin/master
>  * [new branch]      stable     -> origin/stable
> Could not fetch special ref 'e38956b92f738518c29734399629e7cdb33072d3'; assuming it is not special.
> ERROR: squashfs-e38956b92f738518c29734399629e7cdb33072d3.tar.gz has wrong sha256 hash:
> ERROR: expected: bd0aa3011320b8ebee68aa406060de277bef16daf81bad5b9f70cbea6db1a779
> ERROR: got     : c7a61e3bcabb716b268f5a341055ac5ecda8b9f2b42025f82926f201ff5c8881
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Could be the case your build server has a blacklisted tar version and you run
the commands in a clean output (actually without host-tar built)?

A quick test is to run with the series applied:
$ rm -rf ~/dl/squashfs/
$ make host-tar
$ make host-squashfs-extract
And check if the hash still mismatches.

My computer has:
git version 2.14.1
tar (GNU tar) 1.29
So in order to trigger the host-tar build I did:
$ sed -e 's,minor_max=29,minor_max=28,g' -i support/dependencies/check-host-tar.sh

In the current master with the change above, I did:
$ make clean ; make defconfig; rm -rf ~/dl/squashfs/; make host-squashfs-extract

>>> host-squashfs e38956b92f738518c29734399629e7cdb33072d3 Downloading
Initialized empty Git repository in /home/ricardo/dl/squashfs/git/.git/
Fetching all references
remote: Counting objects: 8972, done.
remote: Total 8972 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (8972/8972), 1.73 MiB | 15.00 KiB/s, done.
Resolving deltas: 100% (6529/6529), done.
From https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools
 * [new branch]      lz4        -> origin/lz4
 * [new branch]      master     -> origin/master
 * [new branch]      stable     -> origin/stable
warning: refname 'e38956b92f738518c29734399629e7cdb33072d3' is ambiguous.
Git normally never creates a ref that ends with 40 hex characters
because it will be ignored when you just specify 40-hex. These refs
may be created by mistake. For example,

  git checkout -b $br $(git rev-parse ...)

where "$br" is somehow empty and a 40-hex ref is created. Please
examine these refs and maybe delete them. Turn this message off by
running "git config advice.objectNameWarning false"
squashfs-e38956b92f738518c29734399629e7cdb33072d3.tar.gz: OK (sha256: bd0aa3011320b8ebee68aa406060de277bef16daf81bad5b9f70cbea6db1a779)
>>> host-skeleton  Extracting
>>> host-skeleton  Patching
>>> host-skeleton  Configuring
>>> host-skeleton  Building
>>> host-skeleton  Installing to host directory
lzip-1.20.tar.gz: OK (sha256: c93b81a5a7788ef5812423d311345ba5d3bd4f5ebf1f693911e3a13553c1290c)
>>> host-tar 1.29 Downloading

host-tar is a pre-extract dependency, so when using intermediate targets
(I mean -source, -extract) in a clean output, host-tar is built before source
extraction, but not necessarily before download (and tarball generation).

The most common scenario for build farms (make xx_defconfig && make) works fine
most of the time because for an old distro almost certainly at least one host
package that does not use SCM download methods is extracted before any download
with SCM methods, and that triggers the build of host-tar.

But I think it is not that uncommon to use 'make xx_defconfig && make source &&
make' in build farms so the build fails early if the download fails, either by
a missing version on the remote or by human error selecting the wrong version
on a .mk file.

And we have also the use case of new distros with too recent tar versions.

Not sure how to fix it.

Regards,
Ricardo
