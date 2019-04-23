From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 23 Apr 2019 23:24:03 +0200
Subject: [Buildroot] [PATCH 1/4] package/bind: enable static build
Message-ID: <20190423212406.13909-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Static build has been disabled in 2014 with commit
6045904752b06a8b8e52ba8fc2e49a8548964e8d however bind can be built
statically thanks to --without-dlopen so enable it back

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...n_driver.c-fix-build-without-dlfcn.h.patch | 28 +++++++++++++++++++
 package/bind/Config.in                        |  5 ++--
 package/bind/bind.mk                          |  4 ++-
 3 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 package/bind/0002-dlz_open_driver.c-fix-build-without-dlfcn.h.patch

diff --git a/package/bind/0002-dlz_open_driver.c-fix-build-without-dlfcn.h.patch b/package/bind/0002-dlz_open_driver.c-fix-build-without-dlfcn.h.patch
new file mode 100644
index 0000000000..8b73e746e4
--- /dev/null
+++ b/package/bind/0002-dlz_open_driver.c-fix-build-without-dlfcn.h.patch
@@ -0,0 +1,28 @@
+From 92b738a0fe8a7d65346de9e6dd7a8f135ee29765 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 23 Apr 2019 22:45:25 +0200
+Subject: [PATCH] dlz_open_driver.c: fix build without dlfcn.h
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://gitlab.isc.org/isc-projects/bind9/issues/995]
+---
+ bin/named/unix/dlz_dlopen_driver.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/bin/named/unix/dlz_dlopen_driver.c b/bin/named/unix/dlz_dlopen_driver.c
+index 74d29ffa09..ab8a5c9493 100644
+--- a/bin/named/unix/dlz_dlopen_driver.c
++++ b/bin/named/unix/dlz_dlopen_driver.c
+@@ -14,7 +14,9 @@
+ #include <inttypes.h>
+ #include <stdlib.h>
+ #include <string.h>
++#if HAVE_DLFCN_H
+ #include <dlfcn.h>
++#endif
+ 
+ #include <dns/log.h>
+ #include <dns/result.h>
+-- 
+2.20.1
+
diff --git a/package/bind/Config.in b/package/bind/Config.in
index 049a90cbaf..5b34b66f7a 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_BIND
 	bool "bind"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
 	help
 	  BIND (Berkeley Internet Name Domain) is an
 	  implementation of the Domain Name System (DNS) protocols
@@ -41,6 +40,6 @@ config BR2_PACKAGE_BIND_TOOLS
 
 endif
 
-comment "bind needs a toolchain w/ threads, dynamic library"
+comment "bind needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index b2bbafab20..30a4482db5 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -24,6 +24,7 @@ BIND_CONF_ENV = \
 	BUILD_CC="$(TARGET_CC)" \
 	BUILD_CFLAGS="$(TARGET_CFLAGS)"
 BIND_CONF_OPTS = \
+	$(if $(BR2_STATIC_LIBS),--with-dlopen,--without-dlopen) \
 	--without-lmdb \
 	--with-libjson=no \
 	--with-randomdev=/dev/urandom \
@@ -54,12 +55,13 @@ BIND_CONF_OPTS += --with-libxml2=no
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-BIND_DEPENDENCIES += openssl
+BIND_DEPENDENCIES += host-pkgconf openssl
 BIND_CONF_OPTS += \
 	--with-openssl=$(STAGING_DIR)/usr \
 	--with-ecdsa=yes \
 	--with-eddsa=no \
 	--with-aes=yes
+BIND_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 # GOST cipher support requires openssl extra engines
 ifeq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
 BIND_CONF_OPTS += --with-gost=yes
-- 
2.20.1
