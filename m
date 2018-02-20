From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Tue, 20 Feb 2018 11:53:37 +0100
Subject: [Buildroot] [PATCH next v7 2/2] squid: Add optional dependency on
 libkrb5
In-Reply-To: <1519124017-7510-1-git-send-email-nerv@dawncrow.de>
References: <1519124017-7510-1-git-send-email-nerv@dawncrow.de>
Message-ID: <1519124017-7510-2-git-send-email-nerv@dawncrow.de>
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
index 8ade55e..2d21ad8 100644
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
+SQUID_CONF_OPTS += --with-mit-krb5
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
