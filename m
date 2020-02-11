From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:33:52 +0100
Subject: [Buildroot] [git commit] package/wpewebkit: disable JSC JIT for
 MIPSr6
Message-ID: <20200211223133.E5D328DB62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f779520a63ef5abcb3e28db6159e8762c67dfbf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Forcibly disable the JavaScriptCore JIT compilation support
for MIPSr6 processors, which are unsupported.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index cf45b68943..8b890301b7 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -63,4 +63,13 @@ else
 WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=OFF
 endif
 
+# JIT is not supported for MIPS r6, but the WebKit build system does not
+# have a check for these processors. Disable JIT forcibly here and use
+# the CLoop interpreter instead.
+#
+# Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=191258
+ifeq ($(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
+WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON
+endif
+
 $(eval $(cmake-package))
