From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Dec 2015 09:51:41 +0100
Subject: [Buildroot] [PATCHv2 2/3] Revert "ltp-testsuite: don't link with
	libtirpc"
In-Reply-To: <1449823902-3309-1-git-send-email-patrickdepinguin@gmail.com>
References: <1449823902-3309-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1449823902-3309-2-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

This reverts commit 8f1c4c49a2ab0fc9e6cf73370f4483e253e5ac2d in favor of an
alternative solution in a subsequent patch.

Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

v2: reorder patches only

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
-- 
1.9.5
