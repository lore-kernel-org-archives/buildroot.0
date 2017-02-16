From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Feb 2017 15:24:01 -0300
Subject: [Buildroot] [PATCH next] unionfs: bump to version 2.0
Message-ID: <20170216182401.24847-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.
Update ioctl patch since it's still required to build for musl.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...0001-Revert-to-old-pre-1.0-meta-directory.patch | 36 ----------------------
 .../0001-include-asm-ioctl.h-for-_IOC_SIZE.patch   | 26 ++++++++++++++++
 package/unionfs/unionfs.hash                       |  4 +--
 package/unionfs/unionfs.mk                         |  4 +--
 4 files changed, 29 insertions(+), 41 deletions(-)
 delete mode 100644 package/unionfs/0001-Revert-to-old-pre-1.0-meta-directory.patch
 create mode 100644 package/unionfs/0001-include-asm-ioctl.h-for-_IOC_SIZE.patch

diff --git a/package/unionfs/0001-Revert-to-old-pre-1.0-meta-directory.patch b/package/unionfs/0001-Revert-to-old-pre-1.0-meta-directory.patch
deleted file mode 100644
index 228441b..0000000
--- a/package/unionfs/0001-Revert-to-old-pre-1.0-meta-directory.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 93c2f9bd8b058b28016e6db2421e5b38eac0606c Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Thu, 17 Dec 2015 15:06:38 +0100
-Subject: [PATCH] Revert to old pre-1.0 meta directory
-
-Unionfs changed its meta directory from .unionfs to .unionfs-fuse with the
-unionfs -> unionfs-fuse rename.  The rename later got reverted everywhere
-but the meta directory, so now unionfs doesn't find the whiteout files from
-older releases.
-
-Revert back to the pre-1.0 behaviour to fix this.
-
-Committed upstream:
-https://github.com/rpodgorny/unionfs-fuse/commit/93c2f9bd8b058b28016e6db2421e5b38eac0606c
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/unionfs.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/unionfs.h b/src/unionfs.h
-index c2b5ee3..74b824f 100644
---- a/src/unionfs.h
-+++ b/src/unionfs.h
-@@ -10,7 +10,7 @@
- #define PATHLEN_MAX 1024
- #define HIDETAG "_HIDDEN~"
- 
--#define METANAME ".unionfs-fuse"
-+#define METANAME ".unionfs"
- #define METADIR (METANAME  "/") // string concetanation!
- 
- // fuse meta files, we might want to hide those
--- 
-2.1.4
-
diff --git a/package/unionfs/0001-include-asm-ioctl.h-for-_IOC_SIZE.patch b/package/unionfs/0001-include-asm-ioctl.h-for-_IOC_SIZE.patch
new file mode 100644
index 0000000..f3d8fa1
--- /dev/null
+++ b/package/unionfs/0001-include-asm-ioctl.h-for-_IOC_SIZE.patch
@@ -0,0 +1,26 @@
+From d33635fe940ff898e026d3fb77446e52f8f2bd3f Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 16 Feb 2017 14:59:30 -0300
+Subject: [PATCH] include asm/ioctl.h for _IOC_SIZE
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ src/unionfs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/unionfs.c b/src/unionfs.c
+index 5aed5ce..f6cd368 100644
+--- a/src/unionfs.c
++++ b/src/unionfs.c
+@@ -32,7 +32,7 @@
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <inttypes.h>
+-#include <sys/ioctl.h>
++#include <asm/ioctl.h>
+ 
+ #ifdef linux
+ 	#include <sys/vfs.h>
+-- 
+2.10.2
+
diff --git a/package/unionfs/unionfs.hash b/package/unionfs/unionfs.hash
index c843a0e..fcc1d58 100644
--- a/package/unionfs/unionfs.hash
+++ b/package/unionfs/unionfs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	2ee80bd0634a61adb2159212e155d607a0a82ad659214ae6edb3530396cccc09	unionfs-1.0.tar.gz
-sha256	c8526f80448f344fba0100e5510793b6de985b24a8b526d9a6803bcd713d9de2	0001-include-asm-ioctl.h-for-_IOC_SIZE.patch
+sha256	f24d7dd64c678cefacbebf2727b61e3127b8ecb6bb9176d7117dd31503455643	unionfs-2.0.tar.gz
+sha256	976ca25b7706911f1a6e981c0fd236b607f497aa0b23d407825b0aad41f7c896	0001-include-asm-ioctl.h-for-_IOC_SIZE.patch
diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index 0fa9c94..4281e84 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-UNIONFS_VERSION = 1.0
+UNIONFS_VERSION = 2.0
 UNIONFS_SITE = $(call github,rpodgorny,unionfs-fuse,v$(UNIONFS_VERSION))
-UNIONFS_PATCH = \
-	http://git.alpinelinux.org/cgit/aports/plain/main/unionfs-fuse/0001-include-asm-ioctl.h-for-_IOC_SIZE.patch
 UNIONFS_DEPENDENCIES = libfuse host-pkgconf
 UNIONFS_LICENSE = BSD-3c
 UNIONFS_LICENSE_FILES = LICENSE
-- 
2.10.2
