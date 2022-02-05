Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1AAC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A49FB81260;
	Sat,  5 Feb 2022 22:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JmmhqZH4MV5T; Sat,  5 Feb 2022 22:48:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5418812F8;
	Sat,  5 Feb 2022 22:48:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9FE41BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C77B34010E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:48:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rvbt4TL00F4T for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:48:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A17ED400C7
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:48:47 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id o12so30556828eju.13
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 14:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oIG0wH5nvpkWuOUMtFSgvib1kB4vGRhWtZViE7cYM2I=;
 b=e+sJLpYRQXBChSWZuvQeSANCKaDcogSpnIUC1iQnpJ/rID3Qz92R7JiQ/So4if4qie
 vZ/MIb0oYfoxZbK9IF8iowlziZkKZAshKgG0CG2NAAFpgG9LkPQ6oH72sQsK85w3L4D5
 lg62lhkoOvpv1ktsAiU3T9Vcl4OgcQP42boImXBgKe8nE88um4vZPjbpmVkOO5h//mMN
 O9V5vpEqhhdXKz66fe+o0UIRKC/uU9nlPoAfZZk5C5B0dZuBJ4Dfve3NUdieDePeX0zv
 r9GCyHfffuypb8cGNhH0M3j0K6K7mFL2uEfYnmRzZ6RbwjZO87E9RGttB7ZLCc3huAr3
 iwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oIG0wH5nvpkWuOUMtFSgvib1kB4vGRhWtZViE7cYM2I=;
 b=GxMdU3Vf9s452atCnde4ONu97b5X7Sii5cbrKBElrCkmoFZh0equDTYN+fcebiMOqA
 F9y8rggTRx6cOauRX4WPkgFkfft/x3ePtfFyCHyMQDzDhpoC9SuUP5pCXjTKQChsSRHf
 6++SHIQdDDU1SV8aXYtmJUaZN6EifxT6Rf0amxLEZbi1S7Khwt77niROziOPZW+3kQ55
 aPkt+maAU2UjmDueNt1BPw8X4MYljuCXAlVngjtTUXRCxZMPmnCMwQ5jOCLvoymcwH4M
 zAKN34rVKco2GQA81VKZ4+YAGaUUAir7yfC7nsnEsUDM7kmVdgkrUQdPZXTtoa9uU7MV
 Qvsg==
X-Gm-Message-State: AOAM533uVBXq8eTeF9tQvbiJ4zNQs+zCRKa4J601CarNnvaqoI11Twqi
 7JXxy3otsbqqkeJp0aiOXOEIKw==
X-Google-Smtp-Source: ABdhPJyFjthTYHVu0xkGEbmd0TAN6vl/h8MOOk8sLT1GRWSndsdpzJUNPgYiK/VSSQeEwzoWiK823g==
X-Received: by 2002:a17:907:1c02:: with SMTP id
 nc2mr4726156ejc.661.1644101325651; 
 Sat, 05 Feb 2022 14:48:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cf24sm2022710ejb.133.2022.02.05.14.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 14:48:45 -0800 (PST)
Message-ID: <b4010178-0421-baf4-0d9b-d916a2fcfc77@mind.be>
Date: Sat, 5 Feb 2022 23:48:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20220124080013.83231-1-christian@paral.in>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220124080013.83231-1-christian@paral.in>
Subject: Re: [Buildroot] [PATCH 1/1] package/runc: bump to version 1.1.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/01/2022 09:00, Christian Stewart via buildroot wrote:
> Added LGPL-2.1 license specifier: libseccomp is statically-linked.

  Is there also a license file for that?

> https://github.com/opencontainers/runc/releases/tag/v1.1.0
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/runc/runc.hash | 2 +-
>   package/runc/runc.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/runc/runc.hash b/package/runc/runc.hash
> index 4ef04132bf..38d9f52510 100644
> --- a/package/runc/runc.hash
> +++ b/package/runc/runc.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  0eaf2f6606d72f166a5e7138a8a8d4d8f85d84e43448c08c66a1c93ead17a574  runc-1.0.3.tar.gz
> +sha256  a8de57edbf0ff741ea798ccdd99ac0e1b79914f552871bd7cd92b0569f200964  runc-1.1.0.tar.gz
>   sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
> diff --git a/package/runc/runc.mk b/package/runc/runc.mk
> index c4e45a00a9..a40075544e 100644
> --- a/package/runc/runc.mk
> +++ b/package/runc/runc.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -RUNC_VERSION = 1.0.3
> +RUNC_VERSION = 1.1.0
>   RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
> -RUNC_LICENSE = Apache-2.0
> +RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
>   RUNC_LICENSE_FILES = LICENSE
>   RUNC_CPE_ID_VENDOR = linuxfoundation
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
