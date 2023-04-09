Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3737AC77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 13:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE0C640022;
	Sun,  9 Apr 2023 13:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE0C640022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1njhg7uWISQs; Sun,  9 Apr 2023 13:57:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E30934015E;
	Sun,  9 Apr 2023 13:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E30934015E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B40DD1C2C89
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88C4B415DE
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88C4B415DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H-XVNnE5LJ9O for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 13:57:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 389EC409F1
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 389EC409F1
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 13:57:09 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q29so2359277wrc.3
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 06:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681048628;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SN+B0a28D6tCBHKxJUY7wkeyCwbkVO28jWXCa/vp4eQ=;
 b=7qlvnoYVH4Sv93fzUF//IcICNMP1IL3bGS3Dzt/lGkl13UReJeaKtEz/cPN5RASmUI
 9qfO8dNlTiaQ3DHHA+ybBJGhYiJQt7y37MK6wDOV0jkjmXYoKaBfXdn7v2qCB4v+T5Ly
 ao+u6fEBc8Xc07O9bXZGePcriF0oblqpLFPY7ZA0lFEuZ8SBVxsZP96nw39R/zcQPqlf
 5iuwOizpp30xrw7txdaozK5PrSyYubG8FRS+2EWqOMbN5dSlD2nGel1qWubQjaYrRKZf
 gtSAHkuX6isbacnIZ0uAw+FZYN/unweWrUQXogV1XVv6ZIABNpXHwZoYQonTgUKgsUxN
 caCA==
X-Gm-Message-State: AAQBX9eRXzPqPZFVDxHATd5vbWw5rDsfU5dxwiq/4rvMmbrhEJNnO4LY
 q/K2FkwLkWxnFgDCrLeCtoBqpg==
X-Google-Smtp-Source: AKy350YX+WfxOyi+CDD2Ik1Y37Ta5d0vvnWGD1EwjJ6rlLDG+v6f8rEqoXpiscX5za6BgaBJ7KaHfg==
X-Received: by 2002:adf:dc83:0:b0:2ef:399c:1051 with SMTP id
 r3-20020adfdc83000000b002ef399c1051mr2909552wrj.20.1681048628151; 
 Sun, 09 Apr 2023 06:57:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 k6-20020adff286000000b002eaac3a9beesm9383457wro.8.2023.04.09.06.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 06:57:07 -0700 (PDT)
Message-ID: <26c3054b-c36b-1822-8521-90ff756e9a3e@mind.be>
Date: Sun, 9 Apr 2023 15:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20230405202220.705670-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230405202220.705670-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681048628;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SN+B0a28D6tCBHKxJUY7wkeyCwbkVO28jWXCa/vp4eQ=;
 b=DvXbLeal18aVkn13z5QSDny8y3MDvRsjAnyeB1NTiNuF8UlW4ybLnrfvGtVuDzhtEn
 oWyO/+fad3e/qqVg6vX9BfuqsAbok4IPk8nuSX9rS7l59IeewDxwVRvjBDT0/D8Zuvp7
 1VKU4gxPKPrCE200Z70lOx6uTJ2Y72xhZrqAAmqIRfJgirkXUPlQn4khgLrkxMfkuvLI
 CDo1PBYBTxnXQ9MjanzkggpbjnNtFm/3rne8xkarth1NrBHsEue8W2rf388Oo/ji/RLv
 BuTX8Vaa+r51Wkjl9UVBtnOfxNtYH/DrXFOXENH3V06zGGtgITJyj6O+YBAH4FdakmFu
 ROgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DvXbLeal
Subject: Re: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.3.2
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



On 05/04/2023 22:22, Julien Olivain wrote:
> For change log since v2.3.1, see:
> - https://github.com/FluidSynth/fluidsynth/releases/tag/v2.3.2
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/fluidsynth/fluidsynth.hash | 2 +-
>   package/fluidsynth/fluidsynth.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
> index 3de41b1682..0f8f04d676 100644
> --- a/package/fluidsynth/fluidsynth.hash
> +++ b/package/fluidsynth/fluidsynth.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  d734e4cf488be763cf123e5976f3154f0094815093eecdf71e0e9ae148431883  fluidsynth-2.3.1.tar.gz
> +sha256  cd610810f30566e28fb98c36501f00446a06fa6bae3dc562c8cd3868fe1c0fc7  fluidsynth-2.3.2.tar.gz
>   sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
> diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
> index ad1ed7df11..854ed00032 100644
> --- a/package/fluidsynth/fluidsynth.mk
> +++ b/package/fluidsynth/fluidsynth.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FLUIDSYNTH_VERSION = 2.3.1
> +FLUIDSYNTH_VERSION = 2.3.2
>   FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
>   FLUIDSYNTH_LICENSE = LGPL-2.1+
>   FLUIDSYNTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
