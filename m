From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 12:54:45 +0100
Subject: [Buildroot] [git commit] package/wpewebkit: needs >= GCC 7
Message-ID: <20200216114439.D6C1B8E189@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09af6d8bfd8ece6b021b877aaf5cbd36a78ffad9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CMakeLists.txt contains a toolchain check:

if (${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
    if (${CMAKE_CXX_COMPILER_VERSION} VERSION_LESS "7.3.0")
        message(FATAL_ERROR "GCC 7.3 or newer is required to build WebKit. Use a newer GCC version or Clang.")
    endif ()
endif ()

So bump the toolchain dependency to >= GCC 7.  The check is really about >=
7.3.0, but we do not have such detailed version checks.  Given that GCC
7.3.0 was released in January 2018 (and 7.1.0 in May 2017), most external
GCC 7.x toolchains probably use >= 7.3.0.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index cc73cce324..f3029976f1 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -12,12 +12,12 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 6"
+comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_6
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
@@ -31,7 +31,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_USE_WCHAR # icu, libsoup
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
