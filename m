Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E20CDD0CB
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 016AD6081F;
	Tue, 22 Oct 2024 19:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsiVIJ0jI7cB; Tue, 22 Oct 2024 19:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F0E260815
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F0E260815;
	Tue, 22 Oct 2024 19:28:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 759D12072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5684260812
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SWbbrE9vivpV for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:28:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ECDE860815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECDE860815
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECDE860815
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:28:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C3FE40007;
 Tue, 22 Oct 2024 19:28:02 +0000 (UTC)
Date: Tue, 22 Oct 2024 21:28:00 +0200
To: bryce@raspberrywood.com
Cc: buildroot@buildroot.org, Bryce Johnson <bryce@redpinelabs.com>, Suniel
 Mahesh <sunil@amarulasolutions.com>
Message-ID: <20241022212800.570cbcfc@windsurf>
In-Reply-To: <20241022180542.224972-1-bryce@redpinelabs.com>
References: <20241022180542.224972-1-bryce@redpinelabs.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729625283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mKfwTMRTJ9W+NEfFTC6o4aotd+z24+mZ6E0wPA222VY=;
 b=TMunGCN2Befz5dsGXIkxmSf8J58BNLE+DEjeVkcdXXut1mtnG2CyCyL05ilXw0krz0g4Pa
 8g3DclRGQjmkrL9wLsbhDxbJVRvm1PSu5r+KkVr8q+5OKX5qJNu30nsMOMqXJ1LExxVriw
 5XVNEJ0T0X00tmhtn2nCiJf7Ad+VaM2Cncn/xV3J2LZQCtJteiJFnyFObHs7xHDpwpqVph
 4tP6LREst/o5RmFzydkaCJtaqF4EOr6QUbpUvnSJriQ6feKfvCgmOXHjS0ekeZXbqJpgrj
 489dmQZWLAEyEmtqxMToiXLV0kiZFBk1sMndCuIGDWDiUXYy6yK96EhlUHkF8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TMunGCN2
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-toolchain: Add $(HOSTARCH)
 so it can be built with aarch64
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

Hello Bryce!

Thanks for your patch. Some comments/questions below.

On Tue, 22 Oct 2024 12:05:40 -0600
bryce@raspberrywood.com wrote:

> From: Bryce Johnson <bryce@redpinelabs.com>
> 
> Was testing building with arm64 build server and failed because it was downloading the x86_64 version. Use $(HOSTARCH) instead so it can also downloaded

Minor nit: commit messages should have line wrapped at ~80 columns.

> 
> Tested with building configs/ti_am62x_sk_defconfig on arm64. That it uses to build the 32bit R5 MCU.

More important nit: we need you to add your Signed-off-by: line at the
end of the commit log to allow us to apply your patch.

> diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
> index 0800fa2168..110ec40c09 100644
> --- a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
> +++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
> @@ -1,2 +1,4 @@
>  # taken from https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz.sha256asc
>  sha256  6cd1bbc1d9ae57312bcd169ae283153a9572bd6a8e4eeae2fedfbc33b115fdbb  arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz
> +# taken from https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-aarch64-arm-none-eabi.tar.xz.sha256asc
> +sha256  8fd8b4a0a8d44ab2e195ccfbeef42223dfb3ede29d80f14dcf2183c34b8d199a  arm-gnu-toolchain-13.2.rel1-aarch64-arm-none-eabi.tar.xz
> diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
> index 03bb4dc5da..fce80f2f3a 100644
> --- a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
> +++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
> @@ -6,7 +6,7 @@
>  
>  ARM_GNU_TOOLCHAIN_VERSION = 13.2.rel1
>  ARM_GNU_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(ARM_GNU_TOOLCHAIN_VERSION)/binrel
> -ARM_GNU_TOOLCHAIN_SOURCE = arm-gnu-toolchain-$(ARM_GNU_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
> +ARM_GNU_TOOLCHAIN_SOURCE = arm-gnu-toolchain-$(ARM_GNU_TOOLCHAIN_VERSION)-$(HOSTARCH)-arm-none-eabi.tar.xz

The change looks correct as-is of course, as it doesn't make anything
worse. However, I believe to make things cleaner, we should perhaps
introduce a package/arm-gnu-toolchain/Config.in.host file, with a blind
option BR2_HOST_PACKAGE_ARM_GNU_TOOLCHAIN, that has a "depends on" the
host architectures that are supported. And the packages that use
host-arm-gnu-toolchain would have to be careful to propagate those
depends on, so that we do not allow using host-arm-gnu-toolchain on
configurations that do not allow using the host-arm-gnu-toolchain
package. However this can be done as a separate patch, as again your
change is not making things any worse than they already are :)

Could you send a v2 of your patch with the proposed changes?

Thanks again!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
