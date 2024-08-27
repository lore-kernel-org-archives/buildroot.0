Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B123CC5472F
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F5F40634;
	Tue, 27 Aug 2024 16:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_Io82C9dYs8; Tue, 27 Aug 2024 16:29:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44E9240649
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44E9240649;
	Tue, 27 Aug 2024 16:29:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 416431BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB2E26088E
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7ylD1y5MKTz for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:29:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B86A9605A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B86A9605A3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B86A9605A3
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:29:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A919640002;
 Tue, 27 Aug 2024 16:29:07 +0000 (UTC)
Date: Tue, 27 Aug 2024 18:29:06 +0200
To: Scott Fan <fancp2007@gmail.com>
Message-ID: <20240827182906.4e223440@windsurf>
In-Reply-To: <20240827015942.157139-1-fancp2007@gmail.com>
References: <20240827015942.157139-1-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724776148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZ9AtMWKxXG0MUsHq3JlGcDw9JCRZCyM2VIYqoauxK0=;
 b=hUQFKPSh/xBBLFKWIwzr9WVpMXxoZ5vhObTeyLwxkfX65Xi5DKnuPAV7eO+oB+wChL5MKe
 tcVGUn/UMasZRQmkHQnY1Df/keaivlGxB+4FBWeCorp2JW19Oxv7dw8KvtpIGnKrN597Nt
 DlaeszNiWvkDCD0t11DyEvL5m2UIbtNBRxupLzQNwf6KgAZCq1LkVWM6vyPrxJDel8D6FU
 RC0w04zpi2g+I/RP7hKgFOimCOHlsSUhfxhckfFgatLa60/0EjlHqaff9R/n9jgkHswvBb
 txaRgjfZfV/pWa4XKn4orbuXbeFjch6VmRI5ZoMLtUQyzHDr/MTBvj+RH25F5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hUQFKPSh
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.16.1
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 27 Aug 2024 09:59:40 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> Release notes: https://github.com/timescale/timescaledb/blob/2.16.1/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>  package/timescaledb/timescaledb.hash | 2 +-
>  package/timescaledb/timescaledb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
