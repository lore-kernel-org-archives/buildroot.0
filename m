Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47A5C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 20:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50FD140884;
	Sun, 18 May 2025 20:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQXUDZy_uCDH; Sun, 18 May 2025 20:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C6AE408B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C6AE408B6;
	Sun, 18 May 2025 20:47:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F584193
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9094A4111D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5QBXVMVK5qs for <buildroot@buildroot.org>;
 Sun, 18 May 2025 20:47:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD984410F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD984410F1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD984410F1
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:47:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E79E21C0FAC; Sun, 18 May 2025 22:47:42 +0200 (CEST)
Message-ID: <81e1684e-87d8-40c9-9e7f-27a9cf960130@rnout.be>
Date: Sun, 18 May 2025 22:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Walle <michael@walle.cc>, buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230313081549.493823-1-michael@walle.cc>
 <20230313081549.493823-3-michael@walle.cc>
Content-Language: en-GB, fr-BE
In-Reply-To: <20230313081549.493823-3-michael@walle.cc>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747601263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=a65f3T5LRoLEl0j4ly+sB1/Qa3ozW48WcgDK9vBhW+A=;
 b=CdCAjPBp9fWAjOk2/hlNRh9LiPU4uIcNLGZv2vjaIXrnRxXNHvFcyBvunxP2u7U2lYf314
 c1yvVpKQH6n0s3NPlDwlysvmQ3/CJC64+fZoX+Ii1+21JvFsD8WIM0FRD8oeuvyLsQ24L3
 hQzZkmw0hVAh9KvN0ImfBaJJosZSN7Ut6HdjU7aJ7y0lXvPG7E3DGwDS7gDNv/BN7p3S+z
 7s8dKn/TowR580LXHbdrslLtQfH55asLZXPjJvchlFFJGU4JTqK20AwUgsm3zR5VmWFGRi
 cuVXXmUrSCfDwz512iJiy02iMVSXbgb3M8xgNCPz6L5KELn7UeE+CqAnAs6YgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=CdCAjPBp
Subject: Re: [Buildroot] [PATCH RESEND 2/2] package/buildroot-initscripts:
 add hwclock initscript
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



On 13/03/2023 09:15, Michael Walle via buildroot wrote:
> Add a new initscript to save the date and time to the hardware clock
> on shutdown.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

  We decided to put this instead into a package hwclock-initscript in the System 
Tools menu.

  I've made a few further changes and applied to master, thanks.
- mention in help text that it isn't needed at boot;
  rewrite initscript according to our usual pattern;
  fix shellcheck errors.


  Regards,
  Arnout

> ---
>   package/buildroot-initscripts/Config.in       |  6 ++++++
>   package/buildroot-initscripts/S20hwclock      | 21 +++++++++++++++++++
>   .../buildroot-initscripts.mk                  |  1 +
>   3 files changed, 28 insertions(+)
>   create mode 100644 package/buildroot-initscripts/S20hwclock
> 
> diff --git a/package/buildroot-initscripts/Config.in b/package/buildroot-initscripts/Config.in
> index 8e84e975fa..b30c91b646 100644
> --- a/package/buildroot-initscripts/Config.in
> +++ b/package/buildroot-initscripts/Config.in
> @@ -7,6 +7,12 @@ config BR2_PACKAGE_BUILDROOT_INITSCRIPTS
>   
>   if BR2_PACKAGE_BUILDROOT_INITSCRIPTS
>   
> +config BR2_PACKAGE_BUILDROOT_INITSCRIPTS_HWCLOCK
> +	bool "hwclock"
> +	help
> +	  Initscript to save the date and time to the hardware clock on
> +	  shutdown.
> +
>   config BR2_PACKAGE_BUILDROOT_INITSCRIPTS_URANDOM
>   	bool "urandom"
>   	default y if BR2_PACKAGE_INITSCRIPTS
> diff --git a/package/buildroot-initscripts/S20hwclock b/package/buildroot-initscripts/S20hwclock
> new file mode 100644
> index 0000000000..3e6ea98fe8
> --- /dev/null
> +++ b/package/buildroot-initscripts/S20hwclock
> @@ -0,0 +1,21 @@
> +#! /bin/sh
> +
> +RTC_DEVICE=rtc0
> +
> +[ -r "/etc/default/hwclock" ] && . "/etc/default/hwclock"
> +
> +# Quietly do nothing if /dev/rtc0 does not exist
> +[ -c /dev/$RTC_DEVICE ] || exit 0
> +
> +case "$1" in
> +	start)
> +		exit 0
> +		;;
> +	stop)
> +		echo "Saving the system clock to /dev/$RTC_DEVICE.."
> +		/sbin/hwclock -f /dev/$RTC_DEVICE -w
> +		;;
> +	*)
> +		echo "Usage: $0 {start|stop}"
> +		exit 1
> +esac
> diff --git a/package/buildroot-initscripts/buildroot-initscripts.mk b/package/buildroot-initscripts/buildroot-initscripts.mk
> index 098113bcbd..980a5fe1e4 100644
> --- a/package/buildroot-initscripts/buildroot-initscripts.mk
> +++ b/package/buildroot-initscripts/buildroot-initscripts.mk
> @@ -4,6 +4,7 @@
>   #
>   ################################################################################
>   
> +BUILDROOT_INITSCRIPTS_SCRIPTS_$(BR2_PACKAGE_BUILDROOT_INITSCRIPTS_HWCLOCK) += S20hwclock
>   BUILDROOT_INITSCRIPTS_SCRIPTS_$(BR2_PACKAGE_BUILDROOT_INITSCRIPTS_URANDOM) += S20seedrng
>   
>   define BUILDROOT_INITSCRIPTS_INSTALL_INIT_SYSV

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
