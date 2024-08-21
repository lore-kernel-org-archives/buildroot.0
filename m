Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7A6C52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 11:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0C2B80B6B;
	Wed, 21 Aug 2024 11:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OnCNar1EOL0; Wed, 21 Aug 2024 11:50:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9127811CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9127811CC;
	Wed, 21 Aug 2024 11:50:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D93F1BF4E7
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 11:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AEFA40376
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 11:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9h-D1tUIGYUj for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 11:50:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B7B4400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B7B4400AB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B7B4400AB
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 11:50:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5ED3913F86E;
 Wed, 21 Aug 2024 13:50:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Aug 2024 13:50:46 +0200
Date: Wed, 21 Aug 2024 13:50:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsXUllN6_84yBtvV@landeda>
References: <20240821103816.1940502-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240821103816.1940502-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724241049;
 bh=8d7kZO+NnOtyzrYZVIHocyco/fB8k1/l5himY6KzHjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gh2FgMHigFPn6+GSHn6WJdJdS3F/NbL9BDvyIb0LrZQvvT+e47Ea16QFSWKKEsMs9
 H3DcrpkS0TQavNoa31lR81imxTk2G49RaCoJ55I8rKXsA1ACwBhX+DR8IZRfpdWs8u
 DDpaeuQCAXDDRlDyxNYi6fvN8KKBFVHtzYsdHPIKRSivtmolRIJNcp7gbe1FOrLo7T
 nCoy/zVFFheC2TH1Sp7xRREoO+jW60U9Q7wVgu/tU3kn7aUadh0vAFKyM/gVm9zvS/
 tXpD41DkmUZ3MFXUjCFoGOz6Vt7aNE14h8M5wB23oAXu7tX7AbeurKU0qL7csw7us/
 lqDw4m77n60dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gh2FgMHi
Subject: Re: [Buildroot] [PATCH] package/fan-ctrl: remove package
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
Cc: Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-21 12:38 +0200, Thomas Petazzoni via buildroot spake thusly:
> For this package, we're downloading from the CVS repository viewer,
> but it is gone. The only way would be to download from the CVS
> repository itself, but really upstream is completely dead, and this
> package has seen no update since it has been introduced in 2013, so
> let's get rid of it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I considered whether to apply to master or next, but I did not see a
point in keeping that package on master for another cycle.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy               |  7 +++++++
>  package/Config.in              |  1 -
>  package/fan-ctrl/Config.in     | 11 -----------
>  package/fan-ctrl/fan-ctrl.hash |  2 --
>  package/fan-ctrl/fan-ctrl.mk   | 27 ---------------------------
>  5 files changed, 7 insertions(+), 41 deletions(-)
>  delete mode 100644 package/fan-ctrl/Config.in
>  delete mode 100644 package/fan-ctrl/fan-ctrl.hash
>  delete mode 100644 package/fan-ctrl/fan-ctrl.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index c1870613af..0bae66c3bb 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2024.08"
>  
> +config BR2_PACKAGE_FAN_CTRL
> +	bool "fan-ctrl has been removed"
> +	select BR2_LEGACY
> +	help
> +	  This package was no longer available from SourceForge, the
> +	  upstream is completely dead.
> +
>  config BR2_PACKAGE_FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE
>  	bool "flutter-dynamic-layouts-example has been removed"
>  	select BR2_LEGACY
> diff --git a/package/Config.in b/package/Config.in
> index f2c63ffb6e..317f859684 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -513,7 +513,6 @@ endmenu
>  	source "package/ev3dev-linux-drivers/Config.in"
>  	source "package/evemu/Config.in"
>  	source "package/evtest/Config.in"
> -	source "package/fan-ctrl/Config.in"
>  	source "package/fbtft/Config.in"
>  	source "package/fconfig/Config.in"
>  	source "package/flashrom/Config.in"
> diff --git a/package/fan-ctrl/Config.in b/package/fan-ctrl/Config.in
> deleted file mode 100644
> index 869631683b..0000000000
> --- a/package/fan-ctrl/Config.in
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -config BR2_PACKAGE_FAN_CTRL
> -	bool "fan-ctrl"
> -	depends on BR2_USE_MMU # fork()
> -	help
> -	  Fan-ctrl is a little daemon that controls the speed of one
> -	  or more system or CPU fans. It does so by monitoring
> -	  temperature inputs and selecting a fan speed from an array
> -	  of available speeds based on a set of temperature
> -	  thresholds.
> -
> -	  http://fan-ctrl.sourceforge.net/
> diff --git a/package/fan-ctrl/fan-ctrl.hash b/package/fan-ctrl/fan-ctrl.hash
> deleted file mode 100644
> index 4f26696785..0000000000
> --- a/package/fan-ctrl/fan-ctrl.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally computed
> -sha1  d8ba5bac15e90c36a4e908ca1c98fac83bf702ea  fan-ctrl.c?revision=1.3
> diff --git a/package/fan-ctrl/fan-ctrl.mk b/package/fan-ctrl/fan-ctrl.mk
> deleted file mode 100644
> index 81a52f1e9f..0000000000
> --- a/package/fan-ctrl/fan-ctrl.mk
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -################################################################################
> -#
> -# fan-ctrl
> -#
> -################################################################################
> -
> -# no release, so grab .c file directly from viewvc
> -FAN_CTRL_VERSION = 1.3
> -FAN_CTRL_SOURCE = fan-ctrl.c?revision=$(FAN_CTRL_VERSION)
> -FAN_CTRL_SITE = http://fan-ctrl.cvs.sourceforge.net/viewvc/fan-ctrl/fan-ctrl
> -FAN_CTRL_LICENSE = GPL-2.0+
> -FAN_CTRL_LICENSE_FILES = fan-ctrl.c
> -
> -define FAN_CTRL_EXTRACT_CMDS
> -	cp $(FAN_CTRL_DL_DIR)/$(FAN_CTRL_SOURCE) $(@D)/fan-ctrl.c
> -endef
> -
> -define FAN_CTRL_BUILD_CMDS
> -	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
> -		$(@D)/fan-ctrl.c -o $(@D)/fan-ctrl
> -endef
> -
> -define FAN_CTRL_INSTALL_TARGET_CMDS
> -	$(INSTALL) -D -m 755 $(@D)/fan-ctrl $(TARGET_DIR)/usr/sbin/fan-ctrl
> -endef
> -
> -$(eval $(generic-package))
> -- 
> 2.46.0
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
