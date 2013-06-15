From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Jun 2013 23:15:05 +0200
Subject: [Buildroot] [git commit] Add proprietary libraries for Hantro x170
	HW decoding
Message-ID: <20130615212019.0F04A9AE5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b31ec9d641e772c90dc646b8feba01fc4129dc88
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: select on2-8170-modules, ensure dest dirs exist]
Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in                      |    1 +
 package/multimedia/on2-8170-libs/Config.in        |   16 +++++++++++++
 package/multimedia/on2-8170-libs/on2-8170-libs.mk |   26 +++++++++++++++++++++
 3 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index dd74863..4cb81bf 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -21,6 +21,7 @@ source "package/multimedia/mpd/Config.in"
 source "package/multimedia/mpg123/Config.in"
 source "package/multimedia/mplayer/Config.in"
 source "package/multimedia/musepack/Config.in"
+source "package/multimedia/on2-8170-libs/Config.in"
 source "package/opus-tools/Config.in"
 source "package/multimedia/pulseaudio/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
diff --git a/package/multimedia/on2-8170-libs/Config.in b/package/multimedia/on2-8170-libs/Config.in
new file mode 100644
index 0000000..0cf05ad
--- /dev/null
+++ b/package/multimedia/on2-8170-libs/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_ON2_8170_LIBS
+	#This is a binary only package which has been compiled for glibc
+	depends on BR2_arm926t
+	depends on (BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
+		BR2_TOOLCHAIN_CTNG_eglibc || \
+		BR2_TOOLCHAIN_CTNG_glibc)
+	depends on BR2_LINUX_KERNEL # on2-8170-modules
+	select BR2_PACKAGE_ON2_8170_MODULES # runtime
+	bool "on2-8170-libs"
+	help
+	  Libraries for Hantro X170 video decoder
+
+	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
+
+comment "on2-8170 libs requires a linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/multimedia/on2-8170-libs/on2-8170-libs.mk b/package/multimedia/on2-8170-libs/on2-8170-libs.mk
new file mode 100644
index 0000000..7cdb991
--- /dev/null
+++ b/package/multimedia/on2-8170-libs/on2-8170-libs.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# on2-8170-libs
+#
+################################################################################
+
+ON2_8170_LIBS_VERSION = 1.0
+ON2_8170_LIBS_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/
+
+ON2_8170_LICENSE = PROPRIETARY
+# No license file is included in the archive
+
+ON2_8170_LIBS_INSTALL_STAGING = YES
+
+define ON2_8170_LIBS_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
+	cp -dpf $(@D)/*.a $(@D)/*.so $(STAGING_DIR)/usr/lib
+	cp -dpf $(@D)/*.h $(STAGING_DIR)/usr/include
+endef
+
+define ON2_8170_LIBS_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib
+	cp -dpf $(@D)/*.so $(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))
