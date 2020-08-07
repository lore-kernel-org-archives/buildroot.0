From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 7 Aug 2020 12:12:21 +0200
Subject: [Buildroot] [git commit branch/next] package/libabseil-cpp: needs
 dynamic library support
Message-ID: <20200812144328.2DC2485F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a68fb15dc61bb845e38ad8f4ef48249458701bb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The libabseil-cpp build needs <dlfcn.h>, so let's add a
!BR2_STATIC_LIBS dependency. The only package which is selecting
libabseil-cpp, grpc, already had this dependency anyway.

Fixes:

  http://autobuild.buildroot.net/results/2d796dd4cc43388da235b83f53778d902f477799/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/grpc/Config.in          | 2 +-
 package/libabseil-cpp/Config.in | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index 45299888ea..43ccddbdaf 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_GRPC
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
-	depends on !BR2_STATIC_LIBS # protobuf
+	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBABSEIL_CPP
diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index 38cb66d49f..7b1ca37917 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP
 	bool "libabseil-cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # uses dlfcn.h
 	help
 	  Abseil is an open-source collection of C++ library code
 	  designed to augment the C++ standard library. The Abseil
@@ -11,5 +12,6 @@ config BR2_PACKAGE_LIBABSEIL_CPP
 
 	  https://github.com/abseil/abseil-cpp
 
-comment "libabseil-cpp needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "libabseil-cpp needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
