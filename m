Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5002FA3729
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99102807E2;
	Fri,  2 Jan 2026 15:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEsFZnnLHbJk; Fri,  2 Jan 2026 15:26:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6BED807E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767367563;
	bh=Wgzg/gBWS6Z3WdEkt4IKUkOCiIQiIhWrEx12NzTLjGA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Sny87ZB2zjgSHzYQTyJbXZuXFnXtKIELu6y7s4bYjEqDOC6t4Cf1Nw2WpJVNeIxO+
	 wpm3Paca3AagfclKFq3PNUAj2rBJ0Pf6Q9f4wyG8Vq62guYxZF6cl0vOR9eiv5uhaq
	 1RBOK03Y8pEvG6Ajtc/KKnA1qEtrsYNxq5LmR00Owvo4a26h2nBut/+UG7BhIkwP0e
	 8Uv7YgVaWKSCJo8YXIqMFRm+2ED2D8etOIxWcGOwtQIzTVhgjOiFYumYYvQHLmBX5M
	 Rqqbnkeif4i8hNCzP5RyIyOLkwI5ApEfgdIX3d4luz8+oBUzK+gW+Ogrk3DkY06hCu
	 XVrJM7+s7smFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6BED807E8;
	Fri,  2 Jan 2026 15:26:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1116F19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 027A4607FD
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEGV6bhUUb_5 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE294600C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE294600C4
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE294600C4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:26:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E7B01C1C3B6
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:25:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B2C99606C7;
 Fri,  2 Jan 2026 15:25:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E8866113B071B; Fri,  2 Jan 2026 16:25:57 +0100 (CET)
Date: Fri, 2 Jan 2026 16:25:51 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20260102162551.57e05cd5@windsurf>
In-Reply-To: <20260102141155.167197-1-bernd@kuhls.net>
References: <20260102141155.167197-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767367558; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Zr5d0shTXQjeRbUrPiaRk+DeBOxxEOdq8lR1MV+7Y7I=;
 b=MajJe1lqwpKkkOcwAtY1QwOzdWy9Oybr2rlrdecFD6uYGsTKgFciyLQcfg8j4Ua9OGbHMb
 +DXxHlcHJrinnBDZPZMZvnVGCy/UKrMF7EEBYUrmRfnbY8O/jrIDOHiFxxSLQlJWf+C4oR
 KDe1gH3VXo3SLS221RYO9nSC910ZdZ4NfUeqZtXDuj5vNMM766G8iNRx0MeWs17yJcziWw
 r/Iq+iCtREdbeeSQltr8wwTnycw+7nk7uI8eGbH3/ONlqzp7jOGrn6H66f1Qaa9WZ7HfT5
 YPpoEDhz8sumwzANMF+ijQYb8M5TYRYWxN2NIDo6ORAszsz9O3Ma6PQN2sBCcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=MajJe1lq
Subject: Re: [Buildroot] [PATCH 1/1] package/ncurses: bump to version
 6.6-20251231
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

On Fri,  2 Jan 2026 15:11:54 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> https://github.com/ThomasDickey/ncurses-snapshots/blob/v6_6_20251231/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ncurses/ncurses.hash | 2 +-
>  package/ncurses/ncurses.mk   | 4 ++--
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
