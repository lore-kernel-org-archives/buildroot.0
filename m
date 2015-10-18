From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Oct 2015 22:29:37 +0200
Subject: [Buildroot] [PATCH v4 21/35] package/libelementary: add host package
In-Reply-To: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
References: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445200191-18404-22-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

elm_prefs_cc builded for the host machine is
needed to cross-compile correctly libelementary
for the target. Otherwise, elm_prefs_cc for the
target is used on the host machine.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: use libefl
    reword the commit message
---
 package/efl/libelementary/libelementary.mk | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index a2c4a60..4ba8681 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -12,14 +12,26 @@ LIBELEMENTARY_LICENSE_FILES = COPYING
 
 LIBELEMENTARY_INSTALL_STAGING = YES
 
-LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl libefl
+LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl host-libelementary libefl
 
 LIBELEMENTARY_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--with-eldbus_codegen=$(HOST_DIR)/usr/bin/eldbus-codegen \
+	--with-elm-prefs-cc=$(HOST_DIR)/usr/bin/elm_prefs_cc \
+	--with-doxygen=no \
+	--disable-elementary-test
+
+# We need a host package in order to provide elm_prefs_cc and
+# elementary_codegen.
+HOST_LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl
+HOST_LIBELEMENTARY_CONF_OPTS = \
+	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
+	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
+	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--with-doxygen=no \
 	--disable-elementary-test
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.4.3
