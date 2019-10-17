From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 17 Oct 2019 16:29:14 +0100
Subject: [Buildroot] [RFC PATCH v2 15/30] package/libcef: Add option to
 build cefclient and cefsimple.
In-Reply-To: <20191017152929.49153-1-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
Message-ID: <20191017152929.49153-16-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Preston <thomas.preston@codethink.co.uk>

Cc: Patrick Glaser <pglaser@tesla.com>
Cc: Jon duSaint <jdusaint@tesla.com>
Cc: Enis Lavery <elavery@tesla.com>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/libcef/Config.in | 10 ++++++++++
 package/libcef/libcef.mk | 18 ++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/package/libcef/Config.in b/package/libcef/Config.in
index 85a993bb93..7bdaf17ffd 100644
--- a/package/libcef/Config.in
+++ b/package/libcef/Config.in
@@ -58,6 +58,16 @@ config BR2_PACKAGE_LIBCEF
 
 if BR2_PACKAGE_LIBCEF
 
+config BR2_PACKAGE_LIBCEF_CEFSIMPLE
+	bool "Enable libcef example application cefsimple."
+	help
+	  Enables libcef example application cefsimple.
+
+config BR2_PACKAGE_LIBCEF_CEFCLIENT
+	bool "Enable libcef example application cefclient."
+	help
+	  Enables libcef example application cefclient.
+
 config BR2_PACKAGE_LIBCEF_TARGET_ARCH
 	string
 	default "arm" if BR2_arm
diff --git a/package/libcef/libcef.mk b/package/libcef/libcef.mk
index fe69cabb2c..b20c003a90 100644
--- a/package/libcef/libcef.mk
+++ b/package/libcef/libcef.mk
@@ -204,6 +204,24 @@ else
 LIBCEF_GN_DEFINES += use_pulseaudio=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCEF_CEFSIMPLE),y)
+LIBCEF_BUILD_TARGETS += cefsimple
+define LIBCEF_INSTALL_CEFSIMPLE
+	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/bin \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/cefsimple
+endef
+LIBCEF_POST_INSTALL_TARGET_HOOKS += LIBCEF_INSTALL_CEFSIMPLE
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCEF_CEFCLIENT),y)
+LIBCEF_BUILD_TARGETS += cefclient
+define LIBCEF_INSTALL_CEFCLIENT
+	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/bin \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/cefclient
+endef
+LIBCEF_POST_INSTALL_TARGET_HOOKS += LIBCEF_INSTALL_CEFCLIENT
+endif
+
 define LIBCEF_EXTRACT_CMDS
 	# Extract Chromium source code
 	tar -C $(@D) \
-- 
2.20.1
