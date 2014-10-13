From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 13 Oct 2014 13:10:17 +0200
Subject: [Buildroot] [PATCH v2 07/13] libdrm: fix support for xserver with
	Vivante drivers
In-Reply-To: <1413198623-22373-1-git-send-email-jezz@sysmic.org>
References: <1413198623-22373-1-git-send-email-jezz@sysmic.org>
Message-ID: <1413198623-22373-8-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/libdrm/libdrm-0001-update-arm.patch | 37 +++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/libdrm/libdrm-0001-update-arm.patch

diff --git a/package/libdrm/libdrm-0001-update-arm.patch b/package/libdrm/libdrm-0001-update-arm.patch
new file mode 100644
index 0000000..583dfb2
--- /dev/null
+++ b/package/libdrm/libdrm-0001-update-arm.patch
@@ -0,0 +1,37 @@
+(come from yocto)
+
+Add ARM support into xf86arm.h.  This provides support for Xorg interface.
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
-- 
1.9.1
