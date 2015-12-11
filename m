From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Dec 2015 21:34:29 +0100
Subject: [Buildroot] [git commit] Revert "ltp-testsuite: don't link with
	libtirpc"
Message-ID: <20151211203817.A96958249B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b946ee2a834f737e775edd2410baf12afcd037f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 8f1c4c49a2ab0fc9e6cf73370f4483e253e5ac2d in favor of an
alternative solution in a subsequent patch.

Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 78dc9f4..da36636 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -24,11 +24,18 @@ endif
 # support.
 LTP_TESTSUITE_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
 LTP_TESTSUITE_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
+LTP_TESTSUITE_LIBS =
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+LTP_TESTSUITE_DEPENDENCIES += libtirpc host-pkgconf
+LTP_TESTSUITE_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
+LTP_TESTSUITE_LIBS += "`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
+endif
 
 LTP_TESTSUITE_CONF_ENV += \
-	ac_cv_header_tirpc_netconfig_h=no \
 	CFLAGS="$(LTP_TESTSUITE_CFLAGS)" \
 	CPPFLAGS="$(LTP_TESTSUITE_CPPFLAGS)" \
+	LIBS="$(LTP_TESTSUITE_LIBS)" \
 	SYSROOT="$(STAGING_DIR)"
 
 $(eval $(autotools-package))
