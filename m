Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A371C5B543
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 19:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 541E440D60;
	Fri, 30 May 2025 19:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGAMzw602xZI; Fri, 30 May 2025 19:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 925B140C09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 925B140C09;
	Fri, 30 May 2025 19:44:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D921127
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AD7540BC2
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qcbb_ux9O7G3 for <buildroot@buildroot.org>;
 Fri, 30 May 2025 19:44:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6739F41775
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6739F41775
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6739F41775
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:44:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF43B43A82;
 Fri, 30 May 2025 19:44:15 +0000 (UTC)
Date: Fri, 30 May 2025 21:44:14 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, James Hilliard
 <james.hilliard1@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20250530214414.0b27b79c@windsurf>
In-Reply-To: <20250523121521.380704-3-fiona.klute@gmx.de>
References: <20250523121521.380704-1-fiona.klute@gmx.de>
 <20250523121521.380704-3-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleekkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduieethfeftdejvdegueeuudehiefggeelheettdevvedtkeevieeutdehjeetheenucffohhmrghinhepghhnohhmvgdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduieemfeelmeektggujeemvgdutdelmeelvddttgemvdefvdekmeeijedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudeimeefleemkegtugejmegvuddtleemledvtdgtmedvfedvkeemieejvddvpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehfihhonhgrrdhklhhuthgvsehgm
 higrdguvgdprhgtphhtthhopehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhonhhtrghinhgvrdhfrggsrhhitggvsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748634256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XushbvgGd5sUbVAERF2Mh5HaxCC66QMhI5O55gWDi0A=;
 b=PSHCYitk1Vg7x4s66pxqe4cW65JgtAF9l+YYHWkkaq7lWf7VFf6eawLvDANdySxzdZG5bb
 A+xy+r15N2FFQ3zxc3laewnD7CpUxrxb6OlrNdDFyNa4X8/61/giZVeUjsYZK8yKGuMO5n
 kLEv6Mak0tueZV+/upn/fvJk1GlEdrCZoUVz1ePuUxIYJXK/Ex9urrNfPszP+qW9E4P+Jh
 cJxNDSIlw46PyPpMHWvmQHBBoVK1kJaB5ZGCob1aKbNJpmAUPRQLo4nUQd9iWFcS7bs9dH
 s9ZqSqIjjkbFkc7i1Z8R6v47EATvQZHPc2ySYV4wLciKb2buijE1TTFZkjfH3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PSHCYitk
Subject: Re: [Buildroot] [PATCH v6 3/4] package/gobject-introspection: bump
 version to 1.84.0
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

On Fri, 23 May 2025 14:15:20 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> GOI now has a build option to disable tests [1], so use that and drop
> the "disable tests" patch.
> 
> Meson now checks LD_LIBRARY_PATH during configure and sets the result
> when calling g-ir-scanner [2]. This means overriding it in _NINJA_ENV
> does not work any more, set LD_LIBRARY_PATH in _CONF_ENV instead.
> 
> The hash for giscanner/scannerlexer.l changed due to small code
> additions.
> 
> Upstream changelog:
> https://gitlab.gnome.org/GNOME/gobject-introspection/-/blob/1.84.0/NEWS?ref_type=tags
> 
> [1] https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/3e41addbd0f22024f63cc9c3fbef04ca16f05364
> [2] https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/d3f684559facd0edc368e3ac6db95b16e28ed743
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> Changes v3 -> v4:
> * Fix LD_LIBRARY_PATH for g-ir-scanner

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
