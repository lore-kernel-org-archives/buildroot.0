Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F2BCA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 09:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78822411FE;
	Wed, 13 Aug 2025 09:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sjsd_mPjiRAX; Wed, 13 Aug 2025 09:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88757410E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88757410E1;
	Wed, 13 Aug 2025 09:28:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2A6F938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 09:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B49F74021D
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 09:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emVIVLgN7tqA for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 09:28:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6A6440134
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6A6440134
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6A6440134
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 09:28:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C265431EB;
 Wed, 13 Aug 2025 09:27:57 +0000 (UTC)
Date: Wed, 13 Aug 2025 11:27:55 +0200
To: yann.morin@orange.com
Cc: Neal Frager <neal.frager@amd.com>, <buildroot@buildroot.org>,
 <ibai.erkiaga-elorza@amd.com>, <brandon.maier@collins.com>, <ju.o@free.fr>,
 <thomas.petazzoni@bootlin.com>, <romain.naour@smile.fr>,
 <michal.simek@amd.com>, <romain.naour@gmail.com>
Message-ID: <20250813112755.63b17355@booty>
In-Reply-To: <aJxY+xaZhMFLzxX9@yd-6wlzhs3>
References: <20250813084354.2739722-1-neal.frager@amd.com>
 <aJxY+xaZhMFLzxX9@yd-6wlzhs3>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohephigrnhhnrdhmohhrihhnsehorhgrnhhgvgdrtghomhdprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdro
 hhrghdprhgtphhtthhopehisggrihdrvghrkhhirghgrgdqvghlohhriigrsegrmhgurdgtohhmpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhr
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755077278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wMk56LY95RSWv1tXxrhw2xYANaC2isE+yvg9jsdaUg=;
 b=A4tqJ4CLdh9ba3J1W5/WXlurJo3n2y19jLe5ZCXl8BGiOx/IJfhyKj+onq/0SqzLWltm/5
 udGHBP0dGX9q27uZzd5Q0a71iFjCclYlua6LiJ/l/MHWgynx8cZWBCJFtXlLLMe5pAUkKr
 94RcUW6evzFZc16Mzi+K/+MZ7xeewWQPiwSM8s7Rm8HNuPwIqWal8I+BjiQbm2gzxrBihF
 vPV/Rz7cMKwB09b8oDnHFMtG0RaC1F+vPWRPgkCQtD9gv3emmP5V0N38q+fcU18nDeRThc
 /QeryScHjhfwq9ynJH3iJYAXTgOmSuixoeoQOiES7uOhaOxR5IEmqjABz8i3Jw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A4tqJ4CL
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

Hi Yann,

On Wed, 13 Aug 2025 11:20:59 +0200
yann.morin@orange.com wrote:

> Neal, All,
> 
> On 2025-08-13 09:43 +0100, Neal Frager via buildroot spake thusly:
> > This patch adds an architecture cpu dependency to each application to make
> > sure that users can only build applications which are applicable to their
> > target device family.
> > 
> > The versal_plm and versal_psmfw applications are specific to versal devices
> > which are based on BR2_cortex_a72.
> > 
> > The zynqmp_pmufw application is specific to zynqmp devices which are based on
> > BR2_cortex_a53.
> > 
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
> > ---
> > V1->V2:
> > - Replaced new family variant config option with an architecture cpu
> >   dependency, so no new configs are needed.
> > - Updated patch title and commit message accordingly.
> > V2->V3:
> > - Changed package dependency to only appear if the cpu is BR2_cortex_a53
> >   or BR2_cortex_a72. This way, the xilinx-embeddedsw package will not
> >   appear with zero application options if another BR2_aarch64 cpu is
> >   selected.
> > ---
> >  boot/xilinx-embeddedsw/Config.in | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
> > index 0dd6433608..96e9ca2fb0 100644
> > --- a/boot/xilinx-embeddedsw/Config.in
> > +++ b/boot/xilinx-embeddedsw/Config.in
> > @@ -5,7 +5,7 @@ comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-b
> >  
> >  menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
> >  	bool "xilinx-embeddedsw"
> > -	depends on BR2_aarch64
> > +	depends on BR2_cortex_a53 || BR2_cortex_a72  
> 
> Note that (BR2_cortex_a53 || BR2_cortex_a72) is not a subset of
> BR2_aarch64; they can each be select when the target is BR2_arm,
> BR2_armeb or BR2_aarch64_be.

Ah, thanks for pointing out! I was indeed assuming that (a53 || a72) is
a subset of aarch64, or maybe (aarch64 || aarch64_be).

> So if xilinx-embeddedsw really is AArch64-LE, then you need to keep
> the dependency on BR2_aarch64. If it's really just AArch64, then you can
> relax it with a dependency on BR2_ARCH_IS_64 (plus the individual CPUs,
> of course).

AFAIK all the impacted Xilinx SoCs are aarch64, this that would become:

  depends on BR2_aarch64 && (BR2_cortex_a53 || BR2_cortex_a72)

But I'll let Neal confirm or correct me.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
