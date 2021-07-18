From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 19:58:10 +0200
Subject: [Buildroot] [git commit] package/usbguard: disable on musl
Message-ID: <20210718184041.E3CA488230@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=2392f76b6b345308baf8d3d2f075793d30185d76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
