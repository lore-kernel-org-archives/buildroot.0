Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBB6C77B7C
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 16:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B813760B33;
	Tue, 24 Jun 2025 16:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLaU4mziknTd; Tue, 24 Jun 2025 16:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E12CF60C22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E12CF60C22;
	Tue, 24 Jun 2025 16:37:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE0D243F
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 16:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3EEB60B33
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 16:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaoBvv1T2QdL for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 16:37:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=herve.codina@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2477E60AAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2477E60AAD
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2477E60AAD
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 16:37:33 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 5CC8C580699
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 16:25:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0569C443CA;
 Tue, 24 Jun 2025 16:25:25 +0000 (UTC)
Date: Tue, 24 Jun 2025 18:25:24 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <20250624182524.62604580@bootlin.com>
In-Reply-To: <20250624122048.946492-2-raphael.melotte@mind.be>
References: <20250624122048.946492-1-raphael.melotte@mind.be>
 <20250624122048.946492-2-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvtdefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekfedtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvuddvvddvgffhvdffudejheehudfggfefieefgfevudetheefgfdvgfeljeffgeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdekheemsgelkedtmegvgedttgemiegtgeefmegshegssgemrgegvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvkeehmegsleektdemvgegtdgtmeeitgegfeemsgehsggsmegrgedvkedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprhgrphhhrggvlhdrmhgvlhhothhtvgesmhhinhgurdgsvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrheso
 hhrohhlihgrrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1750782326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrXBBad3Bl5QCbPc2yTSzX9qnLnOb9wVOpyvWaWLbqg=;
 b=mexlZct3+8U/aJcGr5DjoXMT/cf/t9Fnl1CvPI6UrbE4rYlH97iJYInGLB/8LT2RaNOKdd
 zXm/Z3KJIfkzHLHdvBQ0ub7wbREaLUFCXpiiZhobOL8VAy9bS/xr7L/TaasLoQhDBqE8WX
 M2iSB/2uqrUV8A73/1qO+9okHSW0Sf3yHvOdNkEdCcRB0tvgl1/Si+ZkBoa5yUzT380LfO
 0gAK/F4t1spxc5v8uAR5UO9Lozm9WmY5BGxGkJZUDRXvaugECZwqkOuwyfBm+62xJvx/vW
 yyyWcvnPImRlC++CpUeTc69EvUOK4mNY/PJH4zijfLBcf5L6BfGLq4vN8ID4gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mexlZct3
Subject: Re: [Buildroot] [PATCH 2/2] package/modsecurity2: update upstream
 URLs
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUmFwaGHDq2wsCgpPbiBUdWUsIDI0IEp1biAyMDI1IDE0OjIwOjQ0ICswMjAwClJhcGhhw6ts
IE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4gd3JvdGU6Cgo+ICdodHRwczovL2dp
dGh1Yi5jb20vU3BpZGVyTGFicy9Nb2RTZWN1cml0eScgbm93IHJlZGlyZWN0cyB0bwo+ICdodHRw
czovL2dpdGh1Yi5jb20vb3dhc3AtbW9kc2VjdXJpdHkvTW9kU2VjdXJpdHknLCBzbyB1cGRhdGUg
b3VyCj4gVVJMcyBhY2NvcmRpbmdseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6ls
b3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CgpSZXZpZXdlZC1ieTogSGVydmUgQ29kaW5h
IDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+CgpUaGFua3MsCkhlcnbDqQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
