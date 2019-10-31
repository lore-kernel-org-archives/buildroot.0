From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 21:47:25 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/grpc: work around
 gcc bug 85180
Message-ID: <20191031211115.3B5EA8E354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf483261a5658cf111ae1c07b65480fecc85658c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building grpc with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
force using -O0. Doing this let's optimize already present
CFLAGS/CXXFLAGS tweaking by introducing GRPC_CFLAGS and GRPC_CXXFLAGS
variable.

Fixes:
http://autobuild.buildroot.net/results/6f3/6f301904002cdd50dc3a66fe782b04a05b116319/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 716f8b34c526c702aa19e9a66a25df5d3a6ea663)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grpc/grpc.mk | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index e3e5a87712..f8e778515c 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -33,14 +33,25 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 GRPC_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
+GRPC_CFLAGS = $(TARGET_CFLAGS)
+GRPC_CXXFLAGS = $(TARGET_CXXFLAGS)
+
 # Set GPR_DISABLE_WRAPPED_MEMCPY otherwise build will fail on x86_64 with uclibc
 # because grpc tries to link with memcpy at GLIBC_2.2.5
 ifeq ($(BR2_x86_64):$(BR2_TOOLCHAIN_USES_GLIBC),y:)
-GRPC_CONF_OPTS += \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -DGPR_DISABLE_WRAPPED_MEMCPY" \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -DGPR_DISABLE_WRAPPED_MEMCPY"
+GRPC_CFLAGS += -DGPR_DISABLE_WRAPPED_MEMCPY
+GRPC_CXXFLAGS += -DGPR_DISABLE_WRAPPED_MEMCPY
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+GRPC_CFLAGS += -O0
+GRPC_CXXFLAGS += -O0
 endif
 
+GRPC_CONF_OPTS += \
+	-DCMAKE_C_FLAGS="$(GRPC_CFLAGS)" \
+	-DCMAKE_CXX_FLAGS="$(GRPC_CXXFLAGS)"
+
 HOST_GRPC_CONF_OPTS = \
 	-D_gRPC_CARES_LIBRARIES=cares \
 	-DgRPC_CARES_PROVIDER=none \
