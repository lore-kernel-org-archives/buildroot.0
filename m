From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Sep 2017 20:38:42 +0200
Subject: [Buildroot] [PATCH] dump1090: new package
Message-ID: <20170930183842.17954-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/dump1090/Config.in     | 11 +++++++++++
 package/dump1090/dump1090.hash |  3 +++
 package/dump1090/dump1090.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/dump1090/Config.in
 create mode 100644 package/dump1090/dump1090.hash
 create mode 100644 package/dump1090/dump1090.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cedf5a6f84..43ad9e5f8a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1332,6 +1332,7 @@ F:	package/libunistring/
 N:	Peter Korsgaard <peter@korsgaard.com>
 F:	board/orangepi/
 F:	configs/orangepi_pc_defconfig
+F:	package/dump1090/
 F:	package/flickcurl/
 F:	package/fscryptctl/
 F:	package/jo/
diff --git a/package/Config.in b/package/Config.in
index 1580a9e3d6..0dfe086ead 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -396,6 +396,7 @@ endmenu
 	source "package/dmraid/Config.in"
 	source "package/dt-utils/Config.in"
 	source "package/dtv-scan-tables/Config.in"
+	source "package/dump1090/Config.in"
 	source "package/dvb-apps/Config.in"
 	source "package/dvbsnoop/Config.in"
 	source "package/edid-decode/Config.in"
diff --git a/package/dump1090/Config.in b/package/dump1090/Config.in
new file mode 100644
index 0000000000..81fd3f2545
--- /dev/null
+++ b/package/dump1090/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DUMP1090
+	bool "dump1090"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # librtlsdr
+	select BR2_PACKAGE_LIBSRTLSDR
+	help
+	  Dump1090 is a simple Mode S decoder for RTLSDR devices
+
+	  https://github.com/MalcolmRobb/dump1090
+
+comment "dump1090 needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dump1090/dump1090.hash b/package/dump1090/dump1090.hash
new file mode 100644
index 0000000000..fbbf21a015
--- /dev/null
+++ b/package/dump1090/dump1090.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 72c1a94f3e6788af1e72b8cac13bb53e0989fe02cd13e191133f5519d2a2fefb  dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe.tar.gz
+sha256 29046ef7ee0b7b127bcc64faf135035820906dea2b379b2efcfc119131a39f7a  anet.h
diff --git a/package/dump1090/dump1090.mk b/package/dump1090/dump1090.mk
new file mode 100644
index 0000000000..28a7568a8c
--- /dev/null
+++ b/package/dump1090/dump1090.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# dump1090
+#
+################################################################################
+
+DUMP1090_VERSION = bff92c4ad772a0a8d433f788d39dae97e00e4dbe
+DUMP1090_SITE = $(call github,MalcolmRobb,dump1090,$(DUMP1090_VERSION))
+DUMP1090_LICENSE = BSD-3-Clause
+# no real license file
+DUMP1090_LICENSE_FILES = anet.h
+DUMP1090_DEPENDENCIES = host-pkgconf librtlsdr
+
+define DUMP1090_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr -C $(@D)
+endef
+
+define DUMP1090_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/dump1090 $(TARGET_DIR)/usr/bin/dump1090
+	$(INSTALL) -m 0755 -D $(@D)/dump1090 $(TARGET_DIR)/usr/bin/view1090
+	$(INSTALL) -d $(TARGET_DIR)/usr/share/dump1090
+	cp -r $(@D)/public_html/* $(TARGET_DIR)/usr/share/dump1090
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
