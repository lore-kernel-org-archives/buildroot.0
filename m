Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F1FCD6E4C
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 07:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 671A640C09;
	Mon,  1 Jun 2026 07:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MG3HPlRrWrD7; Mon,  1 Jun 2026 07:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54F36408C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780300285;
	bh=PgqL7POiCWMDtN2Z3o0kphUPZ8JDAJyKJeGaNAgUBi4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=IPg6/SFwKDqh0K35smDB8T2jsGCyRsiwaCL5wReHbkoJ/6Tk0Qh1pzKtLtTpmq3JI
	 pxkAo1KfkdGPEgfzazGF6JUcsybKpG9BVpW/My0FGd8h48mGw+GhypPGVOeZ2tXC18
	 v4IycubmB22PzlxuKiwBT7oA2ycabA0cqHPjPTi6JWnC8c4OBDFQOMYckftbIzypsD
	 hKBbbfVWHCKUgsNkFwa5d93CklvE+Ad9eqwUIoPgJfhLzJ8QbDbyerUgw3R1ev4tOs
	 xfWzwOT8sN9xiV8DMHiye9SJ37rftyjhJeCLm9M2eVIiwZsfz5fN++VPB0anwHbH8W
	 JqAt7mtK6zxgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54F36408C1;
	Mon,  1 Jun 2026 07:51:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E037C294
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 07:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1F8660FB5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 07:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LyvbQECe_xZ4 for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 07:51:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D956F60FAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D956F60FAC
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D956F60FAC
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 07:51:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C15191A3799;
 Mon,  1 Jun 2026 07:51:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8EA3C602AB;
 Mon,  1 Jun 2026 07:51:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F6F410888076; 
 Mon,  1 Jun 2026 09:51:15 +0200 (CEST)
Date: Mon, 1 Jun 2026 09:51:15 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <ah05yyYArQrKGVsR@windsurf>
References: <20260531153557.2375580-1-titouan.christophe@mind.be>
 <20260531153557.2375580-8-titouan.christophe@mind.be>
 <ahxgJkG0qqeRJf29@windsurf>
 <e365b141-28f7-42d9-8d02-aeb68191e07a@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e365b141-28f7-42d9-8d02-aeb68191e07a@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780300279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=LWNA+hYJyNvJpzZObgm+lQfv4Y+mPQv72/UYUlx+U3Y=;
 b=IesZj3T9jeq9DN9t6iAZa+9b91gFz0mrp8LSwddKac9Zn9pLUl1QEDzE6MLIbg+SfbYZjj
 KMX8Lp7Sx/oj6LXBpE5uJLjb/Sw2Q1E2gmQz5ZLvYjAHUVHgXy4fMRqLfdkikIbM3ezgsj
 aAvzk5I9Zw284EBX02abwzJNacAzBZAxLrlL3iCG7f76fR8yxgRzeY+Caslsqn5CU3j4T6
 LGqEbrcniGw4Zbs4xiZOCqBSA6aWWWzp8lAS9BzQUfAkyCz3rPjTOSI8q6CqoIbo53l/h+
 pBc+PEtojUQMF4NuVQRGGRsUJbGPT+TTlRxQLrCPj0WQZOo7o3Xyy1rtVRc96g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=IesZj3T9
Subject: Re: [Buildroot] [PATCH v4 7/9] package/openssl: move
 libopenssl/libressl/.br2-external.in.openssl source statements outside of
 the choice
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
Cc: yann.morin@orange.com, ps.report@gmx.net, petr.vorel@gmail.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, Jun 01, 2026 at 08:50:25AM +0200, Titouan Christophe wrote:

> On 31/05/26 18:22, Thomas Petazzoni wrote:
> > On Sun, May 31, 2026 at 05:35:51PM +0200, Titouan Christophe wrote:
> > > +config BR2_PACKAGE_OPENSSL_EXTERNAL
> > > +        bool "from an external tree"
> > > +        depends on "$(BR2_EXTERNAL)" != ""
> > Hu? What is this thing?
> Not exactly sure for this particular entry (maybe you still remember that
> part @Peter Seiderer ?). Indeed, if I revert that particular change
> everything still works as expected. However, reverting either the libressl
> or libopenssl trigger the issue.
> 
> What I can tell for sure is that the libressl & libopenssl changes are
> required because a choice can no longer contain ifs, and the included file
> have some; hence the trickery to move them out of the choice.
> 
> I don't know about a publicly available br2-external that provides openssl,
> but if you have some I'd be glad to look further into that.

I don't have one, but it should be trivial to create a fake/dummy one,
to make sure this continues to work. Or maybe we have a runtime test
for this? (And if not we should have one!)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
