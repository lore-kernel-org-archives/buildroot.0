Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A526C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3006760E4F;
	Fri, 25 Sep 2026 14:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17OsQvfu4Djg; Fri, 25 Sep 2026 14:46:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3D9D160D5E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347600;
	b=cG33WOcKhGJOBWSGxwExH7sBeWQYO4pdbFSLcaCkdhe4TnfwxIvTCUd0b4QY/+KvCFso
	 4zTmqlvYPNL1Bhnx2Zy9pNmUTuIgfZ+OGp5G9O6lq9aIU4qZ9+JsIrfPpGRyd2Z/PO4dv
	 XWCMOmuxPnaXR6PlBB71KqXDYuTm4zEZaaMJkknTi2+dMC/AvPAVAoaE1FDYaw/+Vna0P
	 5PqkxrVmWFNj+X8im4AaEOO2ORzH2oSuDoKaigVlsnqTA4NoMG/+XhzX2BA3c7yK2+6kt
	 9UBfniK9LKVQpQ3Y8AUG6+uHDPxTnH7mAw+uJAcIbkXPYjkENi9T6brNo1g0Yb7u20g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347600;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=czI3VDttKudjUekYpTuPfVLrPPwjFy8fYws69WmdKKQ=;
	b=sGgfuHTNyNYNcL3QvyDG1K4ToKba43K9w9EfbMJHNGiQUKqs0bOYqptWuCCdErVn4tEs
	 vaoYWF1OuPmgM8frsmHDfOXd9nihKoNJfCfMJ/2ElUIkk0DUdJ4PUJBqGtvDgPWxRE77N
	 nNf4DiJ+bXmjoXf3qhBZsXdAM5H1yBjSVNW6frKf5PI2MNOu+s+2doIiFtBRipjZSWAgr
	 UQXhofDL415nmFeHxEFrGJfz793xH9Rq/Ae08Z3S2XfZLxGDH9qYbYOqsnSmyuH5dSDrD
	 k2ayykaY4CnKIGVZ9p07FNUFvt5M3IDgQeYMqO1YROhMzCmPG++g1OTPntcC36ijukg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347600;
	bh=czI3VDttKudjUekYpTuPfVLrPPwjFy8fYws69WmdKKQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f43nrIQPSKLbi/xM3JyN7aW7SO2TS4l568qctbpS22A2iND4zi0RD28cbSksrj5jK
	 rY7gZXOyVaBzEOkm1xhkDJHO7UVRCpNZ8OaipTqAAkyNYw6y/yBn42ZCztSJqJPTCt
	 rTl0yJj9qUWeyA8NVKYbA8TKJRsYeiF1UsdYy/Z+BnswKLuCf8ghUTJnv+EhoYhppt
	 0jXIhoZOUpMj2EzuKXrip/0V+A4j6xJEdXoWm53sSAyhDYnuP5NvaxpzCI2o3EhwKD
	 ZqhnPo3U23iUF/X53uA1tX+gkJTLFO6BpSL0+Yv+5/5FuEGROE0NyXbioDuZ9g3i9E
	 aeb5cblT7uvUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D9D160D5E;
	Fri, 25 Sep 2026 14:46:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2053D334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06F9B407FC
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiRyQIU2btHM for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:46:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 18EB840790
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347597;
 b=pmeGlNQ9FhOirzULzgRXPXuTznfunPL5ym2p+jY5B0aciJaELcnjoBWVa84Mdq6L/Rtt
 qrE0yNM95UTA8+S37ZCPF26tJiwVn8KG3iK5Got+4+SKEf2puE2Z+fMrV9ziMdWI2HrlW
 wbR8lZjv1DxK1ukxmCcUNLxQfTFRu79/kHSqk6ZT7M3373M/qACWXG/MsNawQ7wBqzlWf
 qLZxh5sZYlRsHNISSxr1zlk7qiaJje/ifaGMtP4iqkP9EkZRts5cteCE2694fab/7Z7g2
 Knv87z1PQUtqdLFZaiEDSKL0j/SUB4vQozl6VRMx17zfqBKo6pLkKX3OtWIs9Nhcbgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347597;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=w7x8A1CFbhn1vhf20ahbsv2erSG5FP1S+WQ/OL/o0hw=;
 b=i+Z+WaosLPuvka5KlCt8X1rMsPCLGsPJQQ6pSBjVsPys0ZZt76MCWGDyJqcPejhUMyjP
 mv+R1S96LWUQF6ASSxhVQsSCI9TcpaXVgsnbY01z5MKhrdLVhgGvAm+ejA5T6O8ghcec1
 AX5YefEbfg0T8H3r0xIf4TjG6EKaoWHKIaFszu93ZSjI+8qeXt4oQei/3wS5yBA6XLfDm
 dWZ4On4PugmRx/Sybigd42jWhGeWigBvCAh5c0oMzQ55bJLB/WKuyl5VQXDpRA98lBKhz
 VimWVJH9tsxs7zwpDRAsx2eJ/gUV+EauwIV0rUva4hzxURR91tDFb/H2b6B/8kbWGDw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=J3MnOzGK; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=raphael.melotte@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18EB840790
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:36 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-4887840c529so339310f8f.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347595; x=1790952395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=w7x8A1CFbhn1vhf20ahbsv2erSG5FP1S+WQ/OL/o0hw=;
 b=C17AOreTGYm6QSg99DkQqvny1FITy4cTFvVypNwrZCH0Y3aggY0RyW8Uy0K/JubSCx
 HsrisirYwfEZtLDGTGS3D+B2jWgyVQYYowIrxSnQU6cQeso6v/HXV6rH1BTMMjlDAFj+
 Uy4mKv8iSX6w0aUnxVSCeOYXTOGj7w2QptDT1bKwtoW/Cr8oCRM5GiTe8VE81FauhpAI
 vof8ZXlcKIppmv8IIsQUqQzy/eiZTDRxpF10XsezgDzjmBI2Z7weWwn90G/71xMWT/ER
 26bH4o/ZZTSedlnhE1K74WDOQhXMeIvxT1tkzpU8Le7fgOalW6b6ur7Gir+gN7GSKRVC
 d8Tg==
X-Gm-Message-State: AFuF++n6QxevA4XdjGOGzr2YJ2YuQwpIpzKMduW4b+X9nlv4h4huTRHy
 N6pyEfi6/vIDzYNWZ986SIF+4ttXqRZd5HNATID1s+SGTTF4yQIWwMsMFyrxyAZVKEpuYYy8qdF
 W22McCWeJKg==
X-Gm-Gg: AYBFou3H5F4QUcWZFwJ4zhpG++AaLpfxStj50CbQIyiG2+rwWUzVGVg+3VB+YcLO/B2
 gqPlSp9k/l9sSk06sG/mrVh4XohMivpr/eeHc+9EpeTlCaUU5EOaRCM4H6NexuDz56DOZPSXUl9
 T1SQ6nL/ojM1UOJfRuaa1QamBnzehxmHFeHhX7799ybj4aBPvc2zuXDSFYYIPLnT/mGLXc7FYux
 ylLQ8OyPArGnMsZOC6Oqg6Ut6Taq2779pzVvLdsrHDKePCxqisvrRDHIa9kIrhjbDgzDc0CRdIB
 BV41x9wcclQZ5G+ZzznX1/IjrFGZNDAmiiCMAP23b0aHZmZFQAS07UGWl+L24NxNjiOWA4VgC+R
 uKXwbN+f9Sg1Nhldc1VcKLyQPeSVFSI92pyWFQ9XQw3xOQcVXO/NprP/8wxzDoSZpGj+DpYLZS0
 0PRax3q4Mr/4+rxHJ+KSTesYpjJVlvu5kTOaoIufXJnxamwyKSa6b6auS5SJ0a4bAU61qjbAoj6
 WVVp5fFebQErp51/3rdwkqL9es+KDPP+JfQiD8lTQ==
X-Received: by 2002:a05:600c:630f:b0:49f:d69a:1a04 with SMTP id
 5b1f17b1804b1-49fe6704682mr101794605e9.16.1790347594903; 
 Fri, 25 Sep 2026 07:46:34 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff06bdd11sm67241615e9.9.2026.09.25.07.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:46:34 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:46:31 +0200
Message-ID: <20260925144633.4099569-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917075326.1256294-2-yegorslists@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/qemu: drop x86_core_avx2
 exclusion
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
> Commit 1f7efaf89f03 ("package/qemu: do not support x86_steamroller or
> x86_core_avx2") excluded BR2_x86_core_avx2 from
> BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS because binaries built for that CPU
> variant crashed under qemu-user. This was done at the time of Qemu 4.2,
> whose TCG engine did not implement AVX at all.
> 
> Since Qemu 7.2, the TCG engine implements AVX, AVX2, F16C, FMA3 and
> VAES. In Qemu 11.0.0 (the version we currently package) and 11.1.1,
> target/i386/cpu.c has:
> 
>   #define TCG_EXT_FEATURES (... | CPUID_EXT_AVX | CPUID_EXT_F16C | \
>             CPUID_EXT_FMA | ...)
>   #define TCG_7_0_EBX_FEATURES (... | CPUID_7_0_EBX_BMI1 | \
>             CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_AVX2 | ...)
> 
> which covers everything gcc generates for -march=core-avx2.
> 
> In addition, the exclusion was inconsistent: gcc's core-avx2 is a
> deprecated alias for haswell, both variants select exactly the same
> BR2_X86_CPU_HAS_* symbols in arch/Config.in.x86, and haswell was never
> excluded. The same goes for broadwell, skylake, zen*, x86-64-v3, ...,
> which all enable AVX2 and build fine on the autobuilders.
> 
> So drop the BR2_x86_core_avx2 exclusion.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/qemu/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> index e5379e7224..48979fd7ce 100644
> --- a/package/qemu/Config.in.host
> +++ b/package/qemu/Config.in.host
> @@ -22,7 +22,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
>  	default y if BR2_sparc64
>  	default y if BR2_xtensa
>  	default y if BR2_x86_64
> -	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
> +	depends on !BR2_x86_steamroller
>  	# The Qemu TCG engine does not implement the AVX512
>  	# instruction set, so binaries built for such CPUs cannot be
>  	# emulated.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
