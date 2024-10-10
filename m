Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6F0D24456
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5B6E413A0;
	Thu, 10 Oct 2024 21:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZtV-ihBueRY; Thu, 10 Oct 2024 21:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 220074139F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 220074139F;
	Thu, 10 Oct 2024 21:51:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F02911BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC95F6067C
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wh1ghL6p643 for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:50:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE4A46063A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE4A46063A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE4A46063A
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:50:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 863AF60002;
 Thu, 10 Oct 2024 21:50:50 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:50:49 +0200
To: Gilles Talis <gilles.talis@gmail.com>
Message-ID: <20241010235049.12f17df9@windsurf>
In-Reply-To: <20241005205607.222164-3-gilles.talis@gmail.com>
References: <20241005205607.222164-1-gilles.talis@gmail.com>
 <20241005205607.222164-3-gilles.talis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728597050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ljQzJO6wt8x2FrfNxGEf+xCGG7auKGX2QYtXcryLi5U=;
 b=DMunP5X1IYhnQWT7GkEUPjGeJ0dJ7qEWaUSfs6MJ/kpgTqAVjzh7a+88wP3PQ0bncyO6M/
 whQPXq6pAjhrh7txmteUiQOo5OJ1Q7zpk8S6/BrjfiylEqqPZyKG4qtz5f0ACzRPUro+ec
 6/NHUYzp4Z5mAjiS0xKCZb4iOFwKlWx1uhxHMjU85cV+6Y8TiS8zgY+azdsXi4S3sdVJej
 Sh87e1uppXhSaSzxZRWVvNbfeLFMWAv8GmhopgkLkHgmJtciqg9cl3sjnYV3vqTC2Fxui2
 Msl884VZFo2HZoNzJCJQZZSTTx+rGktmwnUnROHR9joaIIe1hF9M9hFt1/gwKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DMunP5X1
Subject: Re: [Buildroot] [PATCH] package/xapian: bump to version 1.4.26
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

On Sat,  5 Oct 2024 16:56:07 -0400
Gilles Talis <gilles.talis@gmail.com> wrote:

> Change log for version 1.4.26:
> https://trac.xapian.org/wiki/ReleaseOverview/1.4.26
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
>  package/xapian/xapian.hash | 4 ++--
>  package/xapian/xapian.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
