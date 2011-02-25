From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Feb 2011 21:27:40 +0100
Subject: [Buildroot] [git commit master 1/1] squashfs: use kconfig to ensure
	atleast one compressor is selected
Message-ID: <20110225202931.3B2A78F780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=eaf18b8b788c5651b67fb90c12907217f009cc80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to how we do it for mpd now. This way, the selection is clearly
visible to the user, instead of the hidden selection we used to do in
the makefile.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/squashfs/Config.in   |    1 +
 package/squashfs/squashfs.mk |    5 -----
 2 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index d28926e..6730708 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SQUASHFS
 	bool "squashfs"
 	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_SQUASHFS_GZIP if !(BR2_PACKAGE_SQUASHFS_LZMA || BR2_PACKAGE_SQUASHFS_LZO)
 	help
 	  Tools to generate SquashFS filesystems.
 
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 7cbec32..50e8964 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -5,11 +5,6 @@ SQUASHFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/sq
 # no libattr/xz in BR
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0
 
-# we need atleast one compresser, so use gzip if none are enabled
-ifeq ($(BR2_PACKAGE_SQUASHFS_GZIP)$(BR2_PACKAGE_SQUASHFS_LZO)$(BR2_PACKAGE_SQUASHFS_LZMA),)
-BR2_PACKAGE_SQUASHFS_GZIP=y
-endif
-
 ifeq ($(BR2_PACKAGE_SQUASHFS_LZMA),y)
 SQUASHFS_DEPENDENCIES += xz
 SQUASHFS_MAKE_ARGS += XZ_SUPPORT=1 COMP_DEFAULT=lzma
-- 
1.7.3.4
