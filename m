From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 09:58:02 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/webkitgtk: needs
 >= GCC 7
Message-ID: <20200307110058.DF744821F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1de55dd1e48c29d95717e45049c9a42167240c22
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
(cherry picked from commit ec1ff802df9a0f17dd2b734ba536a5e206aa5aa4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 4fbf5a190a..5633544c0f 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -12,17 +12,17 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6"
+comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 7"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_6
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_WEBKITGTK
 	bool "webkitgtk"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
