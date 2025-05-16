Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29504C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 20:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBD5360B3E;
	Fri, 16 May 2025 20:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IoXg6NBmL99F; Fri, 16 May 2025 20:52:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1056C612E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1056C612E0;
	Fri, 16 May 2025 20:52:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A85322CD
 for <buildroot@buildroot.org>; Fri, 16 May 2025 20:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 428194071C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 20:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85jc4bHODXdM for <buildroot@buildroot.org>;
 Fri, 16 May 2025 20:52:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 22E2340735
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22E2340735
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22E2340735
 for <buildroot@buildroot.org>; Fri, 16 May 2025 20:52:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D61A41B5F;
 Fri, 16 May 2025 20:51:59 +0000 (UTC)
Date: Fri, 16 May 2025 22:51:58 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Christian Hitz <christian@klarinett.li>, Zoltan
 Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>, Jesse
 Van Gavere <jesseevg@gmail.com>
Message-ID: <20250516225158.706cccf5@windsurf>
In-Reply-To: <20250515103632.2631227-9-roykollensvendsen@gmail.com>
References: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
 <20250515103632.2631227-9-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehrohihkhholhhlvghnshhvvghnughsvghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtt
 hhopegthhhrihhsthhirghnsehklhgrrhhinhgvthhtrdhlihdprhgtphhtthhopeiighihrghrmhgrthhiseiighihrghrmhgrthhirdguvgdprhgtphhtthhopegsrgigihgthhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgvshhsvggvvhhgsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747428719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DURvG+doDCkfVm0BvIhxU29V0qgIbrIjUpU2+6EsyaI=;
 b=KLTu9CizsL/uk1/Q3OyeZW9hXDtN9nwvx8xiyq9COWppU4kMYOa4fK51NQLMAQeOwH+gfs
 9B/Ntj4f7WpsGNu7+wzE3toO9rZk2OAAOcNlsmw39Yp5bxI+bpBa2CtD7+BO2lYY0UbY+w
 FIphaCzfsjh1rT2CtIuOXK/JzMJj+TnVSxC0FWfd2wSH/pRoKkq+1gLBhS5eTkyJi1d7fP
 S5L1eIP/EmrOQudy1Iz8SIJDbmeE5z3BtJdTiLMa0K/iCm0BHIky5KfSgp6yICgJqQy3D0
 DtO/aSqICV+TEaD1gx+Ke+N+OtJdQXDIxdn47eAztBMb+aQTiM/L14LZMIJSbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KLTu9Ciz
Subject: Re: [Buildroot] [PATCH 09/10] package/qt6/qt6tools: build only host
 linguist tools
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

Hello Roy,

Thanks for the great patch series! I'm going through it, and I'm hoping
to merge it progressively in the next days. I have one question on this
patch though.

On Thu, 15 May 2025 12:36:25 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Strip down qt6tools to the bare minimum by:
> - Removing the target package
> - Disabling all features except for the linguist tools
> 
> This change addresses ongoing issues with qt6tools and focuses on its
> primary intended use: providing linguist tools for translating Qt6
> applications during the build process.
> 
> The linguist tools are essential for internationalization (i18n) of Qt6
> applications and are now available as a host package for cross-compilation
> purposes.
> 
> This modification should resolve stability issues while still maintaining
> the core functionality required for Qt6 application translation.
> 
> update host package

What does this mean?

> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

Could you clarify why PATCH 09/10 and 10/10 are separate? It feels odd
to drop the target package, only to re-introduce it one commit after. I
was thinking of squashing both commits together. What do you think?

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
