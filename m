Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BD7C001DB
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 15:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BB9381F4E;
	Tue, 15 Aug 2023 15:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BB9381F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7-akPwOsBdWn; Tue, 15 Aug 2023 15:17:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0193781F71;
	Tue, 15 Aug 2023 15:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0193781F71
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16EF91BF475
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 15:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2E6181F79
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 15:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2E6181F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2WZqIWwQvyj for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 15:17:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E59F981F6A
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 15:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E59F981F6A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D013785D4B; Tue, 15 Aug 2023 15:17:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 17:16:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64490ea84c135a09b863de4d2ff75d0bfcfbdd96
X-Git-Newrev: 94edad7ed5952f82823e3cd9e01e4e7010af9f96
X-Patchwork-Hint: ignore
Message-Id: <20230815151723.D013785D4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/trinity: fix compile error with
 newer kernels
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=94edad7ed5952f82823e3cd9e01e4e7010af9f96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add two patches from Upstream git to avoid compilation errors with
Linux kernel 6.4.x.

Fixes:
 - http://autobuild.buildroot.net/results/7f9/7f9626827a315b54c42e49ccb0bf75f8b5ec971d

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...check-i810-mga-r128-and-savage-support-44.patch | 113 +++++++++++++++++++++
 .../0006-kvm-drop-KVM_SET_MEMORY_REGION-42.patch   |  30 ++++++
 2 files changed, 143 insertions(+)

diff --git a/package/trinity/0005-ioctls-drm-check-i810-mga-r128-and-savage-support-44.patch b/package/trinity/0005-ioctls-drm-check-i810-mga-r128-and-savage-support-44.patch
new file mode 100644
index 0000000000..b91fddb20b
--- /dev/null
+++ b/package/trinity/0005-ioctls-drm-check-i810-mga-r128-and-savage-support-44.patch
@@ -0,0 +1,113 @@
+From 6823bacb3c2564bff5da3175c574fd6a6af4d8b2 Mon Sep 17 00:00:00 2001
+From: chuhu <chuhu@redhat.com>
+Date: Sat, 1 Jul 2023 01:02:37 +0800
+Subject: [PATCH] ioctls/drm: check i810,mga,r128 and savage support (#44)
+
+kernel v6.3-rc1 removed some drm drivers, so add the extra check to make
+the compile succeed.
+
+7872bc2cb13e drm: Remove the obsolete driver-savage
+28483b8666bf drm: Remove the obsolete driver-r128
+96ed7db55bef drm: Remove the obsolete driver-mga
+cab18866fead drm: Remove the obsolete driver-i810
+
+Signed-off-by: Chunyu Hu <chuhu@redhat.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://github.com/kernelslacker/trinity/commit/6823bacb3c2564bff5da3175c574fd6a6af4d8b2
+---
+ configure    |  4 ++++
+ ioctls/drm.c | 14 ++++++++++++++
+ 2 files changed, 18 insertions(+)
+
+diff --git a/configure b/configure
+index 944c8cf7..bbaf9afc 100755
+--- a/configure
++++ b/configure
+@@ -320,6 +320,10 @@ check_header linux/irda.h USE_IRDA
+ check_header linux/rds.h USE_RDS
+ check_header linux/vfio.h USE_VFIO
+ check_header drm/drm.h USE_DRM
++check_header drm/i810_drm.h USE_DRM_I810
++check_header drm/mga_drm.h USE_DRM_MGA
++check_header drm/r128_drm.h USE_DRM_R128
++check_header drm/savage_drm.h USE_DRM_SAVAGE
+ check_header drm/exynos_drm.h USE_DRM_EXYNOS
+ check_header sound/compress_offload.h USE_SNDDRV_COMPRESS_OFFLOAD
+ check_header linux/kvm.h USE_KVM
+diff --git a/ioctls/drm.c b/ioctls/drm.c
+index 81ed3682..a07a8436 100644
+--- a/ioctls/drm.c
++++ b/ioctls/drm.c
+@@ -8,13 +8,21 @@
+ #ifdef USE_DRM_EXYNOS
+ #include <drm/exynos_drm.h>
+ #endif
++#ifdef USE_DRM_I810
+ #include <drm/i810_drm.h>
++#endif
+ #include <drm/i915_drm.h>
++#ifdef USE_DRM_MGA
+ #include <drm/mga_drm.h>
++#endif
+ #include <drm/nouveau_drm.h>
++#ifdef USE_DRM_R128
+ #include <drm/r128_drm.h>
++#endif
+ #include <drm/radeon_drm.h>
++#ifdef USE_DRM_SAVAGE
+ #include <drm/savage_drm.h>
++#endif
+ 
+ #include "ioctls.h"
+ #include "utils.h"
+@@ -293,6 +301,7 @@ static const struct ioctl drm_ioctls[] = {
+ #endif
+ #endif
+ 
++#ifdef USE_DRM_I810
+ 	/* i810_drm.h */
+ 	IOCTL(DRM_IOCTL_I810_INIT),
+ 	IOCTL(DRM_IOCTL_I810_VERTEX),
+@@ -309,6 +318,7 @@ static const struct ioctl drm_ioctls[] = {
+ 	IOCTL(DRM_IOCTL_I810_MC),
+ 	IOCTL(DRM_IOCTL_I810_RSTATUS),
+ 	IOCTL(DRM_IOCTL_I810_FLIP),
++#endif
+ 
+ 	/* i915_drm.h */
+ 	IOCTL(DRM_IOCTL_I915_INIT),
+@@ -378,6 +388,7 @@ static const struct ioctl drm_ioctls[] = {
+ 	IOCTL(DRM_IOCTL_I915_REG_READ),
+ #endif
+ 
++#ifdef USE_DRM_MGA
+ 	/* mga_drm.h */
+ 	IOCTL(DRM_IOCTL_MGA_INIT),
+ 	IOCTL(DRM_IOCTL_MGA_FLUSH),
+@@ -401,6 +412,7 @@ static const struct ioctl drm_ioctls[] = {
+ 	IOCTL(DRM_IOCTL_NOUVEAU_GROBJ_ALLOC),
+ 	IOCTL(DRM_IOCTL_NOUVEAU_NOTIFIEROBJ_ALLOC),
+ 	IOCTL(DRM_IOCTL_NOUVEAU_GPUOBJ_FREE),
++#endif
+ #ifdef DRM_IOCTL_NOUVEAU_GEM_NEW
+ 	IOCTL(DRM_IOCTL_NOUVEAU_GEM_NEW),
+ #endif
+@@ -417,6 +429,7 @@ static const struct ioctl drm_ioctls[] = {
+ 	IOCTL(DRM_IOCTL_NOUVEAU_GEM_INFO),
+ #endif
+ 
++#ifdef USE_DRM_R128
+ 	/* r128_drm.h */
+ 	IOCTL(DRM_IOCTL_R128_INIT),
+ 	IOCTL(DRM_IOCTL_R128_CCE_START),
+@@ -435,6 +448,7 @@ static const struct ioctl drm_ioctls[] = {
+ 	IOCTL(DRM_IOCTL_R128_FULLSCREEN),
+ 	IOCTL(DRM_IOCTL_R128_GETPARAM),
+ 	IOCTL(DRM_IOCTL_R128_FLIP),
++#endif
+ 
+ 	/* radeon_drm.h */
+ 	IOCTL(DRM_IOCTL_RADEON_CP_INIT),
+-- 
+2.39.2
+
diff --git a/package/trinity/0006-kvm-drop-KVM_SET_MEMORY_REGION-42.patch b/package/trinity/0006-kvm-drop-KVM_SET_MEMORY_REGION-42.patch
new file mode 100644
index 0000000000..4277983694
--- /dev/null
+++ b/package/trinity/0006-kvm-drop-KVM_SET_MEMORY_REGION-42.patch
@@ -0,0 +1,30 @@
+From ca07c86b2aeeb91213922eaf481c9e224679a7fd Mon Sep 17 00:00:00 2001
+From: Jiri Slaby <jirislaby@gmail.com>
+Date: Fri, 17 Mar 2023 20:28:24 +0100
+Subject: [PATCH] kvm: drop KVM_SET_MEMORY_REGION (#42)
+
+It was dropped in upstream in commit 61e15f871241 (KVM: Delete all
+references to removed KVM_SET_MEMORY_REGION ioctl).
+
+Co-authored-by: Jiri Slaby <jslaby@suse.cz>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://github.com/kernelslacker/trinity/commit/ca07c86b2aeeb91213922eaf481c9e224679a7fd
+---
+ ioctls/kvm.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/ioctls/kvm.c b/ioctls/kvm.c
+index 14c55ef1..30aeed7a 100644
+--- a/ioctls/kvm.c
++++ b/ioctls/kvm.c
+@@ -8,7 +8,6 @@
+ #include "utils.h"
+ 
+ static const struct ioctl kvm_ioctls[] = {
+-	IOCTL(KVM_SET_MEMORY_REGION),
+ 	IOCTL(KVM_CREATE_VCPU),
+ 	IOCTL(KVM_GET_DIRTY_LOG),
+ 	IOCTL(KVM_SET_NR_MMU_PAGES),
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
