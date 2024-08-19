Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7814AC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 07:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DE7360087;
	Mon, 19 Aug 2024 07:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMHOSIdTYZCI; Mon, 19 Aug 2024 07:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 377CA605B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 377CA605B1;
	Mon, 19 Aug 2024 07:51:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49A4A1BF297
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 07:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37C034016B
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 07:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxcZSspha4Bp for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 07:51:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68B5040169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68B5040169
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68B5040169
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 07:51:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D70D140002;
 Mon, 19 Aug 2024 07:51:33 +0000 (UTC)
Date: Mon, 19 Aug 2024 09:51:32 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240819095132.5f49f19b@booty>
In-Reply-To: <D3GJE2B5H120.3AGKGHGRX6YB@collins.com>
References: <20240809-boot-uboot-fix-dependency-on-xilinx-prebuilt-v1-1-7014697db0c6@collins.com>
 <20240815111415.25844e3a@windsurf>
 <D3GJE2B5H120.3AGKGHGRX6YB@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724053894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dd1sQcTceX2+luFlfrdLqO8voJ/xdAELIy12+Poz3Fc=;
 b=buL/DTvF2nHpBN9Mx13n2ypUHXAiFS2VdFbLxHLKMYYywHDxLztFGKZ6iqvtNxEacpfU5x
 ukcTd16WvQFp1f48PcDo3bI8u3D8X7/snyD6Ejp76adzjeiR7HhF59xjEsfJDqI8DLAl5l
 mff8+N8oCvibvjuu8Ci2jCQvtJXXCf/Xt9kGtyr/Kpe0cOZcKtYOKLY8xHMl2tZH43Sio0
 blT4v2klNHpASfF0bS/KkVQKmuFZJwJh2AkKg9lsUlKkOp6s3xI+An12lD4MXeCBZz/33d
 BfhGdF82QlqVXTYmrczAsnMS5hThQqo4km4T9P+rVrnMw1r4QWos2osIqW8tbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=buL/DTvF
Subject: Re: [Buildroot] [PATCH] boot/uboot: fix dependency on
 xilinx-prebuilt
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brandon Maier <brandon.maier@collins.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brandon,

On Thu, 15 Aug 2024 13:58:07 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> Hi Thomas,
> 
> On Thu Aug 15, 2024 at 9:14 AM UTC, Thomas Petazzoni via buildroot wrote:
> > Hello Brandon,
> >
> > On Fri, 09 Aug 2024 16:30:18 +0000
> > Brandon Maier via buildroot <buildroot@buildroot.org> wrote:
> >  
> > > When building with `make -j` and PER_PACKAGE_DIRECTORIES, a race
> > > condition occurs between xilinx-prebuilt and u-boot, resulting in the
> > > following error.
> > >
> > >   objcopy -O binary -I elf32-little .../images/pmufw.elf .../images/pmufw.bin
> > >   objcopy: '.../images/pmufw.elf': No such file
> > >
> > > U-Boot registers a KCONFIG_FIXUP_CMD that uses the pmufw.elf from
> > > xilinx-prebuilt. But KCONFIG_FIXUP_CMDS does not use the normal
> > > DEPENDENCIES, so xilinx-prebuilt is not guaranteed to have run before
> > > fixup.
> > >
> > > Instead move the `objcopy` call out to a PRE_BUILD_HOOK so it will run
> > > after xilinx-prebuilt has finished.

Thanks for having fixed this! I apologize for not having reviewed this
earlier -- vacation time + inbox full :(

> > > +ifeq ($(suffix $(UBOOT_ZYNQMP_PMUFW_PATH)),.elf)
> > > +UBOOT_ZYNQMP_PMUFW_PATH_FINAL = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH)).bin
> > > +define UBOOT_ZYNQMP_PMUFW_CONVERT
> > > +	objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_PATH) $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)  
> >
> > Should we be using $(TARGET_OBJCOPY) instead of objcopy to use the
> > target toolchain objcopy?  
> 
> I'm not certain, as Neal pointed out the PMU.elf is a microblaze. I'm
> guessing this works today as `objcopy` probably doesn't need to support
> the target architecture to convert an ELF to a binary.
> 
> If that is true, then maybe we should use $(TARGET_OBJCOPY) anyway. So
> we aren't relying on the build system's version of `objcopy`.

While both are "wrong but working", I agree using $(TARGET_OBJCOPY)
would make the process more reproducible and predictable. While there,
adding an explanatory comment would be a good idea.

> > > +endef
> > > +UBOOT_PRE_BUILD_HOOKS += UBOOT_ZYNQMP_PMUFW_CONVERT
> > > +else
> > > +UBOOT_ZYNQMP_PMUFW_PATH_FINAL = $(UBOOT_ZYNQMP_PMUFW_PATH)
> > > +endif
> > >  define UBOOT_ZYNQMP_KCONFIG_PMUFW
> > > -	$(if $(filter %.elf,$(UBOOT_ZYNQMP_PMUFW_PATH)),
> > > -		objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin
> > > -		$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_BASENAME).bin"),
> > > -		$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)"))
> > > +	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)")  
> >
> > This means this KCONFIG_SET_OPT is not unconditionally if I'm not
> > wrong (so even on platforms that are not Xilinx ones). Shouldn't it
> > only be done if $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL) is not empty?  
> 
> This whole section is inside a `ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)`
> block, so it will only run on Xilinx ZynqMP platforms. However it's
> possible to set the PMUFW to an empty string and then it will set
> CONFIG_PMUFW_INIT_FILE to an empty string.
> 
> If a developer set CONFIG_PMUFW_INIT_FILE in a custom U-Boot defconfig
> or frag, then this could overwrite it. Though I'm not sure if there's
> any practical use-case where this is an issue.
> 
> I can send a patch to add the empty string check though, it seems
> harmless to add.

By a cursory look at the U-Boot code, it looks like the U-Boot build
would fail. If that's the case, I don't think we need an extra check
here: empty string would be just one of all possible incorrect settings
that just cause a build failure.

IOW, I'd only add a check if it can cause subtle issues that are
hard to notice and debug, like a "successful" build (returning zero)
producing non-working binaries.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
