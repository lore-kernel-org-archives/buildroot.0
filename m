From: mrugiero at gmail.com <mrugiero@gmail.com>
Date: Wed, 26 Apr 2017 13:28:50 -0300
Subject: [Buildroot] [PATCH] package/protobuf: depend on gcc >= 4.5
Message-ID: <20170426162850.5214-1-mrugiero@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Mario J. Rugiero" <mrugiero@gmail.com>

Protobuf hits a bug in gcc < 4.5 which breaks the build.
See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=189

Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
---
 package/protobuf/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 03d118cfc..e3c94dcd6 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -22,6 +22,7 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	default y if BR2_sparc64
 	default y if BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_HOST_GCC_AT_LEAST_4_5
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_USE_MMU # fork()
 
@@ -30,6 +31,7 @@ config BR2_PACKAGE_PROTOBUF
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	depends on !BR2_STATIC_LIBS
 	help
 	  Protocol buffers are Google's language-neutral, platform-neutral,
@@ -37,7 +39,7 @@ config BR2_PACKAGE_PROTOBUF
 
 	  https://developers.google.com/protocol-buffers
 
-comment "protobuf needs a toolchain w/ C++, threads, dynamic library"
+comment "protobuf needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.5"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-- 
2.12.2
