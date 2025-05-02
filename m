Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E10BC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 19:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E431F41A63;
	Fri,  2 May 2025 19:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 027eIZ3GmXz9; Fri,  2 May 2025 19:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7626641794
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7626641794;
	Fri,  2 May 2025 19:39:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AB93229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 19:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4084B40264
 for <buildroot@buildroot.org>; Fri,  2 May 2025 19:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYnFEWBizrm8 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 19:39:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 20A0940204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20A0940204
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20A0940204
 for <buildroot@buildroot.org>; Fri,  2 May 2025 19:39:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B0D8440D0;
 Fri,  2 May 2025 19:39:28 +0000 (UTC)
Date: Fri, 2 May 2025 21:39:26 +0200
To: Joseph Zikusooka <josephzik@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250502213926.6f7ee369@booty>
In-Reply-To: <CAPWx8vtV-2c5d-rHmeRXMOCohm8vBwDmkD2OGk=Fhnuh49Lbsw@mail.gmail.com>
References: <CAPWx8vtV-2c5d-rHmeRXMOCohm8vBwDmkD2OGk=Fhnuh49Lbsw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeeffeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffevgedvheelfeekffdujeeitdduueehvddugffgfeelteejteefvefhuefghfevnecuffhomhgrihhnpehgnhhurdhorhhgpdgsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehjohhsvghphhiiihhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746214768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C3mDt8NH1VIjI5jaSALmaNS/i6py19Z/lyMPhWOGLXo=;
 b=R0e8Ds5skGT/HC9Bt28z8QRIarLIJgx6Ud3Fq32iTdiJaiV1q0bonSt1po9q6KSSyqu2J9
 fJ3gj/mE8+qCPDTOkNi9awrNbtlulFbjtyI8MQ2MEphTaaiDFkjYcaz7R5hKbMjHpNcB4x
 xlsdaKcV021Rh5ufdvuf9OnRNLswWzHv5Jozutbhvgqn7sEOTYLK6mlHCBL4cs/pWzQLW6
 Y57sGgiNwCPlmHoFHmD3+FXnjEwlW3+lw+2QdjhJCR9bxYJAHj3fA2ScGks/tPK3cRplMw
 +oxk72kMjYr0sr012kZMhQfSZBoz7ZWJj5pvRwbeV3FoRgsoRCGNbTItp0fDYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R0e8Ds5s
Subject: Re: [Buildroot] [PATCH] package/m4: fix build failure with gcc 15
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

On Wed, 23 Apr 2025 16:57:27 +0300
Joseph Zikusooka <josephzik@gmail.com> wrote:

> From 08d03e3ac14325a05942a632c8cf7b2a7c06d880 Mon Sep 17 00:00:00 2001
> From: "Joseph Zikusooka (ZIK)" <zik@jambula.net>
> Date: Wed, 23 Apr 2025 15:53:56 +0300
> Subject: [PATCH] package/m4: fix build failure with gcc 15
> 
> This is a temporary workaround to address build issues with host-m4
> when using GCC 15, as encountered on
> the recently released Fedora 42. The issue stems from stricter
> compiler behavior introduced in recent
> bersions of GCC.
  ^
"versions"

> A proper fix has already been committed upstream and will be included
> in the next release of GNU m4:
> https://git.savannah.gnu.org/cgit/m4.git/commit/?h=branch-1.4&id=a22c9802dd7e724eaefb21dc21d84ac2d3a49c89
> 
> Until that version is available in buildroot, this patch ensures
> continued compatibility and successful
> builds.
> 
> More context:
> https://lists.buildroot.org/pipermail/buildroot/2025-April/776922.html
> 
> Signed-off-by: Joseph Zikusooka (ZIK) <zik@jambula.net>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
