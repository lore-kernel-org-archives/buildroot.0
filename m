From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:26:57 +0200
Subject: [Buildroot] [git commit] package/apr-util: add optional support for
 openldap
Message-ID: <20180508132646.8266D8B90E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=134968c6c80fd9767e8731c821d690e53cd7f3da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

apr-util contains optional support for openldap:

$ ls -1 output/target/usr/lib/apr-util-1/apr_ldap*
output/target/usr/lib/apr-util-1/apr_ldap-1.so
output/target/usr/lib/apr-util-1/apr_ldap.la
output/target/usr/lib/apr-util-1/apr_ldap.so

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apr-util/apr-util.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 22f1913865..973194b915 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -47,6 +47,16 @@ else
 APR_UTIL_CONF_OPTS += --without-sqlite3
 endif
 
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+APR_UTIL_CONF_OPTS += \
+	--with-ldap \
+	--with-ldap-include="$(STAGING_DIR)/usr/include/" \
+	--with-ldap-lib="$(STAGING_DIR)/usr/lib"
+APR_UTIL_DEPENDENCIES += openldap
+else
+APR_UTIL_CONF_OPTS += --without-ldap
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 APR_UTIL_CONF_OPTS += --with-crypto --with-openssl="$(STAGING_DIR)/usr"
 APR_UTIL_DEPENDENCIES += openssl
