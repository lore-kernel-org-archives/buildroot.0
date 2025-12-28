Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EC5E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 502A240558;
	Sun, 28 Dec 2025 22:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2g2YxONYqPDo; Sun, 28 Dec 2025 22:27:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 889A640365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766960873;
	bh=E/J8vZLSus38gF8phRoAuZTZU0kO1s6L7S7ia0Z96hQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qEUn62bA5hztK1KqigPL1ch7gifaDhNLfiRqY4z9gg0jUvqQegG4Na+Js2mBgEZpS
	 jQFxfzXxNhvtOaw1RegWPHuvUhavWj7Wi4riTxw7GWuQnaRDqJN/+c/KeJulsqoHKx
	 OsNbqMUdzWzOB/ZkO0Jz9z8U91XEpJ5Ro3YTRS4UcUrJFG7OuFBFUIWyUBG707pD/p
	 Onym0HxcOvyCfX4i/WfIT8UGvK7kQ0C/Fbn/pvqGYhu0VjEZFXxIP/rYSE19VOKS0y
	 K/nMYHxxSopFCec7P/DTopetm4qq2coCmvR+C+JCazUX/+0AsXjoN8XpbMl4I203H3
	 3AX+OGU47CE4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 889A640365;
	Sun, 28 Dec 2025 22:27:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 924D0B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F67881399
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70ZiVcvskGQz for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:27:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8CFE281396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CFE281396
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CFE281396
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:27:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CBEFE4E41E2A
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:27:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9222060725;
 Sun, 28 Dec 2025 22:27:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 58A1F119793AC; Sun, 28 Dec 2025 23:27:48 +0100 (CET)
Date: Sun, 28 Dec 2025 23:27:47 +0100
To: "Michael Nosthoff" <buildroot@heine.tech>
Cc: "Michael Nosthoff via buildroot" <buildroot@buildroot.org>, "Asaf
 Kahlon" <asafka7@gmail.com>
Message-ID: <20251228232747.6385eade@windsurf>
In-Reply-To: <9a786142-8290-8202-436a-e0a634f8945f@heine.tech>
References: <20251209201851.1023802-1-buildroot@heine.tech>
 <20251228145724.309c6fc3@windsurf>
 <9a786142-8290-8202-436a-e0a634f8945f@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766960868; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SP6NxsmlFj2740UeTM23JM5d8qvtjbisXVnVygFoBqs=;
 b=sfiQ9AxOoY62XJAF+zPjUwdUP37lOnWVOLTfn/y27mTLqne9IDcMXD9oc7t25km0sqmsrc
 +hm7e0OhylP5im6MYvlRzxPdHTHyg33srH/hoOVT3Pmnu6I9AGBIIoVI257HcwsAOssqns
 oPuI0avAeQXi37X+CvCeYKJQdg7wbPbwsO3oOomVJ0j7kWTbznrJi7gwiRsDm7oBJCM/ww
 nthQmgPySiULA859X/w+jOBnjGHJgYHlm3/sK0SezatbA3PuLFyR3q984rDqugBRu6IH8/
 FTcRr1T0PYJVVak7nPQW7T7I73c0T0QkrX2hOJs1i3jAp+qU/77qJqAsr6OIOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=sfiQ9AxO
Subject: Re: [Buildroot] [PATCH 1/4] package/collectd:  fix build with grpc
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

On Sun, 28 Dec 2025 15:34:29 +0100
"Michael Nosthoff" <buildroot@heine.tech> wrote:

> the "breakage" is introduced in the series which this commit is part
> of when bumping grpc & abseil. So maybe the title could have been
> better. I just oriented on the title of the previous commit which
> bumped collectd to C++14 and is also named so in the collectd repo.

So you mean that in the current master there is no breakage, and it's
only the fact that your series is bumping abseil and grpc that some
breakage will be introduced, and that you therefore fix before the
version bumps?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
