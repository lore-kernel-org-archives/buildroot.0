Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E9ECC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DB2C405DD;
	Tue, 13 Oct 2026 17:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEDVCFRt7FcN; Tue, 13 Oct 2026 17:55:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8A421405E3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914104;
	b=aHL2qlCjUjEVK5Th838zJ8VcoXMi/4cH/6HrMKl9IAAe622t0m6ui8RpJuuJ0ULtz1ta
	 NSBzcoAZ0aK0GsTyXHlWg7LVgLWGc1d7lMXWegThlxVfRIOQKQxhz2SZWVHsBkoVVvyrQ
	 68Zb6xXdp+28tumwJfIs5jQBHDpAKP1nq+gHC6zFK6n8eCtPsCQaUSSN8qCpd70eRx1OH
	 XjZhNHawox/7d7Etugqg7E1oJXqMV2k6tHo+aSpgLed5Oyx43TfYngToLdYoTaepaZrpE
	 evGcz7Q2EqEQjN8iCWEKyNocXBxuaXWd4blwaX89iK2wja6qt3tLDl61Qs09GhAHU5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914104;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3usItYdMLXatnFRt8w0v2tE8PXDvtLztCLnuJOW4Xro=;
	b=rdhX5Gcin6kAkHI+KON5OtW3e6ZzZfBgyl8oMzuek4NfIS714X7YZEy+pDzhNyDiCpXT
	 vMU7YyDQ18a0hYlFyRzomsrt3CoaOz37HfkyrfnJAp16JTzhOQNnULg7yGE2t6pZkNH0l
	 /wT6emgDp+hXbThNf0Bzz0i3eesJgygRLyHhanvV+ny33zLoDhfolIstLbBf/6L4xEExl
	 vjzFvUUQKU1lY2cwjaON1S0QBP36MBnRIvIwQHJSm+m/57wHt4K+8aVtjZD+nFWE21NxN
	 KrOCbRxuHcETX84EqX/35J6qTS16QFdUhoTq4uuPQa6FKAuTud17DB0yAuMQINFIOxw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914104;
	bh=3usItYdMLXatnFRt8w0v2tE8PXDvtLztCLnuJOW4Xro=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MYyTwvOMxpjB1YzCOTvc8TAefDVgxzL+5O07dqjBetrdGm46BLzCcIU1MSmCRH77B
	 kvrx+lLWTgFSPCPFYBm/Yp4M75bnUFK9JN7dfN50dMUbORcBz4w9/54mpoiasc77It
	 /jC5vM9R8QQtD2YeJeAlPXMKaKB8eeDJLSPvnlOWkduPHvarKvJVEvuK9F/OXYZ50q
	 yYOP1vgDk9FNcTsoVW3Jx8t2l2gQ2eJ3c57SFT6w4gJSOHeEjTSjzKmfcvsBGCaprE
	 typFEDPPtrt77oaGH/X7Vd1DzOl6tDQ/Oq5c3nx1X8MadQHMoNOaz8RTm0RupSk4Wk
	 JB/JNySiof0Xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A421405E3;
	Tue, 13 Oct 2026 17:55:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E919D362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAE7780AE6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CxN8KRsCrJvQ for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:55:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BCD8E80AC4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914103;
 b=SEGAPtaxtUuLiRvE4gPY/tmEbtbTEOySjJel8V/rKD1K2f+Qt2a9OdIedTIvPPUmlKxw
 8sUbvkWk5EJ8jd1p0ehXns/DN58plruPe6pkKWzKbgznmxhcNOG152JMDOhWhCsigyR2n
 DbjX2zTbXafijykxODQPhIKJBJUppZZ7vn9JG6cP8XB9C4LmNE4o+W440kJqijLyogb+g
 p88JK/PIPQanbaZnG254p21grtF9wVI/wwrRvyUSOH7Mh/GzHqQk3ITUlaq11fuezoy0s
 yoHD/hNhsOgFlWUtXw9OszsSwqODlzPDsVZTVKkQ0vUv4zh9KFVmE3LDhAoXptoS45g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914103;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=1dwjWnvTRQNT6dvlGxL9FMajcUDLc5xyaVu14D1pA84=;
 b=OWaNguG1yPdV4tPC9/zDaseTWIZdM5kpeZYpsGdRTAcv0e1biXhsPv0RVI/XbZEktuSg
 htX4EbBHzJxli+a8wILDUAUiD2qM8kjR78rJkhn7BDx1Ffpjrpa4wcjg3jFnFDY20dBFC
 f3y8j2OtNZ9KkR8XW4gYYpn25XeOONjglF/fYAdiaL5UuzjEn6xx9I68LWDGDnJsb6pD8
 AU460Rz27hxcnzzx6B2iWWayKtdLHAdPLOrj52LqemGgwotvPiBX+o3s4UNf1VqiqvBXK
 ooPOm3y6ZniGmWpfO6KmaVvPlGfi1UNKZesz6HkzoFt9VByrQgRuEZeKhNLx4rMDC0A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vG4rNuVY; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCD8E80AC4
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C0EA54E41215
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 95AE460362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:58 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 2EABC11D7186C; Tue, 13 Oct 2026 19:50:49 +0200 (CEST)
Date: Sun, 11 Oct 2026 14:56:18 +0200
To: Jean-Christophe Bauduin <jean-christophe.bauduin@mind.be>
Cc: buildroot@buildroot.org, 
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>,
 Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <asuGMIwma5zlpPtg@windsurf>
References: <20250106102258.3315858-1-jean-christophe.bauduin@mind.be>
 <20250106144710.3340188-1-jean-christophe.bauduin@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250106144710.3340188-1-jean-christophe.bauduin@mind.be>
X-TUID: GQlQYFtr6mAK
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 2EABC11D7186C
X-Spamd-Result: default: False [-3.90 / 30.00]; BAYES_HAM(-5.30)[99.54%];
 DATE_IN_PAST(1.00)[52]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; BCC(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; MISSING_XM_UA(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 NEURAL_HAM(-0.00)[-1.000];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 FREEMAIL_CC(0.00)[buildroot.org,mind.be,gmail.com];
 URIBL_BLOCKED(0.00)[st.com:url,bootlin.com:url,trustedfirmware.org:url,localhost:rdns,localhost:helo];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCPT_COUNT_THREE(0.00)[4]
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/arm-trusted-firmware add
 Trusted Board Boot option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for your patch, and sorry for the delay in getting back to
you. We reviewed your patch (as part of the Buildroot Developers
Meeting) and we have a number of questions/comments. See below.

On Mon, Jan 06, 2025 at 03:47:10PM +0100, Jean-Christophe Bauduin via buildroot wrote:

> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_TRUSTED_BOARD_BOOT
> +	bool "Enable Trusted Board boot"
> +	help
> +	  Enables trusted board boot.
> +	  More info:
> +	  https://wiki.st.com/stm32mpu/wiki/TF-A_BL2_Trusted_Board_Boot
> +
> +endif
> +
> +if BR2_TARGET_ARM_TRUSTED_FIRMWARE_TRUSTED_BOARD_BOOT
> +
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ROT_KEY
> +	string "Path to the ROT private key"

Why is the private key needed, and not just the public key?

> +	help
> +	  The path to the private ROT key used by ATF.
> +	  The private key must be in PEM format.

Is it possible to add more details on how to generate the key in the
expected format, or is that platform/vendor dependent?

> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_MBEDTLS_VERSION
> +	string "The version number (ex 2.8) needed for the secure boot"

This description is not good, it should be:

	string "MbedTLS version"

> +	help

And then here explain why it is needed, and perhaps how to figure out
which one should be used.

> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 172a930b5c..dfd4480ba6 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -18,6 +18,25 @@ else
>  # Handle stable official ATF versions
>  ARM_TRUSTED_FIRMWARE_SITE = https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git
>  ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
> +
> +ifneq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_MBEDTLS_VERSION),)

This won't work, as BR2_TARGET_ARM_TRUSTED_FIRMWARE_MBEDTLS_VERSION
being a string option, it's never empty. When no value is specified in
menuconfig, the value of
BR2_TARGET_ARM_TRUSTED_FIRMWARE_MBEDTLS_VERSION will be "". So you need to do:

ARM_TRUSTED_FIRMWARE_MBEDTLS_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_MBEDTLS_VERSION))

and then you can use $(ARM_TRUSTED_FIRMWARE_MBEDTLS_VERSION).

> +ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE = mbedtls-$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_MBEDTLS_VERSION))
> +
> +ARM_TRUSTED_FIRMWARE_MBEDTLS_SITE = https://codeload.github.com/Mbed-TLS/mbedtls/tar.gz/refs/tags/$(ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE)
> +
> +define ARM_TRUSTED_FIRMWARE_MBEDTLS_EXTRACT_CMDS
> +	$(WGET) -O $(DL_DIR)/$(ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE) $(ARM_TRUSTED_FIRMWARE_MBEDTLS_SITE)

This is not good at all: you are downloading during the extract
step. By doing this, you break offline build, you break hash integrity
checking, and you don't account for the license of mbedtls in the
license information.

Instead, use EXTRA_DOWNLOADS. Make sure to update the license
information as well.

> +	mkdir -p $(@D)/$(ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE)
> +	$(TAR) -xvf $(DL_DIR)/$(ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE) -C $(@D)/$(ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE) --strip-components=1
> +endef
> +
> +define ARM_TRUSTED_FIRMWARE_MBEDTLS_BUILD_CMDS
> +	$(MAKE) -C $(@D)/$(ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE) \
> +	CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" lib

Second line should be indented with one more tab (minor detail).

> +endef
> +ARM_TRUSTED_FIRMWARE_POST_EXTRACT_HOOKS += ARM_TRUSTED_FIRMWARE_MBEDTLS_EXTRACT_CMDS
> +endif
> +
>  # The licensing of custom or from-git versions is unknown.
>  # This is valid only for the latest (i.e. known) version.
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION),y)
> @@ -190,12 +209,24 @@ define ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF
>  endef
>  endif
>  
> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_TRUSTED_BOARD_BOOT),y)
> +ARM_TRUSTED_FIRMWARE_TRUSTED_BOOT_ROT_KEY=$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ROT_KEY))

Spaces around = sign (minor detail).

> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
> +	ROT_KEY=$(ARM_TRUSTED_FIRMWARE_TRUSTED_BOOT_ROT_KEY) \
> +	MBEDTLS_DIR=$(@D)/$(ARM_TRUSTED_FIRMWARE_MBEDTLS_SOURCE) \
> +	GENERATE_COT=1 \
> +	TRUSTED_BOARD_BOOT=1
> +endif
> +
>  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += \
>  	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS))
>  
>  ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH))
>  
>  define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
> +	$(if $(BR2_TARGET_ARM_TRUSTED_FIRMWARE_MBEDTLS_VERSION),

Use ARM_TRUSTED_FIRMWARE_MBEDTLS_VERSION. Or perhaps better, use
BR2_TARGET_ARM_TRUSTED_FIRMWARE_TRUSTED_BOARD_BOOT. Indeed, as soon as
BR2_TARGET_ARM_TRUSTED_FIRMWARE_TRUSTED_BOARD_BOOT is y we need to
build mbedtls, and if the user has forgotten to set the MbedTLS
version, a clear build failure would be better than skipping the
MbedTLS build.

Could you have a look at those issues and submit a v3?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
