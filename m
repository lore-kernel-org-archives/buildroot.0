From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Dec 2016 12:02:24 +0100
Subject: [Buildroot] [git commit] package/dovecot: needs OpenSSL
Message-ID: <20161212110548.8B24981D5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f93cd820d15e96ffc29c92d1ede99d10fd4099d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest version bump to 2.27 introduced a bug in the configure
script which occurs when OpenSSL support is missing:
http://lists.busybox.net/pipermail/buildroot/2016-December/179397.html

This patch makes OpenSSL mandatory following the upstream advice:
http://www.dovecot.org/list/dovecot/2016-December/106346.html
"Nobody really should be building without OpenSSL nowadays anyway"

Fixes
http://autobuild.buildroot.net/results/85f/85f2f176c108ab36520f02d975f27c27cddce84b/

[Peter: drop legacy handling]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/Config.in  |  9 ++-------
 package/dovecot/dovecot.mk | 14 +++++---------
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 194efb6..d1ff7bc 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_DOVECOT
 	bool "dovecot"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
 	help
 	  Dovecot is an open source IMAP and POP3 email server for Linux/UNIX-
 	  like systems, written with security primarily in mind. Dovecot is an
@@ -24,13 +26,6 @@ config BR2_PACKAGE_DOVECOT_MYSQL
 comment "mysql support needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_DOVECOT_OPENSSL
-	bool "openssl support"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_ZLIB
-	help
-	  Enable OpenSSL support.
-
 config BR2_PACKAGE_DOVECOT_SQLITE
 	bool "sqlite support"
 	select BR2_PACKAGE_SQLITE
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 3dd231a..fe0afa5 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -10,7 +10,10 @@ DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPLv2.1
 DOVECOT_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
-DOVECOT_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+DOVECOT_DEPENDENCIES = \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
+	openssl
 
 DOVECOT_CONF_ENV = \
 	RPCGEN=__disable_RPCGEN_rquota \
@@ -27,7 +30,7 @@ DOVECOT_CONF_ENV = \
 	lib_cv___va_copy=yes \
 	lib_cv_va_val_copy=yes
 
-DOVECOT_CONF_OPTS = --without-docs
+DOVECOT_CONF_OPTS = --without-docs --with-ssl=openssl
 
 ifeq ($(BR2_PACKAGE_DOVECOT_MYSQL)$(BR2_PACKAGE_DOVECOT_SQLITE),)
 DOVECOT_CONF_OPTS += --without-sql
@@ -62,13 +65,6 @@ else
 DOVECOT_CONF_OPTS += --without-mysql
 endif
 
-ifeq ($(BR2_PACKAGE_DOVECOT_OPENSSL),y)
-DOVECOT_CONF_OPTS += --with-ssl=openssl
-DOVECOT_DEPENDENCIES += openssl
-else
-DOVECOT_CONF_OPTS += --with-ssl=no
-endif
-
 ifeq ($(BR2_PACKAGE_DOVECOT_SQLITE),y)
 DOVECOT_CONF_OPTS += --with-sqlite
 DOVECOT_DEPENDENCIES += sqlite
