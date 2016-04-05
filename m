From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  5 Apr 2016 22:40:26 +0200
Subject: [Buildroot] [PATCH 1/2] poco: bump to version 1.7.2
Message-ID: <1459888827-20199-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also:
 - add a hash file.
 - replace patch #0002 by passing the DEFAULT_TARGET to poco
 - remove patch #0003 as it is obsolet since upstream commit
   010f7a5370be450109f1726e39d5b193e63a6373
 - remove patch #0004 which is applied upstream
 - remove patch #0005 which is fixed by upstream different

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../0002-poco-don-t-build-debug-libraries.patch    | 33 ----------
 ...nflicting-declaration-with-unbundled-pcre.patch | 56 -----------------
 package/poco/0004-fix-unbundled-pcre-usage.patch   | 72 ----------------------
 .../0005-add-missing-LIBPREFIX-definition.patch    | 29 ---------
 package/poco/poco.hash                             |  2 +
 package/poco/poco.mk                               | 21 +++++--
 6 files changed, 18 insertions(+), 195 deletions(-)
 delete mode 100644 package/poco/0002-poco-don-t-build-debug-libraries.patch
 delete mode 100644 package/poco/0003-Fix-conflicting-declaration-with-unbundled-pcre.patch
 delete mode 100644 package/poco/0004-fix-unbundled-pcre-usage.patch
 delete mode 100644 package/poco/0005-add-missing-LIBPREFIX-definition.patch
 create mode 100644 package/poco/poco.hash

diff --git a/package/poco/0002-poco-don-t-build-debug-libraries.patch b/package/poco/0002-poco-don-t-build-debug-libraries.patch
deleted file mode 100644
index 11bb7e9..0000000
--- a/package/poco/0002-poco-don-t-build-debug-libraries.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e84c85cfa6742becbd4f82047ce92290bb3ec19a Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 4 Aug 2015 10:15:17 +0200
-Subject: [PATCH 2/2] poco: don't build debug libraries
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Remove the debug libraries build dependency from the default target.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-[J?rg: Update to version 1.6.1 from github]
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- build/rules/compile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/rules/compile b/build/rules/compile
-index 1945e3c..e0d7fbc 100644
---- a/build/rules/compile
-+++ b/build/rules/compile
-@@ -14,7 +14,7 @@
- 
- all: $(DEFAULT_TARGET)
- all_static: static_debug static_release
--all_shared: shared_debug shared_release
-+all_shared: shared_release
- all_debug: static_debug shared_debug
- all_release: static_release shared_release
- 
--- 
-2.5.0
-
diff --git a/package/poco/0003-Fix-conflicting-declaration-with-unbundled-pcre.patch b/package/poco/0003-Fix-conflicting-declaration-with-unbundled-pcre.patch
deleted file mode 100644
index 669e53a..0000000
--- a/package/poco/0003-Fix-conflicting-declaration-with-unbundled-pcre.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 4e1165e1081e75de842567b16ae963cbed54e2a3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Tue, 4 Aug 2015 11:09:12 +0200
-Subject: [PATCH 3/3] Fix conflicting declaration with unbundled pcre
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Building poco 1.6.1 with the `--unbundled` config options fails due to an
-conflicting declaration of `pcre`:
-
-```sh
-In file included from src/RegularExpression.cpp:21:0:
-/usr/include/pcre.h:325:26: error: conflicting declaration ?typedef struct real_pcre pcre?
- typedef struct real_pcre pcre;
-                          ^
-In file included from src/RegularExpression.cpp:17:0:
-include/Poco/RegularExpression.h:37:34: note: previous declaration as ?typedef struct real_pcre8_or_16 pcre?
-  typedef struct real_pcre8_or_16 pcre;
-```
-
-Upstream status:
-https://github.com/pocoproject/poco/pull/897
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- Foundation/include/Poco/RegularExpression.h | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/Foundation/include/Poco/RegularExpression.h b/Foundation/include/Poco/RegularExpression.h
-index e1bc063..989ed52 100644
---- a/Foundation/include/Poco/RegularExpression.h
-+++ b/Foundation/include/Poco/RegularExpression.h
-@@ -26,7 +26,9 @@
- #include "Poco/Foundation.h"
- #include <vector>
- 
--
-+#if defined(POCO_UNBUNDLED)
-+#include <pcre.h>
-+#else
- //
- // Copy these definitions from pcre.h
- // to avoid pulling in the entire header file
-@@ -37,7 +39,7 @@ extern "C"
- 	typedef struct real_pcre8_or_16 pcre;
- 	struct pcre_extra;
- }
--
-+#endif
- 
- namespace Poco {
- 
--- 
-2.5.0
-
diff --git a/package/poco/0004-fix-unbundled-pcre-usage.patch b/package/poco/0004-fix-unbundled-pcre-usage.patch
deleted file mode 100644
index 4c6c8b4..0000000
--- a/package/poco/0004-fix-unbundled-pcre-usage.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 75636a750ecd93305eabe226ad95d2a58e65117f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 3 Nov 2015 16:33:33 +0100
-Subject: [PATCH] Fix build with unbundled pcre
-
-Poco supports two modes for the pcre library: bundled (the default)
-and unbundled. In bundled mode, an internal copy of the pcre library
-is used by Poco. Since this isn't really nice, Buildroot uses the
-"unbundled" mode. However, Poco pokes into some internal symbols of
-pcre, which doesn't play well with unbundled.
-
-To solve this, this commit is an adaptation of the Gentoo patch at
-https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/poco/files/poco-1.4.4-patch-for-libpcre-8.32.patch?revision=1.1
-to make such symbols available internally in Poco, by using parts of
-the bundled Pcre copy.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Foundation/Makefile            |  1 +
- Foundation/src/pcre_internal.h | 17 +++++++++++++++++
- 2 files changed, 18 insertions(+)
-
-diff --git a/Foundation/Makefile b/Foundation/Makefile
-index a347daa..9231c51 100644
---- a/Foundation/Makefile
-+++ b/Foundation/Makefile
-@@ -46,6 +46,7 @@ pcre_utf8_objects = pcre_ucd pcre_tables
- 
- ifdef POCO_UNBUNDLED
- 	SYSLIBS += -lpcre -lz
-+	objects += $(pcre_utf8_objects)
- else
- 	objects += $(zlib_objects) $(pcre_objects) $(pcre_utf8_objects)
- endif
-diff --git a/Foundation/src/pcre_internal.h b/Foundation/src/pcre_internal.h
-index f3e69fc..c6f1d44 100644
---- a/Foundation/src/pcre_internal.h
-+++ b/Foundation/src/pcre_internal.h
-@@ -2636,6 +2636,17 @@ typedef struct {
- } ucp_type_table;
- 
- 
-+/* renamed to avoid clashes with system pcre */
-+#define _pcre_utf8_table1      _poco__pcre_utf8_table1
-+#define _pcre_utf8_table1_size _poco__pcre_utf8_table1_size
-+#define _pcre_utf8_table2      _poco__pcre_utf8_table2
-+#define _pcre_utf8_table3      _poco__pcre_utf8_table3
-+#define _pcre_utf8_table4      _poco__pcre_utf8_table4
-+#define _pcre_utt              _poco__pcre_utt
-+#define _pcre_utt_size         _poco__pcre_utt_size
-+#define _pcre_utt_names        _poco__pcre_utt_names
-+#define _pcre_OP_lengths       _poco__pcre_OP_lengths
-+
- /* Internal shared data tables. These are tables that are used by more than one
- of the exported public functions. They have to be "external" in the C sense,
- but are not part of the PCRE public API. The data for these tables is in the
-@@ -2749,6 +2760,12 @@ typedef struct {
-   pcre_int32 other_case; /* offset to other case, or zero if none */
- } ucd_record;
- 
-+/* renamed to avoid clashes with system pcre */
-+#define _pcre_ucd_records _poco__pcre_ucd_records
-+#define _pcre_ucd_stage1 _poco__pcre_ucd_stage1
-+#define _pcre_ucd_stage2 _poco__pcre_ucd_stage2
-+#define _pcre_ucp_gentype _poco__pcre_ucp_gentype
-+
- extern const pcre_uint32 PRIV(ucd_caseless_sets)[];
- extern const ucd_record  PRIV(ucd_records)[];
- extern const pcre_uint8  PRIV(ucd_stage1)[];
--- 
-2.6.2
-
diff --git a/package/poco/0005-add-missing-LIBPREFIX-definition.patch b/package/poco/0005-add-missing-LIBPREFIX-definition.patch
deleted file mode 100644
index bfdfad7..0000000
--- a/package/poco/0005-add-missing-LIBPREFIX-definition.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c2a49cbc635d8dc894763624c061be5ae8a1a01c Mon Sep 17 00:00:00 2001
-From: Guenter Obiltschnig <guenter.obiltschnig@appinf.com>
-Date: Mon, 30 Mar 2015 16:21:01 +0200
-Subject: [PATCH] add missing LIBPREFIX definition
-
-Backport from upstream commit c2a49cbc635d8dc894763624c061be5ae8a1a01c
-to ensure libraries are properly installed.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 49318a3..7ee99d8 100644
---- a/Makefile
-+++ b/Makefile
-@@ -20,6 +20,8 @@ ifndef POCO_BUILD
- export POCO_BUILD=$(POCO_BASE)
- endif
- 
-+LIBPREFIX ?= lib
-+
- .PHONY: poco all libexecs cppunit tests samples cleans clean distclean install
- 
- # TESTS and SAMPLES are set in config.make
--- 
-2.6.2
-
diff --git a/package/poco/poco.hash b/package/poco/poco.hash
new file mode 100644
index 0000000..c3b490e
--- /dev/null
+++ b/package/poco/poco.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  cfd311ecbc9e58accf1c4ea70170af88f92f88e73dd14944e528e7f6229e6cab  poco-poco-1.7.2-release.tar.gz
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 580ee9e..7b99b04 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = poco-1.6.1-release
+POCO_VERSION = poco-1.7.2-release
 POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION))
 POCO_LICENSE = Boost-v1.0
 POCO_LICENSE_FILES = LICENSE
@@ -37,6 +37,14 @@ ifeq ($(BR2_sh4a)$(BR2_nios2),y)
 POCO_CONF_OPTS += --no-fpenvironment
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+POCO_MAKE_TARGET = static_release
+else ifeq ($(BR2_SHARED_LIBS),y)
+POCO_MAKE_TARGET = shared_release
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+POCO_MAKE_TARGET = all_release
+endif
+
 define POCO_CONFIGURE_CMDS
 	(cd $(@D); ./configure \
 		--config=Linux		\
@@ -49,17 +57,20 @@ define POCO_CONFIGURE_CMDS
 endef
 
 define POCO_BUILD_CMDS
-	$(MAKE1) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
+	$(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
 		MYSQL_LIBDIR=$(STAGING_DIR)/usr/lib/mysql \
-		MYSQL_INCDIR=$(STAGING_DIR)/usr/include/mysql -C $(@D)
+		MYSQL_INCDIR=$(STAGING_DIR)/usr/include/mysql \
+		DEFAULT_TARGET=$(POCO_MAKE_TARGET) -C $(@D)
 endef
 
 define POCO_INSTALL_STAGING_CMDS
-	$(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) install -C $(@D)
+	$(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) \
+		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
 endef
 
 define POCO_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) install -C $(@D)
+	$(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) \
+		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
 endef
 
 $(eval $(generic-package))
-- 
2.8.0
