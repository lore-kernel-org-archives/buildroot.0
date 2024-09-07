Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C842DEB64CD
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 16:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86B7140106;
	Sat,  7 Sep 2024 16:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5U9KnJ-l3K7C; Sat,  7 Sep 2024 16:52:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45BF140177
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45BF140177;
	Sat,  7 Sep 2024 16:52:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FE341BF4DD
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 16:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DC3581224
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 16:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyGncYaB7SsG for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 16:52:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5670481021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5670481021
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5670481021
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 16:52:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8AA1813F846;
 Sat,  7 Sep 2024 18:52:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Sep 2024 18:52:10 +0200
Date: Sat, 7 Sep 2024 18:52:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <ZtyEul60GNhuJcB1@landeda>
References: <20240906231211.652205-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240906231211.652205-1-f.fainelli@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725727934;
 bh=Kkdt/3oR2199/gwVzw++ukBvNWeXiRk8v3/TpIMTryc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=selPSQr56wiSyixspsz4Xb3ZxAEWGWvNyhaHuklr6gp7nJHuk3QaZm507ageOKynM
 Gcmw9DYcbK8A0CilfPMi3JPaNyPLiXol50gaPijHuSOKbxS13nRlEW7+XVbCuteZHl
 zWjsffXZcXg3lsocVtKCNXtnnk4DsBOZZkCqfn2AXd1lkpB/jH6LrIiEFHQh8v2lx6
 +kWxlopGkq5WwBGsu5QNUndBCd09lUq/db1KXcqVrZFdOK/tzfqb1wIQTpKPNYeEtg
 /ytwv+eoPl76KQ/thfyOzRx2ngSwSV7Y+VrEUtHxr8SU0bDqrY0Vtli+JhBER+OHOV
 zv94+KnAauFyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=selPSQr5
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: Add option for
 Rocketport 2 firmware
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Florian, All,

On 2024-09-06 16:12 -0700, Florian Fainelli spake thusly:
> Add an option to install the firmware file required by the Linux rp2
> driver.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
[--SNIP--]
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index 651ca4508764..4e1f60ba9780 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -706,4 +706,14 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF
>  
>  endmenu
>  
> +menu "Serial adapters firmware"
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_RP2
> +	bool "Comtrol RocketPort EXPRESS/INFINITY firmware"
> +	help
> +	   Firmware files for the Comtrol RocketPort EXPRESS/INFINITY
> +	   needed by the Linux rp2 kernel driver.

Indentation is TAB + two spaces, so I fixed that.

That made me also notice that 'make check-ackage' does not detect that
situation... I'll see if I can hack something around...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +endmenu
> +
>  endif
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index e40eab8dc85f..ae10e160b97f 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -910,6 +910,10 @@ LINUX_FIRMWARE_FILES += arm/mali/arch*/mali_csffw.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mali_csffw
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RP2),y)
> +LINUX_FIRMWARE_FILES += rp2.fw
> +endif
> +
>  ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
>  
>  define LINUX_FIRMWARE_BUILD_CMDS
> -- 
> 2.34.1
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
