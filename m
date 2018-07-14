From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Jul 2018 12:55:13 +0200
Subject: [Buildroot] [PATCH 3/3] package/libva-utils: bump version to 2.2.0
In-Reply-To: <20180714105513.16687-1-bernd.kuhls@t-online.de>
References: <20180714105513.16687-1-bernd.kuhls@t-online.de>
Message-ID: <20180714105513.16687-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream moved its github repo to github.com/intel/, updated URLs, for
reference see upstream PR 110. Also updated project URL.

Upstream unconditionally added -fstack-protector to CFLAGS:
https://github.com/intel/libva-utils/commit/1bea64e12144fce74363538232c1a94ee9c98446

This breaks the build when the buildroot config has no support for SSP,
fix this be removing -fstack-protector in the non-SSP case. Please note
that adding -fnostack-protector to CFLAGS via CONF_ENV is not enough
because in some makefiles upstream includes $(CFLAGS) before adding
-fstack-protector, like in vainfo/Makefile.am.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-utils/Config.in        |  2 +-
 package/libva-utils/libva-utils.hash |  6 +++---
 package/libva-utils/libva-utils.mk   | 14 ++++++++++++--
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/package/libva-utils/Config.in b/package/libva-utils/Config.in
index ad299234c3..597419f7de 100644
--- a/package/libva-utils/Config.in
+++ b/package/libva-utils/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_LIBVA_UTILS
 	  Libva-utils is a collection of tests for VA-API (Video
 	  Acceleration API)
 
-	  https://01.org/linuxmedia/vaapi
+	  https://01.org/vaapi
 
 comment "libva-utils needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 46674a3675..e86cb6e09c 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,5 @@
-# From https://github.com/01org/libva-utils/releases
-sha1 9902eb944c3ace00be4fe95627708f156fc5ace7 libva-utils-2.1.0.tar.bz2
+# From https://github.com/intel/libva-utils/releases
+sha1 ef15d40d6bec847c74f21ee3431b7e7b06fec3b4  libva-utils-2.2.0.tar.bz2
 # Locally computed
-sha256 f6a7790c3dcc56537372c90a83036a3136194a8b397e84e97bf9cc9254fa2c51  libva-utils-2.1.0.tar.bz2
+sha256 ed7a6ed1fab657df4e83ea11f90310efcf31c27828f32d65351a28ca3c404dc0  libva-utils-2.2.0.tar.bz2
 sha256 c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 85ee3083fd..454c8cef5b 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,11 +4,21 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.1.0
+LIBVA_UTILS_VERSION = 2.2.0
 LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
-LIBVA_UTILS_SITE = https://github.com/01org/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
+LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
 LIBVA_UTILS_DEPENDENCIES = host-pkgconf libva
 
+define LIBVA_UTILS_DISABLE_STACK_PROTECTOR
+	$(SED) 's%-fstack-protector%%' $(@D)/putsurface/Makefile
+	$(SED) 's%-fstack-protector%%' $(@D)/vainfo/Makefile
+endef
+
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
+LIBVA_UTILS_CONF_ENV = LIBVA_CFLAGS="$(TARGET_CFLAGS) -fno-stack-protector"
+LIBVA_UTILS_POST_CONFIGURE_HOOKS += LIBVA_UTILS_DISABLE_STACK_PROTECTOR
+endif
+
 $(eval $(autotools-package))
-- 
2.18.0
