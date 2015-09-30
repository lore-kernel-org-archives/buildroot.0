From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Sep 2015 14:38:49 +0300
Subject: [Buildroot] [PATCH 2/2] ltp-testsuite: don't link with libtirpc
In-Reply-To: <5e7ab0a7bf987fa76a167569b823df89144af045.1443613129.git.baruch@tkos.co.il>
References: <5e7ab0a7bf987fa76a167569b823df89144af045.1443613129.git.baruch@tkos.co.il>
Message-ID: <4f342418e3b1c4cb115e13709fe7366ce8ba0db7.1443613129.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot patches libtirpc to remove auth_des support. This breaks tirpc test
build. Remove support for libtirpc for now.

Fixes:
http://autobuild.buildroot.net/results/301/3015eee7b1b6b240e7948b08954d273d28f44c32/

Cc: Anders Roxell <anders.roxell@linaro.org>
Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ltp-testsuite/ltp-testsuite.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index b23cc05441dc..7fe42eb82ff9 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -24,18 +24,11 @@ endif
 # support.
 LTP_TESTSUITE_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
 LTP_TESTSUITE_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
-LTP_TESTSUITE_LIBS =
-
-ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-LTP_TESTSUITE_DEPENDENCIES += libtirpc host-pkgconf
-LTP_TESTSUITE_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
-LTP_TESTSUITE_LIBS += "`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
-endif
 
 LTP_TESTSUITE_CONF_ENV += \
+	ac_cv_header_tirpc_netconfig_h=no \
 	CFLAGS="$(LTP_TESTSUITE_CFLAGS)" \
 	CPPFLAGS="$(LTP_TESTSUITE_CPPFLAGS)" \
-	LIBS="$(LTP_TESTSUITE_LIBS)" \
 	SYSROOT="$(STAGING_DIR)"
 
 $(eval $(autotools-package))
-- 
2.5.3
