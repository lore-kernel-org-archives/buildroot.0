From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 09:56:55 +0100
Subject: [Buildroot] [git commit] package/webkitgtk: fix build with
 ENABLE_C_LOOP=ON
Message-ID: <20201025084452.BF5A481675@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6e78c1752abde36b88309c5268b47072534829a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ENABLE_C_LOOP option conflicts with ENABLE_SAMPLING_PROFILER, so
the WebKit CMake build system will emit an error when both are enabled
at the same time. To avoid hitting that situation, explicitly disable
ENABLE_SAMPLING_PROFILER as needed.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
