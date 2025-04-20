Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68729C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 21:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09C424073B;
	Sun, 20 Apr 2025 21:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpNGdwDDOP0Q; Sun, 20 Apr 2025 21:13:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0304A406FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0304A406FD;
	Sun, 20 Apr 2025 21:13:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EAF1D1C0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC1C480DC3
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1_Yjnt_vRuP for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 21:13:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C18C80DC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C18C80DC7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C18C80DC7
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:13:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3002D440FE;
 Sun, 20 Apr 2025 21:13:09 +0000 (UTC)
Date: Sun, 20 Apr 2025 23:13:07 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
Message-ID: <20250420231307.413d3108@windsurf>
In-Reply-To: <20250420204540.32264-1-fl@n621.de>
References: <20250420204540.32264-1-fl@n621.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeekleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfhhlsehniedvuddruggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745183589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FxtkoP/C7tPljF0qNwOHYCXmO4XHYnMlFq9jYTAI2bo=;
 b=Ai3jrM6+J3Y0YPttNCr5t/6nEaNfsJEESzY7IiLGNS3e0kW9vCceaqHMgWSGn778D53KYW
 7lX5y1au0z82+Q+1HN3070aRVgVR/oEnXVp+4WgnnBKYlI01UW1P41EVfbG9+Ee7bRgWMb
 8i/nWw8ZdlGLN1kmmdhIzOjCOq69QGu2VES0wuNPuiRe3oLKYgUb6G9Uv1ZlO25TipE/kP
 uQMsPzYvbjBpVnaCT1NJxQ1CYMM/N/rNedM5Ie9Jo6ZSMZzZXChBUwahjT7nNPeBsNu3VS
 GyRIdxgfCEvxEBdPZTIRzjtvMkrYROB+CYYjCy+gBGirjScNtpsXo2Fj9iMLtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ai3jrM6+
Subject: Re: [Buildroot] [PATCH 1/1] package/casync-nano: new package
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

Hello Florian,

On Sun, 20 Apr 2025 22:45:38 +0200
Florian Larysch <fl@n621.de> wrote:

> casync-nano is an implementation of a subset of the features of casync,
> optimized for performing OTA updates on embedded systems.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Thanks for this contribution, this looks really good. I only have a few
questions, below.


> +config BR2_PACKAGE_CASYNC_NANO_CASYNC_SHIM
> +	bool "install casync shim"
> +	# only once package should provide the "casync" command
> +	depends on !BR2_PACKAGE_CASYNC
> +	help
> +	  Install a shim that provides basic compatibility with the
> +	  "extract" sub-command of casync to programs that expect it.

I am wondering if we really need this option. What about simply
installing this shim automatically if BR2_PACKAGE_CASYNC is disabled?


> +CASYNC_NANO_VERSION = 1.1.1
> +CASYNC_NANO_SITE = $(call github,florolf,casync-nano,v$(CASYNC_NANO_VERSION))
> +CASYNC_NANO_LICENSE = LGPL-2.1
> +CASYNC_NANO_LICENSE_FILES = COPYING
> +CASYNC_NANO_DEPENDENCIES = host-pkgconf openssl zstd libcurl
> +
> +ifeq ($(BR2_PACKAGE_CASYNC_NANO_CASYNC_SHIM),y)
> +define CASYNC_NANO_INSTALL_CASYNC_SHIM
> +	ln -sf csn $(TARGET_DIR)/usr/bin/casync
> +endef
> +endif
> +
> +define CASYNC_NANO_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m0755 $(@D)/csn $(TARGET_DIR)/usr/bin/csn
> +	$(CASYNC_NANO_INSTALL_CASYNC_SHIM)
> +endef
> +
> +HOST_CASYNC_NANO_DEPENDENCIES = host-pkgconf host-openssl
> +HOST_CASYNC_NANO_CONF_OPTS = -DBUILD_CSN=Off -DBUILD_CSN_TOOL=On

Why aren't those same options set for the target variant? I'm not quite
sure to understand why the host and target variant don't have the same
dependencies. If zstd and libcurl are optional, then they should also
be optional for the target variant.

Could you clarify this point?

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
