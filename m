Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2935EC3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 06:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF75380D8A;
	Thu, 25 Jul 2024 06:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PyGZ2AjRp-i; Thu, 25 Jul 2024 06:41:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5342818C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5342818C9;
	Thu, 25 Jul 2024 06:41:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 485781BF470
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 06:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3796B40431
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 06:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1xGTzwEVtBu for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 06:41:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D578F40163
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D578F40163
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D578F40163
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 06:41:42 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52f008b40d7so106972e87.2
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 23:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721889700; x=1722494500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K7Lu9J6wB6jEuvslcIL3MFXGaXpESVuHYFL9KmbxK9c=;
 b=YPhXkFu8FUBOCnFgduxChgPTzh4xUFk7Z3NIs0+JFmFpt43f00xfY5b+3AlA6egtsF
 C3ZwKgtwlAB9zU96FUz2EeKEwVIXNzR8fwdFWKSIk4ZmyACWzi3t450uRHErSkWXwPcz
 n4hWDg8TlSnRKN/XgYm+ZGffuvItdooLr8p5f8TXdEb+dmPn+KT9+cc8MhJmM2hh6CMP
 xIUqkEmI9bFKRmw7fNopC/iGKaCGE+95ycLQvz+z5/AURGN6wx3uMMd9ht/USxEHN7Aq
 eso6FIri+eQyXCV2K364cNJHXlBr7Bz/cQUcEvuWSjafW5RebutC6TCOimPFNxkmjGnC
 qhpA==
X-Gm-Message-State: AOJu0Yy7UQxxanzR9ysirnoXYwgHuUGdIA41gjO7MJ7p4E0GiBKvAU+B
 rXH/zNFv2IrsGeLD9ZKAXlPKIFTr8/GD2ioGjrSfV7JjYcxdarScf58IOg==
X-Google-Smtp-Source: AGHT+IEDNc9JRjKrqchLoirb8cGaL8iOxSwtarq6Pmvo/TQHG9831WqscB1EPf+FxTTJR1E86zuhEA==
X-Received: by 2002:a05:6512:3c99:b0:52c:def2:d8af with SMTP id
 2adb3069b0e04-52fd52ba74cmr584270e87.4.1721889699348; 
 Wed, 24 Jul 2024 23:41:39 -0700 (PDT)
Received: from localhost.localdomain
 ([2a00:1370:817a:5437:7bfc:c698:2ba8:90c5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5b2d52asm115971e87.0.2024.07.24.23.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 23:41:38 -0700 (PDT)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 09:44:02 +0300
Message-ID: <20240725064402.606108-1-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721889700; x=1722494500; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K7Lu9J6wB6jEuvslcIL3MFXGaXpESVuHYFL9KmbxK9c=;
 b=ZyIYOsGJcv5QoiqZfou6NlEWjOmh8XQTpmtGLBP8eIB70Gw0OzOx0Jlf6/DUfB3uGv
 T4/N2sRs/naZsfPUWceKmRAesZ8JvqMuTXNIE2K7BNE6KyfFtycO6qTObZs48p2dWD3K
 Odz77zOytuxC2tUuFlODr7cFQFL28b6t/yG7WYBDxX8fI4menqYcV8gK4jwS/vTOG1hT
 yRTR3dmmcLpR29XXGgbPuErXB/KLEsdu2QIj53Kg8FwCIai4KM0SPB3jYMFVu/F4HKie
 L6s9w27kl2La/iGqJkAMstEtkkDJ2AGbePKSgOtXsR3BlpWqugs8b8ljjpQlfRbDtF4e
 yRUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZyIYOsGJ
Subject: [Buildroot] [PATCH] package/uclibc-ng-test: Fix musl build
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

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
---
 .../0001-Fix-error-absent-sys-asm-h.patch     | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch

diff --git a/package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch b/package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch
new file mode 100644
index 0000000000..ec88102e56
--- /dev/null
+++ b/package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch
@@ -0,0 +1,57 @@
+From 556292ce354d33a94c54e7555dd999a9395c0a2d Mon Sep 17 00:00:00 2001
+From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+Date: Thu, 25 Jul 2024 09:15:11 +0300
+Subject: [PATCH] Fix errors due to absent sys/asm.h in mips64 musl build
+
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
