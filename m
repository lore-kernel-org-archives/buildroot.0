Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF85C369D1
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 20:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C38860612;
	Sat, 19 Apr 2025 20:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJYpuT6kN428; Sat, 19 Apr 2025 20:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43BC560642
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43BC560642;
	Sat, 19 Apr 2025 20:27:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BAAC6230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB9EF60612
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sm0yqpesnCN0 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 20:27:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC9AE60642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC9AE60642
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC9AE60642
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:27:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59D3A43A78;
 Sat, 19 Apr 2025 20:27:46 +0000 (UTC)
Date: Sat, 19 Apr 2025 22:27:45 +0200
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Quentin Schulz <quentin.schulz@cherry.de>
Message-ID: <20250419222745.53d10dd6@windsurf>
In-Reply-To: <20250404-libcamera-0-5-0-v1-7-e2ca9d029aeb@cherry.de>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
 <20250404-libcamera-0-5-0-v1-7-e2ca9d029aeb@cherry.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdevvdevgfegudeiudfgleduteeggeeijedttdefhedviedvveehveeggfekteeunecuffhomhgrihhnpehlihgstggrmhgvrhgrrdhorhhgpdhmvghsohhnsghuihhlugdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepfhhoshhsodgsuhhilhgurhhoohhtsedtlhgvihhlrdhnvghtpdhrtghpthhtohepsghui
 hhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehkihgvrhgrnhdrsghinhhghhgrmhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgrrhgtuhhsrdhfohhlkhgvshhsohhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvghrihgtrdhlvgdrsghihhgrnhdruggvvhesfhhrvggvrdhfrhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745094466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PN16vB0xXOnjS7ckIY1iEEj99Orm0J5Ow0iehqM/v5c=;
 b=R61lVJn05Typ0Fu4Nx5nGPoCu8x2ymfjwmt6d3WXGrB9PSLjXWjtZwC2MprWxcb+Kk6M65
 PnhKpE8iv53wCp8s+/W1KyWcc2MHnECsqI/xW8kGaT2pXwX8PEwUT30lohliTaxboz2k6O
 +A4hORkmEkcLRXUYOI1rnjtFG4i8XY0i1orCSqVpM3kILvhZQhjkFTTNNCGiXe+ip06Jyq
 YgNBMJf7VCicVGpWE8y8tJ0/SVCw4HbHo1It9waGAY884gUM3wPHdNaWQ2QXqKcsuWKLz6
 sQScZWSeKKFQt2Jldny4vYNzKqvvAKlhDFMTpU0OkQzfWwYJ/VQlLIaco+BlsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R61lVJn0
Subject: Re: [Buildroot] [PATCH 7/9] package/libcamera: bump to 0.5.0
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

On Fri, 04 Apr 2025 18:47:38 +0200
Quentin Schulz <foss+buildroot@0leil.net> wrote:

> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Release notes:
> https://lists.libcamera.org/pipermail/libcamera-devel/2025-April/049672.html
> 
> There's now a pipeline for the Raspberry Pi 5 ISP (PiSP), that can be
> added later on in a separate patch.
> 
> v4l2 compatibility layer is now a feature and not a boolean anymore. The
> former takes "enabled", "disabled" or "auto"[1] while the latter takes
> "true" or "false"[2] so we need to update how we configure the project to
> match those expectations.
> 
> [1] https://mesonbuild.com/Build-options.html#features
> [2] https://mesonbuild.com/Build-options.html#booleans
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  package/libcamera/libcamera.hash | 2 +-
>  package/libcamera/libcamera.mk   | 6 ++----
>  2 files changed, 3 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
