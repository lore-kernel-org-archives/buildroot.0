From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu,  5 Apr 2018 00:16:00 -0300
Subject: [Buildroot] [RFC PATCH] download/git: fix basename for files inside
 tarballs
Message-ID: <20180405031600.18831-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit "6d938bcb52 download: git: introduce cache feature" introduced a
typo that makes the tarball to contain files without the package
basename:
$ tar -tvf good-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
-rw-r--r-- 0/0               8 2017-10-14 02:10 ./file

Historically, all tarballs are generated with the basename:
$ tar -tvf good-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
-rw-r--r-- 0/0               8 2017-10-14 02:10 good-a238b1dfcd825d47d834af3c5223417c8411d90d/file

The hashes in the tree were calculated with the basename.

In the most common scenario, after the download ends the tarball is
generated, the hash mismatches and the download mechanism falls back to
use the tarball from http://sources.buildroot.net .

The problem can be reproduced by forcing the download of any git package
PKG that has a hash file to check against:
$ make defconfig
$ ./utils/config --set-str BR2_BACKUP_SITE ""
$ BR2_DL_DIR=$(mktemp -d) make PKG-dirclean PKG-source

Fix the typo so the basename is really added to the files, that was
clearly the intention of the code.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
NOTICE: linux-firmware is NOT fixed by this. I don't know why.
I tried in my local computer a few other (other than the ones tested in
Gitlab CI) git packages and they are fixed by this patch as well:
libuci
squashfs
ubus
x264
Could it be related to my setup?
tar (GNU tar) 1.29
git version 2.14.1

I detected this while debugging why this automated test now fails:
http://patchwork.ozlabs.org/patch/831742/

Before this patch:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/19997839

After this patch:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/19998472
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 58dbcd211c..f07195b0d1 100755
--- a/support/download/git
+++ b/support/download/git
@@ -111,7 +111,7 @@ LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
 
 # Create GNU-format tarballs, since that's the format of the tarballs on
 # sources.buildroot.org and used in the *.hash files
-tar cf - --transform="s/^\.$/${basename}/" \
+tar cf - --transform="s/^\./${basename}/" \
 	--numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
          -T "${output}.list.sorted" >"${output}.tar"
 gzip -6 -n <"${output}.tar" >"${output}"
-- 
2.14.1
