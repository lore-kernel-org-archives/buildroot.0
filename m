Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1FEC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 07:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AC8F811E7;
	Mon, 15 Jul 2024 07:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRKv7xW0HTeZ; Mon, 15 Jul 2024 07:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AAB28119D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AAB28119D;
	Mon, 15 Jul 2024 07:45:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 738E51BF2B9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EC88403A7
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8HPlHwec_cm for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 07:44:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 085A440195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 085A440195
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 085A440195
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:44:45 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so22857015e9.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 00:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721029483; x=1721634283;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hUjSu6EAWBoQ7FwteKiWDHwbysExF0EO50zYPZVTlOw=;
 b=JOYCIdwNFaesS41s0D11GBEj61DE6Zuenrpeoea8ZGEgkAvcYkDG0k6kPkU0fFElrN
 qlJ4I2TgtHaBz8Sm8fXvaNY0Qb71goWdFCZ9GnZ/Nz68p9hKV3fPvXCOmWP+ddra5o3B
 DjcB2gv1aAf/LmmBYjcHd5RkAwyL3Td11qW9tQS8/SNoQljABsM+1WOj5fu+/+BnosjK
 RCBaVjmIZyalubBJ4iGUT9frT7XWqdxb/ScyUJQ5x99mU1aIRnGL4fMIG0rUztQwJfI5
 YGFmRYcrqR8ijy78OMFus8NqTQWdX3ZwxSqn/fRD62/CyUTxIXbXSEBrEHZxbYxNxi0/
 zNVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiO2pCXAj9o62HeZtQE6M16ke+APKvGA7RrxX9mV67a4DElrfOMue1X6T9CzO/N/nTMdbRk+2cwA343AeWuV+vFqjAXn4iqg==
X-Gm-Message-State: AOJu0Yw08Eupy+PzI3QMPGaJtydV2NQ1eQSMa0hX1cvyPdW2q3cauxTd
 cyFbtwIE02+bEzCoypC1lymnKkyt/7RabonAE00VSfbMAQER3DvnImhTTnUIXe4=
X-Google-Smtp-Source: AGHT+IECI4PDnFUeOQ7aS1qPEHmWQffzBB3QlEoqC5VHf/yNsOTBTp88PJejqROwEwycx3x6XWrsFQ==
X-Received: by 2002:a05:600c:4483:b0:426:6981:1bd with SMTP id
 5b1f17b1804b1-4279dacd014mr83682495e9.5.1721029483662; 
 Mon, 15 Jul 2024 00:44:43 -0700 (PDT)
Received: from [10.3.160.38]
 (laubervilliers-656-1-158-76.w82-127.abo.wanadoo.fr. [82.127.106.76])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7751asm75899585e9.3.2024.07.15.00.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 00:44:43 -0700 (PDT)
Message-ID: <eadcbef5-2123-4f66-9f3e-ea6d521e2a88@mind.be>
Date: Sun, 14 Jul 2024 22:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240714181048.9272-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240714181048.9272-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721029483; x=1721634283; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hUjSu6EAWBoQ7FwteKiWDHwbysExF0EO50zYPZVTlOw=;
 b=BEnB3dEBLI4BXo5EkVQKDIgCKZOfqWQI0yd4L4jX7oEBO2wxTFDcWn85wnoKSye4fY
 /sl+wj5Gvt/CclgIcTrK4eCSrSs2UvYIAOJzLlutsYZeOKFPE3jBMabG0aZkCaFXQGLl
 A5dU4wnWcsE1orMsHdqIdPrXLrT5loXllaro2AFxNsSHsXWPsuYT45xRHNyNlLz3kCQ7
 XktkzVA6yYOaW6CHiVtCmedDJbZvaXqmA5dqwE8r2Dr8ADWvHtTN1vjop+RdNv3BIAfl
 BwpvzPUm45CzwjOv05Hc8taXjmKXE0TSKryoKgBgJ9h2Gm0wSNsHqj9WjYMKtWruyYWx
 bPkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BEnB3dEB
Subject: Re: [Buildroot] [PATCH 1/1] package/chicken: add
 CHICKEN_CPE_ID_VENDOR
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/07/2024 20:10, Fabrice Fontaine wrote:
> cpe:2.3:a:call-cc:chicken is a valid CPE identifier for this package:
> 
>    https://nvd.nist.gov/products/cpe/detail/6F55B09D-8D4B-4F1C-889C-9B65048AB632
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/chicken/chicken.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
> index 9f296a1ce3..2667f7823d 100644
> --- a/package/chicken/chicken.mk
> +++ b/package/chicken/chicken.mk
> @@ -8,6 +8,7 @@ CHICKEN_VERSION = 5.3.0
>   CHICKEN_SITE = https://code.call-cc.org/releases/$(CHICKEN_VERSION)
>   CHICKEN_LICENSE = BSD-3-Clause
>   CHICKEN_LICENSE_FILES = LICENSE
> +CHICKEN_CPE_ID_VENDOR = call-cc
>   CHICKEN_INSTALL_STAGING = YES
>   
>   # If ARCH is not set, it attempts to autodiscover. But it is anyway not used.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
