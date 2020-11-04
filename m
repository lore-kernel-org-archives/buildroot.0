From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Nov 2020 08:33:11 +0100
Subject: [Buildroot] [git commit] package/collectd: fix grpc dependency
Message-ID: <20201104072057.457A881886@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14d09c6db92152052024e061eff933c3353be031
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e98610f039b88a5d164b19343d5ecef2d1c01f6d forgot to propagate
libabseil-cpp dependencies to BR2_PACKAGE_COLLECTD_GRPC

Fixes:
 - http://autobuild.buildroot.org/results/c9bacfb52ae46ab78a5f9097a8df83e10d23ccc4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 7037a8b383..3e854ba518 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -605,15 +605,17 @@ config BR2_PACKAGE_COLLECTD_GRPC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
 	depends on BR2_INSTALL_LIBSTDCPP # grpc -> protobuf
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # grpc -> protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # grpc -> libabseil-cpp
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # grpc -> host-libabseil-cpp
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 	select BR2_PACKAGE_GRPC
 	help
 	  Send/receive values using the gRPC protocol.
 
-comment "grpc needs a toolchain w/ C++, gcc >= 4.8"
+comment "grpc needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 
