Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE42C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 08:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0645400E4;
	Thu, 25 Jul 2024 08:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5DXm5uzxN-O; Thu, 25 Jul 2024 08:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BAB340DF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BAB340DF3;
	Thu, 25 Jul 2024 08:24:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F3BD1BF425
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 08:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B18640119
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 08:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZSKImBb4Yme for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 08:24:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0AB240113
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0AB240113
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0AB240113
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 08:24:43 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52ef9714673so86660e87.0
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 01:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721895881; x=1722500681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OpsNWszCE9/obPWNd7ElapaBRgit0P5vEBNq79RT3mE=;
 b=pR8ljMJRJgWuhTRQdlbn3GQi/kHGAKLYMnwBHTYTxUPoMALHSm6oHWvfIutQcAelvo
 FCNjsS5VLJxtgD7W4szjs71vX4Sc1u04e/9oaloCLzpHXmZE8mdjJYtk1w0GVy1YfsFw
 cjaq8A1Vbd0UgwL2vSw60FhZKYOpP5edOcIakSo+EsjY4jndDdxIuH6KYe9g7Go1Nls1
 qGyqBMUwiL/eczvvkbU3AhkMP28AGP9OxspxZdBy++uLG5HuJ7UdU5CM4tNDKWDn1Xri
 leItO3Uv8g/2ZjusTexPjFky35yfr/JslQPItoNiS3J4Ek+OvWlsrmd2KSTJoyI1pIsw
 xssw==
X-Gm-Message-State: AOJu0YwuVHjvIZWSU46VJPpDdlpk3Uz1cDkdqHJwcjH3aZx3bonB6cu8
 X9bAjrh8OKbxG2Wnq0QceflTX8+tAuoR6ikVSgooHo1Q3g6LCk+XAftlgA==
X-Google-Smtp-Source: AGHT+IHvI9La//RJBDM+Bxyd8kfEUczAKBC5CxPU9ElsQY5GiWvjdTWuCNYEmsnywTPNSSmlrpE++A==
X-Received: by 2002:a05:6512:1192:b0:52f:76:c258 with SMTP id
 2adb3069b0e04-52fd5340daamr646821e87.8.1721895881019; 
 Thu, 25 Jul 2024 01:24:41 -0700 (PDT)
Received: from localhost.localdomain
 ([2a00:1370:817a:3109:b981:f775:6407:7ff6])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c1a601sm140612e87.228.2024.07.25.01.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 01:24:40 -0700 (PDT)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 11:27:03 +0300
Message-ID: <20240725082703.615109-1-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721895881; x=1722500681; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OpsNWszCE9/obPWNd7ElapaBRgit0P5vEBNq79RT3mE=;
 b=MBrCJ4m9Q0AhAtWN4m84+oxlYEAU5dw2qTLpRbGlfT/DNTS0jupzZuYUl+QeLgltAC
 Wa05sh7P1PtzAE0c4b5xfwK8dT+qssBWt4AScLO52FNPAEN+pFjmRXHcTtsmYEgZ7zTM
 +0p5+sfJp6B6EqAOMCMiASLh7dfCtf0K0KnMJI+YHej2Rzw+saOc/aQKTXQffxZeFIx5
 I1jrpCncMSl6FdwpUj+chg6KOn15fVHisM3EOJBCpWOrc01LIPftDIq65/pXV530iui9
 7iTRgq34UMezeJ6tmNXLWiJivGR6Am+Z2gHh3pjnUbmM+iDx+7HB/GSar1GjMGG6e82b
 mO9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MBrCJ4m9
Subject: [Buildroot] [PATCH v3 RESEND] package/uclibc-ng-test: Fix musl build
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
 .../0001-Fix-error-absent-sys-asm-h.patch     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch

diff --git a/package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch b/package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch
new file mode 100644
index 0000000000..0c396d4e38
--- /dev/null
+++ b/package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch
@@ -0,0 +1,61 @@
+From a99d5bdb51bdab92a303c508b2b938ee0789d614 Mon Sep 17 00:00:00 2001
+From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+Date: Thu, 25 Jul 2024 09:15:11 +0300
+Subject: [PATCH] Fix errors due to absent sys/asm.h in mips64 musl build
+
+Upstream:
+ https://patchwork.ozlabs.org/project/uclibc-ng/patch/20240725081519.611076-1-dm.chestnykh@gmail.com/
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
