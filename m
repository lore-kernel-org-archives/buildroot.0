From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 23 Jan 2015 19:34:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/mjpg-streamer: New package
Message-ID: <1422038085-2042-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                      |    1 +
 package/mjpg-streamer/Config.in        |   16 ++++++++++++++
 package/mjpg-streamer/mjpg-streamer.mk |   38 ++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 package/mjpg-streamer/Config.in
 create mode 100644 package/mjpg-streamer/mjpg-streamer.mk

diff --git a/package/Config.in b/package/Config.in
index 266de13..568de5b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1094,6 +1094,7 @@ endif
 	source "package/memcached/Config.in"
 	source "package/mii-diag/Config.in"
 	source "package/minidlna/Config.in"
+	source "package/mjpg-streamer/Config.in"
 	source "package/modem-manager/Config.in"
 	source "package/mongoose/Config.in"
 	source "package/mongrel2/Config.in"
diff --git a/package/mjpg-streamer/Config.in b/package/mjpg-streamer/Config.in
new file mode 100644
index 0000000..0c61d7f
--- /dev/null
+++ b/package/mjpg-streamer/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_MJPG_STREAMER
+	bool "mjpg-streamer"
+	# linux/uvcvideo.h was added in kernel 2.6.40
+	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_JPEG
+	help
+	  MJPG-streamer takes JPGs from Linux-UVC compatible webcams, filesystem
+	  or other input plugins and streams them as M-JPEG via HTTP to
+	  webbrowsers, VLC and other software.
+
+	  http://mjpg-streamer.sourceforge.net
+
+comment "mjpg-streamer needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
new file mode 100644
index 0000000..9d282de
--- /dev/null
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# mjpg-streamer
+#
+################################################################################
+
+# Original source is located at
+# http://sourceforge.net/p/mjpg-streamer/code/commit_browser
+# oliv3r forked the repo to add support for 3.16 and 3.17 kernels:
+# http://sourceforge.net/p/mjpg-streamer/patches/14/
+MJPG_STREAMER_VERSION = 730b5bcdc378b6a201131c6c2620eedbe0f6eb30
+MJPG_STREAMER_SITE = $(call github,oliv3r,mjpg-streamer,$(MJPG_STREAMER_VERSION))
+MJPG_STREAMER_LICENSE = GPLv2+
+MJPG_STREAMER_LICENSE_FILES = LICENSE
+MJPG_STREAMER_DEPENDENCIES = jpeg
+
+define MJPG_STREAMER_FIX_MAKEFILE
+	cd $(@D); \
+	for i in `find -iname Makefile`; do \
+		$(SED) "s/^CC = gcc/#CC = gcc/g" $$i; \
+	done
+endef
+
+MJPG_STREAMER_PRE_CONFIGURE_HOOKS = MJPG_STREAMER_FIX_MAKEFILE
+
+define MJPG_STREAMER_BUILD_CMDS
+	CC=$(TARGET_CC) \
+	CFLAGS="$(TARGET_CFLAGS)" \
+	$(MAKE) -C $(@D)
+endef
+
+MJPG_STREAMER_INSTALL_TARGET_OPTS = DESTDIR="$(TARGET_DIR)" install
+
+define MJPG_STREAMER_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr install
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
