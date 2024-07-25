Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2C2C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 08:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2508140E79;
	Thu, 25 Jul 2024 08:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTyZkjJD8OPD; Thu, 25 Jul 2024 08:23:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF2F840DF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF2F840DF3;
	Thu, 25 Jul 2024 08:23:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 146D81BF425
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 08:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FDED40750
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 08:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6yHvwW52ZFp for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 08:23:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93551406D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93551406D6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93551406D6
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 08:23:06 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52fd0904243so35232e87.3
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 01:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721895784; x=1722500584;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C+NbnfJNYeXOIWmXOROudGvd6UM3mXm+kAxN7kJC8UU=;
 b=WuTCa7VZAC6mRX0yO6jvj8DBs82EhycO+CNdGkkXva24eN5R1IImVTPPttigWEdf4s
 atYo6RMVyz3QiYSQPeDBroraybUbxBs9JI7AAUINOnqaj6Z+YCvaB10pasXTdmjLtzWI
 TzuEHEPutYuXuQ0kE2mk+K2FHb5tRI0O7e4KOx4WSu03ul5PqySSi98uJkEZErBarzo1
 nWLOcrgrG4WFNgx9HJXF5dDny4xhfRPeR3LSGqxhovtSnwHVyxZhkiDM1Wug1mGJh7+y
 I5jUpQDufGSk555f+n202beRdrNol6y/e23bzt7Ck3imcT4XWOwcNilHbgXbQZ+C351q
 gcBw==
X-Gm-Message-State: AOJu0YxsXYj/4prnHfZT3HorISPYfsGn/f8TxLQjfvNip1zAJsIKFbd5
 S/+5rcW2IEmpjbnnVQzf/PebD59yV3daLYTM3rdQOvQaiP//MgAxfwn/xw==
X-Google-Smtp-Source: AGHT+IEVxNJa4iH1lYkJrV1phO3ix3YrBR8I+oV1z+kLzfQbfjDQBJJBkZAvTWsHffYZANoT3bkc6A==
X-Received: by 2002:a05:6512:3e07:b0:52c:ce28:82bf with SMTP id
 2adb3069b0e04-52fd52bafcfmr741172e87.5.1721895783779; 
 Thu, 25 Jul 2024 01:23:03 -0700 (PDT)
Received: from localhost.localdomain
 ([2a00:1370:817a:3109:b981:f775:6407:7ff6])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5bc3e98sm143471e87.20.2024.07.25.01.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 01:23:03 -0700 (PDT)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 11:25:21 +0300
Message-ID: <20240725082521.614921-1-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721895784; x=1722500584; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C+NbnfJNYeXOIWmXOROudGvd6UM3mXm+kAxN7kJC8UU=;
 b=QBXVaPU+tK4p1JHCb2oeDDlpvp0dbgOugvd9DyM2d1Ki+qCpT40VBJ/7zedSfLGHIO
 N6LuaVWdVyclPt3rNoJqtoL+Wu20fXWCEPZiLOHc7Ss/colE/2v0aXvOkl1czF/Xc/4N
 kB4QVFZefR9JStT8tK3OVH6JLBNqWbK0ZWQwfAli83j6qz81mnd42NvhuSFDwaa37ZiL
 NP0DMY3Ls85P2x0qQQ2nH3U4Ik0Hg06JGP5KtxPhwEsSGj9I4y0FGNQ0dMYLT5eMVwGd
 RQqlxFKm19UWyQp1qfgasJLBMF9haTuR4hhweQxEatWKGIvHEaPx3SSOPqgvnlu/s4vB
 EMtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QBXVaPU+
Subject: [Buildroot] [PATCH v3] package/uclibc-ng-test: Fix musl build
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
