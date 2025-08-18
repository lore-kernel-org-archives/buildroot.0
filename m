Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082D7CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 21:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C684940769;
	Mon, 18 Aug 2025 21:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LyblJ1W3qZrH; Mon, 18 Aug 2025 21:02:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF03940751
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF03940751;
	Mon, 18 Aug 2025 21:02:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CDA84196
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 21:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B47C940257
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 21:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBtCfGlZc5oY for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 21:02:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C71B240042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C71B240042
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C71B240042
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 21:02:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 09D61C6B3B0
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 21:02:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 50B6E606A6;
 Mon, 18 Aug 2025 21:02:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 390131C22C86E; 
 Mon, 18 Aug 2025 23:02:08 +0200 (CEST)
Date: Mon, 18 Aug 2025 23:02:06 +0200
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>,
 Peter Korsgaard <jacmet@sunsite.dk>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>
Message-ID: <20250818230206.621be4a5@windsurf>
In-Reply-To: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
References: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755550932; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Rxq32OyBMiR8pn6x0gdBThbD4eRtDCOlbpUY6xw7Pis=;
 b=Kqli/izd2QltyaGh3jMEekN4Soy/k2z9YTFjIjPrnhXXzOVc+lWpcHzM5ny2jvM7UbPYJl
 cpXxjDZTCvMgMkLv4ZfCFrUdtmO4gOYomPN0JMFSwom4U7YArwIEX0IFl5FUyD9cM3fKWg
 fYWJ7OJcTYy2x6+E2rrWYc35MDRumu7oF8+fkB4+z/LGFadjzxyFFcl5LZqoHIsNoLTuX0
 pK9CtyPsLXX+LCQxhjzOKO9b/LE3/9YZHEORNU5hUjZoGFA20MeY9vfnUXmA8thTOfrwaV
 Y9SwmQp7ufsvY9OmtbIiNTsev8QaKloocIlWTaFIS5ZVTPPDGc3uqr31SgsPRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Kqli/izd
Subject: Re: [Buildroot] [PATCH 0/4] package/setserial: patch with _PATCH
 content and fix build on newer toolchains
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

Hello Quentin,

On Fri, 07 Mar 2025 19:58:42 +0100
Quentin Schulz <foss+buildroot@0leil.net> wrote:

> Quentin Schulz (4):
>       package/setserial: apply patches from setserial_2.17-45.3.diff.gz
>       package/setserial: autoreconfigure for compatibility with newer toolchains
>       package/setserial: update to 2.17-57 for compatibility with newer toolchains
>       package/setserial: simplify patching

Today, I faced this setserial build failure, so I looked up for pending
patch series, found yours, and fixes it perfectly. Not sure why your
series hasn't been picked up before, it's super clean, great commit
logs, the split into multiple commits is great.

I've just added a reference to an autobuilder failure in PATCH 2/4, and
fixed a trailing slash in SETSERIAL_SITE in PATCH 3/4, both of which
being minor things. And I've applied the whole series to our master
branch.

Thanks a lot, and sorry for the delay!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
