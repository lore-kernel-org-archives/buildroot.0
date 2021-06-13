From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 17:28:00 +0200
Subject: [Buildroot] [git commit] package/libkrb5: add openssl optional
 dependency
Message-ID: <20210613153519.82FFC87DA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7a5b9d06d484700fc4fcbd354f2c15e0422688c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssl is an optional dependency which is enabled by default since at
least 2007 and
https://github.com/krb5/krb5/commit/4c17f25c0f106ec8e3aad2cee4e7a24f66b5a65d

Enable DES, MD4 and RC4 in openssl to fix build failure raised since
commit a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/d73b477bd2064aee076f9debfd8d3346c63ba657

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: squash the two commits together]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libkrb5/Config.in  |  3 +++
 package/libkrb5/libkrb5.mk | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/libkrb5/Config.in b/package/libkrb5/Config.in
index 2e24c87229..3357d4ad04 100644
--- a/package/libkrb5/Config.in
+++ b/package/libkrb5/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_LIBKRB5
 	# needs fork()
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Kerberos is a system for authenticating users and services
 	  on a network. Kerberos is a trusted third-party service.
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index e4f3fa4186..794cedd33c 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -41,6 +41,21 @@ else
 LIBKRB5_CONF_OPTS += --without-ldap
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBKRB5_CONF_OPTS += \
+	--enable-pkinit \
+	--with-crypto-impl=openssl \
+	--with-spake-openssl \
+	--with-tls-impl=openssl
+LIBKRB5_DEPENDENCIES += openssl
+else
+LIBKRB5_CONF_OPTS += \
+	--disable-pkinit \
+	--with-crypto-impl=builtin \
+	--without-spake-openssl \
+	--without-tls-impl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 LIBKRB5_CONF_OPTS += --with-libedit
 LIBKRB5_DEPENDENCIES += host-pkgconf libedit
