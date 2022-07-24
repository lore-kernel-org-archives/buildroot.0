Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D805C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C421E417C4;
	Sun, 24 Jul 2022 09:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C421E417C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XPiMQsg3NJR9; Sun, 24 Jul 2022 09:12:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B50041752;
	Sun, 24 Jul 2022 09:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B50041752
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A8611BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42C0B4031E
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42C0B4031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCwgaqf1DVkc for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:12:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C73040025
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C73040025
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:12:48 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m17so11702739wrw.7
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EadkKlhX9F2dHWXisap+9zpvXsTTCCWui/s/H7HeHwM=;
 b=gZOezQJOLmWdiFs3XE/uhJvh4QJX13SG6Z6jhq4c8fnp4ic6b2OajwxqnvSv/kNwPO
 YGyboqj48dxV5tDgzMjFrCUGPCabTD8g0yNO3hwB94alamncAtgsWlHiBL+DpcZFB6PB
 Y4cVmgDieT+GxByA/aQCNeYFpJBKZeRUuFtdcZXY/nXF5IsULpI36BP5nHAvxs4/QIb+
 zRRfnnn0NnzvnfdjQyPQsG2IU17nhlr5XxHfWyv7rLpO22CxVHwtLfb9XbC6A98jB0gs
 btilUjba84w5/ISKTbj4flML8XPz27dJhqWIOM6iF79mmkhvNRdok42GdPofP2fXT2gP
 GT1Q==
X-Gm-Message-State: AJIora9CD1a4Jgq4/3G9tBBkGSwy28sPorEJU9R5EqCwcwwT5WFwTpKx
 wObrk2JWtRFI2dNw8dP1nzP3yKFfTq9y/g==
X-Google-Smtp-Source: AGRyM1t1Z0nvHtEsh/XTRNsnmkRvntGOkv6ZwL1sfxjeK88TmlfuELBd3v0MZJVOT97OU/R1ckiLYA==
X-Received: by 2002:adf:f6c8:0:b0:21e:4fe0:cdfe with SMTP id
 y8-20020adff6c8000000b0021e4fe0cdfemr4595780wrp.158.1658653966060; 
 Sun, 24 Jul 2022 02:12:46 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a5d550c000000b0021e4fd8e10bsm2505110wrv.11.2022.07.24.02.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 02:12:45 -0700 (PDT)
Message-ID: <44a31825-021e-2f79-ffe4-2650cef65f75@mind.be>
Date: Sun, 24 Jul 2022 11:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220705172239.1272897-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220705172239.1272897-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=EadkKlhX9F2dHWXisap+9zpvXsTTCCWui/s/H7HeHwM=;
 b=cMlISmTPghLolzdZgs4m5eel6Pw3xUCpeMXJocoH3tWMon9AndGnHCzTaDqYy6RlP6
 5+E9rRxs84dEDv3jDaqS2i+hpR9HPUKX0WRwocPC7dFwGBX1rk6rn7MjaxKU0UpDKZa8
 bdgIY4g3lzP9bJdZA6IJMkQ/LyLsIitKP3oraiPlHZP7VXZ937srv8xpjQHQpDTMrVyV
 03C7IP6ElFLpK50Ghe+0Kb9qaFgYO6KmJBwTX917SHq4a7ziA285JV0OhFQCBWmwyoqN
 ZenWSUOwqkZmG1Ra4BNYVO0WfackLhtvRGbMlaywk/eK1sSKXjlSY6yJ71SC89f2J2ln
 iQjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cMlISmTP
Subject: Re: [Buildroot] [PATCH 1/1] package/bcg729: bump version to 1.1.1
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



On 05/07/2022 19:22, Bernd Kuhls wrote:
> Changelog:
> https://github.com/BelledonneCommunications/bcg729/blob/master/CHANGELOG.md
> 
> Updated license to GPL-3.0+:
> https://github.com/BelledonneCommunications/bcg729/commit/2c3ff1ae1af9b1571e3e8644c067965def39b747
> 
> License file was changed to LICENSE.txt:
> https://github.com/BelledonneCommunications/bcg729/commit/089bb3454409d2cd630a6b3890a602b084e7ca89
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/bcg729/bcg729.hash | 4 ++--
>   package/bcg729/bcg729.mk   | 6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/bcg729/bcg729.hash b/package/bcg729/bcg729.hash
> index 4dbfbbbbb2..2eb80a0407 100644
> --- a/package/bcg729/bcg729.hash
> +++ b/package/bcg729/bcg729.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256 94b3542a06cbd96306efc19f959f9febae62806a22599063f82a8c33e989d48b  bcg729-1.0.4.tar.gz
> -sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> +sha256  68599a850535d1b182932b3f86558ac8a76d4b899a548183b062956c5fdc916d  bcg729-1.1.1.tar.gz
> +sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
> diff --git a/package/bcg729/bcg729.mk b/package/bcg729/bcg729.mk
> index 426cfd90af..f89e535546 100644
> --- a/package/bcg729/bcg729.mk
> +++ b/package/bcg729/bcg729.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -BCG729_VERSION = 1.0.4
> +BCG729_VERSION = 1.1.1
>   BCG729_SITE = $(call github,BelledonneCommunications,bcg729,$(BCG729_VERSION))
> -BCG729_LICENSE = GPL-2.0+
> -BCG729_LICENSE_FILES = COPYING
> +BCG729_LICENSE = GPL-3.0+
> +BCG729_LICENSE_FILES = LICENSE.txt
>   BCG729_INSTALL_STAGING = YES
>   
>   ifeq ($(BR2_STATIC_LIBS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
