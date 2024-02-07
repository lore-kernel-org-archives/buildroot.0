Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955CCC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64C3B81766;
	Wed,  7 Feb 2024 16:45:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fuuPjwvAZAcT; Wed,  7 Feb 2024 16:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 774BB81A0D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 774BB81A0D;
	Wed,  7 Feb 2024 16:45:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AC321BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECBA761439
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lr6FJDFz5uks for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:45:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EFFF960ADC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFFF960ADC
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFFF960ADC
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:45:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33aeb088324so635972f8f.2
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 08:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707324326; x=1707929126;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uxga9zLLX7n7uvwrPPLaA2rQOGjKIR/adTEKdJwoSTg=;
 b=C93Dumn6PnBj/Qw/GMAVp7XJIBXT0SJi8JhRQ/9NsUMQGM8t20h3Z4nAKOcd6gRP//
 iR6x7EIY00stRx7ejzJhwskTFdAchqVxFbP4hJonG0zBGVejTRtiuRvjNvRhMaqpAAo5
 gMHfYYE3Xhonw+5WZryLgDlyLJ/kkyzVLzh+zhPaPyNxI4WsUWUdHkB08xHmTi/JJycD
 8MKtAnQWT1C9lE1iBNSrT/LPBFhK1OPfBemSF0iRgXbhyG3tpilBAOY0WF7qZtQSy5Ko
 SZjJz+tmsMTGmDq+zEkCKyoN+i7gu6YXdQSOwPOHuaf+g2xJwabU9bZRXchmIzMriidI
 nSrA==
X-Gm-Message-State: AOJu0YzCFhAcdcTWLkuESRM1c5z1WaypuBlJRsPpOOQN+BN8i5Qe07gY
 LhRVapio0USVqrtRipbXiXvMU4N+9C+1gRYc6DvyGOc580R/19+KpX/Iv/5x3Cw=
X-Google-Smtp-Source: AGHT+IG//xvmaKf4NhILUI14oMTpR+W95iDhmlxA+FpDG++QM8G4DKPrEa+4SKmSk5YEeVJUU/rmmA==
X-Received: by 2002:a5d:4750:0:b0:33b:274e:af5 with SMTP id
 o16-20020a5d4750000000b0033b274e0af5mr4268539wrs.60.1707324326051; 
 Wed, 07 Feb 2024 08:45:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWyRjJIQCWVIutL4uivcBNGUE43NeDRJjbSPpefsuuvKioUR6v3PouD2wKfXqpTvJIXV/V13vHCc/d1n4SMMxVtFmIVwE/XSQ==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a05600c190b00b0040fe5994d0csm2648349wmq.0.2024.02.07.08.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 08:45:25 -0800 (PST)
Message-ID: <c4798f07-7f9f-4f98-8aa2-6a71a17e55db@mind.be>
Date: Wed, 7 Feb 2024 17:45:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111071706.3073259-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111071706.3073259-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707324326; x=1707929126; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uxga9zLLX7n7uvwrPPLaA2rQOGjKIR/adTEKdJwoSTg=;
 b=EPGsDLnwcR1H4hK58KW36m3kKfKt3mkDG1NgkrYpiXBUfo5dYwWiaurXwn2lrOYjSO
 hvjYLh2EHEdeqyyyTe7qO471Vs3U90NuN+CH6HwuIGql7ZyXuSP2HoSWRUOfHU1zzsB+
 376Awxg7b+y5NqfpktbxsH4OE4JzCCbu/HnC4MwyX0EAE0UJlmXG2IeW0onaSNr2tayq
 kXXGQqTahdEdpSbi+nwchOnLDZaaqn1dltcZCKBlCMyshZrVkJGPvcS0ikQoWDCPcneV
 5J7/+PcjY3EvkVl8uXe9KGfwjXkbKjrvbjttuDXDzXIW58TCacYyFcmDkDxQXG9mO7LR
 PnTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EPGsDLnw
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqliteschema: bump to
 version 2.0.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 08:17, James Hilliard wrote:
> Drop no longer required python-setuptools runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-sqliteschema/Config.in                | 1 -
>   package/python-sqliteschema/python-sqliteschema.hash | 4 ++--
>   package/python-sqliteschema/python-sqliteschema.mk   | 4 ++--
>   3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-sqliteschema/Config.in b/package/python-sqliteschema/Config.in
> index 102a615765..3097102100 100644
> --- a/package/python-sqliteschema/Config.in
> +++ b/package/python-sqliteschema/Config.in
> @@ -1,6 +1,5 @@
>   config BR2_PACKAGE_PYTHON_SQLITESCHEMA
>   	bool "python-sqliteschema"
> -	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
>   	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
>   	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
>   	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
> diff --git a/package/python-sqliteschema/python-sqliteschema.hash b/package/python-sqliteschema/python-sqliteschema.hash
> index d5fe6e7af1..7fe8ee925d 100644
> --- a/package/python-sqliteschema/python-sqliteschema.hash
> +++ b/package/python-sqliteschema/python-sqliteschema.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/sqliteschema/json
> -md5  46da4f7575a0cc6c1d92377a279e5188  sqliteschema-1.3.0.tar.gz
> -sha256  1acdd5087cab54a099135a5623bb1960019816e2e3042b889c637901a832d3c3  sqliteschema-1.3.0.tar.gz
> +md5  b7fd543b82ad709f70cdc06c4ec8639a  sqliteschema-2.0.0.tar.gz
> +sha256  fe6cedddf10de8934ec1ace8319340a2256667e4a1a36f3da4fd1c0956124dc8  sqliteschema-2.0.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
> diff --git a/package/python-sqliteschema/python-sqliteschema.mk b/package/python-sqliteschema/python-sqliteschema.mk
> index c399ebd6f6..4b224048f9 100644
> --- a/package/python-sqliteschema/python-sqliteschema.mk
> +++ b/package/python-sqliteschema/python-sqliteschema.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SQLITESCHEMA_VERSION = 1.3.0
> +PYTHON_SQLITESCHEMA_VERSION = 2.0.0
>   PYTHON_SQLITESCHEMA_SOURCE = sqliteschema-$(PYTHON_SQLITESCHEMA_VERSION).tar.gz
> -PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/3d/ff/91cfff0c96f9ba2bddc27d6855db4907af77551a267b86740c8842beeb78
> +PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/29/e7/4482eebf6d8ff7923bb3fd0e9239d3e634f67125cfda3001c88506b939b9
>   PYTHON_SQLITESCHEMA_SETUP_TYPE = setuptools
>   PYTHON_SQLITESCHEMA_LICENSE = MIT
>   PYTHON_SQLITESCHEMA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
