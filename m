From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 14:36:19 +0200
Subject: [Buildroot] [git commit] libiio: bump version to 0.10
Message-ID: <20170605123630.38AD1827EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72279edddd87e57bea7af3b3f776e92d01ce75ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0001 already included in this release:
  https://github.com/analogdevicesinc/libiio/commit/913c2cc740d60450e91e066cf38f5654936a6015

Patch 0002 already included in this release:
  https://github.com/analogdevicesinc/libiio/commit/6e5a40566ee44694b186d4c2cbcf5f8690d8bba4

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ties.c-Add-a-check-for-newlocale-function.patch | 55 ----------------------
 .../0002-CMake-Test-tools-require-threads.patch    | 32 -------------
 package/libiio/libiio.hash                         |  4 +-
 package/libiio/libiio.mk                           |  2 +-
 4 files changed, 3 insertions(+), 90 deletions(-)

diff --git a/package/libiio/0001-utilities.c-Add-a-check-for-newlocale-function.patch b/package/libiio/0001-utilities.c-Add-a-check-for-newlocale-function.patch
deleted file mode 100644
index cea22cb..0000000
--- a/package/libiio/0001-utilities.c-Add-a-check-for-newlocale-function.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 913c2cc740d60450e91e066cf38f5654936a6015 Mon Sep 17 00:00:00 2001
-From: Paul Cercueil <paul.cercueil@analog.com>
-Date: Mon, 6 Feb 2017 14:04:47 +0100
-Subject: [PATCH] utilities.c: Add a check for newlocale() function
-
-uClibc might define __UCLIBC_HAS_LOCALE__, without actually providing
-the locale_t type or the setlocale() function.
-
-Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
----
- CMakeLists.txt       | 1 +
- iio-config.h.cmakein | 1 +
- utilities.c          | 2 +-
- 3 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index cb3a48f..b24eff3 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -66,6 +66,7 @@ endif()
- include(CheckSymbolExists)
- check_symbol_exists(strdup "string.h" HAS_STRDUP)
- check_symbol_exists(strerror_r "string.h" HAS_STRERROR_R)
-+check_symbol_exists(newlocale "locale.h" HAS_NEWLOCALE)
- 
- IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
- 	option(WITH_IIOD "Build the IIO Daemon" ON)
-diff --git a/iio-config.h.cmakein b/iio-config.h.cmakein
-index 1b8608e..6700326 100644
---- a/iio-config.h.cmakein
-+++ b/iio-config.h.cmakein
-@@ -21,6 +21,7 @@
- #cmakedefine HAS_PIPE2
- #cmakedefine HAS_STRDUP
- #cmakedefine HAS_STRERROR_R
-+#cmakedefine HAS_NEWLOCALE
- #cmakedefine HAS_PTHREAD_SETNAME_NP
- #cmakedefine HAVE_IPV6
- #cmakedefine HAVE_AVAHI
-diff --git a/utilities.c b/utilities.c
-index 88b8257..21dbd10 100644
---- a/utilities.c
-+++ b/utilities.c
-@@ -34,7 +34,7 @@
- #endif
- 
- #ifdef LOCALE_SUPPORT
--#if defined(__MINGW32__)
-+#if defined(__MINGW32__) || (!defined(_WIN32) && !defined(HAS_NEWLOCALE))
- static int read_double_locale(const char *str, double *val)
- {
- 	char *end, *old_locale;
--- 
-2.11.0
-
diff --git a/package/libiio/0002-CMake-Test-tools-require-threads.patch b/package/libiio/0002-CMake-Test-tools-require-threads.patch
deleted file mode 100644
index 32c2023..0000000
--- a/package/libiio/0002-CMake-Test-tools-require-threads.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6e5a40566ee44694b186d4c2cbcf5f8690d8bba4 Mon Sep 17 00:00:00 2001
-From: Paul Cercueil <paul.cercueil@analog.com>
-Date: Tue, 4 Apr 2017 11:25:37 +0200
-Subject: [PATCH] CMake: Test tools require threads
-
-If libiio was compiled without any backend enabled the build of the
-tools would fail with undefined references to libpthread, at least on
-Buildroot (strangely not on my Debian PC).
-
-Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
----
- CMakeLists.txt | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9c17273..cf92de3 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -36,6 +36,10 @@ endif()
- option(WITH_NETWORK_BACKEND "Enable the network backend" ON)
- option(WITH_TESTS "Build the test programs" ON)
- 
-+if (WITH_TESTS)
-+	set(NEED_THREADS 1)
-+endif()
-+
- if (MSVC)
- 	# Avoid annoying warnings from Visual Studio
- 	add_definitions(-D_CRT_SECURE_NO_WARNINGS=1)
--- 
-2.11.0
-
diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
index e538786..027e2a0 100644
--- a/package/libiio/libiio.hash
+++ b/package/libiio/libiio.hash
@@ -1,2 +1,2 @@
-# From https://github.com/analogdevicesinc/libiio/archive/v0.9/
-sha256	b6184876d192fbfd51e3a0a29736fa1be2dbaf07370cf861797076f40a85f823	libiio-0.9.tar.gz
+# Locally calculated
+sha256 002d57f35715821efae66479859bc5357b4d8d33bfff1446b4e17b02ae2c10d2  libiio-0.10.tar.gz
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 35eb23d..d99cdba 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIIO_VERSION = 0.9
+LIBIIO_VERSION = 0.10
 LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPL-2.1+
