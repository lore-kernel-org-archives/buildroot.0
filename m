Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E29C61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 21:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 014A080C84;
	Wed, 26 Aug 2026 21:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0gQWgqtctJz; Wed, 26 Aug 2026 21:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787778968;
	bh=mSg8XHU6zH/8+qZecbeKsgDy4EUFveRkoCqAtrBmzqM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C0JTKxFH0RW/hRlxhw2hOk6rAsUemjWdtpjhK/p9zeYQRoGwxPG59CUygA92JIRwe
	 /cY0A6U0ZaJ9hYiYW8fwTDsI7wfRa1rok2qPFdqiIvntdqKadn6ThAAfeCvCjMhOWv
	 2R2aklTp0s7m5XbEPlUJ2Sb6x9DOxNMw0mANu7pTUQF2IVgqF03hvMIraSAC7iykKs
	 WrGVxMBajNUjJeX5dZgZyGSYfk9p/RPRul34h4LiwL52EGzI6FC4p/0p5Hxn+fNdP3
	 AqOHTNNpoWv+xpgM+Es2KT3h9E2ovO7bU3Lcnyq18nODxS78xUDDySJwahBFJqc8mI
	 DftmJkGuKjUNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86F6480C79;
	Wed, 26 Aug 2026 21:16:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F29937AA
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6271400A6
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FO58cKeMs5PY for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 21:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0BF940247
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CCA5920CA; Wed, 26 Aug 2026 21:15:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Aug 2026 23:06:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8dde961bc05a554f4a90c3bfd00a202ccfac71e
X-Git-Newrev: f57da3c953dcdf32e3468362358e482536e309f5
X-Patchwork-Hint: ignore
Message-Id: <20260826211510.9CCA5920CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dahdi-linux: backport commits to
 fix build with recent kernels
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f57da3c953dcdf32e3468362358e482536e309f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes build with kernels >= 6.15.

Fixes:

  https://autobuild.buildroot.net/results/ed73aa844a18cfc15e942ced4ae363c3d0d09015/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...d-wrappers-for-del_timer-and-del_timer_sy.patch |  38 +++++
 ...ild-Use-ccflags-y-instead-of-EXTRA_CFLAGS.patch | 186 +++++++++++++++++++++
 ...d-wrapper-for-renamed-from_timer-function.patch |  35 ++++
 3 files changed, 259 insertions(+)

diff --git a/package/dahdi-linux/0004-kernel.h-Add-wrappers-for-del_timer-and-del_timer_sy.patch b/package/dahdi-linux/0004-kernel.h-Add-wrappers-for-del_timer-and-del_timer_sy.patch
new file mode 100644
index 0000000000..aac013016a
--- /dev/null
+++ b/package/dahdi-linux/0004-kernel.h-Add-wrappers-for-del_timer-and-del_timer_sy.patch
@@ -0,0 +1,38 @@
+From 96a67c8e51997a18bfc0942416b815057e279caf Mon Sep 17 00:00:00 2001
+From: InterLinked1 <24227567+InterLinked1@users.noreply.github.com>
+Date: Tue, 8 Jul 2025 18:35:56 -0400
+Subject: [PATCH] kernel.h: Add wrappers for del_timer and del_timer_sync.
+
+del_timer[_sync] was renamed to timer_delete[_sync] in kernel
+commit bb663f0f3c396c6d05f6c5eeeea96ced20ff112e, and the
+compatibility wrappers were removed completely in kernel commit
+8fa7292fee5c5240402371ea89ab285ec856c916. Add the wrappers
+back on newer kernels to allow compilation.
+
+Resolves: #91
+
+Upstream: https://github.com/asterisk/dahdi-linux/commit/67d909a8a73364d6fa47bbf8baf314175c94f546
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ include/dahdi/kernel.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/include/dahdi/kernel.h b/include/dahdi/kernel.h
+index ab129a8..ddd3eb4 100644
+--- a/include/dahdi/kernel.h
++++ b/include/dahdi/kernel.h
+@@ -62,6 +62,11 @@
+ #define netif_napi_add netif_napi_add_weight
+ #endif
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,15,0)
++#define del_timer timer_delete
++#define del_timer_sync timer_delete_sync
++#endif
++
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 18, 0)
+ #include <linux/pci.h>
+ #include <linux/dma-mapping.h>
+-- 
+2.55.0
+
diff --git a/package/dahdi-linux/0005-Kbuild-Use-ccflags-y-instead-of-EXTRA_CFLAGS.patch b/package/dahdi-linux/0005-Kbuild-Use-ccflags-y-instead-of-EXTRA_CFLAGS.patch
new file mode 100644
index 0000000000..857f317173
--- /dev/null
+++ b/package/dahdi-linux/0005-Kbuild-Use-ccflags-y-instead-of-EXTRA_CFLAGS.patch
@@ -0,0 +1,186 @@
+From fc3748466d96fa465fe665403b73d6f4f75c124b Mon Sep 17 00:00:00 2001
+From: InterLinked1 <24227567+InterLinked1@users.noreply.github.com>
+Date: Fri, 21 Feb 2025 21:42:19 -0500
+Subject: [PATCH] Kbuild: Use ccflags-y instead of EXTRA_CFLAGS.
+
+ccflags-y was added to the kernel back in 2007, in commit
+f77bf01425b11947eeb3b5b54. Recent kernel commit
+dbd83ea09699390892e5efecddd74ae43a00f071 has now completely
+removed the deprecated EXTRA_CFLAGS.
+
+Comments in Kbuild and the Makefile for the oct612x library were
+added back when it was created in 2013 in commit f65299e8b2e6ffb0b07089759f8c4ff33a695c09
+to use the newer ccflags-y based on the kernel version,
+but the change was never made to conditionally move away
+from the EXTRA_CFLAGS.
+
+Now that the older way no longer exists, always use ccflags-y.
+
+Resolves: #76
+
+Upstream: https://github.com/asterisk/dahdi-linux/commit/9d5b120cb5573d39bcd9e3d8a7b212e25ab5c2c4
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ drivers/dahdi/Kbuild            | 4 ++--
+ drivers/dahdi/oct612x/Kbuild    | 5 +----
+ drivers/dahdi/oct612x/Makefile  | 5 +----
+ drivers/dahdi/voicebus/Kbuild   | 4 ++--
+ drivers/dahdi/wcb4xxp/Kbuild    | 2 +-
+ drivers/dahdi/wct4xxp/Kbuild    | 6 +++---
+ drivers/dahdi/wctc4xxp/Kbuild   | 4 ++--
+ drivers/dahdi/wctdm24xxp/Kbuild | 2 +-
+ drivers/dahdi/xpp/Kbuild        | 4 ++--
+ 9 files changed, 15 insertions(+), 21 deletions(-)
+
+diff --git a/drivers/dahdi/Kbuild b/drivers/dahdi/Kbuild
+index cd0365b..9c9355a 100644
+--- a/drivers/dahdi/Kbuild
++++ b/drivers/dahdi/Kbuild
+@@ -75,13 +75,13 @@ CFLAGS_MODULE += -I$(DAHDI_INCLUDE) -I$(src) -Wno-format-truncation
+ BAD_KERNELS_VERS := 22 34 34.0.1 34.0.2
+ BAD_KERNELS := $(foreach ver,$(BAD_KERNELS_VERS),2.6.9-$(ver).EL 2.6.9-$(ver).ELsmp)
+ ifneq (,$(filter $(KVERS),$(BAD_KERNELS)))
+-EXTRA_CFLAGS+=-Drw_lock_t=rwlock_t
++ccflags-y+=-Drw_lock_t=rwlock_t
+ endif
+ 
+ # A number of Fedora 10 (9 also?) kernels backported hrtimer to 2.6.27
+ # as part of an ALSA backport. TODO: Any better way to detect that?
+ ifeq (1,$(shell fgrep -q ' hrtimer_set_expires' include/linux/hrtimer.h 2>/dev/null && echo 1))
+-EXTRA_CFLAGS+=-DHAVE_HRTIMER_ACCESSORS=1
++ccflags-y+=-DHAVE_HRTIMER_ACCESSORS=1
+ endif
+ 
+ ifeq (1,$(shell fgrep -q 'wait_for_completion_timeout' include/linux/completion.h 2>/dev/null && echo 1))
+diff --git a/drivers/dahdi/oct612x/Kbuild b/drivers/dahdi/oct612x/Kbuild
+index ac53fe7..5015f7e 100644
+--- a/drivers/dahdi/oct612x/Kbuild
++++ b/drivers/dahdi/oct612x/Kbuild
+@@ -24,9 +24,6 @@ octapi_files = octdeviceapi/oct6100api/oct6100_api/oct6100_adpcm_chan.o \
+ 		apilib/llman/octapi_llman.o \
+ 		oct612x-user.o
+ 
+-# TODO: ccflags was added in 2.6.24 in commit f77bf01425b11947eeb3b5b54. This
+-# should be changed to a conditional compilation based on the Kernel Version.
+-# ccflags-y := -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
+-EXTRA_CFLAGS = -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
++ccflags-y := -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
+ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_OCT612X) := oct612x.o
+ oct612x-objs := $(octapi_files)
+diff --git a/drivers/dahdi/oct612x/Makefile b/drivers/dahdi/oct612x/Makefile
+index 5d29143..d01997b 100644
+--- a/drivers/dahdi/oct612x/Makefile
++++ b/drivers/dahdi/oct612x/Makefile
+@@ -23,8 +23,5 @@ octapi_files = octdeviceapi/oct6100api/oct6100_api/oct6100_adpcm_chan.o \
+ 		apilib/largmath/octapi_largmath.o \
+ 		apilib/llman/octapi_llman.o
+ 
+-# TODO: ccflags was added in 2.6.24 in commit f77bf01425b11947eeb3b5b54. This
+-# should be changed to a conditional compilation based on the Kernel Version.
+-# ccflags-y := -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
+-EXTRA_CFLAGS = -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
++ccflags-y := -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
+ lib-y := $(octapi_files)
+diff --git a/drivers/dahdi/voicebus/Kbuild b/drivers/dahdi/voicebus/Kbuild
+index 3bf9640..45026d9 100644
+--- a/drivers/dahdi/voicebus/Kbuild
++++ b/drivers/dahdi/voicebus/Kbuild
+@@ -8,10 +8,10 @@ ifneq ($(HOTPLUG_FIRMWARE),yes)
+ dahdi_voicebus-objs += $(FIRM_DIR)/dahdi-fw-vpmoct032.o
+ $(warning WARNING: You are compiling firmware into voicebus.ko which is not available under the terms of the GPL. It may be a violation of the GPL to distribute the resulting image since it combines both GPL and non-GPL work. You should consult a lawyer of your own before distributing such an image.)
+ else
+-  EXTRA_CFLAGS+=-DHOTPLUG_FIRMWARE
++  ccflags-y+=-DHOTPLUG_FIRMWARE
+ endif
+ 
+-EXTRA_CFLAGS += -I$(src)/.. -Wno-undef
++ccflags-y += -I$(src)/.. -Wno-undef
+ 
+ $(obj)/$(FIRM_DIR)/dahdi-fw-vpmoct032.o: $(obj)/voicebus.o
+ 	$(MAKE) -C $(obj)/$(FIRM_DIR) dahdi-fw-vpmoct032.o
+diff --git a/drivers/dahdi/wcb4xxp/Kbuild b/drivers/dahdi/wcb4xxp/Kbuild
+index 80606bf..59ffc8d 100644
+--- a/drivers/dahdi/wcb4xxp/Kbuild
++++ b/drivers/dahdi/wcb4xxp/Kbuild
+@@ -1,6 +1,6 @@
+ obj-m += wcb4xxp.o
+ 
+-EXTRA_CFLAGS += -I$(src)/.. -Wno-undef
++ccflags-y += -I$(src)/.. -Wno-undef
+ 
+ wcb4xxp-objs := base.o
+ 
+diff --git a/drivers/dahdi/wct4xxp/Kbuild b/drivers/dahdi/wct4xxp/Kbuild
+index cf01ccf..eeeb2f6 100644
+--- a/drivers/dahdi/wct4xxp/Kbuild
++++ b/drivers/dahdi/wct4xxp/Kbuild
+@@ -2,16 +2,16 @@ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCT4XXP) += wct4xxp.o
+ 
+ FIRM_DIR	:= ../firmware
+ 
+-EXTRA_CFLAGS += -I$(src)/.. -I$(src)/../oct612x/ $(shell $(src)/../oct612x/octasic-helper cflags $(src)/../oct612x) -Wno-undef
++ccflags-y += -I$(src)/.. -I$(src)/../oct612x/ $(shell $(src)/../oct612x/octasic-helper cflags $(src)/../oct612x) -Wno-undef
+ 
+ # The OCT612X source files are from a vendor drop and we do not want to edit
+ # them to make this warning go away. Therefore, turn off the
+ # unused-but-set-variable warning for this driver.
+ 
+-EXTRA_CFLAGS += $(call cc-option, -Wno-unused-but-set-variable)
++ccflags-y += $(call cc-option, -Wno-unused-but-set-variable)
+ 
+ ifeq ($(HOTPLUG_FIRMWARE),yes)
+-  EXTRA_CFLAGS+=-DHOTPLUG_FIRMWARE
++  ccflags-y+=-DHOTPLUG_FIRMWARE
+ endif
+ 
+ wct4xxp-objs := base.o vpm450m.o
+diff --git a/drivers/dahdi/wctc4xxp/Kbuild b/drivers/dahdi/wctc4xxp/Kbuild
+index 9f97498..2f1bfbf 100644
+--- a/drivers/dahdi/wctc4xxp/Kbuild
++++ b/drivers/dahdi/wctc4xxp/Kbuild
+@@ -2,10 +2,10 @@ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTC4XXP) += wctc4xxp.o
+ 
+ FIRM_DIR	:= ../firmware
+ 
+-EXTRA_CFLAGS += -I$(src)/.. -Wno-undef
++ccflags-y += -I$(src)/.. -Wno-undef
+ 
+ ifeq ($(HOTPLUG_FIRMWARE),yes)
+-  EXTRA_CFLAGS+=-DHOTPLUG_FIRMWARE
++  ccflags-y+=-DHOTPLUG_FIRMWARE
+ endif
+ 
+ wctc4xxp-objs := base.o
+diff --git a/drivers/dahdi/wctdm24xxp/Kbuild b/drivers/dahdi/wctdm24xxp/Kbuild
+index 22cc71a..c9d96b7 100644
+--- a/drivers/dahdi/wctdm24xxp/Kbuild
++++ b/drivers/dahdi/wctdm24xxp/Kbuild
+@@ -1,5 +1,5 @@
+ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTDM24XXP) += wctdm24xxp.o
+ 
+-EXTRA_CFLAGS += -I$(src)/.. -Wno-undef
++ccflags-y += -I$(src)/.. -Wno-undef
+ 
+ wctdm24xxp-objs := base.o xhfc.o
+diff --git a/drivers/dahdi/xpp/Kbuild b/drivers/dahdi/xpp/Kbuild
+index e46a9d7..02d3149 100644
+--- a/drivers/dahdi/xpp/Kbuild
++++ b/drivers/dahdi/xpp/Kbuild
+@@ -1,4 +1,4 @@
+-EXTRA_CFLAGS	=	$(XPP_LOCAL_CFLAGS)	\
++ccflags-y	=	$(XPP_LOCAL_CFLAGS)	\
+ 			-DDEBUG			\
+ 			-DPOLL_DIGITAL_INPUTS	\
+ 			-DDEBUG_PCMTX		\
+@@ -32,7 +32,7 @@ xpd_echo-objs		+= card_echo.o
+ xpp_mmap-objs		+= mmapbus.o mmapdrv.o
+ 
+ ifeq	(y,$(PARPORT_DEBUG))
+-EXTRA_CFLAGS	+= -DDEBUG_SYNC_PARPORT
++ccflags-y	+= -DDEBUG_SYNC_PARPORT
+ obj-m		+= parport_debug.o
+ endif
+ 
+-- 
+2.55.0
+
diff --git a/package/dahdi-linux/0006-kernel.h-Add-wrapper-for-renamed-from_timer-function.patch b/package/dahdi-linux/0006-kernel.h-Add-wrapper-for-renamed-from_timer-function.patch
new file mode 100644
index 0000000000..6651083ee3
--- /dev/null
+++ b/package/dahdi-linux/0006-kernel.h-Add-wrapper-for-renamed-from_timer-function.patch
@@ -0,0 +1,35 @@
+From 13e360f1bc65dba29ba22c46f30ba868bea9805d Mon Sep 17 00:00:00 2001
+From: InterLinked1 <24227567+InterLinked1@users.noreply.github.com>
+Date: Sat, 12 Jul 2025 17:52:40 -0400
+Subject: [PATCH] kernel.h: Add wrapper for renamed from_timer function.
+
+from_timer was renamed to timer_container_of in kernel commit
+41cb08555c4164996d67c78b3bf1c658075b75f1 as part of updates to
+the timer APIs. Add a compatibility wrapper for kernels >= 6.16.0.
+
+Resolves: #95
+
+Upstream: https://github.com/asterisk/dahdi-linux/commit/0d864e9f97ba22e340380ce24a1bd366ca33ebc2
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ include/dahdi/kernel.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/dahdi/kernel.h b/include/dahdi/kernel.h
+index ddd3eb4..01fe113 100644
+--- a/include/dahdi/kernel.h
++++ b/include/dahdi/kernel.h
+@@ -58,6 +58,10 @@
+ 
+ #include <linux/poll.h>
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 16, 0)
++#define from_timer timer_container_of
++#endif
++
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0)
+ #define netif_napi_add netif_napi_add_weight
+ #endif
+-- 
+2.55.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
