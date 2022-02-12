Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC054C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 22:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B07A40384;
	Sat, 12 Feb 2022 22:17:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZeOZS2i-2NZY; Sat, 12 Feb 2022 22:17:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D40AB402C9;
	Sat, 12 Feb 2022 22:17:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23BC21BF3AF
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00A90400AB
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fGKdKHXLRaIL for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 22:17:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AB6640022
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 22:17:23 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id fy20so29669160ejc.0
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 14:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UKlhH3L9+DxYrH+LP9+j1SnWtG39xSqi7j+6q52l7qo=;
 b=UhMP+J7CTEqVHs9SFRdlfIjPIi/Gmfl+EPIyd3xuPkJWelVc1YbSSqujtzd6urd8zE
 rm5GTSgCqV9zpQ4bBx4ZejP5K97J8d+c35TrYpcOy8go9cudx8t1DEa80NV3h0U27o4a
 xFLjCa9P+HslAdmbcBvGK6/wG49FxDvaq6lNDWjdBeQIJqfDDsdQaIddXBKF4KgChDCA
 /a5z3AY86+CAObc+b6Kxxt7j390WTdDhCsbiFtqqW6xQnxrbppTLdl5DE9C/p/uhmeTr
 HssnnRkHfNbTppzEnfNdZZQxecJ2m317eLbgJTb71dVpsrQzsfNQo1UWXNFGdKaBFPTb
 778w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UKlhH3L9+DxYrH+LP9+j1SnWtG39xSqi7j+6q52l7qo=;
 b=0YVh1QE193qLDAPfUbhNCp9QzYyLWhnjPZcuALdczkAScNBBvn0IprvpOfYHhIM8hZ
 ZmDwxasw6GwwLDqZ6vLqVo+KHA6a44PTzhrYNCy8n1gh9CHmGUkXgDJO3nmmGe5eLyWh
 SQXRqEPTAqQrkv2yYo5PCpfVijrMTBLbilMO6x1/EnmKiTBGNyNk35v/9Ra3spwmKru+
 /lUocV+bMJ6k0gTCnibqkE6faMwt3ByE9qqNe8cuVCjLbJ5nu87Z9imHLLgNAumZQ3KG
 QdzgYgLI/9bo1wgmKERLWO27a3rOvUyORlXPfiUcgM5kEW3oZrIHUGQmr2RyIREIQTge
 rHpQ==
X-Gm-Message-State: AOAM5324Jrj7trS3yLK4y1vdGOwFIDBQiIn+ZBW/87L7LTkQZOeFJ1i9
 KjqgSbMQ4SfguoyycwuIo2RuhQ==
X-Google-Smtp-Source: ABdhPJywSH1fCDzKKD6lsqK7FJzp044QJampBAlMx2BcwvnLsSDqefDF2L/hYime7wPVwQZ+XYG8qA==
X-Received: by 2002:a17:906:608c:: with SMTP id
 t12mr5976726ejj.131.1644704241333; 
 Sat, 12 Feb 2022 14:17:21 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y11sm1224143edc.1.2022.02.12.14.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 14:17:20 -0800 (PST)
Message-ID: <e705b71d-9a21-89ea-d094-0f2678716dc5@mind.be>
Date: Sat, 12 Feb 2022 23:17:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220206115156.6042cc1b@windsurf>
 <20220206112620.1637342-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206112620.1637342-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH v3 0/2] Fix gitlab CI build failure due to
 missing HOST_ dependencies
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2022 12:26, Giulio Benetti wrote:
> This patchset fixes the gitlab build failure due to HOST_ dependencies(uboot/linux).
> 
> V1->V2:
> * add missing host openssl for linux on microchip_sama7g5ek_mmc_defconfig/_dev_defconfig
> V2->V3:
> * add specific custom linux version as suggested by Thomas
> 
> Giulio Benetti (2):
>    configs/microchip_sama7g5ek_mmc_defconfig: set custom linux version to
>      5.15.21 and add host openssl for linux
>    configs/microchip_sama7g5ek_mmc_dev_defconfig: set custom linux
>      version to 5.15.21 and add host openssl for linux

  Both applied to master, thanks.

  The entropy issue can be resolved later.

  Regards,
  Arnout

> 
>   configs/microchip_sama7g5ek_mmc_defconfig     | 4 ++++
>   configs/microchip_sama7g5ek_mmc_dev_defconfig | 4 ++++
>   2 files changed, 8 insertions(+)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
