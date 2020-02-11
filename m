From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:33:45 +0100
Subject: [Buildroot] [git commit] package/webkitgtk: disable JSC JIT for
 MIPSr6
Message-ID: <20200211223133.DDD8F8DAAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5eb70cecedd03e08977a06bcc115b6a954d3da9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Forcibly disable the JavaScriptCore JIT compilation support
for MIPSr6 processors, which are unsupported.

Fixes: http://autobuild.buildroot.net/results/3d21d3c3460cd85a4c828dd197929cdf17aaf4e0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index e5d591fcd2..cbd9003071 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -104,4 +104,13 @@ else
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
