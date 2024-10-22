Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED115CDD0D7
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9112606F2;
	Tue, 22 Oct 2024 19:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPRhRGBy30We; Tue, 22 Oct 2024 19:24:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEB1B607A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEB1B607A1;
	Tue, 22 Oct 2024 19:24:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3EDF2072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8501880EE2
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-B58oRsHOli for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:24:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3726680EE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3726680EE1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3726680EE1
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:24:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7505EC0003;
 Tue, 22 Oct 2024 19:24:22 +0000 (UTC)
Date: Tue, 22 Oct 2024 21:24:20 +0200
To: "Michaelis, Adam J Collins via buildroot" <buildroot@buildroot.org>
Message-ID: <20241022212420.4e850e1c@windsurf>
In-Reply-To: <BN2P110MB1160FC5A43AA27C6195B68A1974CA@BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM>
References: <BN2P110MB1160FC5A43AA27C6195B68A1974CA@BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729625063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2PImBtIgxP6g0jHyGTdUyJbmx+h2qmNhbtP1EuXTj9k=;
 b=HokJL72U2RuRsNciQO6K4CN0olRnEO374i+Yig/SGjN9G8462A/I5+NRjbw4xhl49SJiH3
 PLDGpHqS5kUKq/lvPFMzrdnCODGsoEh2MwOr0AB5W3fD5m/K231NDf9bi5Fz/HPxrlQiT1
 UadGxXi0dUUAc89MYLqfuVOCM/UFKaGs7Lp8+hdhkHMkvd2L6GhurNEDS3QhjWVcQ9upkZ
 NqC5UB3szav3tuxocwxKoFKz/DtiPU+jfDnQ290h1d41VqSg6Aqj6VgLHXCVLir4LTyBt1
 LbXCC5GLFaZWlaDZNYJbymAXKeB4iOcYuvcvaS/eVw+XH94TEREKz0USiUIriQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HokJL72U
Subject: Re: [Buildroot] [PATCH v2 1/1] linux: Install artifacts to staging
 for kmod build
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
Cc: "Michaelis, Adam J Collins" <adam.michaelis@collins.com>, "Buchmeyer,
 Neal Collins" <Neal.Buchmeyer@collins.com>, "Maier, 
 Brandon L                            Collins" <Brandon.Maier@collins.com>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

Thanks a lot for your patch. See below some feedback.

On Tue, 22 Oct 2024 16:06:27 +0000
"Michaelis, Adam J Collins via buildroot" <buildroot@buildroot.org> wrote:

> From 45b18a0b5af619fd90194634530cc75f995ea57a Mon Sep 17 00:00:00 2001
> From: Adam Michaelis <adam.michaelis@collins.com>
> Date: Wed, 16 Oct 2024 09:06:14 -0500
> Subject: [PATCH v2 1/1] linux: Install artifacts to staging for kmod build

Please use git send-email to send your patches, instead of sending the
result of "git format-patch" directly in an e-mail. Indeed, otherwise
we have two times the From:, Date:, Subject:, etc. headers.

> Installing kernel build artifacts to staging so that the user could use
> the exported SDK to build out-of-tree kernel modules.

I think this could be worded a bit better. "This commit adds an option
that allows to install to the staging directory the necessary
files/artefacts that are needed to build out of tree kernel modules.
This is relevant when one wants to build out of tree kernel modules
using the Buildroot-generated SDK".

> +config BR2_LINUX_KERNEL_INSTALL_STAGING
> +       bool "Install kmod build files to staging"
> +       help
> +         Select this option to have the kernel files required for
> +         out-of-tree module building installed to staging. This will
> +         then enable module building from an exported SDK without
> +         the full Linux build and Buildroot.

I am actually wondering whether this should be an option. We don't have
any similar option for any other package.

> +define LINUX_INSTALL_STAGING_CMDS
> +       # Install artifacts needed for module builds into staging for SDK use
> +       if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
> +               install -d "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/arch" && \
> +               rsync --exclude "*.o" -a "$(@D)/arch/$(KERNEL_ARCH)" \
> +                       "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/arch/" && \
> +               rsync --exclude "*.o" --exclude "*.a" -a "$(@D)/include" \
> +                       "$(@D)/scripts" "$(@D)/certs" "$(@D)/Makefile" \
> +                       "$(@D)/Module.symvers" "$(@D)/.config" \
> +                       "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/" ;\

This feels a bit "crappy", these manual rsyncs. Doesn't the kernel has
some relevant make target that do the right thing?

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
