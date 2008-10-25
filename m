From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 25 Oct 2008 02:27:15 +0200
Subject: [Buildroot] [PATCH] uclibc: BR2_ENABLE_LOCALE selects BR2_USE_WCHAR
Message-ID: <200810250227.15595.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This also fixes the problem, when BR2_ENABLE_LOCALE=y and
BR2_USE_WCHAR=n. Then UCLIBC_HAS_WCHAR was first set to y but after it
overwritten to n.
---
Is this the right thing to do? It seemed so to me, because BR2_ENABLE_LOCALE
definitely wants to activate WCHAR support in uclibc.mk.

 toolchain/uClibc/Config.in |    1 +
 toolchain/uClibc/uclibc.mk |    2 --
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 4af60ea..f55379a 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -45,6 +45,7 @@ config BR2_UCLIBC_CONFIG
 
 config BR2_ENABLE_LOCALE
 	bool "Enable locale/gettext/i18n support?"
+	select BR2_USE_WCHAR
 	help
 	    Enable locale/gettext/i18n support?
 
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 45b57ce..02ceb3d 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -344,10 +344,8 @@ else
 endif
 ifeq ($(BR2_ENABLE_LOCALE),y)
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_PREGENERATED_LOCALE_DATA=y\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=y\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
-	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.oldconfig
-	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_USE_WCHAR),y)
 	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.oldconfig
-- 
1.5.6.4
