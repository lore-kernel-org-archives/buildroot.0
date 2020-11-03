From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 10:27:11 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/grpc: fix build
 on ubuntu gcc 4.8
Message-ID: <20201103092300.68FEE8625E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72fee02803097c2352bf376a9dc8fdcc6d9d32d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

gcc 4.8 on ubuntu 14.04 does some broken optimization at link-time
which causes grpc to create a grpc_cpp_plugin which quits because
of a failing assertion. The created plugin is itself used during
compilation which lets the build fail.
With the added -Wl,--no-as-needed flag the LTO is disabled and grpc
compiles successfully.

fixes:
- http://autobuild.buildroot.net/results/b554f6f2fb66892273f7520ad6e36923557b229e
- http://autobuild.buildroot.net/results/3ebb2880b9b3fd5154979016391dde897e2c039c
- http://autobuild.buildroot.net/results/c2078e821e0728fe980be2c849c25d82e791a4c2

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[yann.morin.1998 at free.fr: rewrap the comment]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 19dfe7f6e78e4a0d30464ecec23576a4774ee02b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grpc/grpc.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 087deac0c6..1b6474358f 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -70,5 +70,13 @@ HOST_GRPC_CONF_OPTS = \
 	-DgRPC_ZLIB_PROVIDER=package \
 	-DgRPC_ABSL_PROVIDER=package
 
+# With gcc 4.8 (at least on ubuntu) there is a bug in LTO which breaks
+# the linkage of the grpc_cpp_plugin with libprotobuf and pthread. This
+# additional flag fixes this.
+ifeq ($(BR2_HOST_GCC_AT_LEAST_4_9),)
+HOST_GRPC_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS) -Wl,--no-as-needed"
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
