From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 23 Dec 2020 11:59:50 +0100
Subject: [Buildroot] [PATCH 3/3] package/mutt: add gnutls optional dependency
In-Reply-To: <20201223105950.2278971-1-fontaine.fabrice@gmail.com>
References: <20201223105950.2278971-1-fontaine.fabrice@gmail.com>
Message-ID: <20201223105950.2278971-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnutls is an optional dependency since version 1.5.7 and
https://gitlab.com/muttmua/mutt/-/commit/457d70d6b10860bae084837024eb34aa3bfbc5fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.mk | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 4e14004577..67fc4ed838 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -46,12 +46,23 @@ endif
 ifneq ($(BR2_PACKAGE_MUTT_IMAP)$(BR2_PACKAGE_MUTT_POP3),)
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MUTT_DEPENDENCIES += openssl
-MUTT_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
+MUTT_CONF_OPTS += \
+	--without-gnutls \
+	--with-ssl=$(STAGING_DIR)/usr
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+MUTT_DEPENDENCIES += gnutls
+MUTT_CONF_OPTS += \
+	--with-gnutls=$(STAGING_DIR)/usr \
+	--without-ssl
 else
-MUTT_CONF_OPTS += --without-ssl
+MUTT_CONF_OPTS += \
+	--without-gnutls \
+	--without-ssl
 endif
 else
-MUTT_CONF_OPTS += --without-ssl
+MUTT_CONF_OPTS += \
+	--without-gnutls \
+	--without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_SQLITE),y)
-- 
2.29.2
