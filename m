From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Nov 2015 00:26:38 +0100
Subject: [Buildroot] [PATCH/next 08/13]
	package/x11r7/xdriver_xf86-video-intel: bump version
In-Reply-To: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
References: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1447457203-27816-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed after xserver_xorg-server version bump to 1.18.0.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-sna-udev-fstat.patch                      | 61 -------------------
 .../0002-uxa-udev-fstat.patch                      | 31 ----------
 .../0003-sna-libdrm-abi-protection.patch           | 69 ----------------------
 .../xdriver_xf86-video-intel.mk                    |  5 +-
 4 files changed, 2 insertions(+), 164 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-intel/0001-sna-udev-fstat.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-intel/0002-uxa-udev-fstat.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-intel/0003-sna-libdrm-abi-protection.patch

diff --git a/package/x11r7/xdriver_xf86-video-intel/0001-sna-udev-fstat.patch b/package/x11r7/xdriver_xf86-video-intel/0001-sna-udev-fstat.patch
deleted file mode 100644
index e4ded3a..0000000
--- a/package/x11r7/xdriver_xf86-video-intel/0001-sna-udev-fstat.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 12af8a575d1518d40416f83195049157c3a062a5 Mon Sep 17 00:00:00 2001
-From: Chris Wilson <chris@chris-wilson.co.uk>
-Date: Tue, 24 Feb 2015 15:25:40 +0000
-Subject: sna: udev integration depends on fstat and sys/stat.h
-
-src/sna/sna_driver.c: In function 'sna_handle_uevents':
-src/sna/sna_driver.c:759:2: error: implicit declaration of function 'fstat' [-Werror=implicit-function-declaration]
-
-Also take the opportunity to include udev support in the configure
-summary.
-
-Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
-
-Upstream at: http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=12af8a575d1518d40416f83195049157c3a062a5
-
-Signed-off-by: James Knight <james.knight@rockwellcollins.com>
-
-diff --git a/configure.ac b/configure.ac
-index 7476e2b..de3a4b3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -197,11 +197,15 @@ AC_ARG_ENABLE(udev,
- 
- if test "x$UDEV" != "xno"; then
- 	PKG_CHECK_MODULES(UDEV, [libudev], [udev="yes"], [udev="no"])
-+	AC_CHECK_HEADERS([sys/stat.h], [], [udev="no"])
- 	if test "x$UDEV" = "xyes" -a "x$udev" != "xyes"; then
- 		AC_MSG_ERROR([udev support requested but not found (libudev)])
- 	fi
- 	if test "x$udev" = "xyes"; then
- 		AC_DEFINE(HAVE_UDEV,1,[Enable udev-based monitor hotplug detection])
-+		udev_msg=" yes"
-+	else
-+		udev_msg=" no"
- 	fi
- fi
- 
-@@ -911,6 +915,7 @@ echo "  Support for Kernel Mode Setting? $KMS"
- echo "  Support for legacy User Mode Setting (for i810)? $UMS"
- echo "  Support for Direct Rendering Infrastructure:$dri_msg"
- echo "  Support for Xv motion compensation (XvMC and libXvMC):$xvmc_msg"
-+echo "  Support for display hotplug notifications (udev):$udev_msg"
- echo "  Build additional tools and utilities?$tools_msg"
- if test -n "$xp_msg"; then
- echo "  Experimental support:$xp_msg"
-diff --git a/src/sna/sna_driver.c b/src/sna/sna_driver.c
-index 8c0d0b5..bc20ef0 100644
---- a/src/sna/sna_driver.c
-+++ b/src/sna/sna_driver.c
-@@ -740,6 +740,8 @@ sna_wakeup_handler(WAKEUPHANDLER_ARGS_DECL)
- }
- 
- #if HAVE_UDEV
-+#include <sys/stat.h>
-+
- static void
- sna_handle_uevents(int fd, void *closure)
- {
--- 
-cgit v0.10.2
-
diff --git a/package/x11r7/xdriver_xf86-video-intel/0002-uxa-udev-fstat.patch b/package/x11r7/xdriver_xf86-video-intel/0002-uxa-udev-fstat.patch
deleted file mode 100644
index 3ab255b..0000000
--- a/package/x11r7/xdriver_xf86-video-intel/0002-uxa-udev-fstat.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 369ceec0e4910ba2c37736a59c55c0d6c26433bf Mon Sep 17 00:00:00 2001
-From: Chris Wilson <chris@chris-wilson.co.uk>
-Date: Tue, 24 Feb 2015 15:25:40 +0000
-Subject: uxa: udev integration depends on fstat and sys/stat.h
-
-src/uxa/intel_driver.c: In function 'I830HandleUEvents':
-src/uxa/intel_driver.c:738:14: error: storage size of 's' isn't known
-src/uxa/intel_driver.c:746:2: error: implicit declaration of function 'fstat' [-Werror=implicit-function-declaration]
-
-Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
-
-Upstream at: Signed-off-by: James Knight <james.knight@rockwellcollins.com>
-
-Signed-off-by: James Knight <james.knight@rockwellcollins.com>
-
-diff --git a/src/uxa/intel_driver.c b/src/uxa/intel_driver.c
-index c554124..6e64b8c 100644
---- a/src/uxa/intel_driver.c
-+++ b/src/uxa/intel_driver.c
-@@ -728,6 +728,8 @@ intel_flush_callback(CallbackListPtr *list,
- }
- 
- #if HAVE_UDEV
-+#include <sys/stat.h>
-+
- static void
- I830HandleUEvents(int fd, void *closure)
- {
--- 
-cgit v0.10.2
-
diff --git a/package/x11r7/xdriver_xf86-video-intel/0003-sna-libdrm-abi-protection.patch b/package/x11r7/xdriver_xf86-video-intel/0003-sna-libdrm-abi-protection.patch
deleted file mode 100644
index 32cd275..0000000
--- a/package/x11r7/xdriver_xf86-video-intel/0003-sna-libdrm-abi-protection.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 7fe2b2948652443ff43d907855bd7a051d54d309 Mon Sep 17 00:00:00 2001
-From: Chris Wilson <chris@chris-wilson.co.uk>
-Date: Thu, 19 Mar 2015 23:14:17 +0000
-Subject: sna: Protect against ABI breakage in recent versions of libdrm
-
-Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
-
-Upstream at: http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=7fe2b2948652443ff43d907855bd7a051d54d309
-
-Signed-off-by: James Knight <james.knight@rockwellcollins.com>
-
-diff --git a/src/sna/kgem.c b/src/sna/kgem.c
-index 11f0828..6f16cba 100644
---- a/src/sna/kgem.c
-+++ b/src/sna/kgem.c
-@@ -182,6 +182,15 @@ struct local_i915_gem_caching {
- #define LOCAL_IOCTL_I915_GEM_SET_CACHING DRM_IOW(DRM_COMMAND_BASE + LOCAL_I915_GEM_SET_CACHING, struct local_i915_gem_caching)
- #define LOCAL_IOCTL_I915_GEM_GET_CACHING DRM_IOW(DRM_COMMAND_BASE + LOCAL_I915_GEM_GET_CACHING, struct local_i915_gem_caching)
- 
-+struct local_i915_gem_mmap {
-+	uint32_t handle;
-+	uint32_t pad;
-+	uint64_t offset;
-+	uint64_t size;
-+	uint64_t addr_ptr;
-+};
-+#define LOCAL_IOCTL_I915_GEM_MMAP DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_MMAP, struct local_i915_gem_mmap)
-+
- struct local_i915_gem_mmap2 {
- 	uint32_t handle;
- 	uint32_t pad;
-@@ -514,15 +523,15 @@ retry_wc:
- 
- static void *__kgem_bo_map__cpu(struct kgem *kgem, struct kgem_bo *bo)
- {
--	struct drm_i915_gem_mmap mmap_arg;
-+	struct local_i915_gem_mmap arg;
- 	int err;
- 
- retry:
--	VG_CLEAR(mmap_arg);
--	mmap_arg.handle = bo->handle;
--	mmap_arg.offset = 0;
--	mmap_arg.size = bytes(bo);
--	if ((err = do_ioctl(kgem->fd, DRM_IOCTL_I915_GEM_MMAP, &mmap_arg))) {
-+	VG_CLEAR(arg);
-+	arg.handle = bo->handle;
-+	arg.offset = 0;
-+	arg.size = bytes(bo);
-+	if ((err = do_ioctl(kgem->fd, LOCAL_IOCTL_I915_GEM_MMAP, &arg))) {
- 		assert(err != EINVAL);
- 
- 		if (__kgem_throttle_retire(kgem, 0))
-@@ -536,10 +545,10 @@ retry:
- 		return NULL;
- 	}
- 
--	VG(VALGRIND_MAKE_MEM_DEFINED(mmap_arg.addr_ptr, bytes(bo)));
-+	VG(VALGRIND_MAKE_MEM_DEFINED(arg.addr_ptr, bytes(bo)));
- 
- 	DBG(("%s: caching CPU vma for %d\n", __FUNCTION__, bo->handle));
--	return bo->map__cpu = (void *)(uintptr_t)mmap_arg.addr_ptr;
-+	return bo->map__cpu = (void *)(uintptr_t)arg.addr_ptr;
- }
- 
- static int gem_write(int fd, uint32_t handle,
--- 
-cgit v0.10.2
-
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index f0b0753..814c25e 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.917
-XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 0340718366d7cb168a46930eb7be22f2d88354d8
+XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
 # We're patching configure.ac
-- 
2.6.2
