From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 10 Jun 2013 19:42:19 +0100
Subject: [Buildroot] [PATCH] boost: only the iostreams library requires bzip2
Message-ID: <51B61E0B.6020209@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
  package/boost/Config.in |    4 ++++
  package/boost/boost.mk  |    6 +++++-
  2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 5c65b2f..fbe99d0 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -18,6 +18,9 @@ config BR2_PACKAGE_BOOST

  if BR2_PACKAGE_BOOST

+config BR2_PACKAGE_BOOST_REQUIRES_BZIP2
+	bool
+
  config BR2_PACKAGE_BOOST_CHRONO
  	bool "boost-chrono"

@@ -43,6 +46,7 @@ config BR2_PACKAGE_BOOST_GRAPH_PARALLEL

  config BR2_PACKAGE_BOOST_IOSTREAMS
  	bool "boost-iostreams"
+	select BR2_PACKAGE_BOOST_REQUIRES_BZIP2

  config BR2_PACKAGE_BOOST_LOCALE
  	depends on BR2_USE_WCHAR
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index d11f378..c733b89 100644
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

+ifeq ($(BR2_PACKAGE_BOOST_REQUIRES_BZIP2),y)
+BOOST_DEPENDENCIES += bzip2
+endif
+
  BOOST_OPT += toolset=gcc \
  	     threading=multi \
  	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release) \
-- 
1.7.2.5
