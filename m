Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5646C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 15:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40D4080E4E;
	Mon, 19 May 2025 15:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZY5sHGPPjTE8; Mon, 19 May 2025 15:34:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C86182194
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C86182194;
	Mon, 19 May 2025 15:34:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20A14E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06A6E60ED6
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1uBBg0zKs9s for <buildroot@buildroot.org>;
 Mon, 19 May 2025 15:34:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C668960E77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C668960E77
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C668960E77
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:34:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AD1F43A6A;
 Mon, 19 May 2025 15:34:21 +0000 (UTC)
Date: Mon, 19 May 2025 17:34:19 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20250519173419.322a530a@booty>
In-Reply-To: <SA1PR12MB5615919365719A06F37E3ED7F093A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250409064711.3024937-1-neal.frager@amd.com>
 <20250516104213.0ed78643@booty>
 <SA1PR12MB5615919365719A06F37E3ED7F093A@SA1PR12MB5615.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddujeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghrnhhouhhtsehmihhnugdrsggvpdhrtghpt
 hhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsrhgrnhguohhnrdhmrghivghrsegtohhllhhinhhsrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747668862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3uMzSCqaI3ykHWTI+eMNvd8o3/Eqow7MPIT1OfC1wyk=;
 b=ajiR3Gmy3n287czpNRgrlV7yIXkbt7m012CX+1iGty+3hBEHzp30gNDB6okC0oVBceT01m
 r43NMgPcjvLVzg1uM1bey+GdrbLCT3pT6VOFcvoUmR6IjymwdbyA8Awsj5K7uVktrNgfiP
 NnfCEMOztY1gzb8VogIi+vRwnzhG1AEhJWQY+7i2An7fScrsI7iEWVhmD12727QOam4qiW
 +ZS0Fty/PK4XgBwYi65gBTxMAkx+eOs1wK1yjV/wB1cNRQgjbDqmLskE8mlgBdS4BcYrIw
 7hUgiragiZgkHBNSvay7dPGi9qt7TOSCIKBSLX1A8nOUxdixyIMuvCjoWCiRPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ajiR3Gmy
Subject: Re: [Buildroot] [PATCH v5 1/3] boot/xilinx-embeddedsw: rename
 toolchain vendor to buildroot
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "arnout@mind.be" <arnout@mind.be>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 16 May 2025 09:34:53 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Luca,
> 
> > This patch renames the bare-metal toolchain vendor used by the
> > xilinx-embeddedsw package from Xilinx to Buildroot to be consistent with all
> > other toolchains built by Buildroot.
> >
> > To build the Microblaze applications available with the xilinx-embeddedsw
> > package, the following config is now needed:
> >
> > BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
> >
> > This change keeps backwards compatibility for users already using the
> > following architecture tuple:
> >
> > BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
> >
> > Either vendor name is now valid, but the documentation will describe using
> > the Buildroot vendor name.
> >
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
> > ---
> > V1->V2:
> > - xilinx-embeddedsw is now backwards compatible with either vendor name
> > V2->V3:
> > - split patch into series
> > V3->V4:
> > - rebase patch
> > V4->V5:
> > - add deprecation warning for microblazeel-xilinx-elf tuple
> > ---
> >  boot/xilinx-embeddedsw/Config.in            |  3 ++-
> >  boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 30 ++++++++++++++-------
> >  2 files changed, 23 insertions(+), 10 deletions(-)
> >
> > diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
> > index a27253d594..31b12baaf2 100644
> > --- a/boot/xilinx-embeddedsw/Config.in
> > +++ b/boot/xilinx-embeddedsw/Config.in
> > @@ -1,4 +1,5 @@
> > -comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
> > +comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
> > +     depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
> >       depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
> >
> >  menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
> > diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> > index 7d4fcf8b8f..6e37dc48bd 100644
> > --- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> > +++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> > @@ -12,6 +12,18 @@ XILINX_EMBEDDEDSW_INSTALL_TARGET = NO
> >  XILINX_EMBEDDEDSW_INSTALL_IMAGES = YES
> >  XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot
> >
> > +ifneq ("$(wildcard $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc)","")
> > +$(warning BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf" \
> > +     will soon be deprecated!)
> > +$(warning Please migrate to new bare-metal toolchain config below)  
> 
> > A warning is not very visible, so it won't be very effective. You
> > should really use the same logic that Config.in.legacy uses: error out,
> > and clearly state how to migrate, practically. E.g. (untested):  
> 
> > $(error microblazeel-xilinx-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is not supported anymore!)
> > $(error Replace microblazeel-xilinx-elf with microblazeel-buildroot-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH)  
> 
> If I do this, then it means that users must switch immediately to the new
> microblazeel-buildroot-elf tuple definition.  My thought about the warning was
> that either tuple would be valid for awhile before deprecating the old one.

I understand your idea, and I'm sorry I didn't realize from the
beginning and changed my mind only after testing accurately the series.

However I think a warning will be unnoticed my many users, and others
might just be lazy and ignore it for as long as they can. So basically
they would never update their defconfigs until forced to do so.

It may look a rough attitude, but it's pragmatic, and it is what
happens with Config.in.legacy IIUC: an old symbol is not accepted
starting at a given Buildroot release, but an easy upgrade path is
provided for at least one year after that release. So users upgrading
regularly enough will:

  1) upgrade to newer Buildroot release
  2) have a build failure with instructions on how to update
  3) update their defconfig
  4) build successfully
  5) be happy

Note the "with instructions on how to update" at step 2. This is a
prerequisite to step 5. :-)

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
