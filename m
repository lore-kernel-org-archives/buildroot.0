From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Jul 2021 17:48:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/usbguard: disable on musl
Message-ID: <20210704154848.3401838-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

usbguard doesn't build on musl because it uses GNU version of strerror_r
as well as basename resulting in the following build failure:

In file included from ./src/Library/public/usbguard/Rule.hpp:24,
                 from src/CLI/usbguard-rule-parser.cpp:23:
./src/Library/public/usbguard/Exception.hpp: In static member function 'static std::string usbguard::ErrnoException::reasonFromErrno(int)':
./src/Library/public/usbguard/Exception.hpp:129:72: error: no matching function for call to 'std::__cxx11::basic_string<char>::basic_string(int)'
  129 |       return std::string(strerror_r(errno_value, buffer, sizeof buffer));
      |

Fixes:
 - http://autobuild.buildroot.org/results/ac1fd7b8c7bd65c73a9213a40c5ed1c39204dab0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usbguard/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index 34e24a2156..58ee5c4b25 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_USBGUARD
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
 	depends on !BR2_STATIC_LIBS # libqb, protobuf
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_LIBQB
 	help
@@ -16,7 +17,8 @@ config BR2_PACKAGE_USBGUARD
 
 	  https://usbguard.github.io/
 
-comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+comment "usbguard needs a glibc or uClibc toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		|| BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-- 
2.30.2
