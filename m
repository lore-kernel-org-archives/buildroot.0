From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 09:56:49 +0100
Subject: [Buildroot] [git commit] package/wpewebkit: disable JIT for ARMv5
 and ARMv6
Message-ID: <20201025084452.B248181675@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8eaccdddc3a6eecfa9a886602de0577ef01c993
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

WebKit's JavaScriptCore does not support using JIT nor the LLint
interpreter on ARMv5 and ARMv6, so add those two cases when checking
for target CPUs which need to use the CLoop interpreter.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/wpewebkit.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 7bb13aa610..e1e9ceea76 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -64,14 +64,16 @@ WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=OFF
 endif
 
 # JIT is not supported for MIPS r6, but the WebKit build system does not
-# have a check for these processors. Disable JIT forcibly here and use
-# the CLoop interpreter instead.
+# have a check for these processors. The same goes for ARMv5 and ARMv6.
+# Disable JIT forcibly here and use the CLoop interpreter instead.
 #
 # Also, we have to disable the sampling profiler, which does NOT work
 # with ENABLE_C_LOOP.
 #
-# Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=191258
-ifeq ($(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
+# Upstream bugs: https://bugs.webkit.org/show_bug.cgi?id=191258
+#                https://bugs.webkit.org/show_bug.cgi?id=172765
+#
+ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
 WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
 endif
 
