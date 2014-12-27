From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 19:59:45 +0100
Subject: [Buildroot] [git commit] package/freerdp: do not use SSE2
	extensions when not available
Message-ID: <20141227185950.46D7980442@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52bcc51bbd6e19c588ca0f6aa0fc4c7a43c8df6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not let FreeRDP decide whether it can use SE2 opcodes, it may well
fail to do so, because the heuristic is not working for
cross-compilation.

Also, we do have a Kconfig option stating whether we have SSE2 or not,
so reuse that.

Similar to the recent ARM+Neon fix.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

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
