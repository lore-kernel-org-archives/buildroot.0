From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 09:17:18 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/webkitgtk:
 disable JSC JIT for MIPSr6
Message-ID: <20200307110058.B974B812B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a6de2da7079f07a8d6f47472394206b095232af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Forcibly disable the JavaScriptCore JIT compilation support
for MIPSr6 processors, which are unsupported.

Fixes: http://autobuild.buildroot.net/results/3d21d3c3460cd85a4c828dd197929cdf17aaf4e0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5eb70cecedd03e08977a06bcc115b6a954d3da9a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 8f8870c9b0..c8ad3c3382 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -95,4 +95,13 @@ else
 WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
 endif
 
+# JIT is not supported for MIPS r6, but the WebKit build system does not
+# have a check for these processors. Disable JIT forcibly here and use
+# the CLoop interpreter instead.
+#
+# Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=191258
+ifeq ($(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON
+endif
+
 $(eval $(cmake-package))
