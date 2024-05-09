Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88209C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A88F612DC;
	Thu,  9 May 2024 20:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVIYy6QjyQHg; Thu,  9 May 2024 20:19:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58F88606DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58F88606DF;
	Thu,  9 May 2024 20:19:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 150431BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00FC541E44
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZayAmaZGLixT for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:19:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1E7241E1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1E7241E1E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1E7241E1E
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:19:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F1691BF205;
 Thu,  9 May 2024 20:19:00 +0000 (UTC)
Date: Thu, 9 May 2024 22:18:59 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240509221859.21465e96@windsurf>
In-Reply-To: <20240427140941.381333-1-peter@korsgaard.com>
References: <20240427140941.381333-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715285940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=azmRhppk/orlrDSleZWesRJ/o5R9k/w0RvKAddSVBtQ=;
 b=Wnur5QUtX3hOQxQ7KZmBebWnQB9Kr9HCc+RZEDH/lUjlOZfDOrkd0Ikf9QIJDAWFRZmmqd
 otxMk3xeWGy2OyUwA4PbY2R7gop2tAdzVUjGgSpriZEGmNeqnmzcVi1RRtFvw0gxZ4Ad58
 iWWKppSCEdA1mfreDndZLcf66VqtVx8KYCe9n3p0KL78eDCZieVZ3+8EAIelpC/JLZ/r0c
 JEqjnTjy0FVqNnVockKso0mr3/D+Do5BSptSLP6BiMmULEovBns8GWJtbkE2YmXUw/hVlB
 3iXvt5tbI6CjqrhcZqIDT9XxBOQFe9bUE1GR9hqzxLlbDSflwQwhPlQcZ+hiKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wnur5QUt
Subject: Re: [Buildroot] [PATCH 1/2] package/python-hid: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 27 Apr 2024 16:09:39 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> A python wrapper for the hidapi library.  Hidapi has fairly complicated
> dependencies, so use a select rather than a depends on.

You actually did the opposite :-)

But in fact, there were only 3 depends, so not that much to propagate,
so I stuck to our normal way: a select BR2_PACKAGE_HIDAPI + propagation
of the depends on. Otherwise people will start using that as a counter
example and use "depends on" where "select" should be used.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
