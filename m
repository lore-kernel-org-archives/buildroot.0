From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 24 Feb 2015 11:53:17 +0100
Subject: [Buildroot] [PATCH master 1/2] popt: add to the "popt.pc" the
	dependency libintl
Message-ID: <1424775198-1787-1-git-send-email-Fabio.Porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Porcedda <fabio.porcedda@gmail.com>

This change permits through pkg-config to retrive even the depenencies
that is useful for a static linking.

Signed-off-by: Fabio Porcedda <Fabio.Porcedda@gmail.com>
---
 package/popt/popt.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 8ce64d4..e6d51c0 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -15,10 +15,19 @@ POPT_GETTEXTIZE = YES
 
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
+define POPT_POST_PATCH_FIX_PC
+	$(SED) "s/Libs:/Libs.private: -lintl\nLibs:/" $(@D)/popt.pc.in
+endef
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 POPT_CONF_ENV += am_cv_lib_iconv=yes
 POPT_CONF_OPTS += --with-libiconv-prefix=$(STAGING_DIR)/usr
 endif
 
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+ POPT_DEPENDENCIES += gettext
+ POPT_POST_PATCH_HOOKS += POPT_POST_PATCH_FIX_PC
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.3.0
