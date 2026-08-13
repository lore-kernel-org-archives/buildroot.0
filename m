Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB685C5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 21:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50AEC8154D;
	Thu, 13 Aug 2026 21:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e03rq_QefSuQ; Thu, 13 Aug 2026 21:33:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 314C281544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786656836;
	bh=chyIhIvDRRL5jiFiYlnpBDcg9rOSkGx9V9wbqE7VA+s=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sfaS0oE24UeaCzhurEolstvRsCzMbeZLt7SAl3dGuUVkpFJWoiVtTpzOuXCQZdfVC
	 fi+HR4PI5Qh87TKTBgrRuQauL/Hzn2lOcpOx5MAf9xIZcwZ2u/tQIy/kl86nitrFXo
	 qOwjUVuj/CFeTs9itCSNCSClD6rkuHJQm22mJ94i6pIIVdkrr5Lw3G6sYPi/sFL9lt
	 xj8WBCbhJ97UShBdgwUc+mBLhrUU8ScH5f52zp4tYI3dOBktHjnR2MKhj40qnhuwzJ
	 4kKqsEYv5jba/Ho0QnXGsBYmP3tweznwvyg1ShpE9yYSdzT7rfEghqtqnzCUdns97L
	 20kDcHANaM5eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 314C281544;
	Thu, 13 Aug 2026 21:33:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7F9833B
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 21:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD99A409F8
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 21:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfdAMYTB52k6 for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 21:33:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ECCF2407C2
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECCF2407C2
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Cui8U6QM
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECCF2407C2
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 21:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786656829;
 bh=0YigfzWUj8aS2X0IGViBCcm6iulygfajRuYxbqD7G+Y=;
 h=From:To:Cc:Subject:Date:From;
 b=Cui8U6QM2N9FxmEWMwNWxH2frXBo4zeZKYuDooOqb3mNBS17dbPp0PC6gX9OE0gbG
 jgxiMvW1d5/T8wWHqAFfWp0M4KFcSZdTujSxRRW2rxvXv+tbt6U/TqGOgTW7zdTcFD
 FehGr5peKjIpfvgwSU+4Zkpw9zNwmyXKw1IE/ZOeBp62ecDdC6woEYXM2rtfdTDot8
 40UNsgUNvJVs5dLEQJtOZ5AYQU2S1lKGD4EJhkNwbK1nMQpT01CRxuWdKrgvDGhZaf
 Jt6J7VmDNZvGNxj+k8jL/oLUYJ6VhgQPaJxkSfYBEJsTiI8iJt0vgCt8O8lPusa1dA
 36eV9pj1+m2FQ==
Received: from fli4l.lan.fli4l (p54a1bf47.dip0.t-ipconnect.de [84.161.191.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3C501A4C0CD1;
 Thu, 13 Aug 2026 23:33:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45580)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wud3c-000000002cY-1M3x;
 Thu, 13 Aug 2026 21:33:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Thu, 13 Aug 2026 23:33:48 +0200
Message-ID: <20260813213348.3653337-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Fix build with ARM
 soft-float
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 4ab91a29d8931105d3ff8f6263c59a5438ada1a1 bumped the
package to version 26.1.3 which first included upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/94a6274275e6a16255357579898b366f858e270c

causing a build error with this defconfig

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_XORG7=y

Add a patch to disable some assembler intructions which are not
available with a toolchain configure for soft-float.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/4d124f4d0d8364b2852650d55be759fb564c1e60

 ...c-do-not-use-arm-fpu-instructions-if.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/mesa3d/0004-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch

diff --git a/package/mesa3d/0004-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch b/package/mesa3d/0004-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
new file mode 100644
index 0000000000..96d1902061
--- /dev/null
+++ b/package/mesa3d/0004-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
@@ -0,0 +1,55 @@
+From 345b14a820a557b72f218637cb37ef39947b1f50 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 1 Jul 2026 22:48:15 +0200
+Subject: [PATCH] src/util/u_math.c: do not use arm fpu instructions if fpu is
+ not available
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/42682>
+
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/42682
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/util/u_math.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/util/u_math.c b/src/util/u_math.c
+index 722eac7f733..5683766a417 100644
+--- a/src/util/u_math.c
++++ b/src/util/u_math.c
+@@ -87,6 +87,7 @@ util_fpstate_get(void)
+    }
+ #endif
+ #if DETECT_ARCH_ARM
++#if !defined(__SOFTFP__)
+    if (util_get_cpu_caps()->has_neon) {
+ #ifdef HAVE___BUILTIN_ARM_GET_FPSCR
+       fpstate = __builtin_arm_get_fpscr();
+@@ -94,6 +95,7 @@ util_fpstate_get(void)
+       __asm__ volatile("vmrs %0, fpscr" : "=r"(fpstate));
+ #endif
+    }
++#endif
+ #elif DETECT_ARCH_AARCH64
+    {
+ #ifdef HAVE___BUILTIN_AARCH64_GET_FPCR
+@@ -154,6 +156,7 @@ util_fpstate_set(unsigned fpstate)
+    }
+ #endif
+ #if DETECT_ARCH_ARM
++#if !defined(__SOFTFP__)
+    if (util_get_cpu_caps()->has_neon) {
+ #ifdef HAVE___BUILTIN_ARM_SET_FPSCR
+       __builtin_arm_set_fpscr(fpstate);
+@@ -161,6 +164,7 @@ util_fpstate_set(unsigned fpstate)
+       __asm__ volatile("vmsr fpscr, %0" :: "r"(fpstate));
+ #endif
+    }
++#endif
+ #elif DETECT_ARCH_AARCH64
+    {
+ #ifdef HAVE___BUILTIN_AARCH64_SET_FPCR
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
