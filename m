From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:30 +0000
Subject: [Buildroot] [RFC PATCH v3 16/30] package/libcef: Widevine support
 depends on widevine package.
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-17-thomas.preston@codethink.co.uk>
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
 ...devine-assert.patch => 0002-stop-widevine-assert.patch} | 0
 package/libcef/Config.in                                   | 6 ++++++
 package/libcef/libcef.mk                                   | 7 +++++++
 3 files changed, 13 insertions(+)
 rename package/libcef/{0003-stop-widevine-assert.patch => 0002-stop-widevine-assert.patch} (100%)

diff --git a/package/libcef/0003-stop-widevine-assert.patch b/package/libcef/0002-stop-widevine-assert.patch
similarity index 100%
rename from package/libcef/0003-stop-widevine-assert.patch
rename to package/libcef/0002-stop-widevine-assert.patch
diff --git a/package/libcef/Config.in b/package/libcef/Config.in
index 3344750b5b..e0a70e626c 100644
--- a/package/libcef/Config.in
+++ b/package/libcef/Config.in
@@ -95,6 +95,12 @@ config BR2_PACKAGE_LIBCEF_CEFSIMPLE
 	help
 	  Enables libcef example application cefsimple.
 
+config BR2_PACKAGE_LIBCEF_WIDEVINE
+	bool "Enable Widevine support in libcef."
+	select BR2_PACKAGE_WIDEVINE
+	help
+	  Enables Widevine key system support.
+
 config BR2_PACKAGE_LIBCEF_VAAPI
 	bool "Enable va-api support in libcef."
 	depends on BR2_x86_64
diff --git a/package/libcef/libcef.mk b/package/libcef/libcef.mk
index 7cc4888f44..0bd80f65d4 100644
--- a/package/libcef/libcef.mk
+++ b/package/libcef/libcef.mk
@@ -214,6 +214,13 @@ else
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
