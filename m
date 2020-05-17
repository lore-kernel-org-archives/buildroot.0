From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 May 2020 16:05:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/apitrace: force Release mode
Message-ID: <20200517140515.2665046-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Force Release mode otherwise the toolchain workarounds added by commit
6f5fcb43296ffc54b2b67d0b3723405b56d8d439 will be ignored when debug is
enabled as CMAKE_C_FLAGS_RELWITHDEBINFO is appended to CFLAGS:

output/build/apitrace-9.0/thirdparty/brotli/CMakeFiles/brotli_dec.dir/flags.make:C_FLAGS = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2  -O0 -fvisibility=hidden -Wall -Wno-sign-compare -fno-strict-aliasing -fmessage-length=0 -fno-omit-frame-pointer -O2 -g -DNDEBUG -fPIC

Fixes:
 - http://autobuild.buildroot.org/results/2e31abd7b115d4c29117ca82007fd4f87f853ff7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apitrace/apitrace.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
index e4e6c41fed..71a3929fe0 100644
--- a/package/apitrace/apitrace.mk
+++ b/package/apitrace/apitrace.mk
@@ -34,7 +34,9 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 APITRACE_CXXFLAGS += -O0
 endif
 
+# Force Release mode otherwise the above workarounds will be ignored
 APITRACE_CONF_OPTS += \
+	-DCMAKE_BUILD_TYPE=Release \
 	-DCMAKE_C_FLAGS="$(APITRACE_CFLAGS)" \
 	-DCMAKE_CXX_FLAGS="$(APITRACE_CXXFLAGS)"
 
-- 
2.26.2
