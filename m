Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2812EC5AD49
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 19:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAAAB60D8F;
	Fri, 30 May 2025 19:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id py-SoCzOU82H; Fri, 30 May 2025 19:52:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29F2A60DA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29F2A60DA4;
	Fri, 30 May 2025 19:52:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E5EF236
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8ADF60DA4
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0uZaSe9hfNiP for <buildroot@buildroot.org>;
 Fri, 30 May 2025 19:52:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D805A60D8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D805A60D8F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D805A60D8F
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:52:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D10F543FFE;
 Fri, 30 May 2025 19:52:02 +0000 (UTC)
Date: Fri, 30 May 2025 21:52:00 +0200
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>, James Hilliard
 <james.hilliard1@gmail.com>, thomas.perale@mind.be
Message-ID: <20250530215200.23ef4e06@windsurf>
In-Reply-To: <20250519145126.4114666-1-titouan.christophe@mind.be>
References: <20250519145126.4114666-1-titouan.christophe@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleekleculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejvdejvdfgffevteeiffdugeeiveeliefgffetfeehhfethfeuleefkeejgfefvdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudeimeefleemkegtugejmegvuddtleemledvtdgtmedvfedvkeemieejvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduieemfeelmeektggujeemvgdutdelmeelvddttgemvdefvdekmeeijedvvddphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhithhouhgrnhdrtghhrhhis
 hhtohhphhgvsehmihhnugdrsggvpdhrtghpthhtohepjhgrmhgvshdrhhhilhhlihgrrhguudesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsehmihhnugdrsggv
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748634723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PPdLJe9xiP000VfxBT3ImO+LqbG3Sim3WonAsUykwpU=;
 b=aMYVhfWu/Ll/+hEKRP6gmGlY3IPCA7vOnK0nN/O/2ixJBTU/Cg0sXCWcvpm8nHgqy4xDP7
 gf1z1UGbF1sLLhYD5P7X6iR5dQgISu5VNyLwjXOPwSIGSmrBXndDM2lKtvE/f/y8GKxKq4
 zZYy02/BcBnaRWh0ejw5JEWvhvv2i6lGJg2css7yfIWku2oNfo4Zflu++xmuHai6kYwPAP
 imijEQ02q9h3NQ+UA9OurNhnpZfDq90s0e8j8cJax6zF1ugTZeRUyEqJZZiizNJZFN+gN/
 ZMyaZzGcuX+329pCyKfm0H+i/KQ2WdyTIdWrzJ1WeMvAoTsFpUmfFkOKxuGs4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aMYVhfWu
Subject: Re: [Buildroot] [PATCH] package/python-tornado: bump to version 6.5
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

On Mon, 19 May 2025 16:51:26 +0200
Titouan Christophe via buildroot <buildroot@buildroot.org> wrote:

> Among other things, this fixes the following CVE:
> - CVE-2025-47287: When Tornado's ``multipart/form-data`` parser encounters
>                   certain errors, it logs a warning but continues trying to
>                   parse the remainder of the data. This allows remote
>                   attackers to generate an extremely high volume of logs,
>                   constituting a DoS attack.
> 
> Read the full changelog:
> https://github.com/tornadoweb/tornado/releases/tag/v6.5.0
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>  package/python-tornado/python-tornado.hash | 4 ++--
>  package/python-tornado/python-tornado.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next after cherry-picking the commit from master adding the
security fix, and making sure it gets dropped as part of the version
bump. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
