Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6F5C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 21:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6644C4022A;
	Mon,  5 Aug 2024 21:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4EPO0QM7ow5; Mon,  5 Aug 2024 21:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34BFC40233
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34BFC40233;
	Mon,  5 Aug 2024 21:52:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36D911BF2E4
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 21:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 239CE402C3
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 21:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCksIgs8kUdg for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 21:52:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BED3D40022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BED3D40022
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BED3D40022
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 21:51:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E3E51BF204;
 Mon,  5 Aug 2024 21:51:53 +0000 (UTC)
Date: Mon, 5 Aug 2024 23:51:52 +0200
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20240805235152.48d8a6a7@windsurf>
In-Reply-To: <20240209104705.1825396-1-sebastian.weyer@smile.fr>
References: <20240209104705.1825396-1-sebastian.weyer@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722894715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6X4/RyDvYgDO/BS91HX3qQ6xVh0HFcbJtJdaJ6I1E8M=;
 b=ba23ee2ZMXtloBsdqU6r8Rx6NL5fkivNlxiru1+07rAnJdabzY32sZi9uLXTzIKuwP9SC0
 kfbXZfIuouFNpr2IYhgElodN2ZVOjfUHpyQBEbYk/4wNe+DrYIbQcgUrVCmZ8Gy02e1nxF
 yWMaAxNT6ImJnUy+0oT6QiztH5gmyOR6045QrTYteufokvrUDNwiI09PUbq1lA82ChrNd9
 REVyyzuIAcM9fuRiIMbS1XqnKUtv2B0K2bgJXvMwvemq13VRIH+pxwUEUHHkHcrxHAR30Q
 iLBeT4n6bCoqZyCBE4/n/9qTZyaOxgH1T6WOlhuXwNz4K55x3NmAGHJz9vN+tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ba23ee2Z
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5doc: bump to latest kde
 submodule version
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  9 Feb 2024 11:47:04 +0100
Sebastian Weyer <sebastian.weyer@smile.fr> wrote:

> Bump qt5doc that was missing from the latest version bump to latest
> submodule versions from:
> https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
> 
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
> This was not the only package that was not touched in the latest  update
> of the submodule versions. Here is a list of the missing packages and
> the reason why it hasn't been updated:

Thanks for the patch, but it has been superseded by a later commit
bumping many Qt5 modules, and merged in commit
ca9e08277c473de1d0119768661ce0ba96559a7a.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
