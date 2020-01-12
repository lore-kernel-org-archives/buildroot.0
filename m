From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2020 11:09:14 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/grpc: add
 workaround for gcc<5
Message-ID: <20200112102020.8DE918B458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e049de5f7c6dac2b884b493d6cf4f733323b0eb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes:
http://autobuild.buildroot.net/results/3d5/3d5e0b2b8c6670cf9a43ceac4b8173760e1f933c/

Commit e0e54afd0cf7 (package/grpc: bump to version 1.25.0) bumped the grpc
version and added a workaround for 'failure memory model cannot be stronger
than success memory model for '__atomic_compare_exchange'.  This workaround
is also needed for 1.23.0, so add it here as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grpc/grpc.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 569db12089..b3d5433105 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -48,6 +48,14 @@ GRPC_CFLAGS += -O0
 GRPC_CXXFLAGS += -O0
 endif
 
+# Toolchains older than gcc5 will fail to compile with -0s due to:
+# error: failure memory model cannot be stronger than success memory model for
+# '__atomic_compare_exchange', so we use -O2 in these cases
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5):$(BR2_OPTIMIZE_S),:y)
+GRPC_CFLAGS += -O2
+GRPC_CXXFLAGS += -O2
+endif
+
 GRPC_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(GRPC_CFLAGS)" \
 	-DCMAKE_CXX_FLAGS="$(GRPC_CXXFLAGS)"
