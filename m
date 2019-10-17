From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 17 Oct 2019 16:29:17 +0100
Subject: [Buildroot] [RFC PATCH v2 18/30] package/widevine: Add package for
 the widevine CDM library.
In-Reply-To: <20191017152929.49153-1-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
Message-ID: <20191017152929.49153-19-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Patrick Glaser <pglaser@tesla.com>
Cc: Enis Lavery <elavery@tesla.com>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/Config.in            |  1 +
 package/widevine/Config.in   |  6 ++++++
 package/widevine/widevine.mk | 28 ++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/widevine/Config.in
 create mode 100644 package/widevine/widevine.mk

diff --git a/package/Config.in b/package/Config.in
index 5fc2b8a635..d290f88067 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1650,6 +1650,7 @@ menu "Networking"
 	source "package/usbredir/Config.in"
 	source "package/wampcc/Config.in"
 	source "package/websocketpp/Config.in"
+	source "package/widevine/Config.in"
 	source "package/zeromq/Config.in"
 	source "package/zmqpp/Config.in"
 	source "package/zyre/Config.in"
diff --git a/package/widevine/Config.in b/package/widevine/Config.in
new file mode 100644
index 0000000000..d730e6f9bd
--- /dev/null
+++ b/package/widevine/Config.in
@@ -0,0 +1,6 @@
+menuconfig BR2_PACKAGE_WIDEVINE
+	bool "widevine"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  Proprietary content decryption module (CDM) for the digital
+	  rights management (DRM) of internet content.
diff --git a/package/widevine/widevine.mk b/package/widevine/widevine.mk
new file mode 100644
index 0000000000..7a7546c5a0
--- /dev/null
+++ b/package/widevine/widevine.mk
@@ -0,0 +1,28 @@
+# Get latest version number from: https://dl.google.com/widevine-cdm/current.txt
+WIDEVINE_VERSION = 1.4.9.1088
+
+ifeq ($(BR2_i386),y)
+WIDEVINE_ARCH = ia32
+else ifeq ($(BR2_x86_64),y)
+WIDEVINE_ARCH = x64
+endif
+
+WIDEVINE_SOURCE = $(WIDEVINE_VERSION)-linux-$(WIDEVINE_ARCH).zip
+WIDEVINE_SITE = https://dl.google.com/widevine-cdm
+WIDEVINE_LICENSE = Proprietary
+WIDEVINE_LICENSE_FILES = LICENSE.txt
+WIDEVINE_INSTALL_STAGING = YES
+
+define WIDEVINE_EXTRACT_CMDS
+	$(UNZIP) $(WIDEVINE_DL_DIR)/$(WIDEVINE_SOURCE) -d $(@D)
+endef
+
+define WIDEVINE_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libwidevinecdm.so $(STAGING_DIR)/usr/lib
+endef
+
+define WIDEVINE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libwidevinecdm.so $(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))
-- 
2.20.1
