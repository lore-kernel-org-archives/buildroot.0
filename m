From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:34 +0200
Subject: [Buildroot] [RFC 24/37] package/libelementary: add host package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-25-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libelementary for the target needs elm_prefs_cc in order to
cross-compile correctly.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/libelementary/libelementary.mk | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/libelementary/libelementary.mk b/package/libelementary/libelementary.mk
index 0bec456..e8b026e 100644
--- a/package/libelementary/libelementary.mk
+++ b/package/libelementary/libelementary.mk
@@ -12,14 +12,26 @@ LIBELEMENTARY_LICENSE_FILES = COPYING
 
 LIBELEMENTARY_INSTALL_STAGING = YES
 
-LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-efl efl
+LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-efl efl host-libelementary
 
 LIBELEMENTARY_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--with-eldbus_codegen=$(HOST_DIR)/usr/bin/eldbus-codegen \
+	--with-elm-prefs-cc=$(HOST_DIR)/usr/bin/elm_prefs_cc \
 	--with-doxygen=no \
 	--disable-elementary-test
 
+# We need a host package in order to provide elm_prefs_cc and
+# elementary_codegen.
+HOST_LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-efl
+HOST_LIBELEMENTARY_CONF_OPTS = \
+	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
+	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
+	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
+ 	--with-doxygen=no \
+ 	--disable-elementary-test
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.4.3
