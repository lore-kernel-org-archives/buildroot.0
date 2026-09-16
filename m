Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39120C982D0
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 16:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3B4B60811;
	Wed, 16 Sep 2026 16:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JX-nT9ex09Mo; Wed, 16 Sep 2026 16:52:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CB8C2607BE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789577559;
	b=mx59FNMaiotOU/CPq546z5FDBx/t6+MFmV3W3OdJ5xmaQGuqcaQnV5k4kVnNonCreOTI
	 Vw5eWxZf/8eT5MwVfIYcuH2SabIKDGiea/PsdHvixmlaFv9I/Alx8sxeYqmsTsvH04Tb+
	 NCGZjYdymRF1241z/Jm5nHKH0Uaza95jOuxFAS3l4S7S4GRRsTFtAn2CYi1prpB6YKegi
	 6W2AYsQ4M2QN+M+ex8buep/1CaiXc3CX8br61/Uv3a//zIypDeTPgIgGADhPWvOjnyvu9
	 GRWJ1eFKGL8X4J7zxJElUlnjhQ7Hc5ygTAbeCYhmd6B27z1T4w3X0SvQ6Nzuxm6lcNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789577559;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:DKIM-Signature:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Qh/JKp6UUgrrrVrY1XrA23l6dhbeT3rLKIAR70nrcK4=;
	b=OlQjk0H8F+iXCHvFgLiFlzH5M4Q9urwqQyVZAaDB+tMv8p5bI9KF3Un0DMmdw/bfVcya
	 c7InS26Al6cqFm/UA7OQ/mZsPF4OztwiEtFsTRgXCwS95/GmGhqAJ+o6DwP+vrFvpCGjK
	 UxaAhG8oyVjGBL+rfVQ3/jv0YbntWPyQjgQ1dNOGrnKvJguTdF7bzQFhmccWRNyM5jmvb
	 d9k5LakR8Hibj3ZdDOKr8nrLmDh18Wcknzh0btGWFQiuaj5sXzJdb8OybInG0l57ZhXgh
	 8gY65HKVK7YuR7p0DLzbuhsZPUDYZn1rASJ1UG1lmFJAEAAj4xBKR96A0AKKxJaLB8A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="kEXAk/n5";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789577559;
	bh=Qh/JKp6UUgrrrVrY1XrA23l6dhbeT3rLKIAR70nrcK4=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bg4k/9EA6Hb21UlPGh98rAFeQO5/G7CO5gHhkIqEGi4PFj9gyf83Q5ZVOVBm8d6aE
	 QkEiVyrGJwv3TBmOoRq7LWz2i+Xudoaf1fT7XjuEd/RyowDBtZcMi6VqFYKeOBlBwI
	 7CZ0WAr+fvBN6l6dPXBz7xAP9oB4fRN5p8SLub0OuEocatiOxXBHwnQcLqFNwxEPY+
	 Sj6RxW90fAhgKUJgz4j5JfFOBGcq94Gpr4oCKiO7OnTRWgFmk5ZmK037Ow13EKNh7a
	 Xny9TLzNhbC4byFkKKQNjUjvPg8NaXOiTD2qPJVLtag4eGWIDtnJ4XXXkuXWzRv1XT
	 l8cCLQ/rRrEnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB8C2607BE;
	Wed, 16 Sep 2026 16:52:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3E9E388
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 16:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA3D0607BE
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 16:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtLEQD8nbhEs for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 16:52:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 02789607B7
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789577557;
 b=aa02uglQf4iAiHZAMmjlLSSp6q2A92IAeb3cN+syzTJO3iCeQylcWSV83gQbFG+n3EW1
 EmOEK4Wg42OqK8yvBeU++Ru0XQy+V3sikwOIMyEYPH/aZ8jUcqEsTD6EeHxNS0C2T2jkM
 z1lstLgt924nYILshKvbQMMMfDEIFkzue7URK65PMsm+dZDi2GADyHuZJ/50ib0Vy5kEc
 4MyKYzDqS6+5thARi3AsVXeBlWKZK1Ubx68V9Vdk1GuPCPYItGdyae3/H1JBTCTugjajc
 ZF0sspY4uXykK0o9NILVD5kAVGDBBdfq8Ym5j5XpB02wuRYCKAyKCZ5seUADpKvYHww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789577557;
 h=X-Greylist:Received-SPF:Received:DKIM-Signature:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=yyBXoCPmuYa5Cz3eKKIKPh5qnECO9ZtYq8uhi3x2oVY=;
 b=kWZUJofwTfAkZOX/1CRmzjK+Ymhk5lNtJJriPCxsnBQmkXynonGx8kVjQRE7sltv6Xh4
 dMiur9elsk4GgGDeRk1X2xCpwwK+SzTIC7K4ovK9gPjuY+Yc0awQsNnrHbJxi880LdhCh
 oVaLcRnivqVKapiKyotUyczB6wHPTPIj12Uxxdsf0zgZfvQDqWObxn/HhyyvLK/FJwDD/
 d6mdGf6hXETjXNEBpxcv/wuavhfL7pfZF2TVMawGSbQRRQU9Q+8Jc2JFCzEwtKHx0roUY
 ugaZoC/xQblpFHaROJc3/YTq4xrRVWuqUJGIsygaWUCi7ZlAdQSo2qRr+H8m/52SxiQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=ideasonboard.com; 
 dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b="kEXAk/n5"; 
 arc=none smtp.remote-ip=213.167.242.64
X-Greylist: delayed 515 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 16 Sep 2026 16:52:36 UTC
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=kEXAk/n5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com;
 envelope-from=laurent.pinchart@ideasonboard.com; receiver=<UNKNOWN> 
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02789607B7
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 16:52:36 +0000 (UTC)
Received: from killaraus.ideasonboard.com
 (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD3DD558;
 Wed, 16 Sep 2026 18:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1789576936;
 bh=DWk2LmKu8VPTOn0RFizDZNftVGwhYsQ7i5WqYqblyh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kEXAk/n5/InihrVkJWPtx6T8YeCtLscaVKCGUm/sQi1q//mO4DgzrlIpVjuxP/1iN
 uYwaNmZ0AngKg9L2nf/5i6TgcekIqrdVDHaChqYCoRz0wma/9MFH1R2DCPpxkfeT3o
 tU1U0kljghstCUMQqFgZnIk8VoZ1JuK1GO1U4yug=
Date: Wed, 16 Sep 2026 19:43:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: buildroot@buildroot.org, sakari.ailus@iki.fi,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20260916164355.GA191870@killaraus.ideasonboard.com>
References: <20260916090705.2796356-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260916090705.2796356-1-paul.elder@ideasonboard.com>
Subject: Re: [Buildroot] [PATCH] package/raw2rgbpnm: Add package for
 raw2rgbpnm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Paul,

Thank you for the patch.

On Wed, Sep 16, 2026 at 06:07:04PM +0900, Paul Elder wrote:
> Add package for raw2rgbpnm. It is a tool for converting raw images to
> RGB PNM. While the original repo is at:
> https://git.retiisi.eu/?p=~sailus/raw2rgbpnm.git
> A mirror is hosted on freedesktop:
> https://gitlab.freedesktop.org/camera/raw2rgbpnm
> so use that instead.
> 
> As the build is simple and has no dependencies nor releases, use the
> master branch for the version.

I don't know what buildroot's policy is with this, but using the master
branch will make builds non-reproducible. I would instead use the commit
ID of the current master branch head. It can be updated in future
buildroot releases.

> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> 
> ---
> This patch is based on 2026.08.
> ---
>  package/Config.in                |  1 +
>  package/raw2rgbpnm/Config.in     |  6 ++++++
>  package/raw2rgbpnm/raw2rgbpnm.mk | 16 ++++++++++++++++
>  3 files changed, 23 insertions(+)
>  create mode 100644 package/raw2rgbpnm/Config.in
>  create mode 100644 package/raw2rgbpnm/raw2rgbpnm.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 6058800682b4..6d9daeadafec 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -195,6 +195,7 @@ menu "Development tools"
>  	source "package/mawk/Config.in"
>  	source "package/patch/Config.in"
>  	source "package/pkgconf/Config.in"
> +	source "package/raw2rgbpnm/Config.in"
>  	source "package/ripgrep/Config.in"
>  	source "package/sed/Config.in"
>  	source "package/subversion/Config.in"
> diff --git a/package/raw2rgbpnm/Config.in b/package/raw2rgbpnm/Config.in
> new file mode 100644
> index 000000000000..3d8f36459f4e
> --- /dev/null
> +++ b/package/raw2rgbpnm/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_RAW2RGBPNM
> +	bool "raw2rgbpnm"
> +	help
> +	  Convert raw bayer images to RGB PNM for easier viewing
> +
> +	  https://gitlab.freedesktop.org/camera/raw2rgbpnm
> diff --git a/package/raw2rgbpnm/raw2rgbpnm.mk b/package/raw2rgbpnm/raw2rgbpnm.mk
> new file mode 100644
> index 000000000000..275fe6f32be3
> --- /dev/null
> +++ b/package/raw2rgbpnm/raw2rgbpnm.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# raw2rgbpnm
> +#
> +################################################################################
> +
> +RAW2RGBPNM_SITE = https://gitlab.freedesktop.org/camera/raw2rgbpnm
> +RAW2RGBPNM_SITE_METHOD = git
> +RAW2RGBPNM_VERSION = master
> +
> +RAW2RGBPNM_LICENSE = GPL-2.0
> +RAW2RGBPNM_LICENSE_FILES = LICENSE
> +
> +RAW2RGBPNM_INSTALL_TARGET = YES
> +
> +$(eval $(meson-package))

-- 
Regards,

Laurent Pinchart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
