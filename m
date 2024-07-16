Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF109C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 21:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2BEF405C8;
	Tue, 16 Jul 2024 21:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqPI304HRFoR; Tue, 16 Jul 2024 21:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64CA8409FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64CA8409FA;
	Tue, 16 Jul 2024 21:26:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B45841BF37B
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0A27409FA
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9ZmfcXh5ypN for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 21:26:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3CC20405C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CC20405C8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CC20405C8
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 21:26:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C4D9C0003;
 Tue, 16 Jul 2024 21:26:20 +0000 (UTC)
Date: Tue, 16 Jul 2024 23:26:20 +0200
To: Andreas Naumann <anaumann@ultratronik.de>
Message-ID: <20240716232620.6bf94528@windsurf>
In-Reply-To: <20240716183259.113591-1-anaumann@ultratronik.de>
References: <20240716183259.113591-1-anaumann@ultratronik.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721165181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=alUNVTPWQV3uGJK1BbR39/GPtYjNDgRUd/2psuJPPl0=;
 b=nG2JTIs8EDUos5FGgevqv8j8U3Mi9THwjH9oJzaSJgry0xjI/h66lD0aE6KDxCpCay8xux
 2iJHRQEwCLP0g6OptrG2bJTiKSRnb9iloktQ170oJXa6l8qKAml6v1FjOR1WDuiVlT4JNK
 xmRZKDs87cSbOrK9wmfoRxiu48a2Zjxn/V7+GVjInm1+exKFGHbNfBsEOE6O4DlhiXVq2C
 Pipq+0frTwhFR5GuwjStbK80/yACQa7JaULG+t71TQUSbsaFFKqX9jNTryieZD9A9xf3BD
 tgZtp3TFfleSey1i8jr4SI6XPi5Nmhh0+bi+dBOnRADKIh1aT3h/gecUN+LwFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nG2JTIs8
Subject: Re: [Buildroot] [PATCH 1/1] package/evemu: needs autoreconf for
 python 3.12 compatibility
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

On Tue, 16 Jul 2024 20:32:59 +0200
Andreas Naumann <anaumann@ultratronik.de> wrote:

> evemu ships with an ancient py-compile script (from 2011) depending
> the imp module, which was finally removed in Python 3.12.
> Set autoreconf in order to get an up to date version of py-compile
> which automatically handles the different python versions.
> 
> This is a similar problem as in
> 42eae73ef1 package/cracklib: python needs autoreconf
> 
> Fixes:
> 
>  http://autobuild.buildroot.org/results/a52/a520583be6e86993d268d6535f727a352bd92028/
> 
> and many other configs where Python3 is selected and thus evemu
> is configured to build the python-bindings.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/evemu/evemu.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master after adding missing spaces around "=" sign. Thanks a
lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
