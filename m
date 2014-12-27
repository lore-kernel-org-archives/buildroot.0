From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 21:48:06 +0100
Subject: [Buildroot] [git commit] libdrm: fix support for xserver with
	Vivante drivers
Message-ID: <20141227204831.4E9F58016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94841d87fd2ff8ebf7af84d49e5095074958febf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix minor typo in patch description.]

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/0001-update-arm.patch |   37 ++++++++++++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/libdrm/0001-update-arm.patch b/package/libdrm/0001-update-arm.patch
new file mode 100644
index 0000000..1a95a14
--- /dev/null
+++ b/package/libdrm/0001-update-arm.patch
@@ -0,0 +1,37 @@
+[Adapted from yocto project]
+
+Add ARM support into xf86drm.h.  This provides support for Xorg interface.
+Without this the vivante samples will hang during close requiring a reboot
+
+Upstream-Status: Pending
+
+Signed-off-by: Lauren Post <lauren.post@freescale.com>
+Signed-off-by: Evan Kotara <evan.kotara@freescale.com>
+
+diff --git a/xf86drm.h b/xf86drm.h
+--- a/xf86drm.h
++++ b/xf86drm.h
+@@ -461,6 +461,23 @@ do {	register unsigned int __old __asm("
+ 		: "cr0", "memory");			\
+ 	} while (0)
+ 
++#elif defined(__arm__)
++       #undef DRM_DEV_MODE
++       #define DRM_DEV_MODE     (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)
++
++       #define DRM_CAS(lock,old,new,__ret)             \
++       do {                                            \
++               __asm__ __volatile__ (                  \
++                       "1: ldrex %0, [%1]\n"           \
++                       "   teq %0, %2\n"               \
++                       "   ite eq\n"                   \
++                       "   strexeq %0, %3, [%1]\n"     \
++                       "   movne   %0, #1\n"           \
++               : "=&r" (__ret)                         \
++               : "r" (lock), "r" (old), "r" (new)      \
++               : "cc","memory");                       \
++       } while (0)
++
+ #endif /* architecture */
+ #endif /* __GNUC__ >= 2 */
+ 
