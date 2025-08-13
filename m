Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD19CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 08:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 927B641253;
	Wed, 13 Aug 2025 08:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VHmPntBMgyJ; Wed, 13 Aug 2025 08:20:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 715B94125A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 715B94125A;
	Wed, 13 Aug 2025 08:20:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7E271B5
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 08:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A74F6073F
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 08:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sk0BW9JqWgal for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 08:20:31 +0000 (UTC)
X-Greylist: delayed 415 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 13 Aug 2025 08:20:30 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BC9E6073A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BC9E6073A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BC9E6073A
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 08:20:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CB6A43273;
 Wed, 13 Aug 2025 08:20:26 +0000 (UTC)
Date: Wed, 13 Aug 2025 10:20:24 +0200
To: "Frager, Neal" <neal.frager@amd.com>, "arnout@rnout.be"
 <arnout@rnout.be>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "peter@korsgaard.com"
 <peter@korsgaard.com>, "romain.naour@smile.fr" <romain.naour@smile.fr>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek, Michal"
 <michal.simek@amd.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>
Message-ID: <20250813102024.3d15c0c6@booty>
In-Reply-To: <SA1PR12MB5615E50A2137A428191E355FF049A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250617205801.2440300-1-neal.frager@amd.com>
 <20250709170840.347d5738@booty>
 <SA1PR12MB5615E50A2137A428191E355FF049A@SA1PR12MB5615.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfedtgeeuudeuhfdugffhhfejgedvgfevtdfhfeefkeevfefgheevgeduhfeghfelnecuffhomhgrihhnpegsihhnrdgshidpghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepr
 ghrnhhouhhtsehrnhhouhhtrdgsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755073227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=opPiyb4//P0O9bWx/GyuX07mQ9Y4/XGCnzbXaGdSnkI=;
 b=hnagvtg/7zX1PuJO1noWAz3m/yqhsT1B0EjgNGXiatg0hrFf3o1uH1R3mV7Qb2WIxjLbIN
 Pwb/Z/DQMmaQ/1bKidf+HjrqTjNHbR0SY/Fw6mZyicy+m93GQjgb/4E+PCHXgU7Ymeg6B4
 9wDfgD/UJyfLXGAvRcFxZ/DmeF8oove4BTQLNFuoM6jKCa0MEcHNHUk1Qu21uhdgeA6q7t
 IjYz32JVoh3q+5lkQHLfF3/KouHvUB2uUySd1i9AzxNCSSBrbk56Eg6oZRRWwylMpeTKsx
 lQ0VFhlWKTwJzS9oHIzk2Lyk26goW+cYCDdqgiW4seHoxWvPiFsKeD+YL4B2AA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hnagvtg/
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-embeddedsw: add family
 variant choice
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello core Buildroot developers,

On Wed, 9 Jul 2025 23:13:09 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Luca,
> 
> > This patch adds a family variant choice to xilinx-embeddedsw for two reasons.
> >
> > 1. It does not make sense to build a zynqmp_pmufw for a versal platform or
> > versal_plm and versal_psmfw applications for a zynqmp platform.  With this
> > solution, users can only select applications which are targeted for their
> > device family.  
> 
> > I think ZynqmMP is based on Cortex-A53 and Versal on Cortex-A72, so
> > could the various Kconfig symbols depend on either  BR2_cortex_a53
> > or BR2_cortex_a72, without additional symbols?  
> 
> Yes, this could work.
> 
> zynqmp is cortex_a53
> versal is cortex_a72
> versal_gen2 is cortex_a78
> 
> > 2. Buildroot will soon be adding support for the versal_2ve_2vm second gen
> > family. This family has a plm boot application that generates a plm.elf just
> > like the current versal platform. If a user was to select both the versal_plm
> > and the versal_2ve_2vm_plm, two different plm.elf files will be generated
> > causing a conflict at the installation step and a run-time failure when the
> > wrong plm.elf gets included in the boot.bin.  By having a family variant,
> > only one plm.elf can be built at a time depending on the choice of family
> > variant being "versal" or "versal_2ve_2vm".  
> 
> > Is this new family based on A53 or A72? If it is, clearly the above
> > idea won't work for the new family, so in that case see my discussion
> > below.  
> 
> Even though your above idea works, I still like the global family idea.
> 
> > The issue can be seen by comparing the two Makefiles which both create a
> > plm.elf.
> >
> > versal plm:
> > https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm/src/versal
> >
> > versal_2ve_2vm plm:
> > https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm/src/versal_2ve_2vm
> >
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
> > ---
> >  boot/xilinx-embeddedsw/Config.in | 15 +++++++++++++++
> >  configs/versal_vck190_defconfig  |  1 +
> >  configs/versal_vek280_defconfig  |  1 +
> >  configs/versal_vpk180_defconfig  |  1 +
> >  4 files changed, 18 insertions(+)
> >
> > diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
> > index 0dd6433608..7af8d59929 100644
> > --- a/boot/xilinx-embeddedsw/Config.in
> > +++ b/boot/xilinx-embeddedsw/Config.in
> > @@ -28,8 +28,21 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
> >          Release version of Xilinx/embeddedsw.
> >          Must be xilinx_v2023.1 or newer.
> >
> > +choice
> > +     bool "family variant"
> > +     default BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP
> > +
> > +config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL
> > +     bool "versal"
> > +
> > +config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP
> > +     bool "zynqmp"
> > +
> > +endchoice  
> 
> > I agree about the overall idea. I'm not sure the xilinx-embeddedsw
> > package is the ideal place, though. We already have  
> BR2_TARGET_UBOOT_ZYNQMP in the u-boot options, > and similar
> > setting might be needed in the future for other packages. Users are in
> > charge of configuring all those consistently, in different sub-menus.  
> 
> > So I wonder whether it might make sense to add a family selection in a
> > global place, and then have both uboot and xilinx-embeddedsw follow it.  
> 
> > I'm not sure where that might be added, though. The "Target options"
> > menu looks like the obvious place, but currently it is used only for
> > core-specific options, not SoC-specific ones.  
> 
> > Another possible place is the "Bootloaders" menu. While less ambitious,
> > the need for family selection is limited to bootloader-related packages.  
> 
> > Other opinions?  
> 
> > Best regards,
> > Luca  
> 
> Perhaps a global SoC family definition for bootloaders could make sense.

For the need discussed in this thread, a shortcut was found based on
the fortunate coincidence that all SoC families impacted by
xilinx-embeddedsw are based on a different CPU core (a72, a53...).
However this is not necessarily happening in similar future use cases.

So I'm raising this topic to the attention of core Buildroot developers
as the next Buildroot Developer Days are coming in a short time. Some
discussion there may be useful to bring ideas and opinions about how to
handle such SoC-family-specific differentiation within packages ina
generic way.

> For Xilinx SoCs, there are three packages which would use it:
> 
> uboot
> xilinx-embeddedsw
> xilinx-prebuilt
> 
> However, if we do this, both uboot and xilinx-prebuilt already have family definitions.
> 
> We would need to remain backwards compatible with these already defined definitions.
> 
> Also, we would need to think about how to handle zynqmp and kria.
> 
> For xilinx-embeddedsw and uboot, zynqmp and kria are the same,
> but for xilinx-prebuilt, this is not the case.
> 
> Also, since versal products boot with a microblaze running the plm app,
> and not the u-boot spl, I am not sure if uboot will ever need a versal specific config.
> 
> When I get back from vacation, I will resubmit this patch
> using the BR2_cortex configs.
> 
> We can then think about whether creating a global SoC family definition
> makes sense as a next step.
> 
> Best regards,
> Neal Frager
> AMD



-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
