Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C897C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC1B260B99;
	Mon,  8 Jul 2024 20:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCEbgC55wghD; Mon,  8 Jul 2024 20:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E23EB60BA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E23EB60BA4;
	Mon,  8 Jul 2024 20:26:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88CD41BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75B924033A
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WF3WPZ9eCrjt for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:25:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1466D40133
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1466D40133
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1466D40133
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:25:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F3A320005;
 Mon,  8 Jul 2024 20:25:52 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:25:52 +0200
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Message-ID: <20240708222552.7c5d9248@windsurf>
In-Reply-To: <20240708123050.45780-1-thomas.claveirole@green-communications.fr>
References: <20240708123050.45780-1-thomas.claveirole@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AaPZVe6uN2ZsF4TtgGJCqOc35pvVhyiK0Xt9mT+I7kc=;
 b=k+wilGxJnj3xPlKi5d6w2ZLCCMVrx26kaGXwZjG/es12PKcNtJAFUEooQkBDTXgQq0Ea3j
 CfFyRbGMZ7wQrPmBvAAVebE2LEDyu+DZpRd2TXK0orCiAskyiBITccWS/5A0S+KvkGVdGw
 /0ZHTsfhJVf3at+LyI1Krj/Hb6zqzTGoCwKy075KG0zMH4sjIS/DerTQtSE5+mm7cH3a+j
 KPLD7Vsea2jj8X72HCI7WRYt+5MiS/g6JBAcMpYQSCjCnMT4+34dschEHVU6aIro0nlqJM
 ngGmGw8E96sDcGxwL34p1wRAC346a8epLviFrAw2SOB2tAR440teHrJfNDVm9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k+wilGxJ
Subject: Re: [Buildroot] [PATCH 1/1] package/openlayers: bump to version
 9.2.4
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

On Mon,  8 Jul 2024 14:30:50 +0200
Thomas Claveirole <thomas.claveirole@green-communications.fr> wrote:

> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/openlayers/openlayers.hash | 2 +-
>  package/openlayers/openlayers.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
