From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 30 Nov 2019 15:29:31 -0800
Subject: [Buildroot] [PATCH 1/1] pakcage/libasio: new package
Message-ID: <20191130232931.2482617-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Asio is a cross-platform C++ library for network and low-level
I/O programming that provides developers with a consistent
asynchronous model using a modern C++ approach.

This is a standalone library that does not require Boost.

Tested with test-pkg -a on Debian8:
44 builds, 10 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/libasio/0001-fix-uclibc-eventfd.patch | 51 +++++++++++++++++++
 ...-static-linking-with-openssl-support.patch | 30 +++++++++++
 package/libasio/Config.in                     | 23 +++++++++
 package/libasio/libasio.hash                  |  3 ++
 package/libasio/libasio.mk                    | 25 +++++++++
 7 files changed, 134 insertions(+)
 create mode 100644 package/libasio/0001-fix-uclibc-eventfd.patch
 create mode 100644 package/libasio/0002-fix-static-linking-with-openssl-support.patch
 create mode 100644 package/libasio/Config.in
 create mode 100644 package/libasio/libasio.hash
 create mode 100644 package/libasio/libasio.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 16e8510b0a..aa16a1a1ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -41,6 +41,7 @@ F:	package/gstreamer1/gst1-vaapi/
 F:	package/imx-usb-loader/
 F:	package/janus-gateway/
 F:	package/json-for-modern-cpp/
+F:	package/libasio/
 F:	package/libcpprestsdk/
 F:	package/libressl/
 F:	package/libselinux/
diff --git a/package/Config.in b/package/Config.in
index 37861387e8..d577f9cec8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1738,6 +1738,7 @@ menu "Other"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
 	source "package/libargtable2/Config.in"
+	source "package/libasio/Config.in"
 	source "package/libatomic_ops/Config.in"
 	source "package/libavl/Config.in"
 	source "package/libb64/Config.in"
diff --git a/package/libasio/0001-fix-uclibc-eventfd.patch b/package/libasio/0001-fix-uclibc-eventfd.patch
new file mode 100644
index 0000000000..7369fc77d4
--- /dev/null
+++ b/package/libasio/0001-fix-uclibc-eventfd.patch
@@ -0,0 +1,51 @@
+From f3b6cdadf19269be25645a102fef89baaf289769 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 30 Nov 2019 12:18:51 -0800
+Subject: [PATCH] fix uclibc eventfd
+
+Use eventfd() function with uClibc
+
+The Boost eventfd code either directly makes the eventfd system call
+using __NR_eventfd (when __GLIBC_MINOR is less than 8), or otherwise
+uses the eventfd() function provided by the C library.
+
+However, since uClibc pretends to be glibc 2.2, the Boost eventfd code
+directly uses the system call. While it works fine on most
+architectures, it doesn't on ARC since __NR_eventfd is not defined on
+this architecture. However, eventfd() is properly implemented.
+
+So, this patch adjusts the logic used by Boost to consider uClibc as a
+C library providing the eventfd() function.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Aduskett at gmail.com: Modified to work with the standalone package.]
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ asio/include/asio/detail/impl/eventfd_select_interrupter.ipp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/asio/include/asio/detail/impl/eventfd_select_interrupter.ipp b/asio/include/asio/detail/impl/eventfd_select_interrupter.ipp
+index 9ff9bc8..04e3477 100644
+--- a/asio/include/asio/detail/impl/eventfd_select_interrupter.ipp
++++ b/asio/include/asio/detail/impl/eventfd_select_interrupter.ipp
+@@ -23,7 +23,7 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <fcntl.h>
+-#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8
++#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8 && !defined(__UCLIBC__)
+ # include <asm/unistd.h>
+ #else // __GLIBC__ == 2 && __GLIBC_MINOR__ < 8
+ # include <sys/eventfd.h>
+@@ -45,7 +45,7 @@ eventfd_select_interrupter::eventfd_select_interrupter()
+ 
+ void eventfd_select_interrupter::open_descriptors()
+ {
+-#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8
++#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8 && !defined(__UCLIBC__)
+   write_descriptor_ = read_descriptor_ = syscall(__NR_eventfd, 0);
+   if (read_descriptor_ != -1)
+   {
+-- 
+2.23.0
+
diff --git a/package/libasio/0002-fix-static-linking-with-openssl-support.patch b/package/libasio/0002-fix-static-linking-with-openssl-support.patch
new file mode 100644
index 0000000000..e450212938
--- /dev/null
+++ b/package/libasio/0002-fix-static-linking-with-openssl-support.patch
@@ -0,0 +1,30 @@
+From 70f76fdcd127d1bd59b43f46267a21949c552026 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Sat, 30 Nov 2019 14:17:10 -0800
+Subject: [PATCH] fix static linking with openssl support
+
+Dynamic builds of libcrypto would also include libz, but during static builds
+this is not true. Always specifying -lz fixes building against static builds of
+openssl.
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ asio/configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/asio/configure.ac b/asio/configure.ac
+index 2e20b84..ca74108 100644
+--- a/asio/configure.ac
++++ b/asio/configure.ac
+@@ -60,7 +60,7 @@ AC_CHECK_HEADER([openssl/ssl.h],,
+ ],[])
+ 
+ if test x$OPENSSL_FOUND != xno; then
+-  LIBS="$LIBS -lssl -lcrypto"
++  LIBS="$LIBS -lssl -lcrypto -lz"
+ fi
+ 
+ AM_CONDITIONAL(HAVE_OPENSSL,test x$OPENSSL_FOUND != xno)
+-- 
+2.23.0
+
diff --git a/package/libasio/Config.in b/package/libasio/Config.in
new file mode 100644
index 0000000000..8689018d8a
--- /dev/null
+++ b/package/libasio/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_LIBASIO
+	bool "libasio"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
+	help
+	  Asio is a cross-platform C++ library for network and low-level
+	  I/O programming that provides developers with a consistent
+	  asynchronous model using a modern C++ approach.
+
+	  This is a standalone library that does not require Boost.
+
+	  https://github.com/chriskohlhoff/asio
+
+comment "libasio needs a toolchain w/ C++, dynamic library, wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+
+comment "libasio needs exception_ptr"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/libasio/libasio.hash b/package/libasio/libasio.hash
new file mode 100644
index 0000000000..4ceb4984ca
--- /dev/null
+++ b/package/libasio/libasio.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 bdb01a649c24d73ca4a836662e7af442d935313ed6deef6b07f17f3bc5f78d7a	libasio-asio-1-14-0.tar.gz
+sha256 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566	asio/LICENSE_1_0.txt
diff --git a/package/libasio/libasio.mk b/package/libasio/libasio.mk
new file mode 100644
index 0000000000..776388b288
--- /dev/null
+++ b/package/libasio/libasio.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# libasio
+#
+################################################################################
+
+LIBASIO_VERSION = asio-1-14-0
+LIBASIO_SITE = $(call github,chriskohlhoff,asio,$(LIBASIO_VERSION))
+LIBASIO_SUBDIR = asio
+LIBASIO_AUTORECONF = YES
+# Headers only
+LIBASIO_INSTALL_TARGET = NO
+LIBASIO_INSTALL_STAGING = YES
+LIBASIO_LICENSE = BSL-1.0
+LIBASIO_LICENSE_FILES = asio/LICENSE_1_0.txt
+LIBASIO_CONF_OPTS = --without-boost
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBASIO_DEPENDENCIES += openssl
+LIBASIO_CONF_OPTS += --with-openssl
+else
+LIBASIO_CONF_OPTS += --without-openssl
+endif
+
+$(eval $(autotools-package))
-- 
2.23.0
