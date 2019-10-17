From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 17 Oct 2019 16:29:15 +0100
Subject: [Buildroot] [RFC PATCH v2 16/30] package/libcef: Add option to
 enable VA-API HW acceleration.
In-Reply-To: <20191017152929.49153-1-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
Message-ID: <20191017152929.49153-17-michael.drake@codethink.co.uk>
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
index 7bdaf17ffd..05d577ecb6 100644
--- a/package/libcef/Config.in
+++ b/package/libcef/Config.in
@@ -68,6 +68,12 @@ config BR2_PACKAGE_LIBCEF_CEFCLIENT
 	help
 	  Enables libcef example application cefclient.
 
+config BR2_PACKAGE_LIBCEF_VAAPI
+	bool "Enable va-api support in libcef."
+	select BR2_PACKAGE_LIBVA
+	help
+	  Enables VA-API-based hardware acceleration.
+
 config BR2_PACKAGE_LIBCEF_TARGET_ARCH
 	string
 	default "arm" if BR2_arm
diff --git a/package/libcef/libcef.mk b/package/libcef/libcef.mk
index b20c003a90..9fa87cbb89 100644
--- a/package/libcef/libcef.mk
+++ b/package/libcef/libcef.mk
@@ -204,6 +204,13 @@ else
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
