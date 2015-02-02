From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Feb 2015 23:24:28 +0100
Subject: [Buildroot] [git commit] package/mjpg-streamer: New package
Message-ID: <20150202223712.ACD0B803DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f0037fd9f52bfa26de5ed76c4fa7045fabb95d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--
v2: various fixes (Thomas)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                      |    1 +
 package/mjpg-streamer/Config.in        |   16 ++++++++++++++++
 package/mjpg-streamer/mjpg-streamer.mk |   25 +++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0f5836b..6da5202 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1106,6 +1106,7 @@ endif
 	source "package/memcached/Config.in"
 	source "package/mii-diag/Config.in"
 	source "package/minidlna/Config.in"
+	source "package/mjpg-streamer/Config.in"
 	source "package/modem-manager/Config.in"
 	source "package/mongoose/Config.in"
 	source "package/mongrel2/Config.in"
diff --git a/package/mjpg-streamer/Config.in b/package/mjpg-streamer/Config.in
new file mode 100644
index 0000000..7925d41
--- /dev/null
+++ b/package/mjpg-streamer/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_MJPG_STREAMER
+	bool "mjpg-streamer"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # linux/uvcvideo.h
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
+comment "mjpg-streamer needs a toolchain w/ threads, headers >= 3.0"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
new file mode 100644
index 0000000..2385429
--- /dev/null
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -0,0 +1,25 @@
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
+define MJPG_STREAMER_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
+endef
+
+define MJPG_STREAMER_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr install
+endef
+
+$(eval $(generic-package))
