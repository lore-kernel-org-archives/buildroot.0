From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 17 Oct 2019 16:29:18 +0100
Subject: [Buildroot] [RFC PATCH v2 19/30] package/libcef: Widevine support
 depends on widevine package.
In-Reply-To: <20191017152929.49153-1-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
Message-ID: <20191017152929.49153-20-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Patrick Glaser <pglaser@tesla.com>
Cc: Jon duSaint <jdusaint@tesla.com>
Cc: Enis Lavery <elavery@tesla.com>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/libcef/Config.in | 6 ++++++
 package/libcef/libcef.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/libcef/Config.in b/package/libcef/Config.in
index 46d412f228..c06fc094d3 100644
--- a/package/libcef/Config.in
+++ b/package/libcef/Config.in
@@ -69,6 +69,12 @@ config BR2_PACKAGE_LIBCEF_CEFCLIENT
 	help
 	  Enables libcef example application cefclient.
 
+config BR2_PACKAGE_LIBCEF_WIDEVINE
+	bool "Enable Widevine support in libcef."
+	select BR2_PACKAGE_WIDEVINE
+	help
+	  Enables Widevine key system support.
+
 config BR2_PACKAGE_LIBCEF_VAAPI
 	bool "Enable va-api support in libcef."
 	select BR2_PACKAGE_LIBVA
diff --git a/package/libcef/libcef.mk b/package/libcef/libcef.mk
index e7a4c2b1a3..0fa9c61315 100644
--- a/package/libcef/libcef.mk
+++ b/package/libcef/libcef.mk
@@ -210,6 +210,13 @@ else
 LIBCEF_GN_DEFINES += use_pulseaudio=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCEF_WIDEVINE),y)
+LIBCEF_GN_DEFINES += enable_widevine=true
+LIBCEF_DEPENDENCIES += widevine
+else
+LIBCEF_GN_DEFINES += enable_widevine=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCEF_VAAPI),y)
 LIBCEF_GN_DEFINES += use_vaapi=true
 LIBCEF_DEPENDENCIES += libva
-- 
2.20.1
