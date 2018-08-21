From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Aug 2018 23:25:47 +0200
Subject: [Buildroot] [PATCH v3,1/1] boost: context needs C++11
Message-ID: <20180821212547.14690-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without std=c++11, mutex is not always correctly detected with gcc 4.7,
4.8 or even 5.x. As a result, boost_thread is wrongly selected by
boost_context.

mutex is available on gcc 4.7.x, the issue is that boost does not
correctly detect it because -std=c++11 was missing.
Keep thread select for gcc version lower or equal to 4.6. mutex is
available since gcc 4.4 (with std=c++0x) but common buildroot practice
for C++11 packages is to have a dependency on gcc 4.7, 4.8 or 4.9
depending on the requested C++11 features.

Fixes:
 - http://autobuild.buildroot.net/results/fb046c04fe18bec973d120e4ab33971f32ba5769
 - http://autobuild.buildroot.net/results/99f1a255b78a973faeb8bf3b94d78efc54426a8b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Merge both patches
 - Update commit message

Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update first patch to keep selection of boost-thread but lower gcc
   version from 4.8 to 4.7
 - Update second patch to add -std=c++11 only if gcc >= 4.7

 package/boost/Config.in | 2 +-
 package/boost/boost.mk  | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 965d198ebf..627cf2f356 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -83,7 +83,7 @@ config BR2_PACKAGE_BOOST_CONTEXT
 	bool "boost-context"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	help
 	  C++11 context switching library.
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 14f6162003..f4a44fa123 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -61,6 +61,11 @@ else
 BOOST_FLAGS += --without-icu
 endif
 
+# boost-context needs C++11
+ifeq ($(BR2_PACKAGE_BOOST_CONTEXT)$(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),yy)
+BOOST_TARGET_CXXFLAGS += -std=c++11
+endif
+
 ifeq ($(BR2_PACKAGE_BOOST_IOSTREAMS),y)
 BOOST_DEPENDENCIES += bzip2 zlib
 endif
-- 
2.14.1
