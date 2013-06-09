From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Sun,  9 Jun 2013 20:38:29 +0200
Subject: [Buildroot] [PATCHv2 2/3] Add proprietary libraries for Hantro x170
	HW decoding
In-Reply-To: <1370803110-27093-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1370803110-27093-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1370803110-27093-2-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 package/multimedia/Config.in                      |  1 +
 package/multimedia/on2-8170-libs/Config.in        | 12 ++++++++++++
 package/multimedia/on2-8170-libs/on2-8170-libs.mk | 24 +++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/multimedia/on2-8170-libs/Config.in
 create mode 100644 package/multimedia/on2-8170-libs/on2-8170-libs.mk

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
index 0000000..09ed808
--- /dev/null
+++ b/package/multimedia/on2-8170-libs/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_ON2_8170_LIBS
+	#This is a binary only package which has been compiled for glibc
+	depends on BR2_arm926t
+	depends on (BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
+		BR2_TOOLCHAIN_CTNG_eglibc || \
+		BR2_TOOLCHAIN_CTNG_glibc)
+	bool "on2-8170-libs"
+	help
+	  Libraries for Hantro X170 video decoder
+
+	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
+
diff --git a/package/multimedia/on2-8170-libs/on2-8170-libs.mk b/package/multimedia/on2-8170-libs/on2-8170-libs.mk
new file mode 100644
index 0000000..e04551d
--- /dev/null
+++ b/package/multimedia/on2-8170-libs/on2-8170-libs.mk
@@ -0,0 +1,24 @@
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
+	cp -dpf $(@D)/*.a $(@D)/*.so $(STAGING_DIR)/usr/lib
+	cp -dpf $(@D)/*.h $(STAGING_DIR)/usr/include
+endef
+
+define ON2_8170_LIBS_INSTALL_TARGET_CMDS
+	cp -dpf $(@D)/*.so $(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
