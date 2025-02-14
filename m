Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F84C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 22:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A05341710;
	Fri, 14 Feb 2025 22:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkTYL9Slj_qV; Fri, 14 Feb 2025 22:04:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1A3B417C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1A3B417C3;
	Fri, 14 Feb 2025 22:04:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E5791E7
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 22:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1E09411D1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 22:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEVyUMU7-HMk for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 22:04:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A493740F4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A493740F4B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A493740F4B
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 22:04:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C08120457;
 Fri, 14 Feb 2025 22:03:57 +0000 (UTC)
Date: Fri, 14 Feb 2025 23:03:56 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Neal Frager via buildroot <buildroot@buildroot.org>
Cc: Neal Frager <neal.frager@amd.com>, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 romain.naour@smile.fr, michal.simek@amd.com
Message-ID: <20250214230356.7463c628@windsurf>
In-Reply-To: <20250214165402.1128194-4-neal.frager@amd.com>
References: <20250214165402.1128194-1-neal.frager@amd.com>
 <20250214165402.1128194-4-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduleemkeelgegsmeehhedttdemvddutggvmegsvgehieemrggsfedvmegtrggrvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekleegsgemheehtddtmedvudgtvgemsggvheeimegrsgefvdemtggrrggvpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepihgsrghir
 dgvrhhkihgrghgrqdgvlhhorhiirgesrghmugdrtghomhdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1739570638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bPiIPJoLCLGgnVil/svvjRM8CL0MWHdaehBs2jaeYw4=;
 b=ew3s3S5EtDL8Ce2H2g5Y8DirqYdNHyq88tj24M1AEfWb4NQ7RCcWu2wSoeWNTy23swypTR
 kgNkQVQMM4DLhW1Fif3g05dNY3C5u3f9ul2Hr/vnPXymqlwS5GyidzbYXfiQMnIi6x+Ds6
 RW8jNU74KhZEGJJZhywqCvglYO/VfbNHhQNYXWxaCuvFQxluHhWPFT/9Tc6w/ejJ5HnqHz
 Jj5EUA+2IZzdZ06wL7KwZE/rcaHc9gtjPiaJ8aWy+x0aGLwtd2I+A+S8k/QHzpfXO+sLIy
 T1AeZ0UHXERCxhKPD4jkIvw8hdlNJcrT18GpCnFlHCkfMpmLIjWLDwvkJU+edg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ew3s3S5E
Subject: Re: [Buildroot] [PATCH v2 4/4]
 toolchain/toolchain-bare-metal-buildroot: update help text for multiple
 tuple support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Fri, 14 Feb 2025 16:54:02 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Now that binutils-bare-metal, gcc-bare-metal and newlib-bare-metal packages
> have been upgraded to support a list of architecture tuples, this patch
> updates the toolchain-bare-metal-buildroot help text to describe the new
> capability.
> 
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is still backwards compatible with
> its prior definition as defining a single tuple with this new definition
> works exactly the same as before.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Overall looks good. Maybe one minor wording comment.

>  config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
> -	string "architecture tuple"
> +	string "list of architecture tuples"
>  	help
> -	  This option allows to define the architecture tuple for the
> -	  bare-metal toolchain.
> +	  This option defines a list of architecture tuples for
> +	  building bare metal toolchains.

This option allows to define the list of architecture tuples for which
bare-metal toolchains will be created. One toolchain will be built for
each of the architecture tuples specified in this option.

> +
> +	  For example, to build both a microblaze and a riscv bare

microblaze -> Microblaze

riscv -> RISC-V

> +	  metal toolchain for Xilinx platforms, use the following

I'm not sure the "Xilinx platforms" here is very relevant.

> +	  definition:
> +	  "microblazeel-xilinx-elf riscv32-xilinx-elf"

In fact, I'm not sure the "xilinx" parts of the tuples here are very
relevant/useful. It's the vendor part of the tuple, so it has basically
no effect. It would probably be even more logical to use
microblazel-none-elf, or even microblazeel-buildroot-elf.

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
