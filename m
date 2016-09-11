From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 12 Sep 2016 00:26:07 +0200
Subject: [Buildroot] [PATCH 3/4] php: fix pthread detection
In-Reply-To: <1473632768-53238-1-git-send-email-fabrice.fontaine@orange.com>
References: <1473632768-53238-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <1473632768-53238-3-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following suggestion of Yann Morin, move fix on pthread detection in a
detected patch and add more comment on issue: without this fix, thread
safety option (--enable-maintainer-zts) will not work

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/php/php.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 97e3396..c4ff249 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -47,6 +47,20 @@ define PHP_BUILDCONF
 endef
 PHP_PRE_CONFIGURE_HOOKS += PHP_BUILDCONF
 
+# PHP assumes pthreads are not working when cross-compiling, indeed configure
+# sets pthreads_working to no if cross_compiling is set to yes (line 5888)
+# If pthreads_working is set to no, thread safety option
+# (--enable-maintainer-zts) will not be available
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+PHP_CONF_ENV += ac_cv_pthreads_lib=pthread
+
+define PHP_FIX_THREADS_DETECTION
+	$(SED) 's/pthreads_working\=no/pthreads_working\=yes/' $(@D)/configure
+endef
+
+PHP_PRE_CONFIGURE_HOOKS += PHP_FIX_THREADS_DETECTION
+endif
+
 ifeq ($(BR2_ENDIAN),"BIG")
 PHP_CONF_ENV += ac_cv_c_bigendian_php=yes
 else
-- 
2.5.0
