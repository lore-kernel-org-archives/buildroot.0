From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 09:58:14 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/wpewebkit: needs
 >= GCC 7
Message-ID: <20200307110058.F26AF83B21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=731c150ff040e000951d9b88097c20b4c3a87bff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

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
(cherry picked from commit 09af6d8bfd8ece6b021b877aaf5cbd36a78ffad9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index f1460db20e..888be9eaba 100644
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
