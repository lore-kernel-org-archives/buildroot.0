Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FE7C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 08:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0F10400E4;
	Thu, 25 Jul 2024 08:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atUBDbfpyi2n; Thu, 25 Jul 2024 08:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 845784025C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 845784025C;
	Thu, 25 Jul 2024 08:20:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E9D21BF425
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 08:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E08C60A56
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 08:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rympVYiz7Lqv for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 08:20:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E27A560A52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E27A560A52
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E27A560A52
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 08:20:14 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52fcdc2f1b6so115794e87.3
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 01:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721895612; x=1722500412;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0SlJF8ME6AQ/n4L31V1TVqEzs09ESGeDruDqcaSqp5w=;
 b=eHdzvN/1b6uS/pTm+0Ur9NTQpjvtdaJqR9EFkywiXF1sZZpxIRDbp1uCNba9YFQpDL
 ARrEjgxBWHoMaK6qAKZPN1EHA4/bFweCLuy9dRyckU9XHHvt9e/NoEqG+Xbm1eEK11yO
 Ie57RSCCCbJaMiJQM+7d8ytHPuRL+9tfUc0z5hCuyKVXF3cF9WRbhKN330E5j16ncW2E
 2QgUmI+tAfDPFc6KiRoa2+tU36gyZzhmlVOc7zmsgKOvHto9W857NeTUMqQKsrs8DW+6
 c2xZEZE/NuYyw5qQIe0oD7yib1ylpnRP5tu8FVRHbGMOE6T8DSM4RGb7TgQLfLxBBNN+
 BIUg==
X-Gm-Message-State: AOJu0YxGS4PToxzOWXyeRHmOeWZmn5lEqPDVrc0D/5vEdJO7ARqOG1k+
 RYXb7nqbRUXVen0FJ6Jy/h03orymdLfICfK9TXR7HlDpZ+thyjtDJh/byg==
X-Google-Smtp-Source: AGHT+IEWZofcGatQ1hIt3idCL51hXBAjCu8z9qqMgNMlQy010JoAH7RCzTmCUFgVFCvzNXfzX9WpJg==
X-Received: by 2002:a05:6512:3c99:b0:52c:def2:d8af with SMTP id
 2adb3069b0e04-52fd52ba74cmr696709e87.4.1721895611860; 
 Thu, 25 Jul 2024 01:20:11 -0700 (PDT)
Received: from localhost.localdomain
 ([2a00:1370:817a:3109:b981:f775:6407:7ff6])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5bc403asm139097e87.37.2024.07.25.01.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 01:20:11 -0700 (PDT)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 11:22:29 +0300
Message-ID: <20240725082229.614564-1-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721895612; x=1722500412; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0SlJF8ME6AQ/n4L31V1TVqEzs09ESGeDruDqcaSqp5w=;
 b=hLgG6P7whbUOGwVfKjU9wQOgNlowgBOgH7nV+zu6O1YouquS6iO681eCA9bXFRtp3o
 lOFQopVJopRUeCFZGX+dtMgIDyXF8xeYvoTDZYCrpbAMfgpBowRP/9rEu+pPVfC2mcKh
 VtWzhYsDaUCQYIrJVuFPWqzUQ1P9I5+xzaH5X7Xh2KtRLI6QJ6FrP7VoUc0L9fdA1Bua
 BvQwmMUgSni63SsqH75l/jnalDGAhC3k3kOxzJB09f2mb9/MUt/dC2tPEHgZRrk7WVUG
 O7P1CcvCmEBv4y/HaT9DX8oTwyRN2axY3bMeB81UeIqMNmRdgzq5sGJVczaL5lFOEJXn
 P9IQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hLgG6P7w
Subject: [Buildroot] [PATCH v2] package/uclibc-ng-test: Fix musl build
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
Cc: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Musl doesn't provide sys/asm.h header
so we should add some defines inside
mips-specific header file to avoid build errors

Fixes:
 http://autobuild.buildroot.net/results/af7a1d00930485f87f77762b34cae01873a8cd41/

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
---
Musl doesn't provide sys/asm.h header.
I think no one has enabled this test before for mips musl builds
so perhaps this error has only appeared now
---
 .../0001-Fix-error-absent-sys-asm-h.patch     | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch

diff --git a/package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch b/package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch
new file mode 100644
index 0000000000..39b47fa82c
--- /dev/null
+++ b/package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch
@@ -0,0 +1,58 @@
+From 38d678ad62544e62f9f761f87100d45fac6c703c Mon Sep 17 00:00:00 2001
+From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+Date: Thu, 25 Jul 2024 09:15:11 +0300
+Subject: [PATCH] Fix errors due to absent sys/asm.h in mips64 musl build
+
+Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+---
+ test/tls/tls-macros-mips.h | 33 +++++++++++++++++++++++++++++++++
+ 1 file changed, 33 insertions(+)
+
+diff --git a/test/tls/tls-macros-mips.h b/test/tls/tls-macros-mips.h
+index eed0938..bd4c5c4 100644
+--- a/test/tls/tls-macros-mips.h
++++ b/test/tls/tls-macros-mips.h
+@@ -1,7 +1,40 @@
+ /* Macros to support TLS testing in times of missing compiler support.  */
+ 
+ #include <sys/cdefs.h>
++#if defined(__has_include) && __has_include(<sys/asm.h>)
+ #include <sys/asm.h>
++#else
++
++#define __STRING(x) #x
++
++#if ((_MIPS_SIM == _MIPS_SIM_ABI32 || _MIPS_SIM == _ABI32) && _MIPS_SZPTR == 32)
++#define PTR_ADDIU	addiu
++#define PTR_L		lw
++#endif
++
++#if _MIPS_SIM == _MIPS_SIM_NABI32 || _MIPS_SIM == _NABI32
++
++#if !defined __mips_isa_rev || __mips_isa_rev < 6
++#define PTR_ADDU	add
++#define PTR_ADDIU	addi
++#else
++#define PTR_ADDU        addu
++#define PTR_ADDIU       addiu
++#endif
++
++#define PTR_L		lw
++#endif
++
++#if ((_MIPS_SIM == _MIPS_SIM_ABI32 || _MIPS_SIM == _ABI32) && _MIPS_SZPTR == 64) \
++    || _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM ==  _ABIN32
++
++#define PTR_ADDU	daddu
++#define PTR_ADDIU	daddiu
++#define PTR_L		ld
++
++#endif
++
++#endif
+ 
+ #define __STRING2(X) __STRING(X)
+ #define ADDU __STRING2(PTR_ADDU)
+-- 
+2.45.2
+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
