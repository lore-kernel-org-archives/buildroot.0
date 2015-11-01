From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  1 Nov 2015 19:07:54 +0100
Subject: [Buildroot] [PATCH v6 18/33] package/efl/libelementary: bump to
	version 1.15.2
In-Reply-To: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
References: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1446401289-9059-19-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the newly added libefl package wich provide a new version
of libeina, libevas, libecore and libedje.

Update the upstream url and add a hash file.

We need to add a host package to provide elm_prefs_cc the
host machine to cross-compile correctly libelementary
for the target. Otherwise, elm_prefs_cc for the
target is used on the host machine.

Since eet, eolian_gen and eldbus_codegen are installed in
HOST_DIR by host-efl package, help configure script to find
them.

Explicitly disable doxygen and elementary-test.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v6: squash with the patch adding host-libelementary (Yann E.Morin)
v5: move the hash file to package/efl/libelementary
v4: keep libelementary in package/efl/
v3: bump to 1.15.2
    remove trailing slash (Vicente Bergas)
v2: bump to 1.15.1
    remove glibc only dependency
---
 package/efl/libelementary/Config.in          | 14 ++++-------
 package/efl/libelementary/libelementary.hash |  2 ++
 package/efl/libelementary/libelementary.mk   | 35 ++++++++++++++++------------
 3 files changed, 27 insertions(+), 24 deletions(-)
 create mode 100644 package/efl/libelementary/libelementary.hash

diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
index fcc7025..1f8c962 100644
--- a/package/efl/libelementary/Config.in
+++ b/package/efl/libelementary/Config.in
@@ -1,17 +1,13 @@
-comment "libelementary needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
 config BR2_PACKAGE_LIBELEMENTARY
 	bool "libelementary"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	depends on BR2_TOOLCHAIN_HAS_THREADS # elm_store.c
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEVAS
-	select BR2_PACKAGE_LIBECORE
-	select BR2_PACKAGE_LIBEDJE
 	help
 	  Elementary is a widget toolkit and EFL wrapper and convenience
 	  library to make it easy to build applications and tools with UIs
 	  with less code.
 
-	  http://trac.enlightenment.org/e/wiki/Elementary
+	  https://enlightenment.org
+
+comment "libelementary needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/efl/libelementary/libelementary.hash b/package/efl/libelementary/libelementary.hash
new file mode 100644
index 0000000..2cd36d8
--- /dev/null
+++ b/package/efl/libelementary/libelementary.hash
@@ -0,0 +1,2 @@
+# From https://download.enlightenment.org/rel/libs/elementary/elementary-1.15.2.tar.xz.sha256
+sha256	523c3073210b611817d0f56aa8348962ec757282f9f7dfde93825afa164a0f3f	elementary-1.15.2.tar.xz
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index 8bd69fe..4ba8681 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -4,29 +4,34 @@
 #
 ################################################################################
 
-LIBELEMENTARY_VERSION = 1.7.10
-LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
-LIBELEMENTARY_SITE = http://download.enlightenment.org/releases
+LIBELEMENTARY_VERSION = 1.15.2
+LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.xz
+LIBELEMENTARY_SITE = http://download.enlightenment.org/rel/libs/elementary
 LIBELEMENTARY_LICENSE = LGPLv2.1
 LIBELEMENTARY_LICENSE_FILES = COPYING
 
 LIBELEMENTARY_INSTALL_STAGING = YES
 
-LIBELEMENTARY_DEPENDENCIES = \
-	libeina libevas libecore libedje host-libedje \
-	host-libeet
+LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl host-libelementary libefl
 
 LIBELEMENTARY_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
-	--with-eet-eet=$(HOST_DIR)/usr/bin/eet
+	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
+	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
+	--with-eldbus_codegen=$(HOST_DIR)/usr/bin/eldbus-codegen \
+	--with-elm-prefs-cc=$(HOST_DIR)/usr/bin/elm_prefs_cc \
+	--with-doxygen=no \
+	--disable-elementary-test
 
-# libethumb_client is only built when ethumbd is built.
-# ethumbd is only built if edbus is built.
-ifeq ($(BR2_PACKAGE_LIBETHUMB)$(BR2_PACKAGE_LIBEDBUS),yy)
-LIBELEMENTARY_DEPENDENCIES += libethumb
-LIBELEMENTARY_CONF_OPTS += --enable-ethumb
-else
-LIBELEMENTARY_CONF_OPTS += --disable-ethumb
-endif
+# We need a host package in order to provide elm_prefs_cc and
+# elementary_codegen.
+HOST_LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl
+HOST_LIBELEMENTARY_CONF_OPTS = \
+	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
+	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
+	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
+	--with-doxygen=no \
+	--disable-elementary-test
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.4.3
