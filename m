Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936A9EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C54060F66;
	Sun, 18 Jun 2023 13:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C54060F66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GhLReuD61FSP; Sun, 18 Jun 2023 13:07:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 839866059F;
	Sun, 18 Jun 2023 13:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 839866059F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 336551BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19DF660067
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19DF660067
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5CFBj0asL3FR for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:07:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 103596059F
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 103596059F
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:07:44 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-988a076a7d3so23919166b.3
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687093663; x=1689685663;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2JoJ4bRauDTB/XF5Mbb0IL7lNNZIffjuGiCxWrdTGiQ=;
 b=gPwqno3t8Kb7RnP129hXaPr7VTDJkFypKTiEMWMQeu2U4S71xlk3n4nESbmdLvINOw
 PByR0wavTqJzDRbRrmKdTrCX5sPTr65WgT8P6hE6qRPUULiaTHcGtrnbPvO3JI34TUsg
 /PdoNkSa73NHokGm3o22BMAN4ZgF/APh6NTyKO00Cvkb5PGEZ331EDFh3/z9EbsOZJPx
 Hr2l0ruoFqTQCbQd3D7QWzUm/1QIBaFoyvT2zzMsMYWk8JzTM2qF4/Z67b0gzUGgq529
 QavHiM4DsO8ZtJSwg5ZX5PpiGjVpMj6sYXV84YuGQHQt+mwANXUCTFMRBrmwYvfnfeBA
 CgqA==
X-Gm-Message-State: AC+VfDwCekJj0i8ZY07F8W7Hea+nBfcbSv7Ddw7miZ8mjgA6qv4WyX7i
 nSWntl87MYiCZxl3OipsG+jNmG10nyHnCGG9MNE=
X-Google-Smtp-Source: ACHHUZ45h9JR9bW2Tj0ryXvId2wKG+GwrP2m6svyOgY53VZTm+/fnGj8YDQZIg1w2EGQxCf33Ob3qA==
X-Received: by 2002:a17:907:5ca:b0:987:59b6:c9fa with SMTP id
 wg10-20020a17090705ca00b0098759b6c9famr4141737ejb.19.1687093662987; 
 Sun, 18 Jun 2023 06:07:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 qw4-20020a170906fca400b00986b1fef373sm2695008ejb.184.2023.06.18.06.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:07:42 -0700 (PDT)
Message-ID: <8e6c1ebe-dac5-7ba8-69d8-0aded699c167@mind.be>
Date: Sun, 18 Jun 2023 15:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605072454.1883633-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605072454.1883633-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687093663; x=1689685663;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2JoJ4bRauDTB/XF5Mbb0IL7lNNZIffjuGiCxWrdTGiQ=;
 b=DxiDtRM/uhBHHfEZdAM+cIbqU9xqT03VO9pQfT64DIrveUqfh7ctpLK8W79j45+Npb
 Oim/yMVSTRdjj6aiJCkuj5Gs3T6b3b0sjAhpsimBH1AlaOiuy+OT8J5cXBvUeBPWfiMt
 l7VICqJaNJVlObpnHsqYRm4wzRQrqtz9IDej4UzBYr2NibrgtEux2GEa1ye5pvpG101G
 fDXSYz0+jQE6dh4Jlwzz46eF/UUa1ELHHcOkyTU6s6fDZYocg0Rw2qYzTqAtPNhPXgqy
 hLbz7BjUHleWl0u4MaWO4LqXmtKFNULFJZN/6mVGywiF3CT/eNfQfL3K7lx6nV7AmhZP
 +PTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DxiDtRM/
Subject: Re: [Buildroot] [PATCH 1/1] package/python-yarl: bump to version
 1.9.2
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



On 05/06/2023 09:24, James Hilliard wrote:
> License hash changed due to syntax update:

  It's not just a syntax update; the actual license text was added (before, it 
was just a copyright notice).

> https://github.com/aio-libs/yarl/commit/cc4a11e961fb24b5658df1c5125b26cb44c0b875
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-yarl/python-yarl.hash | 6 +++---
>   package/python-yarl/python-yarl.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
> index 9725e0058b..624297aeba 100644
> --- a/package/python-yarl/python-yarl.hash
> +++ b/package/python-yarl/python-yarl.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/yarl/json
> -md5  57c82725b9f4895eecee45faf5e61a54  yarl-1.8.2.tar.gz
> -sha256  49d43402c6e3013ad0978602bf6bf5328535c48d192304b91b97a3c6790b1562  yarl-1.8.2.tar.gz
> +md5  4e46a0c7078d34d9734a7c5d182dee92  yarl-1.9.2.tar.gz
> +sha256  04ab9d4b9f587c06d801c2abfe9317b77cdf996c65a90d5e84ecc45010823571  yarl-1.9.2.tar.gz
>   # Locally computed sha256 checksums
> -sha256  56d6ac6c8105c0a51304c21db060e361af9a8ea0af9a75c239c28b5d13693838  LICENSE
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
> index 77e0c91383..e4424ff577 100644
> --- a/package/python-yarl/python-yarl.mk
> +++ b/package/python-yarl/python-yarl.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_YARL_VERSION = 1.8.2
> +PYTHON_YARL_VERSION = 1.9.2
>   PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
> -PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/c4/1e/1b204050c601d5cd82b45d5c8f439cb6f744a2ce0c0a6f83be0ddf0dc7b2
> +PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/5f/3f/04b3c5e57844fb9c034b09c5cb6d2b43de5d64a093c30529fd233e16cf09
>   PYTHON_YARL_LICENSE = Apache-2.0
>   PYTHON_YARL_LICENSE_FILES = LICENSE
>   PYTHON_YARL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
