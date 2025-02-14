Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CF7C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 21:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C09141440;
	Fri, 14 Feb 2025 21:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6W6eYvsQ4IOQ; Fri, 14 Feb 2025 21:58:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 284BF41489
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 284BF41489;
	Fri, 14 Feb 2025 21:58:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F0001F1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 21:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 301F26088C
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 21:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ycnf_Hw6prdX for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 21:58:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CEA9C60771
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEA9C60771
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEA9C60771
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 21:58:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10C81443AA;
 Fri, 14 Feb 2025 21:58:32 +0000 (UTC)
Date: Fri, 14 Feb 2025 22:58:31 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Cc: Neal Frager <neal.frager@amd.com>, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 romain.naour@smile.fr, michal.simek@amd.com
Message-ID: <20250214225831.23731a2d@windsurf>
In-Reply-To: <20250214165402.1128194-1-neal.frager@amd.com>
References: <20250214165402.1128194-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduleemkeelgegsmeehhedttdemvddutggvmegsvgehieemrggsfedvmegtrggrvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekleegsgemheehtddtmedvudgtvgemsggvheeimegrsgefvdemtggrrggvpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepihgsrghir
 dgvrhhkihgrghgrqdgvlhhorhiirgesrghmugdrtghomhdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1739570313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hWFPybMPb6lYZzAMZmWJb55E+4bx+2n4rYwGsaTeQQ0=;
 b=FbyitrI8VaqwmjutHL0RQ6bCOfRFoWwyCQiLzSvfdVWYUT/QHQvttfgzQvJ42WaI/Zn44W
 hnqhICnSZ9R85mDv36XMdsgAO5zeTqHGke92jvnx6msLivbh3EQyL2YIGEZsVjWvyXUvwt
 XRrWrOSxGIGZLvUMjMiFhT2mXxTpIZRC+eJaJYiquHW2fuxn7hIoVqaZbACrUCnAlhrUOv
 PNLP984unJiSmawAYQ6jmLUs/i2+KQQx0iogL//BXFMfY6lDSfs6plwrmOpnuqdMulk+SN
 daeta4MrOtM5HakhjkPhebamq+CxhQhwPEV/t6gpi6FHsgD43VBQgueUD7c1Uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FbyitrI8
Subject: Re: [Buildroot] [PATCH v2 1/4] package/binutils-bare-metal: add
 multiple tuple support
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

Hello Neal,

Thanks for your work on this topic. Overall, the approach you have
taken is exactly what I had in mind, so that's very good. I only have
some implementation details to comment on below.

On Fri, 14 Feb 2025 16:53:59 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> +# to build for multiple arch tuples, it is necesssary to build out of the
> +# source tree, so that each arch tuple can have its own build location
> +define HOST_BINUTILS_BARE_METAL_CONFIGURE_SYMLINKS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		mkdir -p $(@D)/build-$(arch_tuple) && \
> +		ln -sf ../configure $(@D)/build-$(arch_tuple)/configure;)
> +endef

You don't need to create a symlink. We do that in gcc because we're
using <pkg>_SUBDIR, with which the default CONFIGURE_CMDS from
autotools-package assumes the configure script will be in the
<pkg>_SUBDIR. But here, since we are anyway implementing our custom
CONFIGURE_CMDS, creating this symlink is not needed. So I would drop
this HOST_BINUTILS_BARE_METAL_CONFIGURE_SYMLINKS entirely.

See below how things would work.

> +
> +HOST_BINUTILS_BARE_METAL_PRE_CONFIGURE_HOOKS += HOST_BINUTILS_BARE_METAL_CONFIGURE_SYMLINKS
> +
> +define HOST_BINUTILS_BARE_METAL_CONFIGURE_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \

Add here:

		mkdir -p $(@D)/build-$(arch_tuple) && \

> +		cd $(@D)/build-$(arch_tuple) && \
> +		$(HOST_CONFIGURE_OPTS) \
> +		$(HOST_BINUTILS_BARE_METAL_CONF_ENV) \
> +		./configure \

Replace with:

		../configure

or:

		$(@D)/configure

whichever you prefer.

> +			--prefix=$(HOST_DIR) \
> +			--sysconfdir=$(HOST_DIR)/etc \
> +			--localstatedir=$(HOST_DIR)/var \
> +			--enable-shared --disable-static \
> +			--disable-gtk-doc \
> +			--disable-gtk-doc-html \
> +			--disable-doc \
> +			--disable-docs \
> +			--disable-documentation \
> +			--disable-debug \
> +			--with-xmlto=no \
> +			--with-fop=no \
> +			--disable-nls \
> +			--disable-dependency-tracking \
> +			--target=$(arch_tuple) \
> +			--disable-gprof \
> +			--enable-lto \
> +			--disable-initfini-array \
> +			--disable-multilib \
> +			--disable-werror; \

I think the final semi-colon here is not needed.

> +	)
> +endef
> +
> +define HOST_BINUTILS_BARE_METAL_BUILD_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		$(HOST_MAKE_ENV) $(MAKE) \
> +			$(HOST_BINUTILS_BARE_METAL_MAKE_OPTS) \
> +			-C $(@D)/build-$(arch_tuple);)

Instead of this final semi-colon, put the closing parenthesis on the
next line, so that the loop looks like this:

	$(foreach bla,$(list),
		something
	)

> +endef
> +
> +define HOST_BINUTILS_BARE_METAL_INSTALL_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		$(HOST_MAKE_ENV) $(MAKE) \
> +			$(HOST_BINUTILS_BARE_METAL_INSTALL_OPTS) \
> +			-C $(@D)/build-$(arch_tuple);)

Ditto here.

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
