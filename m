From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 11 Jun 2013 07:51:46 +0100
Subject: [Buildroot] [PATCH v2] boost: only the iostreams library requires
	bzip2
Message-ID: <51B6C902.6000101@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
  package/boost/Config.in |    2 +-
  package/boost/boost.mk  |    6 +++++-
  2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 5c65b2f..46b5102 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_BOOST
  	# that unfortunately doesn't work. Until someone fixes that,
  	# let's depend on threads.
  	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_BZIP2
  	select BR2_PACKAGE_ZLIB
  	help
  	  A general purpose C++ library
@@ -43,6 +42,7 @@ config BR2_PACKAGE_BOOST_GRAPH_PARALLEL

  config BR2_PACKAGE_BOOST_IOSTREAMS
  	bool "boost-iostreams"
+	select BR2_PACKAGE_BZIP2

  config BR2_PACKAGE_BOOST_LOCALE
  	depends on BR2_USE_WCHAR
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index d11f378..73eb4b0 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -12,7 +12,7 @@ BOOST_INSTALL_STAGING = YES

  TARGET_CC_VERSION = $(shell $(TARGET_CC) -dumpversion)

-BOOST_DEPENDENCIES = bzip2 zlib
+BOOST_DEPENDENCIES = zlib

  BOOST_FLAGS =

@@ -48,6 +48,10 @@ else
  BOOST_FLAGS += --without-icu
  endif

+ifeq ($(BR2_PACKAGE_BOOST_IOSTREAMS),y)
+BOOST_DEPENDENCIES += bzip2
+endif
+
  BOOST_OPT += toolset=gcc \
  	     threading=multi \
  	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release) \
-- 
1.7.2.5
