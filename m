Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F75C83F1D
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 08:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A124860B33;
	Thu, 10 Jul 2025 08:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FaivxIi16FgS; Thu, 10 Jul 2025 08:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE17560DE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE17560DE9;
	Thu, 10 Jul 2025 08:28:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9768A114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 08:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88ECB60DE9
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 08:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XiJ3hKw6v40Y for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 08:28:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C94060B33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C94060B33
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C94060B33
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 08:28:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 869E9433F6;
 Thu, 10 Jul 2025 08:28:21 +0000 (UTC)
Date: Thu, 10 Jul 2025 10:28:20 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Message-ID: <20250710102820.699bcea2@windsurf>
In-Reply-To: <20250710081059.482390-1-thomas.perale@mind.be>
References: <20250709211636.846101-1-thomas.petazzoni@bootlin.com>
 <20250710081059.482390-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefleeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhhohhmrghsrdhpvghrrghlvgesmhhinhgurdgsvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1752136101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+sYYbb/5iClz2HE2paKdJiQP3DPX/EM8NtcOxHSLgHg=;
 b=lbS+8tJpgSymvyI7ompG/VjREeLw1Z9FEzcQ6xBzOmoc5BLHNRddedXL+mALFWJzFHuYmn
 ndEWyy6yli4kboQ6sm01c9zWQ3jENKdAmTeJCdVMzJSVh5nNh4qtFWs7WGe7ja+yE+Kjvh
 OM4ij03DQpzdWgPjpUGCRCJa0fEVxpb8DOMuMVcApTC4D8o8X9VVVv0yd06cintkcORK2y
 NoCjmW7HNpKE7cMn3vA5RKq1xqJ3b94HwYsJyv1gMg8FODAzMdBMcQTsKfcdfUqGuJjE/D
 i6A7Sz4rF+p4ZSs+4ii3PKYZc3tgCymxaJeMR6bwg/JRnUZL6jo6cR2XM+F3dA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lbS+8tJp
Subject: Re: [Buildroot] [PATCH] package/bctoolbox: disable mbedtls support
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

Hello,

On Thu, 10 Jul 2025 10:10:58 +0200
Thomas Perale <thomas.perale@mind.be> wrote:

> They did add support for mbedtls 3.6 in commit [1].

Ah, I missed that, thanks for spotting it! I found the issue about
mbedtls 3.x in their bug tracker, and since the issue was open I
assumed it wasn't fixed.

> This package and mongrel2 are the last packages that doesn't have compat with
> mbedtls 3.6.
> For mongrel2 though the package is not maintained anymore and there isn't any
> port upstream.

I have no problem with dropping packages that are unmaintained, either
upstream or in Buildroot. So feel free to drop mongrel2 and even
bctoolbox.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
