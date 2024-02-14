Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5870C48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 09:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92BCD41727;
	Wed, 14 Feb 2024 09:07:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 95hO2CU7Pt1O; Wed, 14 Feb 2024 09:07:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DA6B4173D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DA6B4173D;
	Wed, 14 Feb 2024 09:07:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 767341BF398
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FAD74050C
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GO8TWs12oFWG for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 09:07:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 615A9404BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 615A9404BC
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 615A9404BC
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 09:07:27 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5114b2b3b73so6118162e87.0
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 01:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707901645; x=1708506445;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I1S0DWkbgj4fSipZiHm2wZsEP/1KrWf+g1ezQrPMoVk=;
 b=hwS41m7ltAJRmKOPHHSflH3Vn4owwlGgPPHRy1TZlyTAl0WfKmurUOdAyRJsQQnJYj
 c2002HLZnecX/DtJhyXX/FBx3LTrh9bDPw6pAh9PPfyTTp6GMuS3PjDYN8YMAptahzBn
 HEKqstGCs8Yuvin1UhUgfAve/eNhbUSynQmMGqmJOgjprtRU8Wk6zKxoPBfAqzb3j9JL
 0FWw/xGwCOMLxJSnf9M9yzYVMAFht4yOmLTHM33FIvHRnplhKW1jCLYM54J4izEpHf0j
 EcKYn7KXw+AvKfNpQ6CSb0zLrTr2YfzRSTWwcARgD783xlMHnFnmA19s891lZMovHVJr
 gbiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6/T3BKHvPCuq32et3qUt7UnCHkoBM5tXBmmgBaXhd0wBEHjy4OVIzWC2/z1FRsfFvkL8d0eBYg7ufYt7A3rAl9QwFiWu6dw==
X-Gm-Message-State: AOJu0Yxt1DEIPGjaVDjRO5Ean8KCCVoTuslnli/GqWxQOK95b9XeeDLu
 p6IW8hZWLFClp2//2CPYQyphecNQtWh0/23G1KkmIWgYPJibRPV8f8GZYP89PTY66+fv5w2icCt
 D
X-Google-Smtp-Source: AGHT+IFXuX4R/RgXGIvaOaSWkPHEUenV6kN308N+IMf5EyX4mwINaljCIxDl3gZ3d/UJax9fmynA5g==
X-Received: by 2002:a19:760e:0:b0:511:9489:dda8 with SMTP id
 c14-20020a19760e000000b005119489dda8mr1583167lff.6.1707901645022; 
 Wed, 14 Feb 2024 01:07:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUHIk4zoJwU7EoputOZXgUEPVdpcn2dXoRTge5+S7Cg4rYl7/3WzDbugaNf2m9KIgB0U+VWk5+b/bZdIvXO/iN2ZIn53lIZ9Q==
Received: from [192.168.43.18] ([109.139.41.245])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05600c474f00b004117e45f12esm1321063wmo.22.2024.02.14.01.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 01:07:24 -0800 (PST)
Message-ID: <897ad4ff-78af-412f-aa74-ef20d6eb2a1b@mind.be>
Date: Wed, 14 Feb 2024 10:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
References: <20240213050106.1371689-1-kadambini.nema@gmail.com>
In-Reply-To: <20240213050106.1371689-1-kadambini.nema@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707901645; x=1708506445; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I1S0DWkbgj4fSipZiHm2wZsEP/1KrWf+g1ezQrPMoVk=;
 b=Zyy6y8ctd/8QZZyKZGo1RNZqhi6QUPB/V3cD0H8kzaYu2zzRD1yAFWyA/fJfvSkVq5
 SWcy/AFIVCKmJg3z/milh6i8PxlokCJlfXhB/P1bq5OUZ+7se4kvYgZfa39dgphvm4Vq
 dn0rnG/aWIkIC4132j35zYGevZetUd52ccwyZtnSwq89FeiPE+CzsChAYaINIAkg7ent
 ZC4PDKCDJMhT/zVO5pIu2IoLyR5jKaoPFfGc8BbzG2u3cK0BHIf6iSKtQ3tTc9mmtvfo
 EWk9XhcRDAtcZOXaVKtjNv60+05sk5mBj1DtxWt7kSko/QfhZgHZpJjRaZbIMBlW+cfC
 cI2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Zyy6y8ct
Subject: Re: [Buildroot] [PATCH 1/1] board/freescale: Fix check-package
 warning
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2024 06:01, Kadambini Nema wrote:
> $ utils/docker-run make check-package
> board/freescale/imx93evk/patches/linux-headers/linux-headers.hash:3: empty line at end of file
> board/freescale/imx93evk/patches/linux/linux.hash:3: empty line at end of file
> 402624 lines processed
> 2 warnings generated
> make: *** [Makefile:1248: check-package] Error 1
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

  Applied to master, thanks.

  Thank you for fixing my mistakes!

  Regards,
  Arnout

> ---
>   board/freescale/imx93evk/patches/linux/linux.hash | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/board/freescale/imx93evk/patches/linux/linux.hash b/board/freescale/imx93evk/patches/linux/linux.hash
> index 5687ec7343..715a590825 100644
> --- a/board/freescale/imx93evk/patches/linux/linux.hash
> +++ b/board/freescale/imx93evk/patches/linux/linux.hash
> @@ -1,3 +1,2 @@
>   # Locally calculated
>   sha256  eb94414f952444289c0af8ad82afa0dc2d07e08f9000ccd2cc39f11da5b494ea  linux-imx-lf-6.1.55-2.2.0.tar.gz
> -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
