From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu,  5 Dec 2019 17:14:59 +0000
Subject: [Buildroot] [PATCH v1 12/30] package/libcef: Add option to enable
 VA-API HW acceleration.
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
Message-ID: <20191205171517.96639-13-michael.drake@codethink.co.uk>
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
 package/libcef/Config.in | 7 +++++++
 package/libcef/libcef.mk | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/libcef/Config.in b/package/libcef/Config.in
index e74ed961f6..b4f76e1dbe 100644
--- a/package/libcef/Config.in
+++ b/package/libcef/Config.in
@@ -94,4 +94,11 @@ config BR2_PACKAGE_LIBCEF_CEFSIMPLE
 	help
 	  Enables libcef example application cefsimple.
 
+config BR2_PACKAGE_LIBCEF_VAAPI
+	bool "Enable va-api support in libcef."
+	depends on BR2_x86_64
+	select BR2_PACKAGE_LIBVA
+	help
+	  Enables VA-API-based hardware acceleration.
+
 endif
diff --git a/package/libcef/libcef.mk b/package/libcef/libcef.mk
index c555f0d85b..bc616b6923 100644
--- a/package/libcef/libcef.mk
+++ b/package/libcef/libcef.mk
@@ -214,6 +214,13 @@ else
 LIBCEF_GN_DEFINES += use_pulseaudio=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCEF_VAAPI),y)
+LIBCEF_GN_DEFINES += use_vaapi=true
+LIBCEF_DEPENDENCIES += libva
+else
+LIBCEF_GN_DEFINES += use_vaapi=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCEF_CEFSIMPLE),y)
 LIBCEF_BUILD_TARGETS += cefsimple
 define LIBCEF_INSTALL_CEFSIMPLE
-- 
2.20.1
