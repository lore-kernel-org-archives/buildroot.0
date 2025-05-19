Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A35EC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 07:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2308E60BC4;
	Mon, 19 May 2025 07:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUsh1ZoV64PT; Mon, 19 May 2025 07:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69C6360D96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69C6360D96;
	Mon, 19 May 2025 07:01:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F294193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C50081FB7
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVivcIA5ZSYN for <buildroot@buildroot.org>;
 Mon, 19 May 2025 07:01:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 414DA81FA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 414DA81FA4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 414DA81FA4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:01:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53BDC4435F;
 Mon, 19 May 2025 07:01:03 +0000 (UTC)
Date: Mon, 19 May 2025 09:01:01 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>, =?UTF-8?B?UmFwaGHDq2wgTcOp?=
 =?UTF-8?B?bG90dGU=?= <raphael.melotte@mind.be>, Bernd Kuhls
 <bernd@kuhls.net>
Message-ID: <20250519090101.5e8e6251@booty>
In-Reply-To: <20250518085723.23020-6-thomas.petazzoni@bootlin.com>
References: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
 <20250518085723.23020-6-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddtjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeljeejuddvudetffdtudelfedugfduledtueffuedufefgudegkeegtdeihedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhop
 ehrrghphhgrvghlrdhmvghlohhtthgvsehmihhnugdrsggvpdhrtghpthhtohepsggvrhhnugeskhhuhhhlshdrnhgvth
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747638063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKVZOxmS7w57h2Xbofc/xBD6VKJ6eG5OKOE9KvkzqdQ=;
 b=Da+UgdjcEYbrMkJj+2a560Km3d6qXluKZWk0HczhcYAqerL9gKVbuSvTbacUg1/ImrJoir
 F1c7pegqVKFiG6Z3KMd/ayWDiOcUo+7IXCQ5ASYCtCwHVFWbVUyIy6eA+pMOCMX4PYZ51R
 by98YsZyrX61PwApEwTpcU/etajHYfNpmGyaFkKokYmRxZg30RseUaBh7c9SsSEhricIej
 O+ZX5CCyiu7YDuBfcEK/IUmsRxtFDbAKAiDsL+6M5ZBIe+gJLyk/S3g1peZ6GK/9wBY2sQ
 rYTWBjrBLuR5KQrSdR7iqrnoZO0t06ShzvD+gE3EDdAs3H6qawGZgwZTHC0PuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Da+Ugdjc
Subject: Re: [Buildroot] [PATCH 05/22] package/exim: drop stale ignore CVE
 entry
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

On Sun, 18 May 2025 10:56:58 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The CVE-2022-3620 entry is not reported as affecting our exim package
> by pkg-stats. Currently it's because the NVD entry is
> incorrect (incorrect exim version), but we sent a bug report [1] to
> the NVD database so that it gets updated. Once updated, pkg-stats
> still won't report the CVE as affecting us because the issue has been
> fixed in exim 4.97, and we're using a newer version.
> 
> [1] https://lore.kernel.org/buildroot/20250517183000.40b28b4d@windsurf/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
