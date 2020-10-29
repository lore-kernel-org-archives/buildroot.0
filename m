From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 19:59:51 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/wpewebkit: fix
 build with ENABLE_C_LOOP=ON
Message-ID: <20201029185152.78461861F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a9db3ce3aaa0967d770174a284499921a7adfa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The ENABLE_C_LOOP option conflicts with ENABLE_SAMPLING_PROFILER, so
the WebKit CMake build system will emit an error when both are enabled
at the same time. To avoid hitting that situation, explicitly disable
ENABLE_SAMPLING_PROFILER as needed.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7a66e3e189ecbd887a35389b582bf94eb489656b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 646bdd9384..0a67391ced 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -67,9 +67,12 @@ endif
 # have a check for these processors. Disable JIT forcibly here and use
 # the CLoop interpreter instead.
 #
+# Also, we have to disable the sampling profiler, which does NOT work
+# with ENABLE_C_LOOP.
+#
 # Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=191258
 ifeq ($(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
-WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON
+WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
 endif
 
 $(eval $(cmake-package))
