From: Johan Derycke <johanderycke@gmail.com>
Date: Tue, 13 May 2014 18:10:18 +0200
Subject: [Buildroot] [PATCH 1/1] icu: add an option to add a custom data
	library file
Message-ID: <1399997418-27131-1-git-send-email-johan.derycke@barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Johan Derycke <johan.derycke@barco.com>
---
 package/icu/Config.in |   21 +++++++++++++++++++++
 package/icu/icu.mk    |    9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/icu/Config.in b/package/icu/Config.in
index 9a27894..1f27b4b 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -13,8 +13,29 @@ config BR2_PACKAGE_ICU
 
 	  http://site.icu-project.org/
 
+if BR2_PACKAGE_ICU
+
+config BR2_PACKAGE_ICU_CUSTOM_DATA
+	bool "Custom data library"
+	  help
+	    Use a custom data library generated with:
+	    http://apps.icu-project.org/datacustom/ICUData51.html
+
+if BR2_PACKAGE_ICU_CUSTOM_DATA
+
+config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
+	string "Data library file to use?"
+	default "/path/to/data/library"
+	help
+	  This option allows to set the path of such a data library file
+
+endif
+
+endif
+
 comment "icu needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_arc
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
+
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index f93eab1..664ce1c 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -26,5 +26,14 @@ ICU_MAKE = $(MAKE1)
 ICU_SUBDIR = source
 HOST_ICU_SUBDIR = source
 
+define ICU_COPY_CUSTOM_DATA
+	cp $(BR2_PACKAGE_ICU_CUSTOM_DATA_PATH) $(@D)/source/data/in/
+endef
+
+ifeq ($(BR2_PACKAGE_ICU_CUSTOM_DATA),y)
+ICU_POST_EXTRACT_HOOKS += ICU_COPY_CUSTOM_DATA
+endif
+
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.10.4
