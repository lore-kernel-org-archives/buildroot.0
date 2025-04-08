Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8848C3600C
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 06:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55B10610F5;
	Tue,  8 Apr 2025 06:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcXmFR-JdZ72; Tue,  8 Apr 2025 06:49:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6636B61058
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6636B61058;
	Tue,  8 Apr 2025 06:49:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 40E7DDA
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 06:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 285E181F0D
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 06:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gih2w5YrO5M for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 06:48:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 180318177C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 180318177C
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 180318177C
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 06:48:57 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 7CC5F580185
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 06:35:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DEE344441;
 Tue,  8 Apr 2025 06:35:07 +0000 (UTC)
Date: Tue, 8 Apr 2025 08:35:05 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250408083505.0a7ecfda@booty>
In-Reply-To: <20250327111645.1430919-1-neal.frager@amd.com>
References: <20250327111645.1430919-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddvfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghrnhhouhhtsehmihhnugdrsggvpdhrtghpt
 hhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsrhgrnhguohhnrdhmrghivghrsegtohhllhhinhhsrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744094108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TMPXGkHjNCrx3aUri6RzMZ0HN60d7PMS7VWX+1CcS/Y=;
 b=jq2WsReoAvvWEOxr3Zr+T9A6zUMRtTUyFbfJvDOmu3eLalOc3zfC69Y3GkQA8y6hu1b7Gd
 U7+hKIHckxN76sgbkcLjjEa0buLEWfomHsHtEwSNVsBqMtcnxsoSEza5vFN0QzPmDko51a
 l2mnYfo2cje1Ey9ZXQhXh0+Ka4GH+gPvCpIncQM3pB/ElLLSlOIjqa0AEJTMGwgu8i/k7l
 F694QduXF68FdC3OKK0PH3DKwyT7X0wKPcm6outhRUsKeuwMd5bvbQxF7nxoPVzxlA5EgO
 z2XSykbqbTwSBLd9CF23TTNd+CThj5jcdro3LSxteIrD1hhtDK8lyHSviplILg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jq2WsReo
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
Cc: ibai.erkiaga-elorza@amd.com, arnout@mind.be, brandon.maier@collins.com,
 ju.o@free.fr, thomas.petazzoni@bootlin.com, buildroot@buildroot.org,
 romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Thu, 27 Mar 2025 11:16:43 +0000
Neal Frager <neal.frager@amd.com> wrote:

> This patch renames the bare-metal toolchain vendor used by the
> xilinx-embeddedsw package from Xilinx to Buildroot to be consistent with all
> other toolchains built by Buildroot.
> 
> To build the Microblaze applications available with the xilinx-embeddedsw
> package, the following config is now needed:
> 
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
> 
> This change keeps backwards compatibility for users already using the
> following architecture tuple:
> 
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
> 
> Either vendor name is now valid, but the documentation will describe using
> the Buildroot vendor name.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

I don't have a strong opinion about this series. Definitely the
"buildroot" vendor name is more appropriate than "xilinx", and the
patches look clean enough, but I'll let the maintainers decide whether
it's worth the extra effort.

If this is accepted, however, I think we should remove the "xilinx"
vendor support after 1y~1.5y and not carry the maintenance burden
indefinitely. Do you think this can be handled by Config.in.legacy, so
in the transition phase users of the old tuple are notified?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
