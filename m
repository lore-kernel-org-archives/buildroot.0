Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BDDC433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 07:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B4F18348C;
	Wed,  2 Feb 2022 07:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFax4Gt1U4an; Wed,  2 Feb 2022 07:41:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ED6E8343F;
	Wed,  2 Feb 2022 07:41:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C122B1BF859
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 07:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8D50400EA
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 07:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U7mCQYacewic for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 07:41:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6FDB400AB
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 07:41:38 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ka4so62396138ejc.11
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 23:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9Pqa7nbsUyF03JnkNr6+5v3aGP8EXzfvJb3/GhQT2zQ=;
 b=EsqMy8XmoqbuYUvUaRys704sDCi9dzreW12MiHp/DbhSPwHbQQg/Pa1mqOGv8XnhO6
 CQlhL+KMcTh6M9eXSi1pMVB4lOedb4meUkFwBj5djWDitI9vo0efgr7hbE9dCLtCa8Ps
 ZUayIbI6JLxd06qJXDNP9F/QgZ/AUHAwjTVAE0TDEKvSupYeaNj5hJSeAiPwgoj9GiTV
 8sSAJLp3NBhp5mUvjcXH28+t00tTCck8OzdpEbQKoHqnzO7VAVY+njB5wCqQRTJxs/G0
 JssqkBa1jIiilAUxME/mrt5vetJeHscKvoW15qnsNycyYA/bgobrVCK2Nfw6re/SAc1T
 IY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9Pqa7nbsUyF03JnkNr6+5v3aGP8EXzfvJb3/GhQT2zQ=;
 b=SoXBg2AszKrJE1JdDfFLSSgifhrTHeTjYZs3WfiItBUnmuorpTpYi9zI60njcNQIIN
 JgliCL6IeZaNxJDDsmP6iHWX1ZHMueJq7akXGmiw7j7ZUG8u6w27hmyp46/ktLqyr1rs
 EQqMCZ9SybZFL8cAn8EfuUqaCUq5EyXMBeVm6hNHStSkvsJ46J7IVtMorxNRJH3k/Pr2
 V9tLahMH8j5iQjMSN56AIpuo/dHp2e1quYh/T8dFXoq84ZQWal2cWMzaQU0p6TokB2D8
 0Me1WF2DhLH1vGxvXtFquWBR8gutCLOo3lNg9cMtyY9+KP1Os/REAdnQAqOLkL2N6Fps
 Ut0w==
X-Gm-Message-State: AOAM533YzDgOHpWDJ6e32bxUP+b3n4++Xu1AKcy95onTXRqQHFkItNV9
 WKfH8OdjYb1MvEEvGJIrSUgckME3LqZVUw==
X-Google-Smtp-Source: ABdhPJxM+m7tNzvTFACiVefw9SPKRsmuQ3ppE0+jMvFdRGnDXJtuEnllt/lapka2nqUz3kraNh0Z4w==
X-Received: by 2002:a17:907:1c10:: with SMTP id
 nc16mr23435428ejc.342.1643787696800; 
 Tue, 01 Feb 2022 23:41:36 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b16sm15417201eja.211.2022.02.01.23.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 23:41:36 -0800 (PST)
Message-ID: <d6ff992c-a84c-d335-3ddb-2122f7c744dd@mind.be>
Date: Wed, 2 Feb 2022 08:41:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220201232203.333403-1-giulio.benetti@benettiengineering.com>
 <20220201232203.333403-2-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220201232203.333403-2-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [URGENT 1/1] package/util-linux: fix host build
 failure
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/02/2022 00:22, Giulio Benetti wrote:
> The UTIL_LINUX_FIX_DISK_UTILS_COMPILE workaround is needed for host
> building too. So let's add it to HOST_UTIL_LINUX_POST_PATCH_HOOKS.
> host-util-linux is used a lot, so this patch fixes a lot of future
> builds.

  Darn, I tested that, both with and without BR2_PACKAGE_HOST_UTIL_LINUX set. I 
don't understand what went wrong in my test...

  Anyway, applied to master, thanks.

  Regards,
  Arnout


> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/util-linux/util-linux.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index e59ef7dadc..5a4ff64d01 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -41,6 +41,7 @@ define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>   	touch $(@D)/disk-utils/raw.8
>   endef
>   UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
> +HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>   
>   HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
