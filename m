From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu,  5 Dec 2019 17:15:02 +0000
Subject: [Buildroot] [PATCH v1 15/30] package/libcef: Widevine support
 depends on widevine package.
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
Message-ID: <20191205171517.96639-16-michael.drake@codethink.co.uk>
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
 .../libcef/0003-stop-widevine-assert.patch    | 24 +++++++++++++++++++
 package/libcef/Config.in                      |  6 +++++
 package/libcef/libcef.mk                      |  7 ++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/libcef/0003-stop-widevine-assert.patch

diff --git a/package/libcef/0003-stop-widevine-assert.patch b/package/libcef/0003-stop-widevine-assert.patch
new file mode 100644
index 0000000000..da511d8c01
--- /dev/null
+++ b/package/libcef/0003-stop-widevine-assert.patch
@@ -0,0 +1,24 @@
+From: Michael Drake <michael.drake@codethink.co.uk>
+Date: Thu, 31 Oct 2019 17:14:20 +0000
+Subject: [PATCH] CEF: Don't enforce Widevine.
+
+Allow the library to be built without Widevine support.
+
+Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
+Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
+
+diff --git a/BUILD.gn b/BUILD.gn
+index f5dd5cad..b37080cb 100644
+--- a/cef/BUILD.gn
++++ b/cef/BUILD.gn
+@@ -246,9 +246,6 @@ assert(enable_basic_printing)
+ assert(enable_print_preview)
+ assert(!enable_service_discovery)
+ 
+-# Enable support for Widevine CDM.
+-assert(enable_widevine)
+-
+ if (is_clang) {
+   # Don't use the chrome style plugin.
+   assert(!clang_use_chrome_plugins)
+
diff --git a/package/libcef/Config.in b/package/libcef/Config.in
index 67113dacd0..bab584df30 100644
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
index 5508d34d13..9d3b305451 100644
--- a/package/libcef/libcef.mk
+++ b/package/libcef/libcef.mk
@@ -220,6 +220,13 @@ else
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
