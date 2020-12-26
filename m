From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:23:01 +0100
Subject: [Buildroot] [git commit] package/mutt: add gnutls optional
 dependency
Message-ID: <20201226170551.594C180E57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4446556e40ab55ecc9e49d58c862611f409f70a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnutls is an optional dependency since version 1.5.7 and
https://gitlab.com/muttmua/mutt/-/commit/457d70d6b10860bae084837024eb34aa3bfbc5fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
