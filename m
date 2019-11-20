From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:29 +0000
Subject: [Buildroot] [RFC PATCH v3 15/30] package/widevine: Add package for
 the widevine CDM library.
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-16-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Drake <michael.drake@codethink.co.uk>

Cc: Patrick Glaser <pglaser@tesla.com>
Cc: Jon duSaint <jdusaint@tesla.com>
Cc: Enis Lavery <elavery@tesla.com>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/Config.in            |  1 +
 package/widevine/Config.in   |  6 ++++++
 package/widevine/widevine.mk | 38 ++++++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 package/widevine/Config.in
 create mode 100644 package/widevine/widevine.mk

diff --git a/package/Config.in b/package/Config.in
index 9cbb454a50..a27b9ad778 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1684,6 +1684,7 @@ menu "Networking"
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
index 0000000000..a6e96ae99b
--- /dev/null
+++ b/package/widevine/widevine.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# Widevine
+#
+################################################################################
+
+# Get latest version number from: https://dl.google.com/widevine-cdm/versions.txt
+WIDEVINE_VERSION = 4.10.1440.19
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
+	$(INSTALL) -D -m 0755 -t $(STAGING_DIR)/usr/lib \
+			$(@D)/libwidevinecdm.so \
+			$(@D)/manifest.json
+endef
+
+define WIDEVINE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 -t $(TARGET_DIR)/usr/lib \
+			$(@D)/libwidevinecdm.so \
+			$(@D)/manifest.json
+endef
+
+$(eval $(generic-package))
-- 
2.20.1
