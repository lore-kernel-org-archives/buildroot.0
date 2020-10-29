From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 19:59:30 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/webkitgtk: fix
 build with ENABLE_C_LOOP=ON
Message-ID: <20201029185148.1389684239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6771085eb9dad55739719678f5d27ce02e1090e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

The ENABLE_C_LOOP option conflicts with ENABLE_SAMPLING_PROFILER, so
the WebKit CMake build system will emit an error when both are enabled
at the same time. To avoid hitting that situation, explicitly disable
ENABLE_SAMPLING_PROFILER as needed.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e6e78c1752abde36b88309c5268b47072534829a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 65a4439839..b760a1f2bf 100644
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
