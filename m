Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDFBC369C5
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 19:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4367A41441;
	Wed, 16 Apr 2025 19:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cG6ViVqdWcuJ; Wed, 16 Apr 2025 19:58:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7845641511
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7845641511;
	Wed, 16 Apr 2025 19:58:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 844456B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A7EA411A1
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tty2SwqpycJV for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 19:58:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62D03401B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62D03401B2
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62D03401B2
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:58:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B21E443BB;
 Wed, 16 Apr 2025 19:58:13 +0000 (UTC)
Date: Wed, 16 Apr 2025 21:58:12 +0200
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <20250416215812.6a8ae1a5@windsurf>
In-Reply-To: <4b029329-2258-428d-80c9-315dbd6335be@essensium.com>
References: <20250415195547.199428-1-thomas.perale@mind.be>
 <87tt6o3oxx.fsf@dell.be.48ers.dk>
 <065809af-e4b6-4bd8-9f53-49d39fab38af@rnout.be>
 <4b029329-2258-428d-80c9-315dbd6335be@essensium.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -110
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdejvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddquddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfeghffhueehgeefveehffeugeeggefgteefffejfeevleefveekudefieeuteeunecuffhomhgrihhnpehnihhsthdrghhovhdpghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsegvshhsvghnshhiuhhmrdgtohhmpdhrt
 ghpthhtoheprghrnhhouhhtsehrnhhouhhtrdgsvgdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsehmihhnugdrsggvpdhrtghpthhtoheptghhrhhishhtihgrnhesrghpvghrthhurhgvrdhush
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744833493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxYSCo+RyBAcyRsr9io1acX3gwQHbwPD11Wzzg+sT78=;
 b=doA9DWOeTZsNrI4J3nPqJpjzGKSQS2Vu6xGJUuDnoG7nOSNhVvyldVH1ThJ74egW5Tef8n
 xUsnYbpQrq1KChhw68V5FdY3d5i1PFwNOh3xyDaPkkuxqzVK4JQByb60h0i7ocClmjY/5F
 X8H3KB1lmuBQSYXYDXuYesTuzyj6lRhAw5pA/5r1k2mMe9sugrY73TEXAFTsdFwk1o3Vlp
 ftO5+yY5oS6RcfBmcVtsWRJJsh7xVOYUmfgDPqQ24CsbIAHv7V5i5MnAe2ouHxfWV//49d
 OGlg+4MYvtdaSN7oZOjNNJZxNJT6UklsMmpFY9IMKYmdfb0f5Ag6F8wLDvR+Xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=doA9DWOe
Subject: Re: [Buildroot] [PATCH 0/7] Add PURL support
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
Cc: Thomas Perale via buildroot <buildroot@buildroot.org>,
 Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>,
 Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Wed, 16 Apr 2025 21:50:48 +0200
Thomas Perale <thomas.perale@essensium.com> wrote:

> The second advantage I see is that OSSIndex (that works with PURL) seems 
> to have a better matching of the CVE with packages. For instance 
> https://nvd.nist.gov/vuln/detail/CVE-2025-27556 is not reported for the 
> Django package and not associated to any version.

That's because it has not been annotated by NVD. However
https://github.com/CVEProject/cvelistV5/blob/main/cves/2025/27xxx/CVE-2025-27556.json
does have it annotated, and associated to
"cpe:2.3:a:djangoproject:django:*:*:*:*:*:*:*:*".

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
