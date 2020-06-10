From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 10 Jun 2020 18:16:01 +0200
Subject: [Buildroot] [PATCH] package/apitrace: fix apitrace microblaze build
 failure
Message-ID: <20200610161601.290420-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apitrace is affected by Gcc Bug 68485 that has already been worked
around, but after version bumping, CMakeLists.txt adds -O2 to
CMAKE_C_FLAGS_RELWITHDEBINFO that is in order appended to CMAKE_C_FLAGS,
making -O0 end appending to fail. To prevent this we need to avoid
CMAKE_C_FLAGS_RELWITHDEBINFO to be appended to CMAKE_C_FLAGS, so let's
do the same as flare-engine package that set CMAKE_BUILD_TYPE to a fake
build type called "buildroot", this way -O2 won't be appended after -O0
and work around restart to work as expected.

Fixes:
http://autobuild.buildroot.net/results/2e3/2e31abd7b115d4c29117ca82007fd4f87f853ff7/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/apitrace/apitrace.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
index e4e6c41fed..b962ac01d3 100644
--- a/package/apitrace/apitrace.mk
+++ b/package/apitrace/apitrace.mk
@@ -27,6 +27,10 @@ APITRACE_CXXFLAGS = $(TARGET_CXXFLAGS)
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 # This works around embedded Brotli build failure
 APITRACE_CFLAGS += -O0
+# CMakeLists.txt sets CMAKE_CXX_FLAGS_<BUILD_TYPE> depending on
+# BUILD_TYPE, and this comes after the generic CMAKE_CXX_FLAGS.
+# Override CMAKE_BUILD_TYPE so no overrides are applied.
+APITRACE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Buildroot
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-- 
2.25.1
