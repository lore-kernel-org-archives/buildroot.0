From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 20 Oct 2020 18:53:10 +0300
Subject: [Buildroot] [PATCH 1/2] package/webkitgtk: fix build with
 ENABLE_C_LOOP=ON
In-Reply-To: <20201020155311.3493430-1-aperez@igalia.com>
References: <20201020155311.3493430-1-aperez@igalia.com>
Message-ID: <20201020155311.3493430-2-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ENABLE_C_LOOP option conflicts with ENABLE_SAMPLING_PROFILER, so
the WebKit CMake build system will emit an error when both are enabled
at the same time. To avoid hitting that situation, explicitly disable
ENABLE_SAMPLING_PROFILER as needed.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 5293d2d0ff..7fab924cc8 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -108,9 +108,12 @@ endif
 # have a check for these processors. Disable JIT forcibly here and use
 # the CLoop interpreter instead.
 #
+# Also, we have to disable the sampling profiler, which does NOT work
+# with ENABLE_C_LOOP.
+#
 # Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=191258
 ifeq ($(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
-WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON
+WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.28.0
