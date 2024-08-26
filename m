Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EABAC5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 16:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B6A0605B7;
	Mon, 26 Aug 2024 16:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GxKGnjrP31Y; Mon, 26 Aug 2024 16:35:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CE5360786
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CE5360786;
	Mon, 26 Aug 2024 16:35:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54D571BF33F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40E6080BEB
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ch-4beS-7pHz for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 16:35:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31D7580BE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31D7580BE8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31D7580BE8
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 16:35:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D573DC0009;
 Mon, 26 Aug 2024 16:35:08 +0000 (UTC)
Date: Mon, 26 Aug 2024 18:35:08 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240826183508.6261c60c@windsurf>
In-Reply-To: <20240825170311.958652-1-bernd@kuhls.net>
References: <20240825170311.958652-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724690109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=187lmsT5mxr+AflK7DLxgmNQoYr1dUIDFtXqngp2Png=;
 b=RzxQhGJw6LZrpGgrG1ahn2DZQMrFYuyvog84rUezA1SGQsVHjXoKy90lb+MrEc9LGiTfvx
 g8Z1Et4xpn4B/AOS1bqR9pP/7lrINtTF4gyeGlHHDLOhYzDfs9ngpvDa7AgFXJNGPGX4Iv
 nckSfNhhBnWo80ZlvpUhj9eIT9mZDWVRN85oY8B2sTCTf5I4YHzr/1OBC60UKmGkrVPI3h
 noaLN02y94EIAnjyKWMUqassP4q/k0JGBNKbfgn1LpmB18ZctjANrCN2ggFZ9mSCPHGMH2
 dCuJ631PZzNOewxWwT2DK+XNZ4x72Y7JMacEWeCosMu3lb9Ko7R3yW/YbC+V1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RzxQhGJw
Subject: Re: [Buildroot] [PATCH v3 1/1] package/php: Fix build on arm
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 25 Aug 2024 19:03:11 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.org/results/5e8ef91d84018ccdf85f2156292feb3460bfe698/
> 
> Without this patch configure wrongfully detects aarch64 support:
> 
>     checking for aarch64 CRC32 API... yes
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v3: switch patch to upstream commit
> v2: rewritten patch to fix configure.ac (Thomas)

Wow, super nice that it already got merged upstream! Many thanks for
pushing the patch through in terms of testing and upstream submission,
this is really nice!

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
