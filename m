Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2CDE9537D
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 11:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA693402FB;
	Wed,  4 Feb 2026 11:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYKXGeMApfrl; Wed,  4 Feb 2026 11:01:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10EA940316
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770202886;
	bh=8Z38wFVVVq4oavg+69FpP3m2vfHgP+457QlhHFy7O+o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QTctOUJw92YU/xayYDdMkOpKDoS+IVTgEy0unALE+U2l4VQ6z1huP6joPKz5QoL3f
	 fGEC/KKTpj52Hec5lk9/kn3Jz6lMxrIOo48acsHWDkghV8s3Cye5G30c+uth5/D+7L
	 MNHN+6jAEO1Fi8TxiUO9UJWgV46MxQU8HDDeE/oB5M3av/baOrXiXZ22RFBCaxu+uN
	 dLunCA/cpLtxXvN1Xlgfeqf3uMSpmJPBkMR3cVcwkBPLZr6hGEyM56iCU3LG3RVKvr
	 0sUmVIZoEm7bVCFTJTsWl+Kd7cPugGLG/9Ryal5rDIJl9G8hlzeqX8bNf57NI/wNlj
	 D4C+L6NTTMHFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10EA940316;
	Wed,  4 Feb 2026 11:01:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CEB04F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B10D840109
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTck4SXDXQPj for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 11:01:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B39234007B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B39234007B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B39234007B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:01:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C896CB979DA1; Wed,  4 Feb 2026 12:01:14 +0100 (CET)
Message-ID: <98f2c09a-fb17-49a0-a89d-27c128745022@rnout.be>
Date: Wed, 4 Feb 2026 12:01:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Olivier Benjamin <olivier.benjamin@bootlin.com>, buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250507160832.121159-1-olivier.benjamin@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250507160832.121159-1-olivier.benjamin@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1770202875; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=RU7MGbz8P5jrljxGoA1DRcAj0Oc2YyT0icTI/m0PK9Y=;
 b=mxa9XEjfwE133NtmMQoPyxhxAztGSRCCOBeBd3Puq0+MpsFqgQVW3Pwb6BvRegAV2cP0Gs
 3cTM3BxpYOFggQ0HkZTXVJIQ24L9RwlONw6J3C1dz0JEL/n9jLsGX4DVqPBNxKeyzBRizK
 NJXnegqG4oe/BB+HNFVTRvwxJ4D+keNzqWTh3W+rU9xbjXQMvgjnlW6X7zUGHAdtSzR4Y0
 s5VuMoNkUm1ltTpwmE8gohcNyRS6MzIXGSKj3ly/NigueMMfUqlcc/dA+2KExU7kR4eLBN
 L39pz5Sm+qdzfgBKykYYnB/MrQRarA5Hgl3/kCN9uuXGjJwRrHCHn9skcmtFKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=mxa9XEjf
Subject: Re: [Buildroot] [PATCH 1/1] rpi-firmware: support installing
 autoobot configurations
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

  Hi Olivier,

On 07/05/2025 18:08, Olivier Benjamin via buildroot wrote:
> autoboot.txt is an optional configuration file for the RPi firmware:
> https://www.raspberrypi.com/documentation/computers/config_txt.html#autoboot-txt
> 
> Supporting several autoboot files will enable A/B setups, as using
> the renameat2() system call with the RENAME_EXCHANGE flag will let users
> atomically replace one autoboot configuratin file with the other.
> This improves reliability in the case of an update which could
> potentially be interrupted.
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>

  This patch is actually very similar to the one that installs multiple 
cmdline.txt. So instead, I changed it to introduce a single option 
BR2_PACKAGE_RPI_FIRMWARE_EXTRA_FILES.

  In the end, the commit doesn't really look like what you submitted any more, 
but I've kept your authorship :-)

  So in the end, applied to master, thanks!

  I haven't tested it much so please check if this covers your use cases and if 
not send follow-up patches.

  Regards,
  Arnout

> ---
>   package/rpi-firmware/Config.in       |  7 +++++++
>   package/rpi-firmware/rpi-firmware.mk | 10 ++++++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
> index f99c116ca2..42982514f8 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -76,6 +76,13 @@ config BR2_PACKAGE_RPI_FIRMWARE_CMDLINE_FILE
>   	  Path to a file stored as cmdline.txt in the boot partition
>   	  of the generated SD card image.
>   
> +config BR2_PACKAGE_RPI_FIRMWARE_AUTOBOOT_FILES
> +	string "List of path(s) to file(s) containing autoboot configuration."
> +	help
> +	  Space-separated path(s) to file(s) that should be stored
> +	  in the boot partition. They will be stored under their own
> +	  name in rpi-firmware.
> +
>   config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
>   	bool "Install Device Tree Blobs (DTBs)"
>   	default y
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 2577d16a01..17b7c0cbca 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -62,6 +62,15 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>   endef
>   endif
>   
> +RPI_FIRMWARE_AUTOBOOT_FILES = $(call qstrip,$(BR2_PACKAGE_RPI_FIRMWARE_AUTOBOOT_FILES))
> +ifneq ($(RPI_FIRMWARE_AUTOBOOT_FILES),)
> +define RPI_FIRMWARE_INSTALL_AUTOBOOTS
> +	$(foreach f,$(RPI_FIRMWARE_AUTOBOOT_FILES), \
> +		$(INSTALL) -D -m 0644 $(f) $(BINARIES_DIR)/rpi-firmware/$(notdir $(f))
> +	)
> +endef
> +endif
> +
>   # Install prebuilt libraries if RPI_USERLAND not enabled
>   ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)
>   define RPI_FIRMWARE_INSTALL_TARGET_LIB
> @@ -86,6 +95,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
>   	$(RPI_FIRMWARE_INSTALL_BIN)
>   	$(RPI_FIRMWARE_INSTALL_CONFIG)
>   	$(RPI_FIRMWARE_INSTALL_CMDLINE)
> +	$(RPI_FIRMWARE_INSTALL_AUTOBOOTS)
>   	$(RPI_FIRMWARE_INSTALL_DTB)
>   	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
>   endef

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
