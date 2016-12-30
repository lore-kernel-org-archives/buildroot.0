From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:50 +0100
Subject: [Buildroot] [PATCH 49/52] package/asterisk: add optional iconv
	support
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <9e2dc3a55439562ac253227770c587eef4773732.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iconv support is available if iether the toolchain has iconv built-in
(glibc, musl, or uclibc-with-iconv) or if the libiconv package is
enabled. Both are exclusive one to the other, so we need only test one.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index dee60c0..d9bdb5b 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -36,7 +36,6 @@ ASTERISK_CONF_OPTS += \
 	--without-gmime \
 	--without-h323 \
 	--without-hoard \
-	--without-iconv \
 	--without-iksemel \
 	--without-imap \
 	--without-inotify \
@@ -131,6 +130,13 @@ else
 ASTERISK_CONF_OPTS += --without-ilbc
 endif
 
+ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),y)
+ASTERISK_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+ASTERISK_CONF_OPTS += --with-iconv
+else
+ASTERISK_CONF_OPTS += --without-iconv
+endif
+
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 ASTERISK_DEPENDENCIES += openldap
 ASTERISK_CONF_OPTS += --without-ldap
-- 
2.7.4
