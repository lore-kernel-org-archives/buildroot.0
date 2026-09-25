Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CD0C98326
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74AED60DA4;
	Fri, 25 Sep 2026 14:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0C7ThH2jrk3Z; Fri, 25 Sep 2026 14:46:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7A1D660E00
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347593;
	b=YaLvN2HqS9U7j7foq9LNgSuVm+uPT+GIxSCuiG1+KxscfdkW7yAVy4Ei2zkZKrPdhgbl
	 iig0RWwlmSXfWj0ggtfbLfwimGvQmB/HcQJmR4LTykP5uaQ3lKUjJF1BXKEx6LqSZRUhP
	 A4OlEz29zhRB6hubbbhk1yvZtPJgDL3f0JQg9WOHaiY3s8ttgSL8+8a5FijZ/uMI3JbAK
	 o76yr4njXc5ktx9oSw/Rya7h+sMjf1QHhZsw9cazNq7dTLDeIvmq2U0EBi51ei/1wuXgi
	 Y1q3RYjJiJbpX1QQpjDFLPiOLrV8L/0AahFRfXJeYXB1amxgxGmS1OfRBwgPvHaLsbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347593;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GR4lRujNYI5zRBdOKP/I8I/o7Wpcg4TC5vBuXgtg/RM=;
	b=X4YFwTARVfceYzLWYse01u9LEl5NGQXgy1NBoez9Ix6Qnl85nI0Bpt0iHZFkD2SQdT1+
	 GlllhWRO0fREAXeOyWCGAtnkiEE3Xdev3uaOlzpGqpF81dfSyLEcM9oFpKNdrFUWLeYaM
	 7ide/ShLATR2jAxSdgkXB6pwom98o6fSZqXf8uooN1PTm9VMRAT1n8qTEipcMfqF7YhVN
	 khdBuFIrmor7TrzX0dZU3TUh0fw16CAAXLFZUazBA2UPeYvp+JKs+ICj/JN8ULNAVZXGn
	 gxy21xOGSg7OFFBv52TfgfNwTfmetmgdH9vALoMeivoFmkRxYAyyWQ0xiEdKDV6IU0Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347593;
	bh=GR4lRujNYI5zRBdOKP/I8I/o7Wpcg4TC5vBuXgtg/RM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Da8jMNiDyX1vWQcVUeZ5lcqCQbqajU/dWb2ZWj44ybl9h2MKWwgaPWWv4sSbF4yYR
	 oiEke7oqkPH4eXyg+A8skaJgoCOLe8x9qk4ta5WQQCgCM2Ql7D8opcfOfFr4SSrox8
	 iDUx41tp0iVD1FhxA2s7+DHBRN51VCvHwEwZgiWG3RplUGJ+fvlrTEJsFou2fO1Yb9
	 PaAwK7W2Xaj6/7LOv+lJQlODGNECpwnH2xOkpDBfy9Rhq68o6Mf+S3GaeIhOVPU20F
	 jmq41OFYQSzqWbdlCMsW5ASCNhjzfbyTl08gQGXdmYZ9Sk9q4rtfEhLvWkTLvtcPTp
	 BqlngXgWP5Mqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A1D660E00;
	Fri, 25 Sep 2026 14:46:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 948CC334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86952811AE
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nejsirpWfdwk for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:46:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 50DA7813F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347590;
 b=P9iSxzqDjX7UcGorCkVVMUMusD5pgPjKKNjl2kiGxwYpnndYM6cVFHwqQ82PLV2VRbQT
 1DZFdmdadqhtKWxP2ZKboGMK7HPEytHw/YX+hQM+7KvcbJb4U36yFhiBj6PLRfYzSwovX
 vOf1YnNBe5EkT+XVTEAb1xoVzH0czPMXm98QgPsBEtSgefl9/wq9+1FX3MxgKLSwTCdQu
 QKNB4ThGgRwwPzAKDLQW2pd+MUMUflhysvbxMKAz7YF4R0jHJiaWcVgNjWEYlgpr5xAjn
 AXN3S8vJYg2WOVIOK1o/n7Qaq1XblNZ3v0+Bgq344UedQvJ6l9Mb6Vuxwel/n9wYXCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347590;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=9fGtohbviyh21TkAf9mB7tm/Br0EB13G1ZQ7QeFZ9UQ=;
 b=fPJi5Vw2PrLgTVdoT5HdoUGiYcLg2v+0Gq7MQ/hWaJrC24gQIQox4N3FRqZAioD8+Fif
 3DHKbBGiB86Z78wLxKgHCEe7fb1SuWyCJD/DufYvJW48r7/A8yhd4ZZrBjFRA4Spx5deX
 orPoyim8b1qsYcsFKcsA8wUrrsDtykV0VqhJiZHHeQR9u020lJDGKAG8bjPjawWAJVFvW
 mrGPdpVI3cUq0qktfmPMs4WX+E2Q4jvEq4Uwme9pxrDvX/LG1sqa8IfaDser7yC1mpgU9
 HRUrt1LGN1k53RgOJL1qwYSipjs+Ycy/fJw4nFhR7L0LaJLOBTPHy6vo+eLoELOaA6A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=R87ViEsU; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50DA7813F3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:29 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49e66390995so6125145e9.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347588; x=1790952388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9fGtohbviyh21TkAf9mB7tm/Br0EB13G1ZQ7QeFZ9UQ=;
 b=ObPUKCV0KNggZoY5yrF46Z+c/ubWLXMXg88IZcp0Yeg9po3HZ3q+sshCsbaYssjgOE
 7ePVjlYpohAAW1T4puH3IKmZvnX9PDx3X25kek3Wx7dwnVHhIX4SvC0wuYkpjMW/JRR9
 LwLChJkLPBaisdarhM0hE1Cu+UfwJ+47kCZrm8U7kpMXGLMdAYFpX/Nz3BiuVwtifMcE
 wWS0x2/r6ouxYyHXV1I3stUy2qRRX1hvBz4C5YALXPB6enIqJEF9ISd3a0/aiMayAP1u
 vSfDOyOht2uprA3qfijDFGq6SbzJndztG40O9OMYwkYo8zcscyGjy/CtShgI1MlWw9QV
 umjg==
X-Gm-Message-State: AFuF++mVJsHSXVwkIlP61lkX/lfoGvyHJBfH1BEfstRNulvk+PXl4h7R
 ckBnRXdYZ5Gt76baUiHawx1Fle0fBUjYnmQ0cFl6ZGXAUlzZoDY0yc4RC1foYzVgckWX3U8yxey
 bu10121QG1Q==
X-Gm-Gg: AYBFou20XlrxTMP46G8T7SWXzJH/JOaO+esDFwYjIqzhsPsJaeYkPbkGTq7DJyOEE9K
 V/492fkyhB+aLH6i779s+YqzEw1k+Sf6qOnlElj9Y+RZSzqYag7PZ3OEoi+qfp33Liio1IitOiu
 L+jAX8uyS2q8Ckr2wRXjdILAaS7krNqlPjXAaIG9tb75iuz3wFYYgsWuxYzibHZKsffhW0j+K1n
 4dIgc5zBoGMQx9nDMH8IwUFJFx4WyLHIvxqIkiXhrfuGuQkfR4lDnrV4JJokWj0r64MwDJk+wiX
 Af8TGSDNEBH2MvNpTFFQrGv/GK2YLQJ7Ao6SjpJ95/vqkt+tBJ5oUBJeTjrzavD+mfaO418UzLj
 hBkglvFbRPdhn/Q+PUQN/I/Rrk3kxYXsz5P1JDyWk4s860Fr+lAxd634qkxV1jhfLsmRZ2pVn70
 6VCwKxUhkn2DHGrPsIbCpzitUBMT/0VV8ABERHUWPVWAqTMiEmyrQqBYjxlenE5icONwmwFTNgC
 VRtMyNVrsFtEVYssTLlZM6dvXqXjLCno/BtrbbdQk8=
X-Received: by 2002:a05:600c:3e1b:b0:49d:7fc:5dc5 with SMTP id
 5b1f17b1804b1-49ff06d9235mr49369275e9.1.1790347588074; 
 Fri, 25 Sep 2026 07:46:28 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fef6186a6sm57397335e9.4.2026.09.25.07.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:46:27 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:46:25 +0200
Message-ID: <20260925144626.4099334-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916231235.2635069-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ibm-sw-tpm2: fix build with
 gcc-15.x
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes:
> https://autobuild.buildroot.net/results/d43/d4364f6e3636c696471bf8cba6d308439130e53a/
> 
> In function 'MakeIv',
>     inlined from 'TestSymmetricAlgorithm' at AlgorithmTests.c:197:25:
> AlgorithmTests.c:181:23: error: writing 32 bytes into a region of size
>  16 [-Werror=stringop-overflow=]
> 
> The build error occurs with gcc 15.x on some platforms, gcc 14.x is not
> affected.
> 
> These defconfigs build without this patch:
> 
> BR2_x86_64=y
> BR2_GCC_VERSION_14_X=y
> BR2_PACKAGE_IBM_SW_TPM2=y
> 
> BR2_x86_64=y
> BR2_x86_x86_64_v4=y
> BR2_GCC_VERSION_14_X=y
> BR2_PACKAGE_IBM_SW_TPM2=y
> 
> BR2_x86_64=y
> BR2_PACKAGE_IBM_SW_TPM2=y
> 
> This gcc-15 based defconfig is broken:
> 
> BR2_x86_64=y
> BR2_x86_x86_64_v4=y
> BR2_PACKAGE_IBM_SW_TPM2=y
> 
> The build error is not related to the recent bump of the package from
> rev183-2024-03-27 to rev183-2026-08-26 because no changes were committed
> upstream to AlgorithmTests.c since rev183-2024-03-27:
> https://github.com/kgoldman/ibmswtpm2/commits/master/src/AlgorithmTests.c
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  ...15-stringop-overflow-error-in-MakeIv.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/ibm-sw-tpm2/0003-tpm2-fix-GCC-15-stringop-overflow-error-in-MakeIv.patch
> 
> diff --git a/package/ibm-sw-tpm2/0003-tpm2-fix-GCC-15-stringop-overflow-error-in-MakeIv.patch b/package/ibm-sw-tpm2/0003-tpm2-fix-GCC-15-stringop-overflow-error-in-MakeIv.patch
> new file mode 100644
> index 0000000000..9b22522b36
> --- /dev/null
> +++ b/package/ibm-sw-tpm2/0003-tpm2-fix-GCC-15-stringop-overflow-error-in-MakeIv.patch
> @@ -0,0 +1,45 @@
> +From b35faee1224f5bccf759464e69f724a03421c8a9 Mon Sep 17 00:00:00 2001
> +From: Arthur Gautier <arthur.gautier@arista.com>
> +Date: Tue, 9 Jun 2026 21:52:07 -0700
> +Subject: [PATCH] tpm2: fix GCC 15 stringop-overflow error in MakeIv
> +
> +When compiling with GCC 15 using `CFLAGS=-march=x86-64-v4`, the compiler's
> +aggressively optimized vectorizer triggers a false-positive
> +-Wstringop-overflow error. Because x86-64-v4 enables wide AVX-512 registers,
> +the compiler misinterprets the loop unrolling and warns that a 64-byte
> +vector write is overflowing the destination buffer:
> +```
> +  tpm2/TPMCmd/tpm/src/crypt/AlgorithmTests.c:158:17: error:
> +  writing 64 bytes into a region of size 15 [-Werror=stringop-overflow=]
> +    158 |             *iv = i;
> +```
> +
> +This fixes the warning by marking the `iv` output pointer parameter as
> +`volatile`. This inhibits the over-aggressive loop vectorization on this
> +specific buffer, silencing the compiler error without changing the
> +underlying logic.
> +
> +Signed-off-by: Arthur Gautier <arthur.gautier@arista.com>
> +
> +Source: https://github.com/stefanberger/libtpms/commit/2d9b00c4e42677cd0a9b67344f4d873ddc409a21
> +Upstream: https://github.com/kgoldman/ibmswtpm2/pull/25
> +
> +[Bernd: rebased for ibm-sw-tpm2 package]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/AlgorithmTests.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/AlgorithmTests.c b/src/AlgorithmTests.c
> +index e8549adca..28d8e780a 100644
> +--- a/src/AlgorithmTests.c
> ++++ b/src/AlgorithmTests.c
> +@@ -162,7 +162,7 @@
> + // Internal function to make the appropriate IV depending on the mode.
> + static UINT32 MakeIv(TPM_ALG_ID mode,  // IN: symmetric mode
> + 		     UINT32     size,  // IN: block size of the algorithm
> +-		     BYTE*      iv     // OUT: IV to fill in
> ++		     volatile BYTE*      iv     // OUT: IV to fill in
> + 		     )
> + {
> +     BYTE i;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
