Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA1FC3271E
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 07:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD83416DC;
	Thu, 11 Jul 2024 07:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYq_rLXIIsXQ; Thu, 11 Jul 2024 07:05:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 061524170F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 061524170F;
	Thu, 11 Jul 2024 07:05:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CC901BF990
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 07:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87A6183F38
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 07:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtBu5yqRBoe1 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 07:05:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9736F83F36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9736F83F36
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9736F83F36
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 07:05:34 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a77dc08db60so59934266b.1
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 00:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720681533; x=1721286333;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jjoE62MuSLhozQje7/3W80mmDCsphb4cD/HITdLfMfY=;
 b=s0S3B1+FqSOGCxqRsmpIglLfliytcuEv9xu9nn/Iimmmc22/A8c6cHFdnNS/N3rBeA
 NVgB+Ns7jOLO3HMftk7C1RIaeY0S99v5ubmu6xrPujbqzlzpotYB/Q6eu3C27UKkgf4q
 p4cSInXQD4fBCLDqFcYCgCyghYhTwyNrakYxVT9zOAtEYBvJcc/5+LHlh0w5aHGm25yR
 Q7WFNYUliwuJGJIDSvcBaIJFAb79d+KyVhygi0hKWNAaWv4+bhPoMSW0irKK6ftbhRtK
 EDksbKYrs/dH4p+u1ryzdDB7o07x2/iphNf+EOoLYERrQh2A4RAmF7Dvd48TBLOZprza
 G2QA==
X-Gm-Message-State: AOJu0YyB0IWsBr23N72Bie5NtZ/NfD+byuhYija+ABY6w3fHDFKeOIzm
 dV1DPU0nFcPmRt4U8cGkRuFuZAo/N5uZnPHGuNlEXCGlbwWE1vPbqsxLIZiWEl9TXV6bK6Ngb7B
 f/r0=
X-Google-Smtp-Source: AGHT+IFRbSdHOioKstvXA8aJ0wsD1ZWLZkH+oBnPHeB1VWy8r3T0YptSbCp5HjSKJ6O0zOguxNY12Q==
X-Received: by 2002:a17:906:b74a:b0:a72:5715:f7b9 with SMTP id
 a640c23a62f3a-a780b689247mr517334966b.15.1720681532681; 
 Thu, 11 Jul 2024 00:05:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.36])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bc6cdsm229868166b.23.2024.07.11.00.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 00:05:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 09:05:25 +0200
Message-ID: <20240711070525.1406612-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720681533; x=1721286333;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jjoE62MuSLhozQje7/3W80mmDCsphb4cD/HITdLfMfY=;
 b=Na+mg+fdhsbswkDJ0roEuUJdzzCn0aqwSoSYuJViwLetqi8wsKE0H1iTOUHk8fmZwE
 aVlnlrZ92vf+LJypUf9SXsmYd1fqtIL4Ur8yJku9mSUV7sdXlpLHb3zRXVhhPxO/xbzR
 dYy6rallMtrtpWAUKxpjAtSI1kdgPZDIwCrYU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Na+mg+fd
Subject: [Buildroot] [PATCH 1/1] package/sunxi-mali-utgard-driver: fix patch
 fuzz
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, sunxi-mali-utgard-driver fails to build with output:

    - r6p2:

        Applying 0018-mali-support-building-against-4.20.patch using series:
	patching file src/devicedrv/mali/linux/mali_kernel_linux.c
	Hunk #1 succeeded at 1125 (offset 193 lines).
	patching file src/devicedrv/mali/linux/mali_kernel_linux.h
	Hunk #1 FAILED at 16.
	Hunk #2 succeeded at 33 (offset 5 lines).
	1 out of 2 hunks FAILED -- saving rejects to file src/devicedrv/mali/linux/mali_kernel_linux.h.rej

    -r8p1:

	Applying r6p2/0013-mali-support-building-against-4.15.patch using series:
	patching file src/devicedrv/mali/common/mali_control_timer.c
	patching file src/devicedrv/mali/common/mali_group.c
	Hunk #2 FAILED at 1768.
	1 out of 2 hunks FAILED -- saving rejects to file src/devicedrv/mali/common/mali_group.c.rej
	patching file src/devicedrv/mali/common/mali_osk_types.h
	patching file src/devicedrv/mali/linux/mali_memory_os_alloc.c
	Hunk #1 succeeded at 202 (offset -2 lines).
	patching file src/devicedrv/mali/linux/mali_osk_timers.c

	Applying 0020-mali-support-building-against-4.17.patch using series:
	patching file src/devicedrv/mali/linux/mali_memory.c
	Hunk #1 FAILED at 57.
	1 out of 1 hunk FAILED -- saving rejects to file src/devicedrv/mali/linux/mali_memory.c.rej

This commit fixes the driver patches on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...he-patches-to-be-applied-with-fuzz-0.patch | 317 ++++++++++++++++++
 1 file changed, 317 insertions(+)
 create mode 100644 package/sunxi-mali-utgard-driver/0002-Update-the-patches-to-be-applied-with-fuzz-0.patch

diff --git a/package/sunxi-mali-utgard-driver/0002-Update-the-patches-to-be-applied-with-fuzz-0.patch b/package/sunxi-mali-utgard-driver/0002-Update-the-patches-to-be-applied-with-fuzz-0.patch
new file mode 100644
index 000000000000..00e313a57d9a
--- /dev/null
+++ b/package/sunxi-mali-utgard-driver/0002-Update-the-patches-to-be-applied-with-fuzz-0.patch
@@ -0,0 +1,317 @@
+From 6aed6098e4bdfeef87ae7003bfcff03df7b2e13e Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Tue, 9 Jul 2024 18:39:08 +0200
+Subject: [PATCH] Update the patches to be applied with fuzz 0
+
+This driver, used in Buildroot for versions r6p2 and r8p1, fails to apply
+some patches after the commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh:
+set the maximum fuzz factor to 0") has been merged.
+
+This commit fixes those patches so that they can be applied with fuzz
+factor 0, without causing regressions for any of the Mali versions,
+including those not used in Buildroot.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/giuliobenetti/sunxi-mali/pull/2
+---
+ ...8-mali-support-building-against-4.20.patch |  87 ++++++++++++
+ patches/r6p2/series                           |   2 +-
+ ...3-mali-support-building-against-4.15.patch | 127 ++++++++++++++++++
+ ...0-mali-support-building-against-4.17.patch |  21 +++
+ patches/r8p1/series                           |   6 +-
+ 5 files changed, 239 insertions(+), 4 deletions(-)
+ create mode 100644 patches/r6p2/0018-mali-support-building-against-4.20.patch
+ create mode 100644 patches/r8p1/0013-mali-support-building-against-4.15.patch
+ create mode 100644 patches/r8p1/0020-mali-support-building-against-4.17.patch
+
+diff --git a/patches/r6p2/0018-mali-support-building-against-4.20.patch b/patches/r6p2/0018-mali-support-building-against-4.20.patch
+new file mode 100644
+index 000000000000..aac891ee1af3
+--- /dev/null
++++ b/patches/r6p2/0018-mali-support-building-against-4.20.patch
+@@ -0,0 +1,87 @@
++From ab90dcd9c5c33d3c26f2553f63dcd1837ce49d79 Mon Sep 17 00:00:00 2001
++From: Roman Stratiienko <roman.stratiienko@globallogic.com>
++Date: Wed, 28 Nov 2018 14:23:57 +0200
++Subject: [PATCH] mali: support building against 4.20
++
++From 4.20 kernel vm_insert_pfn was dropped
++This makes wrapper to preserve compatibility
++
++Also get_monotonic_boottime(...) was removed from 4.20
++Replace it with ktime_get_boot_ns()
++
++Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
++---
++ src/devicedrv/mali/linux/mali_kernel_linux.c | 11 +++++++++++
++ src/devicedrv/mali/linux/mali_kernel_linux.h | 10 ++++++++++
++ src/devicedrv/mali/linux/mali_osk_time.c     |  4 ++++
++ 3 files changed, 25 insertions(+)
++
++diff --git a/src/devicedrv/mali/linux/mali_kernel_linux.c b/src/devicedrv/mali/linux/mali_kernel_linux.c
++index 34cb3d7..6ed89a6 100755
++--- a/src/devicedrv/mali/linux/mali_kernel_linux.c
+++++ b/src/devicedrv/mali/linux/mali_kernel_linux.c
++@@ -1125,6 +1125,17 @@
++ 	return err;
++ }
++ 
+++/*
+++ * From 4.20.0 kernel vm_insert_pfn was dropped
+++ * Make wrapper to preserve compatibility
+++ */
+++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0)
+++int vm_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
+++		  unsigned long pfn)
+++{
+++	return vm_fault_to_errno(vmf_insert_pfn(vma, addr, pfn), 0xffff);
+++}
+++#endif
++ 
++ module_init(mali_module_init);
++ module_exit(mali_module_exit);
++diff --git a/src/devicedrv/mali/linux/mali_kernel_linux.h b/src/devicedrv/mali/linux/mali_kernel_linux.h
++index 8548c9f..f858a5c 100755
++--- a/src/devicedrv/mali/linux/mali_kernel_linux.h
+++++ b/src/devicedrv/mali/linux/mali_kernel_linux.h
++@@ -16,6 +16,7 @@
++ #endif
++ 
++ #include <linux/cdev.h>     /* character device definitions */
+++#include <linux/mm.h>
++ #include <linux/idr.h>
++ #include <linux/rbtree.h>
++ #include "mali_kernel_license.h"
++@@ -33,6 +34,15 @@
++ #define __GFP_REPEAT __GFP_RETRY_MAYFAIL
++ #endif
++ 
+++/*
+++ * From 4.20.0 kernel vm_insert_pfn was dropped
+++ * Make wrapper to preserve compatibility
+++ */
+++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0)
+++extern int vm_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
+++			 unsigned long pfn);
+++#endif
+++
++ #ifdef __cplusplus
++ }
++ #endif
++diff --git a/src/devicedrv/mali/linux/mali_osk_time.c b/src/devicedrv/mali/linux/mali_osk_time.c
++index 4deaa10..a14cb7d 100755
++--- a/src/devicedrv/mali/linux/mali_osk_time.c
+++++ b/src/devicedrv/mali/linux/mali_osk_time.c
++@@ -53,7 +53,11 @@ u64 _mali_osk_time_get_ns(void)
++ 
++ u64 _mali_osk_boot_time_get_ns(void)
++ {
+++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0)
+++	return ktime_get_boot_ns();
+++#else
++ 	struct timespec tsval;
++ 	get_monotonic_boottime(&tsval);
++ 	return (u64)timespec_to_ns(&tsval);
+++#endif
++ }
++-- 
++2.17.1
++
+diff --git a/patches/r6p2/series b/patches/r6p2/series
+index 8922fa49e5f6..c1ff18d1b522 100644
+--- a/patches/r6p2/series
++++ b/patches/r6p2/series
+@@ -14,7 +14,7 @@ r6p2/0013-mali-support-building-against-4.15.patch
+ r6p2/0014-mali-Make-devfreq-optional.patch
+ 0015-Enable-parallel-building-passing-variable-to-Makefile.patch
+ r6p2/0016-mali-support-building-against-4.16.patch
+-0018-mali-support-building-against-4.20.patch
++r6p2/0018-mali-support-building-against-4.20.patch
+ 0019-mali-support-building-against-5.0.patch
+ 0020-mali-support-building-against-4.17.patch
+ 0021-mali-support-building-against-5.3.patch
+diff --git a/patches/r8p1/0013-mali-support-building-against-4.15.patch b/patches/r8p1/0013-mali-support-building-against-4.15.patch
+new file mode 100644
+index 000000000000..ff6641a74f37
+--- /dev/null
++++ b/patches/r8p1/0013-mali-support-building-against-4.15.patch
+@@ -0,0 +1,127 @@
++From 5bc1f96c6e9b8927e3020fdfe58b2d99fa42bcb3 Mon Sep 17 00:00:00 2001
++From: John Stultz <john.stultz@linaro.org>
++Date: Thu, 16 Nov 2017 13:42:23 -0800
++Subject: MALI: v4.15-rc build fix
++
++Signed-off-by: John Stultz <john.stultz@linaro.org>
++---
++ src/devicedrv/mali/common/mali_control_timer.c  | 2 +-
++ src/devicedrv/mali/common/mali_group.c          | 8 +++++---
++ src/devicedrv/mali/common/mali_osk_types.h      | 8 +++++++-
++ src/devicedrv/mali/linux/mali_memory_os_alloc.c | 2 +-
++ src/devicedrv/mali/linux/mali_osk_timers.c      | 16 ++++++++++------
++ 5 files changed, 24 insertions(+), 12 deletions(-)
++
++--- a/src/devicedrv/mali/common/mali_control_timer.c
+++++ b/src/devicedrv/mali/common/mali_control_timer.c
++@@ -28,7 +28,7 @@ void mali_control_timer_add(u32 timeout)
++ 	_mali_osk_timer_add(mali_control_timer, _mali_osk_time_mstoticks(timeout));
++ }
++ 
++-static void mali_control_timer_callback(void *arg)
+++static void mali_control_timer_callback(struct timer_list *t)
++ {
++ 	if (mali_utilization_enabled()) {
++ 		struct mali_gpu_utilization_data *util_data = NULL;
++--- a/src/devicedrv/mali/common/mali_group.c
+++++ b/src/devicedrv/mali/common/mali_group.c
++@@ -44,7 +44,7 @@
++ static void mali_group_bottom_half_mmu(void *data);
++ static void mali_group_bottom_half_gp(void *data);
++ static void mali_group_bottom_half_pp(void *data);
++-static void mali_group_timeout(void *data);
+++static void mali_group_timeout(struct timer_list *t);
++ static void mali_group_reset_pp(struct mali_group *group);
++ static void mali_group_reset_mmu(struct mali_group *group);
++ 
++@@ -1761,9 +1761,11 @@
++ 				      0xFFFFFFFF, 0);
++ }
++ 
++-static void mali_group_timeout(void *data)
+++static void mali_group_timeout(struct timer_list *t)
++ {
++-	struct mali_group *group = (struct mali_group *)data;
+++	_mali_osk_timer_t *tim = container_of(t, _mali_osk_timer_t, timer);
+++	struct mali_group *group = container_of(&tim, struct mali_group, timeout_timer);
+++
++ 	MALI_DEBUG_ASSERT_POINTER(group);
++ 
++ 	MALI_DEBUG_PRINT(2, ("Group: timeout handler for %s at %u\n",
++--- a/src/devicedrv/mali/common/mali_osk_types.h
+++++ b/src/devicedrv/mali/common/mali_osk_types.h
++@@ -50,6 +50,7 @@ typedef unsigned long long u64;
++ #include <linux/types.h>
++ #endif
++ 
+++#include <linux/timer.h>
++ /** @brief Mali Boolean type which uses MALI_TRUE and MALI_FALSE
++   */
++ typedef unsigned long mali_bool;
++@@ -395,7 +396,12 @@ typedef struct _mali_osk_notification_t_
++  * by any callers of _mali_osk_timer_del(). Otherwise, a deadlock may occur.
++  *
++  * @param arg Function-specific data */
++-typedef void (*_mali_osk_timer_callback_t)(void *arg);
+++typedef void (*_mali_osk_timer_callback_t)(struct timer_list *t);
+++
+++
+++struct _mali_osk_timer_t_struct {
+++	struct timer_list timer;
+++};
++ 
++ /** @brief Private type for Timer Callback Objects */
++ typedef struct _mali_osk_timer_t_struct _mali_osk_timer_t;
++--- a/src/devicedrv/mali/linux/mali_memory_os_alloc.c
+++++ b/src/devicedrv/mali/linux/mali_memory_os_alloc.c
++@@ -202,7 +202,7 @@
++ 	/* Allocate new pages, if needed. */
++ 	for (i = 0; i < remaining; i++) {
++ 		dma_addr_t dma_addr;
++-		gfp_t flags = __GFP_ZERO | __GFP_REPEAT | __GFP_NOWARN | __GFP_COLD;
+++		gfp_t flags = __GFP_ZERO | __GFP_REPEAT | __GFP_NOWARN;
++ 		int err;
++ 
++ #if defined(CONFIG_ARM) && !defined(CONFIG_ARM_LPAE)
++--- a/src/devicedrv/mali/linux/mali_osk_timers.c
+++++ b/src/devicedrv/mali/linux/mali_osk_timers.c
++@@ -18,16 +18,25 @@
++ #include "mali_osk.h"
++ #include "mali_kernel_common.h"
++ 
++-struct _mali_osk_timer_t_struct {
++-	struct timer_list timer;
++-};
+++#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 0)
+++
+++#define TIMER_DATA_TYPE		unsigned long
+++#define TIMER_FUNC_TYPE		void (*)(TIMER_DATA_TYPE)
+++
+++static inline void timer_setup(struct timer_list *timer,
+++			       void (*callback)(struct timer_list *),
+++			       unsigned int flags)
+++{
+++	__setup_timer(timer, (TIMER_FUNC_TYPE)callback,
+++		      (TIMER_DATA_TYPE)timer, flags);
+++}
+++#endif
++ 
++ typedef void (*timer_timeout_function_t)(unsigned long);
++ 
++ _mali_osk_timer_t *_mali_osk_timer_init(void)
++ {
++ 	_mali_osk_timer_t *t = (_mali_osk_timer_t *)kmalloc(sizeof(_mali_osk_timer_t), GFP_KERNEL);
++-	if (NULL != t) init_timer(&t->timer);
++ 	return t;
++ }
++ 
++@@ -65,8 +74,7 @@ mali_bool _mali_osk_timer_pending(_mali_
++ void _mali_osk_timer_setcallback(_mali_osk_timer_t *tim, _mali_osk_timer_callback_t callback, void *data)
++ {
++ 	MALI_DEBUG_ASSERT_POINTER(tim);
++-	tim->timer.data = (unsigned long)data;
++-	tim->timer.function = (timer_timeout_function_t)callback;
+++	timer_setup(&tim->timer, callback, 0);
++ }
++ 
++ void _mali_osk_timer_term(_mali_osk_timer_t *tim)
+diff --git a/patches/r8p1/0020-mali-support-building-against-4.17.patch b/patches/r8p1/0020-mali-support-building-against-4.17.patch
+new file mode 100644
+index 000000000000..3077f080f60d
+--- /dev/null
++++ b/patches/r8p1/0020-mali-support-building-against-4.17.patch
+@@ -0,0 +1,21 @@
++mali: support building against 4.17
++
++4.17 changed the return code of the fault handler from int to vm_fault_t.
++
++The return values don't change though, so we only need to update the prototype.
++
++Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
++
++--- a/src/devicedrv/mali/linux/mali_memory.c
+++++ b/src/devicedrv/mali/linux/mali_memory.c
++@@ -70,7 +70,9 @@
++ 	}
++ }
++ 
++-#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 11, 0)
+++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 17, 0)
+++static vm_fault_t mali_mem_vma_fault(struct vm_fault *vmf)
+++#elif LINUX_VERSION_CODE >= KERNEL_VERSION(4, 11, 0)
++ static int mali_mem_vma_fault(struct vm_fault *vmf)
++ #else
++ static int mali_mem_vma_fault(struct vm_area_struct *vma, struct vm_fault *vmf)
+diff --git a/patches/r8p1/series b/patches/r8p1/series
+index 564bf88a0ba1..15fdd50e7255 100644
+--- a/patches/r8p1/series
++++ b/patches/r8p1/series
+@@ -4,14 +4,14 @@
+ r6p2/0006-mali-Allow-devfreq-to-run-without-power-models.patch
+ r8p1/0011-mali-support-building-against-4.13.patch
+ 0012-mali-support-building-against-4.14.patch
+-r6p2/0013-mali-support-building-against-4.15.patch
++r8p1/0013-mali-support-building-against-4.15.patch
+ r6p2/0014-mali-Make-devfreq-optional.patch
+ 0015-Enable-parallel-building-passing-variable-to-Makefile.patch
+ r6p2/0016-mali-support-building-against-4.16.patch
+ r8p1/0017-mali-support-building-against-4.9-later.patch
+-0018-mali-support-building-against-4.20.patch
++r6p2/0018-mali-support-building-against-4.20.patch
+ 0019-mali-support-building-against-5.0.patch
+-0020-mali-support-building-against-4.17.patch
++r8p1/0020-mali-support-building-against-4.17.patch
+ 0021-mali-support-building-against-5.3.patch
+ r6p2/0022-mali-support-building-against-5.6.patch
+ 0023-mali-support-building-against-5.7.patch
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
