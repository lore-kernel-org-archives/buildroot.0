From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu,  5 Dec 2019 17:14:58 +0000
Subject: [Buildroot] [PATCH v1 11/30] package/libcef: Add option to build
 cefsimple.
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
Message-ID: <20191205171517.96639-12-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Preston <thomas.preston@codethink.co.uk>

This primitive browser is an example application which uses libcef.

Cc: Patrick Glaser <pglaser@tesla.com>
Cc: Jon duSaint <jdusaint@tesla.com>
Cc: Enis Lavery <elavery@tesla.com>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/libcef/Config.in | 9 +++++++++
 package/libcef/libcef.mk | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/libcef/Config.in b/package/libcef/Config.in
index e0d8929bce..e74ed961f6 100644
--- a/package/libcef/Config.in
+++ b/package/libcef/Config.in
@@ -86,3 +86,12 @@ config BR2_PACKAGE_LIBCEF
 	  Google Chromium web browser.
 
 	  https://bitbucket.org/chromiumembedded/cef
+
+if BR2_PACKAGE_LIBCEF
+
+config BR2_PACKAGE_LIBCEF_CEFSIMPLE
+	bool "Enable libcef example application cefsimple."
+	help
+	  Enables libcef example application cefsimple.
+
+endif
diff --git a/package/libcef/libcef.mk b/package/libcef/libcef.mk
index 4eb9c557c6..c555f0d85b 100644
--- a/package/libcef/libcef.mk
+++ b/package/libcef/libcef.mk
@@ -214,6 +214,15 @@ else
 LIBCEF_GN_DEFINES += use_pulseaudio=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCEF_CEFSIMPLE),y)
+LIBCEF_BUILD_TARGETS += cefsimple
+define LIBCEF_INSTALL_CEFSIMPLE
+	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/lib \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/cefsimple
+endef
+LIBCEF_POST_INSTALL_TARGET_HOOKS += LIBCEF_INSTALL_CEFSIMPLE
+endif
+
 # To build libcef, the CEF project source must be extracted in a
 # `cef` directory inside the Chromium source tree.  We override
 # the buildroot default extract commands to get the desired source
-- 
2.20.1
