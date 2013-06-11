From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jun 2013 11:58:27 +0200
Subject: [Buildroot] [git commit] boost: only the iostreams library requires
	bzip2 and zlib
Message-ID: <20130611100810.5A1499AC6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2f28217816174550dc5858fbb4f1d68ee5f0c20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/boost/Config.in |    4 ++--
 package/boost/boost.mk  |    6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 5c65b2f..912717a 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -9,8 +9,6 @@ config BR2_PACKAGE_BOOST
 	# that unfortunately doesn't work. Until someone fixes that,
 	# let's depend on threads.
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_BZIP2
-	select BR2_PACKAGE_ZLIB
 	help
 	  A general purpose C++ library
 
@@ -43,6 +41,8 @@ config BR2_PACKAGE_BOOST_GRAPH_PARALLEL
 
 config BR2_PACKAGE_BOOST_IOSTREAMS
 	bool "boost-iostreams"
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_ZLIB
 
 config BR2_PACKAGE_BOOST_LOCALE
 	depends on BR2_USE_WCHAR
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 57d021a..ce72990 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -12,7 +12,7 @@ BOOST_INSTALL_STAGING = YES
 
 TARGET_CC_VERSION = $(shell $(TARGET_CC) -dumpversion)
 
-BOOST_DEPENDENCIES = bzip2 zlib
+BOOST_DEPENDENCIES =
 
 BOOST_FLAGS =
 
@@ -48,6 +48,10 @@ else
 BOOST_FLAGS += --without-icu
 endif
 
+ifeq ($(BR2_PACKAGE_BOOST_IOSTREAMS),y)
+BOOST_DEPENDENCIES += bzip2 zlib
+endif
+
 BOOST_OPT += toolset=gcc \
 	     threading=multi \
 	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release) \
