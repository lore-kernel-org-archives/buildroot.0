From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Sun,  5 Nov 2017 17:22:35 +0100
Subject: [Buildroot] [PATCH 2/2] squid: Add libkrb5 dependency check
In-Reply-To: <1509898955-17124-1-git-send-email-nerv@dawncrow.de>
References: <1509898955-17124-1-git-send-email-nerv@dawncrow.de>
Message-ID: <1509898955-17124-2-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/squid/squid.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index d334d14..3b3649a 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -29,7 +29,6 @@ SQUID_CONF_OPTS = \
 	--enable-removal-policies="lru,heap" \
 	--with-filedescriptors=1024 \
 	--disable-ident-lookups \
-	--without-mit-krb5 \
 	--enable-auth-basic="fake getpwnam" \
 	--enable-auth-digest="file" \
 	--enable-auth-negotiate="wrapper" \
@@ -50,6 +49,13 @@ else
 SQUID_CONF_ENV += squid_cv_gnu_atomics=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+SQUID_CONF_OPTS += --without-krb5
+SQUID_DEPENDENCIES += libkrb5
+else
+SQUID_CONF_OPTS += --without-mit-krb5
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SQUID_CONF_OPTS += --with-openssl
 SQUID_DEPENDENCIES += openssl
-- 
2.7.4
