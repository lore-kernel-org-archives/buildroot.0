Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9B7D13577
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 17:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18F2580A82;
	Sun, 27 Oct 2024 17:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDM_GDdMIgoV; Sun, 27 Oct 2024 17:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2514181304
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2514181304;
	Sun, 27 Oct 2024 17:35:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FFCE971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 17:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D5374056C
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 17:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F17iuWAJAT9k for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 17:35:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0ED640566
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0ED640566
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0ED640566
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 17:35:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1CA760003;
 Sun, 27 Oct 2024 17:35:17 +0000 (UTC)
Date: Sun, 27 Oct 2024 18:35:16 +0100
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
Message-ID: <20241027183516.42b55f09@windsurf>
In-Reply-To: <20241027093306.2271872-1-romain.naour@smile.fr>
References: <20241027093306.2271872-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730050518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WPc0fRNjtuS6KH2pseWrV4UH1+1pHPwhzPJYDjXyq/8=;
 b=gTWmZ3IJfZYfAzf+TqiRaZzLsopF7kUsZETX0ou3UBC7XFunScboz6cwMzUrI5ALs1zIjF
 TRBba3EpNz0OxBP+h0M+fd9oeYn6Ut6eHCCEfktA7RO+wMTO1YL8jcuXC2uoqJO9Kb9/lT
 K3hZi1NR+A6QT5r51Q0JHGc8AuVSMqTGJlgkIqDnbODE6NPhFLq5XiTzB2D2SD1WcBfXdO
 Iu9U/5rFsVxO6LqjMgyh5LwPQxCU5G7HEcDRr95GtnLfSwEHkAy71XkDdJ46Puo2GLWMFg
 WXwNj+waSotDx3czUqqGeqFyahzPE/FAhDs9p4NBqEcfSV/Bq+oIa6JHsvNw8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gTWmZ3IJ
Subject: Re: [Buildroot] [PATCH 1/3] configs/qemu_aarch64_sbsa_defconfig:
 update ATF to v2.11
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

Hello Romain,

On Sun, 27 Oct 2024 10:33:04 +0100
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.7"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"

Thanks for the update. Shouldn't you update
board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash ?
Your defconfig currently works because boot/arm-trusted-firmware/ has
the hash for v2.11, but as soon as we bump boot/arm-trusted-firmware to
v2.12, we will drop this hash, and your qemu_aarch64_sbsa_defconfig
will fail building.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
