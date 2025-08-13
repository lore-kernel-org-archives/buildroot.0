Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E24C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 13:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7973D608CE;
	Wed, 13 Aug 2025 13:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZ8llk2Fmv52; Wed, 13 Aug 2025 13:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CBB1608CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CBB1608CA;
	Wed, 13 Aug 2025 13:31:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB79C938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 13:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2133608C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 13:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVVZEQhorSeZ for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 13:31:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8BF2608CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8BF2608CA
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8BF2608CA
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 13:31:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3557843955;
 Wed, 13 Aug 2025 13:31:34 +0000 (UTC)
Date: Wed, 13 Aug 2025 15:31:32 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Cc: "yann.morin@orange.com" <yann.morin@orange.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Message-ID: <20250813153132.5942d8f7@booty>
In-Reply-To: <SA1PR12MB56150000BDD0EC7C783A9CEFF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250813084354.2739722-1-neal.frager@amd.com>
 <aJxY+xaZhMFLzxX9@yd-6wlzhs3> <20250813112755.63b17355@booty>
 <SA1PR12MB5615D78075169997FF3A7369F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <aJxiOiEp8IG2zdXX@yd-6wlzhs3>
 <SA1PR12MB561513AAF7E7C17AF954956BF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <aJxyq8E0t+89Dxh2@yd-6wlzhs3>
 <SA1PR12MB56150000BDD0EC7C783A9CEFF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeekfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopeihrghnnhdrmhhorhhinhesohhrrghnghgvrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdro
 hhrghdprhgtphhtthhopehisggrihdrvghrkhhirghgrgdqvghlohhriigrsegrmhgurdgtohhmpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhr
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755091895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=52BXOe9z/yqXGEglg57qqG1mp/yU/tsWRat2LjTIaOw=;
 b=SYYqeO/D82YY7vA+wRNN/XX+6ayZDvL8NSEzlkgSDzT4LU9oQ5l1HRjimGE0P63/SQdt4E
 o/PAkBRoaHr3JtQBaYNWnYxcusghJkDcDfPZe7SQAvZZy8qleKx0JaD8HWposcGc8zZ+nY
 0sDVREzqfluwi0Ag0138VbNOyhagoI7fORbLRrrIwjRcsT/8Rt+1cxX1wzhK6k5hiIVVRB
 /k0cI+IRXwLMxC3FqS6eiUgHY4y0wybe1Sy4U/x5hLuAd1CkcvHm4N0BKCdPh243ITa22l
 ybiOVnjMOfpV4do6PfeMxAhVOj46cm9Ir1tPRDmi9cIbLhAEZI5ZQbiHo5HziA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SYYqeO/D
Subject: Re: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
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

Hello Neal,

On Wed, 13 Aug 2025 11:46:24 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Yann,
> 
> [--SNIP--]
> > > When the dependency is not tricvial, I think it is good to introduce an
> > > intermediate symbol:
> > >    config BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS  
> [--SNIP--]
> > I see your point, but don't you think adding another symbol is still
> > a bit overkill?  The dependencies are still only 3 lines and are rather
> > straight forward.  
> 
> > This would not be unheard of, there already are a few packages with very
> > few arch dependencies, but that still have a dedicated symbol, see for
> > example (some are more interesting, as they do have comments for each
> > dependency they carry):
> >  - bayer2rgb-neon
> >  - bitcoin
> >  - bpftrace
> >  - dpdk
> >  - host-flutter-sdk-bin
> >  - (host-)gdb
> >  - gtkiostream
> >  - ... and so on...  
> 
> > Note that we usually do that for libraries, so that it is easier to
> > inherit their dependencies in selecting packages, but of the above,
> > only two are libraries.  
> 
> > But maintainers will have to decide what they want. ;-)  
> 
> In the end, I changed my mind on the issue since there are two places where
> the arch dependency is used. The BR2_TARGET_XILINX_EMBEDDEDSW as well as the
> comment about the dependency needs.
> 
> To avoid having the two be out of sync, it makes sense to create a
> symbol BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS that keeps all the arch
> dependencies in one place. This way, when I add BR2_cortex_a78 in the near
> future, I will only have one place to add it instead of two.

I agree this is a good idea.

However the same logic can apply to other Xilinx firmware and related
packages, such as xilinx-prebuilt. Thus I'd rather create a single
symbol that can be reused for both packages, and it should probably be
in boot/Config.in. It should be also named without "EMBEDDEDSW", e.g.
BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS.

Side note: I personally don't recommend sending new iterations so
quickly, without letting the discussion settle, it produces a lot of
noise. I'd wait at least a few days after the latest e-mail in the
discussion before sending a new version.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
