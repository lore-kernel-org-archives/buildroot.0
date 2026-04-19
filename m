Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D2DEA7188
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 05:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AB5960FB8;
	Sun, 19 Apr 2026 05:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTeVMwCPzzCW; Sun, 19 Apr 2026 05:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1256960FA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776577622;
	bh=+T5C29nyhWpkTS91jyOUUvbh4sUPVUGtNDfP+YIBbQ0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YcCmkfCbyFMjXRIJFlHOeyyu/REV8WFqncxgqjhYMV2ewU7bOCo8cf++zmxh+UV+S
	 OJt/wPCXUsuXxk6gvXF6FerFpvMnEthuUFKdSXFZYh1NQ9e8Pd4eW5dJLsbdCpVcfZ
	 GzzMTSK5JaT5Kc32sMcxSCzOG+vioxIbZ1pIBI2LzSdVMLBElR3ZR7E57HgPiUEB1I
	 OwkoZ9Di7MZypsQGU6Bz+/yWRZrbz2p7PA8q6rMsmBJhMOFojG5uf/HjNiSGNi0pPo
	 KeN1/9gfWuVRJUcbGGeLKhkjFjs/7bJhVbZ9SPKV/dzZxSFaGs+/JByOuhtfWUrVlT
	 qcTZ6Cjk/KMyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1256960FA7;
	Sun, 19 Apr 2026 05:47:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72639259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 05:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 508E9400BB
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 05:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIL33Uq0VJgc for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 05:46:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com;
 envelope-from=daniel@0x0f.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 870D5400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 870D5400AB
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 870D5400AB
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 05:46:58 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-35d965648a2so1738496a91.0
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 22:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776577617; x=1777182417;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yueeA1RmOsL1HHLpfd/m04ar3dSnT5NaECK4tga8V6M=;
 b=YU0Vi+X0SzTi+MAuYMiHderDZIGreQtRSP97ESKDQrVgZmKx+3ajaJov5jMWDLUzWC
 ChkbPHZlCTtmjAcC9ZPcgRRmRqF+RE2rovYs2qPMOxINaM5eG8xRaTipwxROMDALEyZh
 V0cKjhg9leIKLP9WKdnA43X0TXChT2jUpihNc0evHWcy9T0fNAFLZ9/wppV20103jRQH
 nj7s4RcOAEsxLce0fcovEbnwx+j+frEFc4pm+ubEm2VckwYbVWMXC2CUepY07BfD4tYu
 hzL3QD3BbrFISlOT3SXtlbtChBke3auCkghiNmHktvjq0mmOS2Lt1yL7tore/T3yGKat
 o65Q==
X-Gm-Message-State: AOJu0YxUHr8kmYrdHpZvuLFpClRXErDr6rL2N1KTzs4d7PDsS4HlI02x
 ag1JNjbPZPCwIGLUnEm+BoMpXAHd/jAasBIyXvXwGhj/Xp74KglL8phu6HCfJBw/NmRJUMN/OUb
 1x7jV
X-Gm-Gg: AeBDieuVHfP5F//0Qb/URuhqqgSu5TzxjAmLwIYFPkaMjix7BGQlBXtiPYBF7fO6hPG
 XtzxtKbnBRmuQVxqbaIVgPltag2ja0T89fohsgiKMdeSJrvHWMlcSmutUDilB/yCj9nU5dZV+yb
 TytIwY3rls/Huma/0bklD4AF2tyaXtYK4jU7Jmj/C2IqF3SAoiUQbaJjRY2AD94Tneky1UkppRo
 /d6wzpLR1HiGcH6Ruk21vtNyasHeu+sJqnRvEWPlMruNaKAuzRGokUkPbJTXRRWvEV8AU8u9Ip1
 HGsRNj2y4lOlwgPzCQV/xxMpItelfxEGytxUnA2s/Gc73HeBJbTJ1fr+IkMQGvEs3xNtHQuSbCY
 DrNlxVyQs33VmEpJdUwK3JzBjbHPjex7UzoRPgHxsu97KgL74P21m9zUdbWCR6kYxAJFyG2IKk7
 EWckMvMWKjZQEt5KVxwen5KJ0f7Ah0i4cHUvU6tZihgqdOWZm+sH+G0k9bRzh9A49pVCQaGGsMb
 JsosWQdlRXtdV8dSLtjAZ8+
X-Received: by 2002:a17:90b:3d86:b0:35d:a90d:580e with SMTP id
 98e67ed59e1d1-36140490bedmr9251584a91.23.1776577617228; 
 Sat, 18 Apr 2026 22:46:57 -0700 (PDT)
Received: from kinako.work.home.arpa
 (p1329195-ipxg00a01sizuokaden.shizuoka.ocn.ne.jp. [114.145.5.195])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-3613fa8e5d3sm3223150a91.2.2026.04.18.22.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2026 22:46:55 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: buildroot@buildroot.org
Cc: Daniel Palmer <daniel@thingy.jp>
Date: Sun, 19 Apr 2026 14:46:45 +0900
Message-ID: <20260419054645.2019170-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thingy.jp; s=google; t=1776577617; x=1777182417; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yueeA1RmOsL1HHLpfd/m04ar3dSnT5NaECK4tga8V6M=;
 b=hw3w7SX1IPIUnOgjbC+sjtOUP3JtDQ+w6hAozZLKViYAVDFR/0zrmXriIZsZMOs00y
 edxDOLDuYLaAcTrtSKKVboIETttAoRv2LpR7IOYDCIqflo6noYPacs2Vpwpiv/gbXDFY
 R/5DQRBDXehVeCUA8h8tXuD7gkTg17haFncz8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=thingy.jp
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=thingy.jp header.i=@thingy.jp header.a=rsa-sha256
 header.s=google header.b=hw3w7SX1
Subject: [Buildroot] [RFC PATCH] m68k: Add 68000 nommu support
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

Everyone thinks they like ARM but secretly they want to run
Linux on their Megadrive[0].

Building a working toolchain/userland for nommu m68k is a bit
difficult because of the bitrotten tools all over the place and
one big issue is GCC generates code that uses unaligned
accesses that will cause an exception on 68000 machines if you
aren't careful.

Buildroot can easily create a working toolchain and userland
for nommu m68k so why not?

0 - This isn't a joke, I'm working on this. I have u-boot working
    on the Megadrive, Linux is already working on a bunch of 68000
    machines and I just need to get everything a little bit smaller
    to get into 4MB of RAM.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 arch/Config.in.m68k | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index 235cafacf5b7..74a197934ff1 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -23,6 +23,11 @@ choice
 	help
 	  Specific CPU variant to use
 
+config BR2_m68k_68000
+	bool "68000"
+	select BR2_m68k_m68k
+	select BR2_SOFT_FLOAT
+
 config BR2_m68k_68030
 	bool "68030"
 	select BR2_m68k_m68k
@@ -41,6 +46,7 @@ config BR2_m68k_cf5208
 endchoice
 
 config BR2_GCC_TARGET_CPU
+	default "68000"		if BR2_m68k_68000
 	default "68030"		if BR2_m68k_68030
 	default "68040"		if BR2_m68k_68040
 	default "5208"		if BR2_m68k_cf5208
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
