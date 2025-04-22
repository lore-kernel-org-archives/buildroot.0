Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24057C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 21:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5E5F40352;
	Tue, 22 Apr 2025 21:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzhfxZcAD3vO; Tue, 22 Apr 2025 21:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D32B406AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D32B406AA;
	Tue, 22 Apr 2025 21:32:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 592D91BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 286C140352
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJQJOAo2L947 for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 21:32:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 074D940BB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 074D940BB6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 074D940BB6
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:32:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BDDF439F7;
 Tue, 22 Apr 2025 21:31:58 +0000 (UTC)
Date: Tue, 22 Apr 2025 23:31:57 +0200
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Julien
 Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>, Akhilesh Nema
 <nemaakhilesh@gmail.com>
Message-ID: <20250422233157.27a969d7@windsurf>
In-Reply-To: <20250328180427.3434693-16-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-16-olteanv@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopeholhhtvggrnhhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegtihhorhhnvghii
 hhorghnrgesghhmrghilhdrtghomhdprhgtphhtthhopeeurhgrnhguohhnrdforghivghrsegtohhllhhinhhsrdgtohhmpdhrtghpthhtohepvhhjrghrughinhesfhhrvggvrdhfrhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepnhgvmhgrrghkhhhilhgvshhhsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745357519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xlUF2QT9DSBaWdf5h3xWqICfq+XR5XdJSvVFTJ+6aP0=;
 b=RQJ3a1Mp0RjFnzz8/4l9w2pX3fWuxuhOVo99lh+s8NKTXvCoJ8jKVqHon9bZtjQSoT148f
 nhJGflSo7frxU6GExd+3zWKXeH9Bx5bR9ljtNX9crEhhbCBKuB/JdHrXfxAwJ+UnlohQ/k
 cRABhjL19iGZtHpcSPVDiCQvBCWwDi0Myab88+Jut2PLYA0VIzeWknCVgjIhT5Y/0rAaBP
 7y+M6HYufcRVpvwfIX+3JdbGzODh8r/QGbOHzg8GnS9aN5Trc32Ng3zn8gupD4VMae3HnC
 2jvxqDPiOsPAYUEuRXIlqOetKCn57bDl/936MwR1jXU1f0CM39o6aKywLhntcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RQJ3a1Mp
Subject: Re: [Buildroot] [PATCH v2 15/18] package/qoriq-mc-utils: new package
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

Hello Vlad,

Thanks for the v2, which I have applied. I have some comments below,
though.

On Fri, 28 Mar 2025 20:04:23 +0200
Vladimir Oltean <olteanv@gmail.com> wrote:

> The configuration files for the MC firmware binary are distributed
> through a separate repository on GitHub, and need a different package.
> They are licensed differently than the firmware itself, and unlike the
> firmware, they are customizable.
> 
> There are two ways for a board to use this package - similar to
> qoriq-rcw. If it is an NXP reference board or if the example files
> otherwise work fine with it, it is recommended to set the _INTREE
> variables to select a pre-existing DPL and DPC. Otherwise, if it is a
> custom board, the best solution is to just provide the DPL and DPC dts
> files in board/, and set the _CUSTOM_PATH variables to point to them.
> 
> There are also two ways to deploy to the target.
> 
> Traditionally in NXP BSPs, U-Boot loads the MC firmware, DPL and DPC
> from given offsets in the storage medium (outside of the filesystem).
> But this is not hardcoded and it doesn't have to be the case - the
> mcinitcmd U-Boot environment variable is freely customizable. What can
> also be done, and is done for the LX2160A-RDB, is to deploy multiple DPL
> and DPC files (all the files available for a board) to a folder of the
> rootfs, and just have two symlinks: dpl.dtb and dpc.dtb which point to
> the currently active files. This makes easier the processes of
> upgrading, downgrading and keeping multiple file versions.
> 
> Nonetheless, the "traditional" method of deploying to the target is also
> possible. The selected DPL and DPC files are deployed to the "images"
> folder and are freely usable with genimage or other post-image scripts.

Very nice commit log, really. It does help people like me, who are not
familiar with the details of QorIQ platforms, understand why the
package is done like this. So clearly thanks a lot for this commit log
(the one on qoriq-mc-binary was equally useful).


> +QORIQ_MC_UTILS_VERSION = 10.39.0
> +QORIQ_MC_UTILS_SITE = $(call github,nxp-qoriq,mc-utils,mc_release_$(QORIQ_MC_UTILS_VERSION))
> +QORIQ_MC_UTILS_LICENSE = BSD-3-Clause
> +QORIQ_MC_UTILS_INSTALL_IMAGES = YES
> +ifeq ($(BR2_PACKAGE_QORIQ_MC_UTILS_TARGET_INSTALL_PATH),)
> +QORIQ_MC_UTILS_INSTALL_TARGET = NO
> +endif

For the same reason as for qoriq-mc-binary, this couldn't work as
$(BR2_PACKAGE_QORIQ_MC_UTILS_TARGET_INSTALL_PATH) is never empty.

> +QORIQ_MC_UTILS_DEPENDENCIES = host-dtc
> +
> +QORIQ_MC_UTILS_DPC_FILES = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPC_CUSTOM_PATH))
> +QORIQ_MC_UTILS_DPC_INTREE = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPC_INTREE))
> +QORIQ_MC_UTILS_DPL_FILES = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPL_CUSTOM_PATH))
> +QORIQ_MC_UTILS_DPL_INTREE = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPL_INTREE))
> +QORIQ_MC_UTILS_INSTALL_PATH = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_TARGET_INSTALL_PATH))
> +
> +define QORIQ_MC_UTILS_INSTALL_FILES
> +	$(foreach file, $(QORIQ_MC_UTILS_DPC_FILES) $(QORIQ_MC_UTILS_DPL_FILES), \
> +		PATH=$(BR_PATH) dtc -I dts -O dtb $(file).dts -o $(1)/$(notdir $(file)).dtb; )
> +	$(foreach file, $(QORIQ_MC_UTILS_DPC_INTREE) $(QORIQ_MC_UTILS_DPL_INTREE), \
> +		$(INSTALL) -D $(@D)/config/$(file).dtb $(1)/$(notdir $(file)).dtb; )

Nit: I dropped the ; and moved the parenthesis to the next line, as
this is usually how we format such loops in Buildroot.

However, initially I was confused: you were not doing anything with the
external DPC/DPL files, so I was wondering how the BUILD_CMDS could do
something with them. Turns out you can actually build them "manually"
with dtc at install time.

So I was initially a bit hesitant: I think it would have made more
sense to actually build those files in the build step, and only do the
installation at the install step. Right now, you might be building them
twice (once when installing to images, once when installing to target).
Sure thing, a dtc run isn't long, so performance-wise not a problem.
But if we imagine that DTC was stored a timestamp in the .dtb, then the
.dtb in images/ and target/ would be different. Not super nice, but
overall I decided that it was a bit bike-shedding, so I applied your
patch as-is. But I thought it was worth sharing my thoughts
nevertheless.

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
