Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9AEC369D7
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 21:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74238813A1;
	Wed, 23 Apr 2025 21:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjEoYkSRnLCp; Wed, 23 Apr 2025 21:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74880812FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74880812FB;
	Wed, 23 Apr 2025 21:38:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A175A19F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 21:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87401810F3
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 21:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vouNAEpAwj0R for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 21:38:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56E3681116
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56E3681116
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56E3681116
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 21:38:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0BFD1FD45;
 Wed, 23 Apr 2025 21:38:09 +0000 (UTC)
Date: Wed, 23 Apr 2025 23:38:08 +0200
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>
Message-ID: <20250423233808.5d612f93@windsurf>
In-Reply-To: <20250422-libcamera-pre-linux-6-4-v2-1-5c06ba2426ab@cherry.de>
References: <20250422-libcamera-pre-linux-6-4-v2-1-5c06ba2426ab@cherry.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhkeekgeevgfekhfeggfelffdvgfdtteduuedthfehfffgkeeileefhedvkeelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepfhhoshhsodgsuhhilhgurhhoohhtsedtlhgvihhlrdhnvghtpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdro
 hhrghdprhgtphhtthhopehkihgvrhgrnhdrsghinhhghhgrmhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgrrhgtuhhsrdhfohhlkhgvshhsohhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggv
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745444290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYKErTxXUVj+FPzgRg1Uejchghgl5y7jIItM43R77P0=;
 b=ZGqO9YS6AtJpy4yIo3dS/PkJfBsrUpV8I6WCUMN3IXA5bTeE61e0bX2u78h+5fyxb4Pnod
 b23GPwsPbZGnA4FRAcXNUMLUs1lpXC2sxQUAWYUJrfJ0U2BL1FqhPkZt44PySZnrDD+y61
 wVrugl5B9eyjm6189fM1g2fzMSaRDb4M/svYgF2W/SRRLyU6Pyv2GnZ3jfeK1g2wZX/+x5
 XE4lE8zuMUsOeB1DECclsoU+rj1oFzbILEqmmNnHSckoy1cVZ55wEhCSTxzbg6NBx3SVjz
 zxfiQSyyFGICxw2IDF2jS3wJBF5BRzYU5vskB7tP62TPNZDwUCbG4tcG0zLz6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZGqO9YS6
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: fix crash on Rockchip
 with kernels before 6.4
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

On Tue, 22 Apr 2025 13:12:06 +0200
Quentin Schulz <foss+buildroot@0leil.net> wrote:

> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> libcamera migrated to use an ioctl for detecting frame sizes which is
> only available in kernels 6.4 and later. If it doesn't exist, default
> frame sizes are used. However the min and max resolutions supported by
> the pipeline weren't initialized for kernels where that ioctl isn't
> available and ended up creating invalid configuration that later
> crashed.
> 
> The introducing commit was part of the v0.4.0 release.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Changes in v2:
> - update patch with merged commit
> - split into its own one-patch series
> - Link to v1: https://lore.kernel.org/buildroot/e15073e3-c1db-480e-87d6-ea152c1e9392@cherry.de/
> ---
>  ...amera-rkisp1-Eliminate-hard-coded-resizer.patch | 113 +++++++++++++++++++++
>  1 file changed, 113 insertions(+)

Applied to master after adjusting the sequence number from 0001 to
0002, as there's already a 0001 patch. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
