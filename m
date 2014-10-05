From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  5 Oct 2014 19:51:28 +0200
Subject: [Buildroot] [PATCH] tinyalsa: new package
Message-ID: <1412531488-8849-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in            |  1 +
 package/tinyalsa/Config.in   | 14 ++++++++++++++
 package/tinyalsa/tinyalsa.mk | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 package/tinyalsa/Config.in
 create mode 100644 package/tinyalsa/tinyalsa.mk

diff --git a/package/Config.in b/package/Config.in
index c4ea688..e19e6ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -27,6 +27,7 @@ menu "Audio and video applications"
 	source "package/pulseaudio/Config.in"
 	source "package/sox/Config.in"
 	source "package/tidsp-binaries/Config.in"
+	source "package/tinyalsa/Config.in"
 	source "package/tstools/Config.in"
 	source "package/twolame/Config.in"
 	source "package/upmpdcli/Config.in"
diff --git a/package/tinyalsa/Config.in b/package/tinyalsa/Config.in
new file mode 100644
index 0000000..0295c51
--- /dev/null
+++ b/package/tinyalsa/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_TINYALSA
+	bool "tinyalsa"
+	default n
+	help
+	  a small library to interface with ALSA in the Linux kernel
+
+	  The aims are:
+
+	  - Provide a basic pcm and mixer API
+	  - If it's not absolutely needed, don't add it to the API
+	  - Avoid supporting complex and unnecessary operations that could be dealt
+	    with at a higher level
+
+	  https://github.com/tinyalsa/tinyalsa
diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
new file mode 100644
index 0000000..b287e78
--- /dev/null
+++ b/package/tinyalsa/tinyalsa.mk
@@ -0,0 +1,34 @@
+#############################################################
+#
+# tinyalsa
+#
+#############################################################
+
+TINYALSA_VERSION = f2a7b6d3d81bd337a540d56704b4aaa7bdb046fe
+TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,$(TINYALSA_VERSION))
+TINYALSA_LICENSE = BSD-3c
+TINYALSA_INSTALL_STAGING = YES
+
+define TINYALSA_BUILD_CMDS
+	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
+endef
+
+define TINYALSA_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libtinyalsa.so \
+			$(STAGING_DIR)/usr/lib/libtinyalsa.so
+	$(INSTALL) -D -m 0644 $(@D)/include/sound/asound.h \
+			$(STAGING_DIR)/usr/include/sound/asound.h
+	$(INSTALL) -D -m 0644 $(@D)/include/tinyalsa/asoundlib.h \
+			$(STAGING_DIR)/usr/include/tinyalsa/asoundlib.h
+endef
+
+define TINYALSA_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libtinyalsa.so \
+			$(TARGET_DIR)/usr/lib/libtinyalsa.so
+	$(INSTALL) -D -m 0755 $(@D)/tinyplay $(TARGET_DIR)/usr/bin/tinyplay
+	$(INSTALL) -D -m 0755 $(@D)/tinycap $(TARGET_DIR)/usr/bin/tinycap
+	$(INSTALL) -D -m 0755 $(@D)/tinymix $(TARGET_DIR)/usr/bin/tinymix
+	$(INSTALL) -D -m 0755 $(@D)/tinypcminfo $(TARGET_DIR)/usr/bin/tinypcminfo
+endef
+
+$(eval $(generic-package))
-- 
2.1.1
