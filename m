From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 5 Mar 2011 15:04:44 +0100
Subject: [Buildroot] [git commit master 1/1] squashfs: re-add legacy lzma
	support
Message-ID: <20110305141529.8D51B8E322@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=194ac2d5496d7895980252059d9e133b218cf170
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Readd legacy LZMA support since older patched kernels might be using it.
Introduce an XZ target filesystem option for the new format.

[Peter: add a seperate xz target for squashfs-target as well]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/squashfs/Config.in        |    3 +++
 fs/squashfs/squashfs.mk      |    4 ++++
 package/squashfs/Config.in   |    6 ++++++
 package/squashfs/squashfs.mk |   12 ++++++++++--
 4 files changed, 23 insertions(+), 2 deletions(-)

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
diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index 6730708..7d0fc71 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -28,6 +28,12 @@ config BR2_PACKAGE_SQUASHFS_LZO
        help
          Support LZO compression algorithm
 
+config BR2_PACKAGE_SQUASHFS_XZ
+       bool "xz support"
+       select BR2_PACKAGE_XZ
+       help
+         Support XZ compression algorithm
+
 endif
 
 comment "squashfs requires a toolchain with LARGEFILE support"
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 5000a8c..7aa8ca9 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -2,11 +2,18 @@ SQUASHFS_VERSION=4.2
 SQUASHFS_SOURCE=squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
 
-# no libattr/xz in BR
+# no libattr in BR
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0
 
 ifeq ($(BR2_PACKAGE_SQUASHFS_LZMA),y)
 SQUASHFS_DEPENDENCIES += xz
+SQUASHFS_MAKE_ARGS += LZMA_XZ_SUPPORT=1 COMP_DEFAULT=lzma
+else
+SQUASHFS_MAKE_ARGS += LZMA_XZ_SUPPORT=0
+endif
+
+ifeq ($(BR2_PACKAGE_SQUASHFS_XZ),y)
+SQUASHFS_DEPENDENCIES += xz
 SQUASHFS_MAKE_ARGS += XZ_SUPPORT=1 COMP_DEFAULT=xz
 else
 SQUASHFS_MAKE_ARGS += XZ_SUPPORT=0
@@ -34,7 +41,8 @@ HOST_SQUASHFS_MAKE_ARGS = \
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
