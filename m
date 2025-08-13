Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAE2C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 10:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9DDC8184F;
	Wed, 13 Aug 2025 10:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jq9WFkjhD7r; Wed, 13 Aug 2025 10:33:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B42EE8186A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B42EE8186A;
	Wed, 13 Aug 2025 10:33:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0C251B5
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 10:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C75AD8184F
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 10:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4dRg0jTbDkA for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 10:33:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9ACA5817C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ACA5817C0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9ACA5817C0
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 10:33:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30901443AF;
 Wed, 13 Aug 2025 10:33:35 +0000 (UTC)
Date: Wed, 13 Aug 2025 12:33:35 +0200
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <20250813123335.3c421094@windsurf>
In-Reply-To: <20250813102024.3d15c0c6@booty>
References: <20250617205801.2440300-1-neal.frager@amd.com>
 <20250709170840.347d5738@booty>
 <SA1PR12MB5615E50A2137A428191E355FF049A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250813102024.3d15c0c6@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtoheprghrn
 hhouhhtsehrnhhouhhtrdgsvgdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhr
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755081217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=no5OInC71PRzz8MjFaj3WTrMTI32PpzOLemuam45W4I=;
 b=CjpvV8o3u+WQfbdsz3ZoAO2/XL07cufxwMQgx/JBAo6EtdstCOoj19AnfnX2uuVmO2avfK
 kUD+iP/iz4bpZ2UsA47DMpslc3pMPDxusNG1Dx5Ymja+NekjtrHE1DizVm8ZtmRDpYFOkK
 L5R5v/MBcN/YBnleR4bvtoDuY5ny317MUwQGWo6C1d6YePbK4GuwnJlVjyCVNX8C7squEK
 RTCd4lQd8j70D8sluyw0COiv7azXEqcxiMaRROTvOQzaIpvPdt6tcnJQos4FID4nsZi2M0
 z0/HpV2sDTLvsRvEmrnmg3fAU6va/gh5cSAIYSKdqSUwiOLTptLNRhED7INXGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CjpvV8o3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>, "Frager, Neal" <neal.frager@amd.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 13 Aug 2025 10:20:24 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> > Perhaps a global SoC family definition for bootloaders could make sense.  
> 
> For the need discussed in this thread, a shortcut was found based on
> the fortunate coincidence that all SoC families impacted by
> xilinx-embeddedsw are based on a different CPU core (a72, a53...).
> However this is not necessarily happening in similar future use cases.
> 
> So I'm raising this topic to the attention of core Buildroot developers
> as the next Buildroot Developer Days are coming in a short time. Some
> discussion there may be useful to bring ideas and opinions about how to
> handle such SoC-family-specific differentiation within packages ina
> generic way.

I haven't followed the whole discussion. We do already have some SoC
selection for i.MX platforms somewhere in package/freescale-imx/.

I am a bit balanced with this idea of having a top-level SoC selection.
On one hand it would indeed help to show/not show relevant packages. On
the other hand, people will think "my SoC is not in this list, so
Buildroot doesn't support it" just like people already think "there is
no defconfig in Buildroot, so Buildroot doesn't support my platform".
Also, it would be a quite long list to maintain. So I'm not fully
against, but I'm not super sold to it as well.

So far on the bootloaders side, I believe what matters is appropriate
help text describing for which platform a given package is designed, if
it's a platform-specific package.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
