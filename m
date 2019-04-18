From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 18 Apr 2019 14:44:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/libtorrent-rasterbar: bump to
 version 1.2.0
Message-ID: <20190418124451.25968-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop boost-chrono, replaced by std::chrono since
  https://github.com/arvidn/libtorrent/commit/78bc2698327069aa69ff7460b9314cbe45bd4d66
- Drop boost random, replace by standard number classes since
  https://github.com/arvidn/libtorrent/commit/fef94a4c5254e2280b601ab3ea211cc0193fecaa
- Add two patches to fix build on uclibc
- Needs exception_ptr since
  https://github.com/arvidn/libtorrent/commit/5c361715da9d20d63b019d7fc4ce772cdecd7138

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-add-missing-cstdarg-include.patch    | 37 +++++++++++++++++++
 .../0002-buffer.hpp-fix-build-on-uclibc.patch | 29 +++++++++++++++
 package/libtorrent-rasterbar/Config.in        |  8 +++-
 .../libtorrent-rasterbar.hash                 |  2 +-
 .../libtorrent-rasterbar.mk                   |  2 +-
 5 files changed, 74 insertions(+), 4 deletions(-)
 create mode 100644 package/libtorrent-rasterbar/0001-add-missing-cstdarg-include.patch
 create mode 100644 package/libtorrent-rasterbar/0002-buffer.hpp-fix-build-on-uclibc.patch

diff --git a/package/libtorrent-rasterbar/0001-add-missing-cstdarg-include.patch b/package/libtorrent-rasterbar/0001-add-missing-cstdarg-include.patch
new file mode 100644
index 0000000000..f5fc693ab4
--- /dev/null
+++ b/package/libtorrent-rasterbar/0001-add-missing-cstdarg-include.patch
@@ -0,0 +1,37 @@
+From bfc579e61f9c6dd69a024ef6e2f9287abb40603f Mon Sep 17 00:00:00 2001
+From: arvidn <arvid@libtorrent.org>
+Date: Sun, 20 Jan 2019 18:03:38 +0100
+Subject: [PATCH] add missing cstdarg include
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/arvidn/libtorrent/commit/bfc579e61f9c6dd69a024ef6e2f9287abb40603f]
+---
+ include/libtorrent/alert_types.hpp     | 1 +
+ include/libtorrent/stack_allocator.hpp | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/include/libtorrent/alert_types.hpp b/include/libtorrent/alert_types.hpp
+index 12d4091e75..090c48c8cd 100644
+--- a/include/libtorrent/alert_types.hpp
++++ b/include/libtorrent/alert_types.hpp
+@@ -60,6 +60,7 @@ POSSIBILITY OF SUCH DAMAGE.
+ #include "libtorrent/aux_/disable_warnings_pop.hpp"
+ 
+ #include <bitset>
++#include <cstdarg> // for va_list
+ 
+ #if TORRENT_ABI_VERSION == 1
+ #define PROGRESS_NOTIFICATION | alert::progress_notification
+diff --git a/include/libtorrent/stack_allocator.hpp b/include/libtorrent/stack_allocator.hpp
+index 9e83ac52e7..8fa7a98708 100644
+--- a/include/libtorrent/stack_allocator.hpp
++++ b/include/libtorrent/stack_allocator.hpp
+@@ -39,6 +39,7 @@ POSSIBILITY OF SUCH DAMAGE.
+ #include "libtorrent/aux_/vector.hpp"
+ #include "libtorrent/aux_/numeric_cast.hpp"
+ 
++#include <cstdarg> // for va_list
+ #include <cstdio> // for vsnprintf
+ #include <cstring>
+ 
diff --git a/package/libtorrent-rasterbar/0002-buffer.hpp-fix-build-on-uclibc.patch b/package/libtorrent-rasterbar/0002-buffer.hpp-fix-build-on-uclibc.patch
new file mode 100644
index 0000000000..4957984825
--- /dev/null
+++ b/package/libtorrent-rasterbar/0002-buffer.hpp-fix-build-on-uclibc.patch
@@ -0,0 +1,29 @@
+From a2c7f19ad414879d5354ef6ca98acf80a5005ab3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 18 Apr 2019 14:30:16 +0200
+Subject: [PATCH] buffer.hpp: fix build on uclibc
+
+malloc_usable_size is not available on uclibc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ include/libtorrent/buffer.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/libtorrent/buffer.hpp b/include/libtorrent/buffer.hpp
+index 3af5ef24f..785e7cfd8 100644
+--- a/include/libtorrent/buffer.hpp
++++ b/include/libtorrent/buffer.hpp
+@@ -85,7 +85,7 @@ public:
+ 
+ 		// the actual allocation may be larger than we requested. If so, let the
+ 		// user take advantage of every single byte
+-#if defined __GLIBC__ || defined __FreeBSD__
++#if (defined __GLIBC__ && !defined __UCLIBC__) || defined __FreeBSD__
+ 		m_size = static_cast<difference_type>(::malloc_usable_size(m_begin));
+ #elif defined _MSC_VER
+ 		m_size = static_cast<difference_type>(::_msize(m_begin));
+-- 
+2.20.1
+
diff --git a/package/libtorrent-rasterbar/Config.in b/package/libtorrent-rasterbar/Config.in
index 6c55085947..8c259e113e 100644
--- a/package/libtorrent-rasterbar/Config.in
+++ b/package/libtorrent-rasterbar/Config.in
@@ -1,8 +1,13 @@
 comment "libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.8"
 	depends on BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
+comment "libtorrent-rasterbar needs exception_ptr"
+	depends on BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_LIBTORRENT_RASTERBAR
 	bool "libtorrent-rasterbar"
 	depends on BR2_INSTALL_LIBSTDCPP # boost
@@ -11,10 +16,9 @@ config BR2_PACKAGE_LIBTORRENT_RASTERBAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
 	depends on BR2_USE_WCHAR # boost
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_RANDOM
 	select BR2_PACKAGE_OPENSSL
 	help
 	  libtorrent is a feature complete C++ bittorrent implementation
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
index e38c0f4f1d..f462a7b701 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7c23deba7fa279825642307587609d51c9935ac7606e0ef2f2d0ba10728b5847 libtorrent-rasterbar-1.1.11.tar.gz
+sha256 428eefcf6a603abc0dc87e423dbd60caa00795ece07696b65f8ee8bceaa37c30 libtorrent-rasterbar-1.2.0.tar.gz
 sha256 f3a5dd1558cce616b12edad521427ec8976ce2bb0af33f7f359cfa648bf55ad8 COPYING
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index 24bd011ae7..9164c343c6 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTORRENT_RASTERBAR_VERSION = 1.1.11
+LIBTORRENT_RASTERBAR_VERSION = 1.2.0
 LIBTORRENT_RASTERBAR_SITE = https://github.com/arvidn/libtorrent/releases/download/libtorrent_$(subst .,_,$(LIBTORRENT_RASTERBAR_VERSION))
 LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
 LIBTORRENT_RASTERBAR_LICENSE_FILES = COPYING
-- 
2.20.1
