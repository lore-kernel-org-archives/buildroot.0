From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Apr 2015 11:16:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdcadec: new package
Message-ID: <1429953408-32582-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for next ffmpeg release:
http://git.videolan.org/?p=ffmpeg.git;a=blobdiff;f=Changelog;h=4542e324d8ab722468ed251325a3efddb28bff8e;hp=46304d83a90d2a846421a61f9391dfcd1e52ba31;hb=72025ac36c740f031d7e413041fdfe97087c83c4;hpb=6fe2641d6e410b7bc203138fa97e1118b411f16d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in              |    1 +
 package/libdcadec/Config.in    |    7 +++++++
 package/libdcadec/libdcadec.mk |   28 ++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/libdcadec/Config.in
 create mode 100644 package/libdcadec/libdcadec.mk

diff --git a/package/Config.in b/package/Config.in
index e0a8057..c8f3115 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -897,6 +897,7 @@ endmenu
 menu "Multimedia"
 	source "package/libass/Config.in"
 	source "package/libbluray/Config.in"
+	source "package/libdcadec/Config.in"
 	source "package/libdvbcsa/Config.in"
 	source "package/libdvbsi/Config.in"
 	source "package/libdvdnav/Config.in"
diff --git a/package/libdcadec/Config.in b/package/libdcadec/Config.in
new file mode 100644
index 0000000..2687a18
--- /dev/null
+++ b/package/libdcadec/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDCADEC
+	bool "libdcadec"
+	help
+	  dcadec is a free DTS Coherent Acoustics decoder with support
+	  for HD extensions.
+
+	  https://github.com/foo86/dcadec
diff --git a/package/libdcadec/libdcadec.mk b/package/libdcadec/libdcadec.mk
new file mode 100644
index 0000000..1c423f0
--- /dev/null
+++ b/package/libdcadec/libdcadec.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# libdcadec
+#
+################################################################################
+
+LIBDCADEC_VERSION = 7b3b44cd180c9345c98be9062eac701eab5c7454
+LIBDCADEC_SITE = $(call github,foo86,dcadec,$(LIBDCADEC_VERSION))
+LIBDCADEC_LICENSE = LGPLv2.1+
+LIBDCADEC_LICENSE_FILES = COPYING.LGPLv2.1
+LIBDCADEC_INSTALL_STAGING = YES
+
+define LIBDCADEC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -std=gnu99" -C $(@D)
+endef
+
+define LIBDCADEC_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		DESTDIR=$(STAGING_DIR) PREFIX=/usr install
+endef
+
+define LIBDCADEC_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
