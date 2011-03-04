From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  4 Mar 2011 11:10:14 -0300
Subject: [Buildroot] [PATCH] squashfs: readd legacy lzma support
Message-ID: <1299247814-22629-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Readd legacy LZMA support since older patched kernels might be using it.
Introduce an XZ target filesystem option for the new format.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 fs/squashfs/Config.in        |    3 +++
 fs/squashfs/squashfs.mk      |    4 ++++
 package/squashfs/squashfs.mk |    5 +++--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 85416be..f13410a 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -37,5 +37,8 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_LZMA
 config BR2_TARGET_ROOTFS_SQUASHFS4_LZO
        bool "lzo"
 
+config BR2_TARGET_ROOTFS_SQUASHFS4_XZ
+       bool "xz"
+
 endchoice
 endif
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 91a7534..a680dae 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -11,11 +11,15 @@ ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
 ROOTFS_SQUASHFS_ARGS += -comp lzo
 else
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZMA),y)
+ROOTFS_SQUASHFS_ARGS += -comp lzma
+else
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_XZ),y)
 ROOTFS_SQUASHFS_ARGS += -comp xz
 else
 ROOTFS_SQUASHFS_ARGS += -comp gzip
 endif
 endif
+endif
 
 else
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs3
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 5000a8c..b23b303 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -7,7 +7,7 @@ SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0
 
 ifeq ($(BR2_PACKAGE_SQUASHFS_LZMA),y)
 SQUASHFS_DEPENDENCIES += xz
-SQUASHFS_MAKE_ARGS += XZ_SUPPORT=1 COMP_DEFAULT=xz
+SQUASHFS_MAKE_ARGS += LZMA_XZ_SUPPORT=1 XZ_SUPPORT=1 COMP_DEFAULT=xz
 else
 SQUASHFS_MAKE_ARGS += XZ_SUPPORT=0
 endif
@@ -34,7 +34,8 @@ HOST_SQUASHFS_MAKE_ARGS = \
 	XATTR_SUPPORT=0 \
 	XZ_SUPPORT=1    \
 	GZIP_SUPPORT=1  \
-	LZO_SUPPORT=1
+	LZO_SUPPORT=1	\
+	LZMA_XZ_SUPPORT=1
 
 define SQUASHFS_BUILD_CMDS
  $(TARGET_MAKE_ENV) $(MAKE)    \
-- 
1.7.3.4
