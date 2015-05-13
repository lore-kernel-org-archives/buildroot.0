From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 13 May 2015 21:22:07 +0300
Subject: [Buildroot] [PATCH] openldap: fix static link with openssl
Message-ID: <33a0cb92a9390f2851bde5dc52b48da398305c28.1431541327.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pkg-config to get openssl link dependencies.

Fixes:
http://autobuild.buildroot.net/results/dd3/dd3821e713b7da7cde0f059409fba46371c8bc40/
http://autobuild.buildroot.net/results/d60/d60c8b4522e99cf385ee41aa20a1d49deb59c5fb/
http://autobuild.buildroot.net/results/b41/b41c043fb3b2fad1d9cea0a95b512fb4942b5b19/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/openldap/openldap.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 991d36953f3e..68464abcea2c 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -10,6 +10,7 @@ OPENLDAP_SITE = ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
 OPENLDAP_LICENSE_FILES = LICENSE
 OPENLDAP_INSTALL_STAGING = YES
+OPENLDAP_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENLDAP_TLS = openssl
@@ -30,6 +31,7 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENLDAP_MP = bignum
 OPENLDAP_DEPENDENCIES += openssl
+OPENLDAP_CONF_ENV = LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto)"
 else ifeq ($(BR2_PACKAGE_GMP),y)
 OPENLDAP_MP = gmp
 OPENLDAP_DEPENDENCIES += gmp
@@ -37,7 +39,7 @@ else
 OPENLDAP_MP = longlong
 endif
 
-OPENLDAP_CONF_ENV = ac_cv_func_memcmp_working=yes
+OPENLDAP_CONF_ENV += ac_cv_func_memcmp_working=yes
 
 OPENLDAP_CONF_OPTS += \
 	--enable-syslog \
-- 
2.1.4
