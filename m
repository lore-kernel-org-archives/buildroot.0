From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  6 Feb 2019 18:45:29 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/gerbera: bump to version 1.3.0
Message-ID: <20190206174529.10725-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Add a dependency to gcc >= 7 for C++17 optional feature:
  https://github.com/gerbera/gerbera/commit/ae8192ddf37cec2c78ec578a5d627b2d89fa90f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Add package in title

 package/gerbera/0001-Fix-atrailers-build.patch | 48 --------------------------
 package/gerbera/Config.in                      |  6 ++--
 package/gerbera/gerbera.hash                   |  2 +-
 package/gerbera/gerbera.mk                     |  2 +-
 4 files changed, 5 insertions(+), 53 deletions(-)
 delete mode 100644 package/gerbera/0001-Fix-atrailers-build.patch

diff --git a/package/gerbera/0001-Fix-atrailers-build.patch b/package/gerbera/0001-Fix-atrailers-build.patch
deleted file mode 100644
index ba99ef4714..0000000000
--- a/package/gerbera/0001-Fix-atrailers-build.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 5d4c24bcca7f8d7f550720461373fb84eefef27e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 12 May 2018 14:16:30 +0200
-Subject: [PATCH] Fix atrailers build
-
-i2i function is used in atrailers_service.cc but this function is
-defined only if defined(HAVE_JS) || defined(HAVE_TAGLIB) ||
-defined(YOUTUBE) || defined(HAVE_LIBMP4V2) as a result compilation
-fails if HAVE_CURL is set but HAVE_JS and HAVE_TAGLIG are not.
-As youtube and libmp4v2 support have been dropped, replace those by
-ATRAILERS in this list.
-
-[Upstream Status: merged (https://github.com/gerbera/gerbera/pull/300)]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/string_converter.cc | 2 +-
- src/string_converter.h  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/string_converter.cc b/src/string_converter.cc
-index b0b1f20f..79f46008 100644
---- a/src/string_converter.cc
-+++ b/src/string_converter.cc
-@@ -226,7 +226,7 @@ Ref<StringConverter> StringConverter::p2i()
- }
- #endif
- 
--#if defined (HAVE_JS) || defined(HAVE_TAGLIB) || defined(YOUTUBE) || defined(HAVE_LIBMP4V2)
-+#if defined (HAVE_JS) || defined(HAVE_TAGLIB) || defined(ATRAILERS)
- 
- Ref<StringConverter> StringConverter::i2i()
- {
-diff --git a/src/string_converter.h b/src/string_converter.h
-index c0b64f29..ca8ae16f 100644
---- a/src/string_converter.h
-+++ b/src/string_converter.h
-@@ -66,7 +66,7 @@ public:
-     static zmm::Ref<StringConverter> p2i();
- 
- #endif
--#if defined(HAVE_JS) || defined(HAVE_TAGLIB) || defined(YOUTUBE) || defined(HAVE_LIBMP4V2)
-+#if defined(HAVE_JS) || defined(HAVE_TAGLIB) || defined(ATRAILERS)
-     /// \brief safeguard - internal to internal - needed to catch some
-     /// scenarious where the user may have forgotten to add proper conversion
-     /// in the script.
--- 
-2.14.1
-
diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index b0155d1b37..e10f78b77e 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GERBERA
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17 optional
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_PACKAGE_LIBUPNP # libupnp18
 	select BR2_PACKAGE_EXPAT
@@ -19,9 +19,9 @@ config BR2_PACKAGE_GERBERA
 
 	  https://gerbera.io
 
-comment "gerbera needs a toolchain w/ C++, threads, gcc >= 4.9"
+comment "gerbera needs a toolchain w/ C++, threads, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_PACKAGE_LIBUPNP
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index a9281cc253..bcac080c9d 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	a64fe5820aced590bcdc22600596dc8a41c0baf68d7c0ec5baf7a561ade820df	gerbera-v1.2.0.tar.gz
+sha256	5e40971c519eb322fe0111754cafa12d99c47c2ae7d0f9f1aebb19b06e74a912	gerbera-v1.3.0.tar.gz
 sha256	cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6	LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index b900a83c8c..7ded7cec74 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = v1.2.0
+GERBERA_VERSION = v1.3.0
 GERBERA_SITE = $(call github,gerbera,gerbera,$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
-- 
2.14.1
