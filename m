Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE529CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C74485179;
	Sat, 30 May 2026 20:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Men-I2AZJQx5; Sat, 30 May 2026 20:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03E6B85171
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780173651;
	bh=4FP36xgWLwc1AisMYpudaF3z95Gq+BMTppReFn0W3x8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V5fNgO5BbL1orInMBGIswqTsN3IVBCsiVrykRu5S3pj6MduwQDpnCstTN5TIALhLE
	 s36YuP+jlpue6gNcncRz8Mi9DeKZWCL1JA9bmzODgsClPDpAFWZkRUkcuHQdjTh2DS
	 Un8FuGfowsx6Z24vWO3p1iHv5rNekQt1bb+OtYgYQLugHRwTc5PYwQwyT3nytlsbrq
	 9Fl8BM1ZrlCD1MATpblRd10ftKm+2qD+8OkRYz3vKVdtIIl27cgCMQftBEqTvx3aHT
	 j2llRBStWMaD89Df8uxrbcGUzageXuKjNFkaPlQdPAUAxIMENtEMcLbRMn4Dqz7qTh
	 eN8qtjjnmO+jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03E6B85171;
	Sat, 30 May 2026 20:40:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A991F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BF4C42670
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73f_u3x7z-Sg for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:40:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 88D4E4010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88D4E4010F
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88D4E4010F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:40:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 19142B97C712; Sat, 30 May 2026 22:40:46 +0200 (CEST)
Message-ID: <646a121a-cbbd-4093-bcc6-f93ff1793e98@rnout.be>
Date: Sat, 30 May 2026 22:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Sergey Matyukevich <geomatsi@gmail.com>, Dick Olsson <hi@senzilla.io>
References: <20260530173352.1294980-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260530173352.1294980-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780173646; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=BFIr+q1mEPg15vJ/Pk29avGvhLjLFTKL24e/Am4VElg=;
 b=FQU6eIjlX4ZGnBlNWyos3upiczqfkTG4LRyq9Tl1L93Y76VYPyQ+CskFCQDHea640FrtAi
 8xNaLB8nF2yK5y0qsInCnchunkmf9MqB7bDt/dItD73yZrQ/Qf8xlRsaI+on7Y75R0yf7N
 Rey2Vw/m1eOIzXaOitIZ7w11X5iE9FYQvh6qfSj1Ole0G9WEYhyVAdyo38YkoPhjDd0Gbg
 2w2VD9M1KtOFomPohNZqU0qP7ELGL4/u6PKj/v9VGEKND/i6xHuYoUKKn+ZOv6YClI42Qy
 3IPq6HVY+WakGnN1vtGrNG6MhQsQ+Qd5fJ2dfsdYu9SSD9qxxJmkjrg55aM/zA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=FQU6eIjl
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: correct cpe-id
 version logic
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/05/2026 19:33, Peter Korsgaard wrote:
> Commit 53bb7eafb2 ("package/arm-trusted-firmware: add
> ARM_TRUSTED_FIRMWARE_CPE_ID_*") added logic to set the cpe-id version from
> the package version by dropping a v or lts- prefix, but it used subst
> instead of patsubst - So it would replace "v" and "lts-" anywhere in the
> version and not only in the beginning of it.
> 
> Change to patsubst to fix that.
> 
> E.G. with the following defconfig:
> BR2_aarch64=y
> BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="version-with-v-or-lts-in-it"
> 
> before:
> make printvars VARS=ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION
> ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION=ersion-with--or-in-it
> 
> after:
> make printvars VARS=ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION
> ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION=ersion-with-v-or-lts-in-it
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index c3c4a581da..1b52f36783 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -8,7 +8,7 @@ ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_V
>   ARM_TRUSTED_FIRMWARE_CPE_ID_PREFIX = cpe:2.3:o
>   ARM_TRUSTED_FIRMWARE_CPE_ID_VENDOR = arm
>   ARM_TRUSTED_FIRMWARE_CPE_ID_PRODUCT = trusted_firmware-a
> -ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION = $(subst v,,$(subst lts-,,$(ARM_TRUSTED_FIRMWARE_VERSION)))
> +ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION = $(patsubst v%,%,$(patsubst lts-%,%,$(ARM_TRUSTED_FIRMWARE_VERSION)))
>   
>   ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL),y)
>   # Handle custom ATF tarballs as specified by the configuration

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
