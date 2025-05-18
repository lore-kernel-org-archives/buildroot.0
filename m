Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF52C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 15:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB4A660B43;
	Sun, 18 May 2025 15:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9HP7BXzE-Q9e; Sun, 18 May 2025 15:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7BB060A5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7BB060A5B;
	Sun, 18 May 2025 15:07:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBE34DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1BA560A5B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rO6IPign006K for <buildroot@buildroot.org>;
 Sun, 18 May 2025 15:07:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9DE2A6077C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DE2A6077C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DE2A6077C
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:07:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 081111FCE7;
 Sun, 18 May 2025 15:07:14 +0000 (UTC)
Date: Sun, 18 May 2025 17:07:14 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
Message-ID: <20250518170714.1c59ca31@windsurf>
In-Reply-To: <20250420204540.32264-1-fl@n621.de>
References: <20250420204540.32264-1-fl@n621.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfhhlsehniedvuddruggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747580835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0ku8RFDOWi9QsrXJIT5pyIcydzJpG/MWClmOVKrYr4=;
 b=Y6LkiGnxZ4qYtrON6Z5hRauQfylt/zyVJKYPDOTI5i2+S27TESqfg94tT1+fASQhhGKJPj
 gftSkuQYAEpgKEfNcYWHgucLM/Op+UiGwgqzQ1lPzA60r4ZUsTfbeffmGCPhYTn/itFNvK
 SHAEmNqf5ck67AlF0rLIwLFSuEZAmHpVbW2d9l9SV7zlgbfynhC2kPaXlQB5ArdvK6Auo8
 d1RQLumxzGFrryKsu/0wmIrRxLr/aRdptLKjy+5CKJtxRm6jA0g4zs3cqPuXW4ElZqN0O/
 VwUQ9hmJKQ3csaEr1+n+GWREh/wsKx1rWdynAgWpCHnOpRkPG4Sx6igPWWsktw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y6LkiGnx
Subject: Re: [Buildroot] [PATCH 1/1] package/casync-nano: new package
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

On Sun, 20 Apr 2025 22:45:38 +0200
Florian Larysch <fl@n621.de> wrote:

> casync-nano is an implementation of a subset of the features of casync,
> optimized for performing OTA updates on embedded systems.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>
> ---
>  DEVELOPERS                           |  3 +++
>  package/Config.in                    |  1 +
>  package/Config.in.host               |  1 +
>  package/casync-nano/Config.in        | 21 +++++++++++++++++++++
>  package/casync-nano/Config.in.host   |  7 +++++++
>  package/casync-nano/casync-nano.hash |  3 +++
>  package/casync-nano/casync-nano.mk   | 28 ++++++++++++++++++++++++++++
>  7 files changed, 64 insertions(+)
>  create mode 100644 package/casync-nano/Config.in
>  create mode 100644 package/casync-nano/Config.in.host
>  create mode 100644 package/casync-nano/casync-nano.hash
>  create mode 100644 package/casync-nano/casync-nano.mk

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
