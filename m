From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 11 Feb 2020 22:44:45 +0200
Subject: [Buildroot] [PATCH 2/2] package/wpewebkit: disable JSC JIT for
 MIPSr6
In-Reply-To: <20200211204445.782766-1-aperez@igalia.com>
References: <20200211204445.782766-1-aperez@igalia.com>
Message-ID: <20200211204445.782766-2-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forcibly disable the JavaScriptCore JIT compilation support
for MIPSr6 processors, which are unsupported.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
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
-- 
2.25.0
