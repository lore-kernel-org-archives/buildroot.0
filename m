From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 19:16:07 +0100
Subject: [Buildroot] [PATCH 2/2] package/freerdp: do not use SSE2 extensions
	when not available
In-Reply-To: <cover.1419704115.git.yann.morin.1998@free.fr>
References: <cover.1419704115.git.yann.morin.1998@free.fr>
Message-ID: <d37d664e994af72e48de29bfbb2112249981b672.1419704115.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not let FreeRDP decide whether it can use SE2 opcodes, it may well
fail to do so, because the heuristic is not working for
cross-compilation.

Also, we do have a Kconfig option stating whether we have SSE2 or not,
so reuse that.

Similar to the recent ARM+Neon fix.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index c9396b5..a703500 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -69,4 +69,10 @@ else
 FREERDP_CONF_OPTS += -DWITH_NEON=OFF
 endif
 
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+FREERDP_CONF_OPTS += -DWITH_SSE2=ON
+else
+FREERDP_CONF_OPTS += -DWITH_SSE2=OFF
+endif
+
 $(eval $(cmake-package))
-- 
1.9.1
