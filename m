Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859E7C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 18:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FCF8607A3;
	Wed,  7 Feb 2024 18:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZLzwxqrisldK; Wed,  7 Feb 2024 18:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 575C3607F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 575C3607F0;
	Wed,  7 Feb 2024 18:49:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C05DF1BF20D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 18:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA1324085C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 18:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U2gufX4nDMMa for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 18:49:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92CC3401F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92CC3401F0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92CC3401F0
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 18:49:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [84.198.244.196])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C27F360137;
 Wed,  7 Feb 2024 19:49:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 19:49:35 +0100
Date: Wed, 7 Feb 2024 19:49:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZcPQv10uGwEEseaj@landeda>
References: <20240207173911.3704142-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240207173911.3704142-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707331778;
 bh=gU6eQnTX+UtBUvoSeGaGquZR8y5ggubLF0NnCBLL9yU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eF1mfVZ8Sp11a2Ux3Gt+ty1q3sfptftaMt8q66kA0kMUH3vBvHtbIzzLAEzAJ8zKB
 QjqmuzdyMzOANMo4RY8SY/3Ha43nDMIUUu64KUeQbeGlf9QaDeSc14MHU3iIFRe7Ub
 2vv+WvXCNsUPlsOBS6vivEvh1uJm8rUUjj1wrCu4KZC5FJbbxIyfLPSb0yKX+L0Pqs
 3yJBnxSvKcmJN3KpVu/b8vGjLAkpx4Wceyl9Cy71BHHoSwfoYOAIL6g2XMRqUGX3Cc
 FbcgcSJxUJwAgtKOrABIHECjpRQ55WrFscfMWKKsKEgnCr8POlJ4caaYahhFJ9g44F
 vm+Dg2rmZcz9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eF1mfVZ8
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: drop README.md from
 license files
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Darrio, All,

On 2024-02-07 18:39 +0100, Dario Binacchi spake thusly:
> The patch drops the file README.md from the license files. Indeed, the
> licensing terms apply to third-party libraries that uuu links to, and
> even though they are bundled in the source tree of uuu|mfgtools, they
> are not used by Buildroot as we use the ones we build. Therefore, the
> actual license file of the package is the file LICENSE.
> 
> Moreover, this also leads to simplifying the bump to new versions.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master from Brussels airport, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/uuu/uuu.hash | 1 -
>  package/uuu/uuu.mk   | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
> index c231d5d729f0..e45cbb868078 100644
> --- a/package/uuu/uuu.hash
> +++ b/package/uuu/uuu.hash
> @@ -1,4 +1,3 @@
>  # locally computed
>  sha256  6e65fc028afacc94b805ae376e3da3864dcb2570d425037820e716207ab70373  uuu_source-uuu_1.5.165.tar.gz
>  sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
> -sha256  1b3d030a1824d633f75194743bd92bc1ed2d9a4bf1915bc11e49bf4c0c54012d  README.md
> diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
> index 80d5e1937a97..5800277b10d5 100644
> --- a/package/uuu/uuu.mk
> +++ b/package/uuu/uuu.mk
> @@ -8,7 +8,7 @@ UUU_VERSION = 1.5.165
>  UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
>  UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
>  UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
> -UUU_LICENSE_FILES = LICENSE README.md
> +UUU_LICENSE_FILES = LICENSE
>  HOST_UUU_DEPENDENCIES = \
>  	host-bzip2 \
>  	host-libusb \
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
