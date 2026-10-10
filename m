Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E10CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C7FE60634;
	Sat, 10 Oct 2026 20:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AzzQ19AcErmA; Sat, 10 Oct 2026 20:15:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2A06A60662
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663343;
	b=JUPaOXksO2/Xy6hugqzXPc3Ruy+fxjlrkY3S5HM1KiYBI/EPRJHckVBMwpTzokQak42t
	 o8XcIXvjkzEZLPJ2e/VSBi/3fsNPZnx+lCuyhZTqT5S5QwABlm2dN92dOiYNWnvVX0uZ3
	 pu3F2js1gnTzEcX1nlUjOzNZzlMXH8IkfYotrOlEptDSE0M/VPTSKKeGrb4X+52rA5e24
	 +M+he1K107wFPOw3hr/Jg0N3NkLIQKpT8a6ePBhwBpTQyD/e+akBl2SbL/wu0v2IJM3Hf
	 lYCOfQXoZ2dEJRU8N5jIGExV00hwo5HeqIG1F/erp2fCkEs5CU2XtwM3flKqNwKo8xg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663343;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yBv6vQfP8bXWi79sHG4bCfpV9JORrwd7N1S6z4/X0Bc=;
	b=AWc9JqRLRQLVHwp1/scj97OQeeSSBhahCk+gfk8lBilgJ/eAgKHvBfvjkzqmnpSgOoDX
	 y6a9/N0wEt7EJZsrrkGtrJaQ9zpKYanmwdD/WW/VAkiGs5nAHqHmoq7wHbmIAhB4/K73Q
	 RKzszqDxHV1p4A2a4FnjKf5gqSQ0JIP9H0s7HEDVqyHvd4QpS0lPZit5jhjIj83TSMEWD
	 ja5tduFGM5Nmrz4XwKYuRUuCABff1b7YplDDb/SnRUuwKRXq2LRzhLdOvRBVF5XyI8W6e
	 /uM308zpKoUS+biOpCoNdULEWTvmvlz1groxUKQoLHBSRiC0aXBoTz8tx5cyvZWV6cg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663343;
	bh=yBv6vQfP8bXWi79sHG4bCfpV9JORrwd7N1S6z4/X0Bc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=DcYCwq5h5SSz+XNGsm8eca9WcplytYJbgMG3R3oYhG6P0LbM3vQiv06QX8/l3b9k3
	 2qI9mZ11qv0RK5MxSPqAKNvENaRCQ8236QZWUfn5eFlS2MyJdD+h65ede1/oYUXPzi
	 pY6/osRxDlhWIyW0Hd/ci2yLsFRgnaQ16BejZfuiJQGDPXJLtXdnjHSdQzrYjelT+T
	 fr5GUopgHtpTnlv9aEYfGiGigyzyCF6DecSNxMzEOJh1z0YK29I2EAL+JVX8GC59A/
	 8/Odyi+tlOxw1ZzOzbAbrAdcQVDz2dtWwcKNjy4lQIz2TPYZojGZXX4eCOLiL9NDkt
	 orQXu2CSuEK7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A06A60662;
	Sat, 10 Oct 2026 20:15:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D39BD9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA28381092
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHQBZPqu-86W for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:15:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 11B4A8108D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663339;
 b=dK0l6e10nXxPdvY4xi1kqlRQcNgQGvcLBdJmEVBgrPU3pF4rL3zQrl6bG0W0MAPUNHHC
 1vNpEfwTdmHEguGrS5y2KRM3imVEWmw4BzXX2z9hl/mrQgoNJ5X1PaWskpkyDIwRUf/IB
 aMWUmKHq5O2gt638w1cbe5QaL+ARhaOr0MZM0/kk+Uad1NE0ewZM1aNbxA+X32OHXmeJ3
 p6miYi3riQR/4ToydRkMJPpfEeaRZOmeYXAQS607dRyczmNvrYYsRbxGPffwgJyriSaJn
 vHJ+SE1n2KpfxkHBMacRD1hRgMqwk1whdsswGUjSyTrqdSA/IFVwsflXk6RC+pVDpOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663339;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=94WwZsnT5ABWUctJG7FuW8+NmhBbtX1pv48H08CLCDQ=;
 b=d5/QiS2KY5C2tfNCUMojuytY+EprmrO5JBPOQI+r69JXIb/mjGqf8klmngoCu/fcNm4U
 qdiRK4tSoaLrSNRecVjzp0Loo2WNIc6DGLvqbNATXwsvnJKMkJIkzPEMweaPsldT0QPXf
 eP0KVDaRxGkNxnP+jp9DOeF4tIGjT5wWDlSBCj9YpcbLS/YZimwNsIFMK8XBH3qMtRXPN
 iGfkc+/nNP4+knqQ3a+7kkCqBoUWZ/03+1IkAug8DroVooqmDgGr8Ew+K7UPZccO8XqL3
 X4lpEbFN9M3evBJbKWYeZkKmfhWaDpk46ictdyz9BWMdcTOy7FVpeUr6Uw459pUxdrQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VKpaL+sF; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11B4A8108D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:15:37 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so551118f8f.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 13:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791663335; x=1792268135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=94WwZsnT5ABWUctJG7FuW8+NmhBbtX1pv48H08CLCDQ=;
 b=WXhzSZGgpCVQr/j4yHAOq3Cpapo6gXSQ1BKekdUzF4zZDpUHhNiH9K66//RFvLaoCy
 E89r3ZJzyrFILZhQBKUNa4ti6oGURBOmNHZZyr4XboZzPf8uOsbOxgT7trj4hzMEYxrq
 yYzwBeGP3T4wrMu+LSOR9OEoEqshkG6jQ8n2RzXtJsyHjZNoKvqfS7tD0A8D/62xoufv
 bgI/GHUQwd5wLkr7Tlmc+if/zkazbwSNsw57+pDSqJ4+eYSa8S/L8QMLI2PHJPW1+UDu
 ckzfn34ZL4oA1P+32VMc8rdJKdQdHf5q2MBgbDNWbzSbg4yWuSQ0KhGb9mrYgFECouY5
 GS9A==
X-Gm-Message-State: AFq9FYIC5MjC5CG+H8CvSaVOI7CubiK48XgZdx5s/SfFhpAkSazdjMro
 82pExvj9Fv3iYI5q5nvxWaMqAzJKRYFgYDf3KS3vp6YgiUjQip/Lus5qdrqAKRaQv+68N24W2t2
 kWvf7mn8=
X-Gm-Gg: AYBFou3XmAJMZpwl80CGWzODR0Vq7viCVOQ1132mH9wC181SfRf2ySC+RIg7HAb440I
 UkQMaJT7TZWhRF5mryc5jZSEkFtwb4jL2f9ggOyUUclkxD6XWd45pnrjr4tHaFT6n1mfSYkZnlD
 pZNsn1OYm7vP4/l74aHK2I7hUoH0QFHXJ8v3HCQbV1bX44RFNsYrBl48ZBWV7WF8HNfWwWIMxad
 Xe/hHe7BVniXcdzjFxdbhUp1rmnk7479ooRUtp214nmjACM1MGC0zyEOA09tVvxIMQtLOFdGVuu
 x1uH8nhQr5TAGLJRxhNWf+1/zLM+yNI2WK6l3rYJ1S84vsdStARYEecrkPxkgMHbUMHe7fGY5jd
 cn5iP7sQb+KJaXWLSqBpVtuQsEwHnKJg1gclrP9xWxcOAs6pCZPNVwA8TcaG3dkta/p3i/tgjfh
 KWDB2rVh6/39yh4K4cFEg2NSA7rrxITJtfcMhWAROWsS0pcS199C2JvEG3tjpm/h7J1qY5tjJ5h
 1WspE6VVj0cTvYZKgDSU3kwyiUTNl8mngpJAIbqW8ksImiE8SqWivoEmmYROfAmrTgjV/a+jA==
X-Received: by 2002:adf:e184:0:b0:488:7bdc:6032 with SMTP id
 ffacd0b85a97d-48dbace4711mr10064011f8f.43.1791663335281; 
 Sat, 10 Oct 2026 13:15:35 -0700 (PDT)
Received: from dragon.telekom.ip
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db99b800asm10225432f8f.22.2026.10.10.13.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 13:15:34 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:15:06 +0200
Message-ID: <20261010201508.963412-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010201508.963412-1-titouan.christophe@mind.be>
References: <20261010201508.963412-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] linux: always select host-uboot-tools for
 mips
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: ju.o@free.fr, thomas.petazzoni@bootlin.com, arnout@rnout.be,
 git@jdknight.me, thomas.perale@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit 40e266ccb9 [1], host-uboot-tools was always selected
for the latest Linux kernel. This change is intended for autobuilders, and
was introduced in Buildroot while the latest kernel was 6.12.

However, further investigation seem to indicate that itb images were
generated for mips for a much longer time. Linux commit eed0eabd12 [2]
seem to enable that image format, and was released in Linux 4.9.

This version being EOL for quite some time, we can therefore assume
any "not so old" Linux for mips will need host-uboot-tools to finalize
this image, and therefore we should select it when building Linux.

[1] linux: select host-uboot-tools with FIT on mips
    https://gitlab.com/buildroot.org/buildroot/-/commit/40e266ccb9
[2] MIPS: generic: Introduce generic DT-based board support
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eed0eabd12ef061821cbfa20d903476e07645320

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 99efb56b49..3521fe5cd5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -4,6 +4,9 @@ config BR2_LINUX_KERNEL
 	bool "Linux Kernel"
 	select BR2_PACKAGE_HOST_KMOD # Unconditional, even if modules not enabled
 	select BR2_PACKAGE_HOST_IMAGEMAGICK if BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH != ""
+	# mips always generates an ITB image
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	help
 	  Enable this option if you want to build a Linux kernel for
 	  your embedded device
@@ -32,9 +35,6 @@ choice
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (7.2)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2 if BR2_KERNEL_HEADERS_AS_KERNEL
-	# mips always generates an ITB image
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.254-cip72)"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
