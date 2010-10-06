From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Oct 2010 11:48:58 +0200
Subject: [Buildroot] [git commit master 1/1] package: add libmpeg2
Message-ID: <20101006103554.2176D8B7C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d089c987a67359f1f1b697d0b6bb60e95be2ba62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libmpeg2 is a mpeg1/mpeg2 video decoder library.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                 |    2 +-
 package/multimedia/Config.in            |    1 +
 package/multimedia/libmpeg2/Config.in   |   13 +++++++++++++
 package/multimedia/libmpeg2/libmpeg2.mk |   28 ++++++++++++++++++++++++++++
 4 files changed, 43 insertions(+), 1 deletions(-)
 create mode 100644 package/multimedia/libmpeg2/Config.in
 create mode 100644 package/multimedia/libmpeg2/libmpeg2.mk

diff --git a/CHANGES b/CHANGES
index c979607..a8bd699 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,7 +21,7 @@
 
 	Alpha, Cris, IA64 and Sparc64 architecture support removed.
 
-	New packages: librsvg, xz
+	New packages: libmpeg2, librsvg, xz
 
 	Updated/fixed packages: acpid, alsa-lib, argus, at, autoconf,
 	automake, avahi, axel, beecrypt, berkeleydb, bind, bmon, boa,
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 3b0eec5..91def57 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -16,6 +16,7 @@ source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
 source "package/multimedia/libmms/Config.in"
 source "package/multimedia/libmpd/Config.in"
+source "package/multimedia/libmpeg2/Config.in"
 source "package/multimedia/libogg/Config.in"
 source "package/multimedia/libsndfile/Config.in"
 source "package/multimedia/libtheora/Config.in"
diff --git a/package/multimedia/libmpeg2/Config.in b/package/multimedia/libmpeg2/Config.in
new file mode 100644
index 0000000..a3fafb0
--- /dev/null
+++ b/package/multimedia/libmpeg2/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBMPEG2
+	bool "libmpeg2"
+	help
+	  MPEG1/MPEG2 video decoder library
+
+	  http://libmpeg2.sourceforge.net/
+
+config BR2_PACKAGE_LIBMPEG2_BINS
+       bool "mpeg2 binaries"
+       depends on BR2_PACKAGE_LIBMPEG2
+       help
+         Install mpeg2dec, corrupt_mpeg2 and extrac_mpeg2 programs as
+	 well.
diff --git a/package/multimedia/libmpeg2/libmpeg2.mk b/package/multimedia/libmpeg2/libmpeg2.mk
new file mode 100644
index 0000000..cd8ac89
--- /dev/null
+++ b/package/multimedia/libmpeg2/libmpeg2.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# libmpeg2
+#
+#############################################################
+LIBMPEG2_VERSION = 0.5.1
+LIBMPEG2_SOURCE = libmpeg2-$(LIBMPEG2_VERSION).tar.gz
+LIBMPEG2_SITE = http://libmpeg2.sourceforge.net/files/
+LIBMPEG2_INSTALL_STAGING = YES
+LIBMPEG2_CONF_OPT = --without-x --disable-directx
+
+ifeq ($(BR2_PACKAGE_SDL),y)
+LIBMPEG2_CONF_OPT += --enable-sdl
+LIBMPEG2_DEPENDENCIES += sdl
+else
+LIBMPEG2_CONF_OPT += --disable-sdl
+endif
+
+ifneq ($(BR2_PACKAGE_LIBMPEG2_BINS),y)
+define LIBMPEG2_REMOVE_BINS
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,\
+		mpeg2dec corrupt_mpeg2 extract_mpeg2)
+endef
+
+LIBMPEG2_POST_INSTALL_TARGET_HOOKS += LIBMPEG2_REMOVE_BINS
+endif
+
+$(eval $(call AUTOTARGETS,package/multimedia,libmpeg2))
-- 
1.7.1
