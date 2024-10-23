Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C52FCFA462
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B19B8113D;
	Wed, 23 Oct 2024 19:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqxBYvL-GPyF; Wed, 23 Oct 2024 19:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2880F8114A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2880F8114A;
	Wed, 23 Oct 2024 19:53:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F1D43F2E
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E69F6062A
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5REfXgJIrfO7 for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:53:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6179E6072B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6179E6072B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6179E6072B
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:53:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56524FF805;
 Wed, 23 Oct 2024 19:53:49 +0000 (UTC)
Date: Wed, 23 Oct 2024 21:53:47 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>, Damien Le Moal <dlemoal@kernel.org>, Niklas
 Cassel <cassel@kernel.org>
Message-ID: <20241023215347.15ca78ea@windsurf>
In-Reply-To: <20241023182509.2808544-1-niklas.cassel@wdc.com>
References: <20241023182509.2808544-1-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729713229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WafUGS7gbWlC/mhJt4DyTP5DBZ/8IgfAJ/wkRruZA6s=;
 b=g4/6nel3IEj08Iv6eGsx4WSL+jj+SJ/6Sd6GCpHT296fCPsppslzhCztuZjFnLaDY+lXFu
 87nfKAPLRrK3JSSjewgAUeKnb0Nx+VoAbneyUU8TXWSqzlZ6UnjHZ5ADlOahvjvZj5G2uS
 TAl6+v3apNvZLSZ90joX0c6dnUxg2J/uJtlwTsV9QPIg5s9X4qcDj837oYimfhpbOPVVT+
 MfGDgWTGCvLXoa3XcU69OwshfugqzA4LAKnQPBHsohHfqpvVWSxWgp6PYCxk54N3aG9ZXA
 B0zdFwkvQ1d9oNgr1RUNw4+k9/WLIxy3EVucKgL98ql9X8PgttrYt49J/B0D+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g4/6nel3
Subject: Re: [Buildroot] [PATCH v4] configs/rock5b: enable uboot-env on the
 SD card
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

On Wed, 23 Oct 2024 20:25:09 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> From: Niklas Cassel <cassel@kernel.org>
> 
> Having the uboot environment defined on the SD card allows the user to
> use the uboot setenv and saveenv commands to make persistent changes
> (e.g. to change the boot order, or to set a server IP for PXE boot).
> 
> Set the uboot-env partition type GUID to "U-Boot environment", see:
> https://github.com/u-boot/u-boot/blob/v2024.10/doc/README.gpt#L288
> https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs
> and enable CONFIG_PARTITION_TYPE_GUID such that uboot will automatically
> find the SD card partition to store/load the uboot environment to.
> 
> We need to mark the root partition as bootable, otherwise uboot will no
> longer be able to boot the partition by default. (Most likely because
> the root partition is now no longer the first partition on the device.)
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
> Changes since v3:
> -Use partition type GUID to specify the partition to use, rather than
>  hardcoding an offset using uboot Kconfig CONFIG_ENV_OFFSET.

Nice solution: applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
