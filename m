Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D50CD6E56
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 12:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 445E4411D1;
	Mon,  1 Jun 2026 12:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82CtMNqww-Aq; Mon,  1 Jun 2026 12:57:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F63341F1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780318626;
	bh=pgifZSL0fmFwdENeYOYvZhKA2xfqj1A5CDIhqCc4wjM=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bUAEKbWBBmHe2rhCbqsThOcp1uLlSreob764GGwbmc9XUrrB+1w2sK/EclERVhziZ
	 orMN/eSHWiDGiUZlxti5TTKlfCZn9Le1D5K3p6Nd0D7QzbK91UPiUZwvWrgTWNLApq
	 KPtPNMST4aZ57TshUdKz+v8KawaSS7gi8uadh9n/HtjcTgyuxcYi3JtZC9aXealPer
	 r7jna8uK+JYTio5rJmBRckbMPD28iSC0E0pK6AyZ7T3zjYLZanWbhp6qwx/00rku/j
	 MP8ny2IMy8mJtJTWDreGHBz+xrYfKciGVJpmZu98Wa2NtYywp2R9QdfqGUpKQGRjJV
	 5AsFdL5TkvgKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F63341F1C;
	Mon,  1 Jun 2026 12:57:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB922F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 12:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDFF1610BF
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 12:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1T6JYX1blPo7 for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 12:57:03 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 01 Jun 2026 12:57:03 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 61DE760B9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61DE760B9F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.89.1.16;
 helo=013.lax.mailroute.net; envelope-from=wdouglass@carnegierobotics.com;
 receiver=<UNKNOWN> 
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61DE760B9F
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 12:57:03 +0000 (UTC)
Received: from 005.lax.mailroute.net (005.lax.mailroute.net [199.89.1.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by 013.lax.mailroute.net (Postfix) with ESMTPS id 4gTYhP5H9Kzlskjy
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 12:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 005.lax.mailroute.net (Postfix) with ESMTP id 4gTYhM0Wjfzm81M4;
 Mon,  1 Jun 2026 12:49:55 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 005.lax.mailroute.net ([127.0.0.1])
 by localhost (005.lax [127.0.0.1]) (mroute_mailscanner, port 10026) with LMTP
 id KI6aR3wkaQ6H; Mon,  1 Jun 2026 12:49:52 +0000 (UTC)
Received: from mail.carnegierobotics.com
 (static-108-39-229-99.pitbpa.fios.verizon.net [108.39.229.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 005.lax.mailroute.net (Postfix) with ESMTPS id 4gTYhH62Z6zm88hG;
 Mon,  1 Jun 2026 12:49:51 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 1 Jun 2026 08:49:50 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.1544.036; Mon, 1 Jun 2026 08:49:50 -0400
To: Pengji Li <wjjsn@qq.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Thread-Topic: [PATCH 1/1] package/opencv4: respect LoongArch SIMD selection
Thread-Index: AQHc8bU8Uj31luuU+0uRHHefT9lazLYp6egA
Date: Mon, 1 Jun 2026 12:49:50 +0000
Message-ID: <d67b0f3a-189c-4b6a-be79-9accfed41316@carnegierobotics.com>
References: <tencent_EA74B36C1735A9BED38BAF20690480CAAA08@qq.com>
In-Reply-To: <tencent_EA74B36C1735A9BED38BAF20690480CAAA08@qq.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-originating-ip: [172.30.1.146]
Content-ID: <B0F9B5AA8C7CCB49A4124F60F92BF5C7@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1780318192; x=1782910193;
 bh=VXj3Ne8mkhmMURCV3S5RBJLie3WHuC16s+cWgi/5UL0=; b=yZqsxq8wJ0K8
 hDLMR5cOVzI75EnowbhuhCQI6a4MewSYvKZyxkCmBap/j2CdFQCUN1VSAEu4HsV6
 w1oJ1i1yNVPRBZ6zU8gRZX2UPmaViig7lajMcZdxoXapg7EZAK7pwNHcZym8/znB
 p7fDAJTZ9fZNB2ekxk1B1gRLZY/rioNGA3SzawsP9FrtUKAKOT16SqqnXTfdf8m9
 rR+Cf/BeTuQdYSEVF0qGqkArqtUtcUq+X9gpm7SpPrQwIZYVNNKEyRgNTNoTAHJ1
 YD2Q3qg6duPYGEFYxYdiIiUW48GozEwU/22NcX2NqjYU/fCmtfraPdDdM7vb1hkd
 l8Ct/nswvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=carnegierobotics.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=yZqsxq8w
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: respect LoongArch SIMD
 selection
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
From: Woody Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woody Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 6/1/26 06:55, Pengji Li wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender.
>
>
> OpenCV probes the host compiler for LSX/LASX by trying to compile a
> small test program with '-mlsx' / '-mlasx'. With Buildroot's toolchain
> this probe succeeds even when the target CPU lacks the matching ISA
> extension, and the resulting libraries then contain LSX/LASX
> instructions. This causes SIGILL at runtime on, e.g., the LA264.
>
> Map Buildroot's BR2_LOONGARCH_SIMD_* selection to OpenCV's
> CPU_BASELINE / CPU_DISPATCH knobs:
>
>    BR2_LOONGARCH_SIMD_NONE  -> no baseline, no dispatch
>    BR2_LOONGARCH_SIMD_LSX   -> baseline = LSX,  no dispatch
>    BR2_LOONGARCH_SIMD_LASX  -> baseline = LSX,  dispatch = LASX
>
> The block is gated on BR2_loongarch64, so the existing auto detection
> remains in effect for every other architecture.

This looks good to me! I don't really have a way to test it, so maybe a 
second opinion is warrented

Thanks,
Woody


Reviewed-by: Woodrow Douglass <wdouglass@carnegierobotics.com>


>
> Signed-off-by: Pengji Li <wjjsn@qq.com>
> ---
>   package/opencv4/opencv4.mk | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
>
> diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
> index 695355c308..0e2567eb6f 100644
> --- a/package/opencv4/opencv4.mk
> +++ b/package/opencv4/opencv4.mk
> @@ -120,6 +120,41 @@ OPENCV4_CONF_OPTS += \
>          -DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF) \
>          -DENABLE_VFPV3=OFF
>
> +# LoongArch: OpenCV probes the host compiler for LSX/LASX by trying to
> +# compile a small test program with '-mlsx' / '-mlasx'. With Buildroot's
> +# toolchain this check succeeds even when the target CPU does not have
> +# the matching ISA extension, and the resulting OpenCV libraries end up
> +# containing LSX/LASX instructions, causing SIGILL at runtime on CPUs
> +# such as the LA264.
> +#
> +# Trust Buildroot's own LoongArch SIMD selection (BR2_LOONGARCH_SIMD_*)
> +# as the source of truth and translate it to OpenCV's CPU_BASELINE /
> +# CPU_DISPATCH knobs (OpenCV knows LSX and LASX on LoongArch):
> +#
> +#   BR2_LOONGARCH_SIMD_NONE  -> no baseline, no dispatch
> +#   BR2_LOONGARCH_SIMD_LSX   -> baseline = LSX,  no dispatch
> +#   BR2_LOONGARCH_SIMD_LASX  -> baseline = LSX,  dispatch = LASX
> +#                              (LASX implies LSX; OpenCV's own upstream
> +#                              combination matches BR2's choice above.)
> +#
> +# We only enter this block on LoongArch, so the existing OpenCV auto
> +# detection still applies for all other architectures.
> +ifeq ($(BR2_loongarch64),y)
> +ifeq ($(BR2_LOONGARCH_SIMD_NONE),y)
> +OPENCV4_CONF_OPTS += \
> +       -DCPU_BASELINE= \
> +       -DCPU_DISPATCH=
> +else ifeq ($(BR2_LOONGARCH_SIMD_LSX),y)
> +OPENCV4_CONF_OPTS += \
> +       -DCPU_BASELINE=LSX \
> +       -DCPU_DISPATCH=
> +else ifeq ($(BR2_LOONGARCH_SIMD_LASX),y)
> +OPENCV4_CONF_OPTS += \
> +       -DCPU_BASELINE=LSX \
> +       -DCPU_DISPATCH=LASX
> +endif
> +endif
> +
>   # Cuda stuff
>   OPENCV4_CONF_OPTS += \
>          -DBUILD_CUDA_STUBS=OFF \
> --
> 2.43.0
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
