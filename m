From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2014 10:52:27 +0100
Subject: [Buildroot] [git commit] zxing: don't select libiconv
Message-ID: <20140202102515.2D1AF9C70A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95b623963a8c90e6776ba025869ee19bb98480b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The zxing package currently selects libiconv when locale support is not
available in the toolchain.  This patch stops the zxing package selecting
libiconv.  The zxing package now uses uses libiconv if it's available
otherwise iconv support is disabled in zxing.

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zxing/Config.in |    1 -
 package/zxing/zxing.mk  |    8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/zxing/Config.in b/package/zxing/Config.in
index b69dfc9..1e04635 100644
--- a/package/zxing/Config.in
+++ b/package/zxing/Config.in
@@ -4,7 +4,6 @@ comment "zxing needs a toolchain w/ C++"
 config BR2_PACKAGE_ZXING
 	bool "zxing"
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  ZXing (pronounced "zebra crossing") is an open-source,
 	  multi-format 1D/2D barcode image processing library
diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
index 367a84f..5942167 100644
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -12,7 +12,13 @@ ZXING_LICENSE_FILES = COPYING
 ZXING_INSTALL_STAGING = YES
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
 ZXING_DEPENDENCIES += libiconv
+else
+# There is no locale support in the toolchain and libiconv
+# is not available so disable iconv support in zxing
+ZING_MAKE_OPT=CXXFLAGS+="-DNO_ICONV"
+endif
 endif
 
 define ZXING_EXTRACT_CMDS
@@ -20,7 +26,7 @@ define ZXING_EXTRACT_CMDS
 endef
 
 define ZXING_BUILD_CMDS
-	$(MAKE) -C $(@D)/cpp/core/src $(TARGET_CONFIGURE_OPTS)
+	$(MAKE) -C $(@D)/cpp/core/src $(TARGET_CONFIGURE_OPTS) $(ZING_MAKE_OPT)
 endef
 
 define ZXING_INSTALL_STAGING_CMDS
