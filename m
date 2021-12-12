Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFA6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D5C54268F;
	Sun, 12 Dec 2021 14:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xLlcn8ld9e0E; Sun, 12 Dec 2021 14:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AA8A4268D;
	Sun, 12 Dec 2021 14:10:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7D921BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A74EF85664
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MjzpuDD5JTnV for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:10:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B53DA85663
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:10:19 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id t5so43901780edd.0
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Iu6wqxpz0Vck9ZiZUcdcmXNWQ64jbwAWS2lxcD6UUzI=;
 b=XCeBzzVCm9+SFEA80Z7/Ss+ZzU8gT93wVX216YVM38zndVZKGD6axZq5/KGSlMEFA7
 10O3Y5lX80aVpOL8KPrAKPGjTt4UZLyzLzmpMtoHOKT7sMXEVmcVjVYtLxT00OIOWDLW
 zLH+NeG8gOOt1BLVyK/g2QylFXCXNpo3yKxPiCSY6eDB8JX9JYpWX7jWmZipl/hGwz1Y
 egymg4VpxUqY5EaMc2jeYBO8bT8P4Ui72mfDXhPdGcgopZ2InHOVyF9j0dEMid5bgmEI
 2qGgu81sSy+ZBKveeHHp20+LJX96fnY2wsjY94xQ/2uAdhqrMoBCxvCSgr3ElHSF5y7E
 8VeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Iu6wqxpz0Vck9ZiZUcdcmXNWQ64jbwAWS2lxcD6UUzI=;
 b=2dAhNM3fTDhl8ip1MHBwhDZC3j6itc+MqrhrsQuoEn2qTk+bZxig1/FgmKXbzbZmff
 BvEMJ9JwaXn5dKyAIQpoVE1xXFHvjmKGOtXSDaNOEmBp2lm3ZY0c75nnINJJliMSgG8a
 Fcr4JAQHH4nMxM8fOtuWIWqnUXU1YwLJTowjjMNmY2KsdvWsXeb+jKT8ajI2kFgEt4qv
 +n90+0QESsg22Cb++4oOuHGHCEW2Y5mxi/G7VzRKI3tf+lcZPdBoAxTIyOqe36O3i1nh
 LXEvnLXER6PKRfPhXLISIk7HqaHIaQKJtaeR6jNdqt443PdXqKn1q0OE78ibapxDbME+
 BeEQ==
X-Gm-Message-State: AOAM532s2q03zky+t3B6NAXKLVjCukqSuH0JBe17/3mDP4IaIa1vblH1
 e0XaXfEhN3lKYvvelf1EE3XAGQ==
X-Google-Smtp-Source: ABdhPJybkVRC+AcWEmNOsO2ffpkkMxcjwrCK6A0s5Fc6UeQxRMasFCEdW3qibINzT+lAB497rnd2tg==
X-Received: by 2002:a05:6402:2686:: with SMTP id
 w6mr55068375edd.141.1639318217911; 
 Sun, 12 Dec 2021 06:10:17 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u10sm4655527edo.16.2021.12.12.06.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:10:17 -0800 (PST)
Message-ID: <4c08bc73-5525-d664-25ed-2a4f929fd6e8@mind.be>
Date: Sun, 12 Dec 2021 15:10:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20211209214751.459313-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211209214751.459313-1-angelo@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH] package/cups-filters: bump to version
 1.28.10
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/12/2021 22:47, Angelo Compagnucci wrote:
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/cups-filters/cups-filters.hash | 2 +-
>   package/cups-filters/cups-filters.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
> index 3b65e702c5..aefb67f651 100644
> --- a/package/cups-filters/cups-filters.hash
> +++ b/package/cups-filters/cups-filters.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256 5bad0b931f8293082f8773b34d5c4fed66415d2bf268b0798889e5f593c0ba61  cups-filters-1.28.9.tar.gz
> +sha256 8cb40355287d65ea03e90dfa7e2d34f0d46752957c8a6d4e96ab6fe6c581e5d2  cups-filters-1.28.10.tar.gz
>   sha256 38192ffdaca98b718f78b2d4abc38bb087f0bbcc9a16d212c98b903b985f900f  COPYING
> diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
> index bc69b3832d..63b85f0b8b 100644
> --- a/package/cups-filters/cups-filters.mk
> +++ b/package/cups-filters/cups-filters.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CUPS_FILTERS_VERSION = 1.28.9
> +CUPS_FILTERS_VERSION = 1.28.10
>   CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
>   CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
>   CUPS_FILTERS_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
