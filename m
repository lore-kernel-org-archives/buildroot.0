From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 21:14:19 +0200
Subject: [Buildroot] [git commit] tinyalsa: new package
Message-ID: <20141006191449.C8B75B0C8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86ee96f9f5cac79729f63ab5ef2678e4df99d5d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - remove 'default n', since it's the default
 - add dependency on !BR2_PREFER_STATIC_LIB since the Makefile always
   builds a shared library.
 - move from Audio/video applications to Libraries -> Audio.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/tinyalsa/Config.in   |   17 +++++++++++++++++
 package/tinyalsa/tinyalsa.mk |   34 ++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index aad968c..2dbe6f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -556,6 +556,7 @@ menu "Audio/Sound"
 	source "package/portaudio/Config.in"
 	source "package/speex/Config.in"
 	source "package/taglib/Config.in"
+	source "package/tinyalsa/Config.in"
 	source "package/tremor/Config.in"
 	source "package/vo-aacenc/Config.in"
 	source "package/webrtc-audio-processing/Config.in"
diff --git a/package/tinyalsa/Config.in b/package/tinyalsa/Config.in
new file mode 100644
index 0000000..3021307
--- /dev/null
+++ b/package/tinyalsa/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_TINYALSA
+	bool "tinyalsa"
+	depends on !BR2_PREFER_STATIC_LIB
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
+
+comment "tinyalsa needs toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
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
