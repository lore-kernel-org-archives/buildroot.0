Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516A2C61CE2
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 06:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB6AE40660;
	Mon, 24 Aug 2026 06:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vy8iDADrh8vL; Mon, 24 Aug 2026 06:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787553534;
	bh=gPkAUMAAJLsHbF0CtDob+5eHATSD4cfNKCUBvWBspnA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k0ypNGiHG7YVg6xdiRu/mIr6ZQhutlqVCe86BXBzmLIUrHmpflExWLAYSJyWqeBRI
	 3fSOfLdp1dWU7ZMHmiKu5lAC7fdEfgg7ynOg1sl05hyCygI85Q0UjYied722ksbeqo
	 BxH7mNf1QeqErZWvoHVqBGPv9SAOQi1hK1V/yIJT2HqfSODMEnWEvQg3CXyyLDqJQO
	 PXxzSV4WDZH7VuAxVschZyn8MmxVCqSdcpR+hbYf72Aqvt4bHZHGK6ymJnPeTnB8b0
	 2tTKL2LzIkXFrYtRR/Ur7rkDVFgD5QQhAoXENfFtn7UeqXKGx1t5lVcukO+G6Lqkxn
	 1VGDSGLVHwfMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 182354065C;
	Mon, 24 Aug 2026 06:38:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FD9A386
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EAF460619
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_H4PXeZQt3Q for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 06:38:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=nfY/moNf
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BB006060B
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:51 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c1671ec8692so437796566b.0
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 23:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1787553529; x=1788158329;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9tCBuSkmgEJJEyJrT40TdeRFg8jqySBoUVvT6pTVmIA=;
 b=nfY/moNf8e2vsSihWDXqoR8t7CLiUeMg0qWIqC1DNdIY7a/vlxMskUd9z4TCTNJ+VF
 xxIiB4PZUWMfXw7eBcIOLaXzseMETKYjfVbdl7dkyicOu6lZNKhiZmhTNO3AFyoeDhJ8
 /P9/C/jKN2yIywobiM+5VDa/LwUXFTBlF8bpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787553529; x=1788158329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9tCBuSkmgEJJEyJrT40TdeRFg8jqySBoUVvT6pTVmIA=;
 b=ealCwCXDrQV36BhL1qKj+MMrebpPlwLUqo+NBmNl2794Z5ys301+CELDIBYN2Pzzb9
 N5xgYpBgQvTkrxtuI1naLKh8mZCcTRuAOkCaltIiVY/Mh3VQrp1BT+70eaw8R1Rinw5q
 J75uUyCjpXoffr/K7UgQV35GDn+ckMKwkucHlbukrD0rABfhBhst9XvB2d5Psnf1xZZ+
 75C2K0tIRTWwHLHnHEm197VZrjCcUZDCf/2/OlZ2BVZpDV9aSkH1UgvmCIZSL/lueaJq
 5FG7Y3MuGTkNW5xxIZ7t0w3EUGf4LI2TI7vnOqBaSVoFF7XzwP9PqYl/Z5BKFb1/wj1v
 WuUQ==
X-Gm-Message-State: AFuF++lbpTyQPjrRfUi+/RybCqimV/XS5Z5dZQAcW10CGvX5VVc9iQRH
 v7bGPUXeVRhVo5pV0h230QMvgZYgRVMYeZxCMotZUVa8QaQcuGRVALCnC47zg2cDeLbB/HqaQyI
 sor9EA1s=
X-Gm-Gg: AR+sD12ZPJeGOAYPnbxj+iEitKyr8xKdkzeonm/tnpfg/o2twXYnSgK6JrmasaHmzZD
 sp4dPkfxcnicQdoAKR6nUfM2HEcZAVrAugFaEzUoRhFO2LS8Sa8Kh+vsGNOvbdpTGDEMs8SiW0+
 nHxVGG9TuKdg0LUNLbRcOynrdZbpJvL25qa0ot+X/nHQb0vOoUwnLyQfja+9+gqI9XUty+S64dt
 xifs3eG7Rg/zeBp72VyhNdVQqemqmjLEuoIOOppHw0kapVwomfQL7h3lyD9HvCXS/Jj26ZQuOOO
 izBVblR8grEmzcGQWQYR6baNJ820fodXeBhHGswR9gri5gUTyaNqUr8jM//oddquXFG+0rpBT6s
 4y2w2/vuKibGZmRFD0SmIG8PlEJwip84atCi6u8lt6euy01+gu8qIcHEQyk1HVhO22ZnJM9SoZO
 KvCt92uGf+wQhSzCA/Q0gfuE06YCuaUH9nuMCoWpd/GECEPKJw0sKIEo4UV1yr/otnmtSXEKNOH
 asR2vBebId+/UgA6t2bcGVUOaGxI+mClgabws+68YBY4mf1j3R2ZolxWDv5mc2DaJ1aywxNxEdF
 5xbnRo4a64L0D9c3UWas+9A+TFd9n2b0R/pAjrZEVvDLWdBhVXgM2YVOzrWz91tVXs8j/LcF+A=
 =
X-Received: by 2002:a17:907:d0c:b0:c20:d90b:2cb1 with SMTP id
 a640c23a62f3a-c249188eadbmr1859410766b.0.1787553529493; 
 Sun, 23 Aug 2026 23:38:49 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249685ef7bsm1226186766b.52.2026.08.23.23.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 23:38:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Fischer <mf@go-sys.de>
Date: Mon, 24 Aug 2026 08:38:38 +0200
Message-ID: <20260824063843.839745-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824063843.839745-1-dario.binacchi@amarulasolutions.com>
References: <20260824063843.839745-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 1/6] package/sdl3: fix build on PowerPC with
 uClibc
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

Testing the SDL3 package by running:

  $ utils/test-pkg -p sdl3 -T bootlin-powerpc-e500mc-uclibc

raised the following error:

  src/cpuinfo/SDL_cpuinfo.c: In function 'SDL_GetAltiVecFeatures':
  src/cpuinfo/SDL_cpuinfo.c:351:37: error: 'PPC_FEATURE_HAS_ALTIVEC' undeclared (first use in this function)
    351 |     altivec = getauxval(AT_HWCAP) & PPC_FEATURE_HAS_ALTIVEC;
        |                                     ^~~~~~~~~~~~~~~~~~~~~~~

Add a patch providing a fallback definition for PPC_FEATURE_HAS_ALTIVEC.

Fixes: 2dd13e328f11 ("package/sdl3: new package")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...001-Fix-build-on-PowerPC-with-uClibc.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/sdl3/0001-Fix-build-on-PowerPC-with-uClibc.patch

diff --git a/package/sdl3/0001-Fix-build-on-PowerPC-with-uClibc.patch b/package/sdl3/0001-Fix-build-on-PowerPC-with-uClibc.patch
new file mode 100644
index 000000000000..17197478682d
--- /dev/null
+++ b/package/sdl3/0001-Fix-build-on-PowerPC-with-uClibc.patch
@@ -0,0 +1,40 @@
+From e9f373ffed24781bc09a1c20d0c58c809a5c7838 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sun, 23 Aug 2026 16:09:24 +0200
+Subject: [PATCH] Fix build on PowerPC with uClibc
+
+PPC_FEATURE_HAS_ALTIVEC is not defined by all C libraries. The following
+error was raised while testing SDL3 in Buildroot with a PowerPC toolchain
+using uClibc-ng:
+
+  src/cpuinfo/SDL_cpuinfo.c: In function 'SDL_GetAltiVecFeatures':
+  src/cpuinfo/SDL_cpuinfo.c:351:37: error: 'PPC_FEATURE_HAS_ALTIVEC' undeclared (first use in this function)
+    351 |     altivec = getauxval(AT_HWCAP) & PPC_FEATURE_HAS_ALTIVEC;
+        |                                     ^~~~~~~~~~~~~~~~~~~~~~~
+
+Provide a fallback definition when it is not defined.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/libsdl-org/SDL/pull/16184
+---
+ src/cpuinfo/SDL_cpuinfo.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/cpuinfo/SDL_cpuinfo.c b/src/cpuinfo/SDL_cpuinfo.c
+index 116c5371c1ed..d58c1503179a 100644
+--- a/src/cpuinfo/SDL_cpuinfo.c
++++ b/src/cpuinfo/SDL_cpuinfo.c
+@@ -80,6 +80,10 @@
+ #include <sys/auxv.h>
+ #endif
+ 
++#ifndef PPC_FEATURE_HAS_ALTIVEC
++#define PPC_FEATURE_HAS_ALTIVEC 0x10000000
++#endif
++
+ #ifdef SDL_PLATFORM_RISCOS
+ #include <kernel.h>
+ #include <swis.h>
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
