From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:22:44 +0100
Subject: [Buildroot] [git commit] package/grpc: drop host gcc 4.8 workaround
Message-ID: <20210118210339.8EA5686F8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32dc218c8257a7794149b750457735cd46b83956
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to libabseil dependencies the host gcc is at least 4.9.
So the fix for host gcc 4.8 is no longer needed.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/grpc/grpc.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 8585b6bdc3..f7ddffd386 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -72,13 +72,5 @@ HOST_GRPC_CONF_OPTS = \
 	-DgRPC_SSL_PROVIDER=package \
 	-DgRPC_ZLIB_PROVIDER=package
 
-# With gcc 4.8 (at least on ubuntu) there is a bug in LTO which breaks
-# the linkage of the grpc_cpp_plugin with libprotobuf and pthread. This
-# additional flag fixes this.
-ifeq ($(BR2_HOST_GCC_AT_LEAST_4_9),)
-HOST_GRPC_CONF_OPTS += \
-	-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS) -Wl,--no-as-needed"
-endif
-
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
