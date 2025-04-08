Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16715C3600C
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 10:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4F8A80C9E;
	Tue,  8 Apr 2025 10:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggj_isl_mAyy; Tue,  8 Apr 2025 10:09:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF8CE80E76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF8CE80E76;
	Tue,  8 Apr 2025 10:09:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDBDB1F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 10:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF68B40504
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 10:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhN5OHX91mKf for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 10:09:16 +0000 (UTC)
X-Greylist: delayed 12843 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 08 Apr 2025 10:09:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C3FF44042F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3FF44042F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3FF44042F
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 10:09:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 268CB43184;
 Tue,  8 Apr 2025 10:09:13 +0000 (UTC)
Date: Tue, 8 Apr 2025 12:09:10 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20250408120910.5dc50b98@booty>
In-Reply-To: <SA1PR12MB56151490BEC4B0D5D05E8991F0B52@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250327111645.1430919-1-neal.frager@amd.com>
 <20250408083505.0a7ecfda@booty>
 <SA1PR12MB56151490BEC4B0D5D05E8991F0B52@SA1PR12MB5615.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddvkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghrnhhouhhtsehmihhnugdrsggvpdhrtghpt
 hhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsrhgrnhguohhnrdhmrghivghrsegtohhllhhinhhsrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744106954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cWgt3yeTz1Fe5OF9C3KiTpd75rE1RIyCjHCjLkf1Yqw=;
 b=Rssy2zqKRmaK9n6umzoor+JL9v2TukkEJVS8e0pNWYHn7kWqnMuSBD6uLvDJyQgy5IMeqz
 F+1ANurfBDgDWzFdte38CIhqTuj9LEskzM/gwNjAgO5lm6Vj41LeGthLl7Lpa8MsMGVMdM
 8zLHTrslJ0CKoGQXT4gmWVigTCDij8hjEjaJ44S+h8ZWAeLc5WsF7mqU+CjKyB7HmkGw/G
 QqkrCVQ33eLLYKVlFrRUIz/FN3xJMyBNj1/wDCHJtETW5i93WIkcMqgTTaeA7yWhmwoboz
 QmOX9sN998stBJ5VIFlThowSrZfIHEEBDm2BgkqRihSZ8FH9KN0jnHek8U81CA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rssy2zqK
Subject: Re: [Buildroot] [PATCH v4 1/3] boot/xilinx-embeddedsw: rename
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

On Tue, 8 Apr 2025 06:40:55 +0000
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
> 
> > I don't have a strong opinion about this series. Definitely the
> > "buildroot" vendor name is more appropriate than "xilinx", and the
> > patches look clean enough, but I'll let the maintainers decide whether
> > it's worth the extra effort.  
> 
> > If this is accepted, however, I think we should remove the "xilinx"
> > vendor support after 1y~1.5y and not carry the maintenance burden
> > indefinitely. Do you think this can be handled by Config.in.legacy, so
> > in the transition phase users of the old tuple are notified?  
> 
> Yes, I agree with this.  Probably the sooner we transition over the better,
> in order to limit the number of users of the xilinx vendor name.

I don't think the number of users is very relevant, and we cannot
control or even know that anyway. If a kconfig value was valid in a
Buildroot release, then we need to handle the transition before it is
made invalid.

Config.in.legacy is the primary tool for this, but I'm not sure it will
work for this specific change which is not removing a kconfig symbol
but rather one of the possible entries within its value.

Maybe you could emit a warning in case the old vendor string is used,
suggesting to switch to the new vendor string, and after 1y+ make it an
error.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
