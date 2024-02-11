Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D8BC4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 17:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25E8740486;
	Sun, 11 Feb 2024 17:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f8tQIBgGziZr; Sun, 11 Feb 2024 17:12:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3A4540492
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3A4540492;
	Sun, 11 Feb 2024 17:12:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 022581BF861
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D98F740715
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:12:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jf9zhrTAlLY6 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 17:12:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCF154071A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCF154071A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCF154071A
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:12:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7107C13F861;
 Sun, 11 Feb 2024 18:12:03 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Feb 2024 18:12:03 +0100
Date: Sun, 11 Feb 2024 18:12:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <Zcj_497nWslai-0t@landeda>
References: <20240211151546.1615163-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240211151546.1615163-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707671525;
 bh=kGQDy5b127u/rvjHJkMxuMDRcGcbgPQxoZiTHcLs2W8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H/q2IDrWd9mWMT7m5eS9inbSbh5lvkcj36FBKIYOahupJMWoa4BcXt1wDVHw1Jsua
 PwKtyLUDVjCU+Czdp7t3ExG5Sqw/IaoTc3opArT8z54RjAX4UYMDDFyin1ZVRyFLzJ
 uplfgercJmTGszhoq1HZlTyz07uioB5DCHs9XGto8ru8Riqc1Y7s2Vsd6pC9Fke7QB
 NF2wHPdLeyhJoDSHiGfEG+r5zhi4YhHi63LkxdLD/3SHXmfrVNlDtAO+sPNfDkh28A
 IxZioQ7uy92Bi8KYFuBXBp6dWrtzfF48NZzDQ3xw8LUf8X4heEE6ma8+C3uLJcnMDj
 n08OLsoC+pU/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H/q2IDrW
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: bump version to 20.4-Nexus
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

Bernd, All,

On 2024-02-11 16:15 +0100, Bernd Kuhls spake thusly:
> Release notes: https://github.com/xbmc/xbmc/releases/tag/20.4-Nexus
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
>  package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-
>  package/kodi/kodi.hash                                   | 2 +-
>  package/kodi/kodi.mk                                     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
> index 2ed4961e68..b785a71b6e 100644
> --- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
> +++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
> @@ -6,7 +6,7 @@
>  
>  # Not possible to directly refer to kodi variables, because of
>  # first/second expansion trickery...
> -KODI_JSONSCHEMABUILDER_VERSION = 20.3-Nexus
> +KODI_JSONSCHEMABUILDER_VERSION = 20.4-Nexus
>  KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
>  KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
>  KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
> diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
> index 728e25606c..9810193014 100644
> --- a/package/kodi-texturepacker/kodi-texturepacker.mk
> +++ b/package/kodi-texturepacker/kodi-texturepacker.mk
> @@ -6,7 +6,7 @@
>  
>  # Not possible to directly refer to kodi variables, because of
>  # first/second expansion trickery...
> -KODI_TEXTUREPACKER_VERSION = 20.3-Nexus
> +KODI_TEXTUREPACKER_VERSION = 20.4-Nexus
>  KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
>  KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
>  KODI_TEXTUREPACKER_DL_SUBDIR = kodi
> diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
> index 81d26f1cb1..7b26778b68 100644
> --- a/package/kodi/kodi.hash
> +++ b/package/kodi/kodi.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  1dbf1d9f4d5eeeb6aa2593813703343a8a377e88a00c68226354e4d67467f64d  kodi-20.3-Nexus.tar.gz
> +sha256  ccb2d3e382b5ae628a89db2325f5e778f1770a2a182f6eaa25645a22ccdffb18  kodi-20.4-Nexus.tar.gz
>  sha256  f38c4a4e7a4f4da6d8e83b8852489aa3bb6588a915dc41f5ee89d9aad305a06e  kodi-libdvdcss-1.4.3-Next-Nexus-Alpha2-2.tar.gz
>  sha256  584f62a3896794408d46368e2ecf2c6217ab9c676ce85921b2d68b8961f49dfc  kodi-libdvdnav-6.1.1-Next-Nexus-Alpha2-2.tar.gz
>  sha256  719130091e3adc9725ba72df808f24a14737a009dca5a4c38c601c0c76449b62  kodi-libdvdread-6.1.3-Next-Nexus-Alpha2-2.tar.gz
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 97d02e9b92..d057eb3f05 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -6,7 +6,7 @@
>  
>  # When updating the version, please also update kodi-jsonschemabuilder
>  # and kodi-texturepacker
> -KODI_VERSION_MAJOR = 20.3
> +KODI_VERSION_MAJOR = 20.4
>  KODI_VERSION_NAME = Nexus
>  KODI_VERSION = $(KODI_VERSION_MAJOR)-$(KODI_VERSION_NAME)
>  KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
> -- 
> 2.39.2
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
