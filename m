From: Trent Piepho <tpiepho@impinj.com>
Date: Sat, 23 Feb 2019 02:10:59 +0000
Subject: [Buildroot] [PATCH] grpc: update to 1.18.0
Message-ID: <20190223021045.4383-1-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version.  Freshen a patch that had a conflict.

Remove duplicate env setting.

Add comment about the hack being used to get gRPC to use the buildroot
c-ares library.  Otherwise it looks like the cmake env settings are out
of date vs what the gRPC build documentation says to use.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
I tested by running their sample app and making rpc calls to/from the target and
the host.

 ...-Properly-detect-the-availability-of-pthread_setname_.patch | 10 +++++-----
 package/grpc/grpc.hash                                         |  2 +-
 package/grpc/grpc.mk                                           |  7 +++++--
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch b/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
index 766f758172..14807999b8 100644
--- a/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
+++ b/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
@@ -1,4 +1,4 @@
-From 0aeefca28104f86f14b511feee8d5711f2e8bcb5 Mon Sep 17 00:00:00 2001
+From 0dfb289a3b362b082ac3608d887e42f09dadc0d2 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Mon, 31 Dec 2018 16:22:07 +0100
 Subject: [PATCH] Properly detect the availability of pthread_setname_np()
@@ -17,7 +17,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  2 files changed, 8 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fc76cf50da..8dd457fb1a 100644
+index 89e834b..c7bd2ad 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -94,6 +94,12 @@ endif()
@@ -30,11 +30,11 @@ index fc76cf50da..8dd457fb1a 100644
 +  add_definitions(-DHAVE_PTHREAD_SETNAME_NP)
 +endif ()
 +
- add_definitions(-DPB_FIELD_16BIT)
+ add_definitions(-DPB_FIELD_32BIT)
  
  if (MSVC)
 diff --git a/include/grpc/impl/codegen/port_platform.h b/include/grpc/impl/codegen/port_platform.h
-index b2028a6305..dc89e6ed57 100644
+index 031c0c3..a29a9dc 100644
 --- a/include/grpc/impl/codegen/port_platform.h
 +++ b/include/grpc/impl/codegen/port_platform.h
 @@ -173,7 +173,9 @@
@@ -48,5 +48,5 @@ index b2028a6305..dc89e6ed57 100644
  #else /* musl libc */
  #define GPR_MUSL_LIBC_COMPAT 1
 -- 
-2.20.1
+2.14.4
 
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 9e5011125a..3ccf3bdd69 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 a5342629fe1b689eceb3be4d4f167b04c70a84b9d61cf8b555e968bc500bdb5a grpc-v1.16.1.tar.gz
+sha256 069a52a166382dd7b99bf8e7e805f6af40d797cfcee5f80e530ca3fc75fd06e2 grpc-v1.18.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 6c804429ff..9506e0268a 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = v1.16.1
+GRPC_VERSION = v1.18.0
 GRPC_SITE = $(call github,grpc,grpc,$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
@@ -15,6 +15,10 @@ GRPC_INSTALL_STAGING = YES
 GRPC_DEPENDENCIES = c-ares host-grpc openssl protobuf zlib
 HOST_GRPC_DEPENDENCIES = host-c-ares host-openssl host-protobuf host-zlib
 
+# gRPC_CARES_PROVIDER=package won't work because it requires c-ares to have
+# installed a cmake config file, but buildroot uses c-ares' autotools build,
+# which doesn't do this.  These CARES settings trick the gRPC cmake code into
+# not looking for c-ares at all and yet still linking with the library.
 GRPC_CONF_OPTS = \
 	-D_gRPC_CARES_LIBRARIES=cares \
 	-DgRPC_CARES_PROVIDER=none \
@@ -32,7 +36,6 @@ endif
 HOST_GRPC_CONF_OPTS = \
 	-D_gRPC_CARES_LIBRARIES=cares \
 	-DgRPC_CARES_PROVIDER=none \
-	-DgRPC_CARES_PROVIDER=none \
 	-DgRPC_PROTOBUF_PROVIDER=package \
 	-DgRPC_SSL_PROVIDER=package \
 	-DgRPC_ZLIB_PROVIDER=package
-- 
2.14.4
