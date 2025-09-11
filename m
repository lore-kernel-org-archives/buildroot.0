Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED44CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4198942371;
	Thu, 11 Sep 2025 19:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKzGQWktCJ2U; Thu, 11 Sep 2025 19:35:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66AA84234B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66AA84234B;
	Thu, 11 Sep 2025 19:35:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A032F234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85AEC42128
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TdngYrZUamU for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:35:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 80F9942110
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80F9942110
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80F9942110
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:35:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7DB3FB978815; Thu, 11 Sep 2025 21:35:39 +0200 (CEST)
Message-ID: <cc476de6-16d3-4a21-8cd2-c6bb3fc2e236@rnout.be>
Date: Thu, 11 Sep 2025 21:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-3-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-3-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757619339; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=+3ucnHVqHoK3D9JkLueuJI2QFljOAKlm0AO0npAg0tg=;
 b=d9ruGVKLC4Ts4Lo1jENJYnrqjcS+S/Zds/ixp/0qQng1X94cjjwysGjucdXbTm6ts6RBIm
 nqCxI79EMppUC2GyW/AQgnJfyP4HhXqf35bCJ21RcCDRkv4SYTn8CMIyULgXp1tvGehF4x
 9o1Uqg6pzSRcAd7sMENADWEc6IOlnPkL76Qn3Avpzken7tBCoKN4FgqG+AIIN9ZihIe/Iv
 0Js7KG3mfXCT0toAZ+BzeH0qH5LDO+jb3tVOtKfxAt/Th1sGANskYDotlRo0bRvj7J6VFA
 6tWG5qGBFHvwdx0GGE12FLEXnriGHXxtuJIFy42m59CHP+y1Tm7WAWqSg8l1oA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=d9ruGVKL
Subject: Re: [Buildroot] [PATCH 02/23] package/cwiid: remove wmgui support,
 needs libgtk2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/09/2025 23:32, Thomas Petazzoni via buildroot wrote:
> As we're about to remove libgtk2, let's drop the wmgui support from
> cwiid, which is libgtk2 only.
> 
> Note that cwiid hasn't seen a commit in the past 16 years, so there's
> no real hope to see wmgui fixed to have support for a more recent Gtk
> version. And perhaps this separately calls for removing cwiid
> entirely from Buildroot.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   Config.in.legacy        |  7 +++++++
>   package/cwiid/Config.in | 14 --------------
>   package/cwiid/cwiid.mk  |  9 +--------
>   3 files changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 33b60dfd42..4bb160c4a3 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>   
>   comment "Legacy options removed in 2025.11"
>   
> +config BR2_PACKAGE_CWIID_WMGUI
> +	bool "cwiid wmgui has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The wmgui part of cwiid required libgtk2, which has been
> +	  removed from Buildroot.
> +
>   config BR2_LINUX_KERNEL_EXT_EV3DEV_LINUX_DRIVERS
>   	bool "ev3dev Linux drivers have been removed"
>   	select BR2_LEGACY
> diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
> index 44148eb188..0c1a97402a 100644
> --- a/package/cwiid/Config.in
> +++ b/package/cwiid/Config.in
> @@ -14,20 +14,6 @@ config BR2_PACKAGE_CWIID
>   
>   	  https://github.com/abstrakraft/cwiid
>   
> -if BR2_PACKAGE_CWIID
> -config BR2_PACKAGE_CWIID_WMGUI
> -	bool "wmgui"
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
> -	depends on BR2_PACKAGE_XORG7 # libgtk2
> -	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
> -	depends on BR2_USE_MMU # libgtk2 -> libglib2
> -	depends on BR2_INSTALL_LIBSTDCPP # libgtk2 -> pango
> -	select BR2_PACKAGE_LIBGLIB2
> -	select BR2_PACKAGE_LIBGTK2
> -endif
> -
>   comment "cwiid needs a toolchain w/ dynamic lib, threads, wchar, headers >= 3.18"
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
> diff --git a/package/cwiid/cwiid.mk b/package/cwiid/cwiid.mk
> index a11c56c0aa..e552da3b46 100644
> --- a/package/cwiid/cwiid.mk
> +++ b/package/cwiid/cwiid.mk
> @@ -17,13 +17,6 @@ CWIID_DEPENDENCIES = host-pkgconf host-bison host-flex bluez5_utils
>   # Disable python support. This disables the 2 following things:
>   #   - wminput Python plugin support
>   #   - cwiid Python module
> -CWIID_CONF_OPTS = --without-python --disable-ldconfig
> -
> -ifeq ($(BR2_PACKAGE_CWIID_WMGUI),y)
> -CWIID_DEPENDENCIES += libgtk2 libglib2
> -CWIID_CONF_OPTS += --enable-wmgui
> -else
> -CWIID_CONF_OPTS += --disable-wmgui
> -endif
> +CWIID_CONF_OPTS = --without-python --disable-ldconfig --disable-wmgui
>   
>   $(eval $(autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
