From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 18:54:21 +0100
Subject: [Buildroot] [git commit] libdrm: adjust the ARM patch to work on
	ARMv4/ARMv5
Message-ID: <20160326175430.40F9880E2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60a8c5c7894ae034ace50f5f5f231f7bdbe0e203
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ARM patch that was added in commit
94841d87fd2ff8ebf7af84d49e5095074958febf ("libdrm: fix support for
xserver with Vivante drivers") makes the assumption that ldrex/strex
is available on ARM. While this is true on ARMv6+, it is not true on
ARMv4/ARMv5. Due to this, we had to make follow-up commits like
7bac31ceea1b52986b1773a1bd4841110672f923
("package/x11r7/xserver_xorg-server: dri needs arm >= v6") and more is
needed in the reverse dependencies to disable DRI usage on
ARMv4/ARMv5.

In fact, it turns out that the CAS code in libdrm is only an
optimization, and it will gracefully fall back to a system call based
lock/unlock mechanism.

So we simply change the patch to only provide the optimized CAS
implementation on ARMv6+. The original reason for this patch was to
fix Vivante drivers, and Vivante GPUs are only used in ARMv6+ cores,
so we should be fine (famous last words).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Add-ARM-support-into-xf86drm.h.patch       | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/0001-Add-ARM-support-into-xf86drm.h.patch b/package/libdrm/0001-Add-ARM-support-into-xf86drm.h.patch
index 99a02a8..3c00e9c 100644
--- a/package/libdrm/0001-Add-ARM-support-into-xf86drm.h.patch
+++ b/package/libdrm/0001-Add-ARM-support-into-xf86drm.h.patch
@@ -1,4 +1,4 @@
-From c0950d73c8aa13f057707fb7933c65c147349376 Mon Sep 17 00:00:00 2001
+From 2e3dd0040e676530f7e735fab335ff449b9b3f4d Mon Sep 17 00:00:00 2001
 From: Lauren Post <lauren.post@freescale.com>
 Date: Tue, 22 Mar 2016 22:08:25 +0100
 Subject: [PATCH] Add ARM support into xf86drm.h
@@ -10,19 +10,28 @@ samples will hang during close requiring a reboot
 Upstream-Status: Pending
 Signed-off-by: Lauren Post <lauren.post@freescale.com>
 Signed-off-by: Evan Kotara <evan.kotara@freescale.com>
+[Thomas: change CAS code to only be used on ARMv6/ARMv7, and not
+ARMv4/ARMv5, which don't support ldrex/strex. If no CAS implementation
+is provided libdrm falls back to a system call for locking/unlocking.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- xf86drm.h | 17 +++++++++++++++++
- 1 file changed, 17 insertions(+)
+ xf86drm.h | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
 
 diff --git a/xf86drm.h b/xf86drm.h
-index 481d882..1cc0075 100644
+index 481d882..72341f6 100644
 --- a/xf86drm.h
 +++ b/xf86drm.h
-@@ -469,6 +469,23 @@ do {	register unsigned int __old __asm("o0");		\
+@@ -469,6 +469,28 @@ do {	register unsigned int __old __asm("o0");		\
  		: "cr0", "memory");			\
  	} while (0)
  
-+#elif defined(__arm__)
++# elif defined (__ARM_ARCH_6__) || defined(__ARM_ARCH_6J__) \
++	|| defined (__ARM_ARCH_6Z__) || defined(__ARM_ARCH_6ZK__) \
++	|| defined (__ARM_ARCH_6K__) || defined(__ARM_ARCH_6T2__) \
++	|| defined (__ARM_ARCH_7__) || defined(__ARM_ARCH_7A__) \
++	|| defined(__ARM_ARCH_7R__) || defined(__ARM_ARCH_7M__) \
++	|| defined(__ARM_ARCH_7EM__)
 +       #undef DRM_DEV_MODE
 +       #define DRM_DEV_MODE     (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)
 +
