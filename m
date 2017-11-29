From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 29 Nov 2017 23:29:31 +0100
Subject: [Buildroot] [PATCH 2/2] package/supertuxkart: bump to 0.9.3
In-Reply-To: <20171129222931.17511-1-romain.naour@gmail.com>
References: <20171129222931.17511-1-romain.naour@gmail.com>
Message-ID: <20171129222931.17511-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream patches.

See: http://blog.supertuxkart.net/2017/11/supertuxkart-093-released.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...001-irrlicht-Get-rid-of-unprefixed-cflags.patch | 34 -------------------
 ...x-boolean-return-type-for-jpeglib-s-callb.patch | 39 ----------------------
 package/supertuxkart/supertuxkart.hash             |  8 ++---
 package/supertuxkart/supertuxkart.mk               |  6 ++--
 4 files changed, 8 insertions(+), 79 deletions(-)
 delete mode 100644 package/supertuxkart/0001-irrlicht-Get-rid-of-unprefixed-cflags.patch
 delete mode 100644 package/supertuxkart/0002-irrlicht-Fix-boolean-return-type-for-jpeglib-s-callb.patch

diff --git a/package/supertuxkart/0001-irrlicht-Get-rid-of-unprefixed-cflags.patch b/package/supertuxkart/0001-irrlicht-Get-rid-of-unprefixed-cflags.patch
deleted file mode 100644
index 351b587..0000000
--- a/package/supertuxkart/0001-irrlicht-Get-rid-of-unprefixed-cflags.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 73bed675202cf1f1c748540a4363d7d99e161dca Mon Sep 17 00:00:00 2001
-From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-Date: Thu, 9 Jun 2016 18:58:51 -0300
-Subject: [PATCH 1/2] irrlicht: Get rid of unprefixed cflags
-
-Cross-building requires proper include paths. This commit
-removes the unprefixed -I/usr/X11R6/include in irrlicht cflags.
-
-Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
----
-Fix sent upstream as part of pull:
-https://github.com/supertuxkart/stk-code/pull/2554
-
- lib/irrlicht/CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/irrlicht/CMakeLists.txt b/lib/irrlicht/CMakeLists.txt
-index 46d54008c291..5f4975e3a6f9 100644
---- a/lib/irrlicht/CMakeLists.txt
-+++ b/lib/irrlicht/CMakeLists.txt
-@@ -25,8 +25,8 @@ elseif(MINGW)
-   add_definitions(-D_IRR_STATIC_LIB_)
-   add_definitions(-D_CRT_SECURE_NO_WARNINGS) # Shut up about unsafe stuff
- else()
--  set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -I/usr/X11R6/include")
--  set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -I/usr/X11R6/include")
-+  set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing")
-+  set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing")
-   if(CMAKE_COMPILER_IS_GNUCC)
- 	  set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -fexpensive-optimizations")
-   endif()
--- 
-2.9.0
-
diff --git a/package/supertuxkart/0002-irrlicht-Fix-boolean-return-type-for-jpeglib-s-callb.patch b/package/supertuxkart/0002-irrlicht-Fix-boolean-return-type-for-jpeglib-s-callb.patch
deleted file mode 100644
index 1a89bea..0000000
--- a/package/supertuxkart/0002-irrlicht-Fix-boolean-return-type-for-jpeglib-s-callb.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From fe71624eb39e0bc302a7603c79503fb12667dc2b Mon Sep 17 00:00:00 2001
-From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-Date: Sun, 3 Jul 2016 15:16:59 -0300
-Subject: [PATCH 2/2] irrlicht: Fix boolean return type for jpeglib's callback
-
-Building on certain toolchains can fail due to returning an integer
-instead of TRUE. In any case, only {TRUE,FALSE} should be used
-as 'boolean' jpeglib type. Fix this by returning TRUE.
-
-  CImageLoaderJPG.cpp: In static member function 'static boolean
-  irr::video::CImageLoaderJPG::fill_input_buffer(j_decompress_ptr)':
-  CImageLoaderJPG.cpp:69:9: error: invalid conversion from 'int' to 'boolean'
-  [-fpermissive]
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
----
-Fix sent upstream as part of pull:
-https://github.com/supertuxkart/stk-code/pull/2554
-
- lib/irrlicht/source/Irrlicht/CImageLoaderJPG.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/irrlicht/source/Irrlicht/CImageLoaderJPG.cpp b/lib/irrlicht/source/Irrlicht/CImageLoaderJPG.cpp
-index 8fc5222a1e9b..1811f31dd28f 100644
---- a/lib/irrlicht/source/Irrlicht/CImageLoaderJPG.cpp
-+++ b/lib/irrlicht/source/Irrlicht/CImageLoaderJPG.cpp
-@@ -66,7 +66,7 @@ void CImageLoaderJPG::init_source (j_decompress_ptr cinfo)
- boolean CImageLoaderJPG::fill_input_buffer (j_decompress_ptr cinfo)
- {
- 	// DO NOTHING
--	return 1;
-+	return TRUE;
- }
- 
- 
--- 
-2.9.0
-
diff --git a/package/supertuxkart/supertuxkart.hash b/package/supertuxkart/supertuxkart.hash
index 45ad8c5..4bba3f2 100644
--- a/package/supertuxkart/supertuxkart.hash
+++ b/package/supertuxkart/supertuxkart.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256	0b080bb098a26adb552d6fd48905bcb6b1e873ef1567457d7268d7d3aaa48282  supertuxkart-0.9.2-src.tar.xz
-# From https://sourceforge.net/projects/supertuxkart/files/SuperTuxKart/0.9.2/
-sha1	df3805a8f9dc556a0fc5af44442dae8126db5d5a  supertuxkart-0.9.2-src.tar.xz
-md5	f1f5081fd41b8eeb310b4edc07b9ee12  supertuxkart-0.9.2-src.tar.xz
+sha256	d8014e7106ba84f98b5ec5f146249dcffc284fc4083f8f237ff420b9e2219cb0  supertuxkart-0.9.3-src.tar.xz
+# From https://sourceforge.net/projects/supertuxkart/files/SuperTuxKart/0.9.3/
+sha1	2650ba20976472f10122a8600cc239507a9b6f24  supertuxkart-0.9.3-src.tar.xz
+md5	8de5455b8fdbb92679e302b76c9041cf  supertuxkart-0.9.3-src.tar.xz
diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
index dc4b232..3775621 100644
--- a/package/supertuxkart/supertuxkart.mk
+++ b/package/supertuxkart/supertuxkart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUPERTUXKART_VERSION = 0.9.2
+SUPERTUXKART_VERSION = 0.9.3
 SUPERTUXKART_SOURCE = supertuxkart-$(SUPERTUXKART_VERSION)-src.tar.xz
 SUPERTUXKART_SITE = http://downloads.sourceforge.net/project/supertuxkart/SuperTuxKart/$(SUPERTUXKART_VERSION)
 
@@ -29,7 +29,9 @@ SUPERTUXKART_DEPENDENCIES = \
 
 # Since supertuxkart is not installing libstkirrlicht.so, and since it is
 # the only user of the bundled libraries, turn off shared libraries entirely.
-SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
+# Disable In-game recorder (there is no libopenglrecorder package)
+SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF \
+	-DBUILD_RECORDER=OFF
 
 ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
 SUPERTUXKART_DEPENDENCIES += libfribidi
-- 
2.9.5
