Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB24CF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 19:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9049640015;
	Sat, 21 Sep 2024 19:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2d_nTrU9z0Wc; Sat, 21 Sep 2024 19:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 459E5400DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 459E5400DD;
	Sat, 21 Sep 2024 19:58:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63D2E1BF577
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 19:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5254B406DC
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 19:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQWpmUC0i_1h for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 19:58:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0D06406B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0D06406B2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0D06406B2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 19:58:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2B88C5FFBA;
 Sat, 21 Sep 2024 21:58:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Sep 2024 21:58:50 +0200
Date: Sat, 21 Sep 2024 21:58:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <Zu8leshuQAHWF9uD@landeda>
References: <20240921190258.3650726-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240921190258.3650726-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726948733;
 bh=umzY7JUzcHXyp5PdgO41n23im53zS6tIC8NKmml5aGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kMmkzXjuV9E/Puh86dJlZeZ8zWUWurqZC1PemDOljMP5mtnMH01LDN33YLddk7/MK
 PxTDP2WJYrx7Rdke7+2PH45g2swfpFpV0O8N0W7SMwjm+MwV/1WIvZsxIkgZrnz4+e
 AwaQqaMoKazTxiaDPnYNY2KvuOL6+X+B262AumMmsKBsFD2K2BXwwz3dvl4lHcnx2P
 evtxig7STGjGipdRY782c/JEi53uNSfVKOdSdkGjB8G1BL57FaF0+tbbsTR7OSQdXy
 1hbsocsseogisE7NkQcRPQPeIq8eBLq6s0x8AyP/P/kFKLQHGWy0t1+/YKF2tZnuIa
 oBjB324zrtYYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kMmkzXju
Subject: Re: [Buildroot] [PATCH v2 1/1] package/kodi-skin-confluence: bump
 version
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

On 2024-09-21 21:02 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: bumped to current commit, fixes teletext button broken in v1
> 
>  package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
>  package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
> index 487aa7e5f1..3cf17c5e13 100644
> --- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
> +++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  816010973378faf7ad45e8b7fb97e190500fd5f8a6adaaea032f8c877424113c  kodi-skin-confluence-ae94e6e92c1c67861701e6e8a70f9ccc4dca9f13.tar.gz
> +sha256  61bded39800f751f4285c2e5bca26d4a4064fbeb3f90c253697b5aef07b1b328  kodi-skin-confluence-34e77d0122eab8c6e3fb502c623ba29749b19031.tar.gz
>  sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
> diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
> index 59e5f10875..dcff19793c 100644
> --- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
> +++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_SKIN_CONFLUENCE_VERSION = ae94e6e92c1c67861701e6e8a70f9ccc4dca9f13
> +KODI_SKIN_CONFLUENCE_VERSION = 34e77d0122eab8c6e3fb502c623ba29749b19031
>  KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
>  KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
>  KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
> -- 
> 2.39.5
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
