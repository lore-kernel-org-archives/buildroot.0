From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 16:13:39 +0200
Subject: [Buildroot] [git commit] squid: add optional dependency on libkrb5
Message-ID: <20180331141356.E84EC83F85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39d5d9ad65c0cb5f116287a7f0bd3cfc5d451de6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/squid/squid.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 8ade55ee37..2d21ad8858 100644
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
