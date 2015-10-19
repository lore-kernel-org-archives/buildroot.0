From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Oct 2015 22:38:41 +0200
Subject: [Buildroot] [git commit] xdriver_xf86-video-intel: add upstream
	patch fixing libdrm/kernel crash
Message-ID: <20151019204051.D9A0981D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8e6d22bc2f8568cadd02d1e5c769dd817ba6e13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When running this Intel driver with a newer libdrm/kernel (4.x), Xorg
can crash (segmentation fault).

References:
 http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=7fe2b2948652443ff43d907855bd7a051d54d309
 https://bugs.gentoo.org/show_bug.cgi?id=552124
 https://bugzilla.opensuse.org/show_bug.cgi?id=931917

[Thomas:
  - add upstream link to the git commits in the patches themselves
  - add James SoB line inside the patches themselves]

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-sna-libdrm-abi-protection.patch           |   69 ++++++++++++++++++++
 1 files changed, 69 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/0003-sna-libdrm-abi-protection.patch b/package/x11r7/xdriver_xf86-video-intel/0003-sna-libdrm-abi-protection.patch
new file mode 100644
index 0000000..32cd275
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-intel/0003-sna-libdrm-abi-protection.patch
@@ -0,0 +1,69 @@
+From 7fe2b2948652443ff43d907855bd7a051d54d309 Mon Sep 17 00:00:00 2001
+From: Chris Wilson <chris@chris-wilson.co.uk>
+Date: Thu, 19 Mar 2015 23:14:17 +0000
+Subject: sna: Protect against ABI breakage in recent versions of libdrm
+
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+
+Upstream at: http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=7fe2b2948652443ff43d907855bd7a051d54d309
+
+Signed-off-by: James Knight <james.knight@rockwellcollins.com>
+
+diff --git a/src/sna/kgem.c b/src/sna/kgem.c
+index 11f0828..6f16cba 100644
+--- a/src/sna/kgem.c
++++ b/src/sna/kgem.c
+@@ -182,6 +182,15 @@ struct local_i915_gem_caching {
+ #define LOCAL_IOCTL_I915_GEM_SET_CACHING DRM_IOW(DRM_COMMAND_BASE + LOCAL_I915_GEM_SET_CACHING, struct local_i915_gem_caching)
+ #define LOCAL_IOCTL_I915_GEM_GET_CACHING DRM_IOW(DRM_COMMAND_BASE + LOCAL_I915_GEM_GET_CACHING, struct local_i915_gem_caching)
+ 
++struct local_i915_gem_mmap {
++	uint32_t handle;
++	uint32_t pad;
++	uint64_t offset;
++	uint64_t size;
++	uint64_t addr_ptr;
++};
++#define LOCAL_IOCTL_I915_GEM_MMAP DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_MMAP, struct local_i915_gem_mmap)
++
+ struct local_i915_gem_mmap2 {
+ 	uint32_t handle;
+ 	uint32_t pad;
+@@ -514,15 +523,15 @@ retry_wc:
+ 
+ static void *__kgem_bo_map__cpu(struct kgem *kgem, struct kgem_bo *bo)
+ {
+-	struct drm_i915_gem_mmap mmap_arg;
++	struct local_i915_gem_mmap arg;
+ 	int err;
+ 
+ retry:
+-	VG_CLEAR(mmap_arg);
+-	mmap_arg.handle = bo->handle;
+-	mmap_arg.offset = 0;
+-	mmap_arg.size = bytes(bo);
+-	if ((err = do_ioctl(kgem->fd, DRM_IOCTL_I915_GEM_MMAP, &mmap_arg))) {
++	VG_CLEAR(arg);
++	arg.handle = bo->handle;
++	arg.offset = 0;
++	arg.size = bytes(bo);
++	if ((err = do_ioctl(kgem->fd, LOCAL_IOCTL_I915_GEM_MMAP, &arg))) {
+ 		assert(err != EINVAL);
+ 
+ 		if (__kgem_throttle_retire(kgem, 0))
+@@ -536,10 +545,10 @@ retry:
+ 		return NULL;
+ 	}
+ 
+-	VG(VALGRIND_MAKE_MEM_DEFINED(mmap_arg.addr_ptr, bytes(bo)));
++	VG(VALGRIND_MAKE_MEM_DEFINED(arg.addr_ptr, bytes(bo)));
+ 
+ 	DBG(("%s: caching CPU vma for %d\n", __FUNCTION__, bo->handle));
+-	return bo->map__cpu = (void *)(uintptr_t)mmap_arg.addr_ptr;
++	return bo->map__cpu = (void *)(uintptr_t)arg.addr_ptr;
+ }
+ 
+ static int gem_write(int fd, uint32_t handle,
+-- 
+cgit v0.10.2
+
