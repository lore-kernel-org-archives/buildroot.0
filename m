From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:50:09 +0200
Subject: [Buildroot] [git commit] boost: context needs C++11
Message-ID: <20181010194859.BA15E82804@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3a483a81be43b0ff674400e11900605969f8f1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 2 +-
 package/boost/boost.mk  | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 389592fd32..e0bff17f75 100644
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
index 0adad89297..2ce6bbb75f 100644
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
