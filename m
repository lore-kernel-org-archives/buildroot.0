From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 22:50:18 +0200
Subject: [Buildroot] [git commit] package/haproxy: fix build on m68k
Message-ID: <20200419203556.76CD98F310@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb7fd98774b94d7c50f381ae4e2d005db21afb3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When threads are enabled, haproxy expects that pthread_getcpuclockid is
available which is not the case on m68k. Fix this by enabling threads
support only if NPTL is available.

Fixes:
 - http://autobuild.buildroot.org/results/52cc4b1fcac2a4fc84ab15ec4c692d2cd9b6d8bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haproxy/haproxy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 6752367fac..e59896b485 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -19,7 +19,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 HAPROXY_LIBS += -latomic
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
 # threads uses atomics on gcc >= 4.7 and sync otherwise (see
 # include/common/hathreads.h)
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7):$(BR2_TOOLCHAIN_HAS_ATOMIC),y:y)
