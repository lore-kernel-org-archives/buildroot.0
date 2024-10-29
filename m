Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8419FD2AB0D
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 09:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3286980F1E;
	Tue, 29 Oct 2024 09:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUjAqhd5hEw3; Tue, 29 Oct 2024 09:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 503E78104F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 503E78104F;
	Tue, 29 Oct 2024 09:38:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E793D112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0AA440591
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9vQneuGb-kT for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 09:38:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D4F5405A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D4F5405A1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D4F5405A1
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:38:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 531CAE0013;
 Tue, 29 Oct 2024 09:38:47 +0000 (UTC)
Date: Tue, 29 Oct 2024 10:38:46 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20241029103846.631ecfd5@windsurf>
In-Reply-To: <CH2PR12MB5004C6ED05628E45F099A388F04B2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20241029070344.2661276-1-neal.frager@amd.com>
 <20241029100133.06382c6e@windsurf>
 <CH2PR12MB5004C6ED05628E45F099A388F04B2@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730194727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2WyVVEVCIwWyRP/dijB5OxxUVgWgns1DmuYIxs50VEg=;
 b=YhRb+rsBOMj/dHsEVByYX2HVtmBM2ZWcMxMkCZoa378LSTHULaOg7vprO9gNtvshQoGU4R
 Fg7U2W2adZQ8Xgbw797or0CKMKEDW9eIxQt1xZIZkbTX4tJUmXbRhy6ktyv9NiQIKrlEzr
 kqaoopdulhhq1meYQXhMuBRQaT96pMn6Q/XdGAp+MV8MqiFMuKq5mG9Io+IW0QuHs5Jwrn
 me6cmwDJxmawBzr4wVxpqyGhDVMdBHXbtd1xkQ4De4UZqlcNwdMY7kssXuKFX/R5SMeKZU
 qhX2qHnhXmOX1aoohBIeFooa6HV1NzwjdLg2gJSh6jeqnmTQ4SDkjMnKWwqIcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YhRb+rsB
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: clean up variable
 names
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 29 Oct 2024 09:08:41 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> If that is the case, then maybe these are wrong?
> 
> https://github.com/buildroot/buildroot/blob/master/package/binutils-bare-metal/binutils-bare-metal.mk
> https://github.com/buildroot/buildroot/blob/master/package/gcc-bare-metal/gcc-bare-metal.mk

"Wrong" no, as they work, but we indeed normally define those variables
without a HOST_ prefix.

One thing that should be fixed is:

define GCC_BARE_METAL_CONFIGURE_SYMLINK
	mkdir -p $(@D)/build
	ln -sf ../configure $(@D)/build/configure
endef

HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += GCC_BARE_METAL_CONFIGURE_SYMLINK

GCC_BARE_METAL_CONFIGURE_SYMLINK should be
HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
