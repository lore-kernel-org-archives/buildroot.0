From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 18 Aug 2016 08:25:35 +0200
Subject: [Buildroot] [PATCH] pcre: fix compile error for m68k coldfire
Message-ID: <20160818062535.GA28475@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some very big functions can not be compiled successfully for
m68k coldfire, when -msep-data is used.

Fixes:
  http://autobuild.buildroot.net/results/d31/d311955ada1ffcd7f69e82965c8fe33eabe488cd/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/pcre/pcre.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index a10950d..6352cc8 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -26,5 +26,11 @@ PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_32),--enable-pcre32,--disable-pcre32)
 PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UTF),--enable-utf,--disable-utf)
 PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UCP),--enable-unicode-properties,--disable-unicode-properties)
 
+# fixes gcc error: value -yyyyy out of range
+ifeq ($(BR2_m68k_cf),y)
+PCRE_CFLAGS = $(filter-out -msep-data,$(TARGET_CFLAGS))
+PCRE_CONF_ENV += CFLAGS="$(PCRE_CFLAGS)"
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.4
