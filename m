From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 08:30:41 +0200
Subject: [Buildroot] [git commit] package/cramfs: fix missing type
Message-ID: <20150806063047.DAB5081E72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfcffb6f81244c57416de5f80cbad4810528ec42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

loff_t is guarded by _GNU_SOURCE. although already properly defined in
cramfsck, it was not defined in mkcramfs.

Fixes;
    http://autobuild.buildroot.org/results/57d/57de9e838fa953e2fb5e358cd535603fb249b7d2/
    http://autobuild.buildroot.org/results/e02/e023014934bf291add9d9dfdfc005bfec34dc1ff/
    [...]

Note: since cramfs was last released in 2002-02-24, we don't stand a
chance to get this merged any time soon... :-(

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cramfs/0003-fix-missing-types.patch |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/cramfs/0003-fix-missing-types.patch b/package/cramfs/0003-fix-missing-types.patch
new file mode 100644
index 0000000..8961100
--- /dev/null
+++ b/package/cramfs/0003-fix-missing-types.patch
@@ -0,0 +1,17 @@
+mkcramfs; loff_t is guarded by _GNU_SOURCE
+
+Although already properly done in cramfsck, it was missing in mkcramfs.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN cramfs-1.1.orig/mkcramfs.c cramfs-1.1/mkcramfs.c
+--- cramfs-1.1.orig/mkcramfs.c	2015-08-05 22:31:16.830543096 +0200
++++ cramfs-1.1/mkcramfs.c	2015-08-05 22:33:33.136289744 +0200
+@@ -22,6 +22,7 @@
+  * If you change the disk format of cramfs, please update fs/cramfs/README.
+  */
+ 
++#define _GNU_SOURCE
+ #include <sys/types.h>
+ #include <stdio.h>
+ #include <sys/stat.h>
