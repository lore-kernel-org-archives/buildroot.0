Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA42FC6182
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 22:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92CCE419B6;
	Fri, 13 Sep 2024 22:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nncpGtiBI77l; Fri, 13 Sep 2024 22:17:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D21A042476
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D21A042476;
	Fri, 13 Sep 2024 22:17:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22C1D1BF2BE
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF34B60742
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqWVPZK5l8qY for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 22:17:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D849960D70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D849960D70
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D849960D70
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 22:17:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D85E9C0002;
 Fri, 13 Sep 2024 22:17:47 +0000 (UTC)
Date: Sat, 14 Sep 2024 00:17:46 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240914001746.477c3e8f@windsurf>
In-Reply-To: <20240911202822.739096-1-james.hilliard1@gmail.com>
References: <20240911202822.739096-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726265868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGT78rzqE7hyFfEvRrp36oP/tzCMTiBPPfONj75t3Vg=;
 b=h2ShUghRfIxqdFhC+UpDe4JyBnQxFN59w8WEVEeNW/3XXSjnjZgRwKvW0X7+syh8HHxa0s
 7hUPyOGbCRUg4qVLiUZO3C8aRrR9H5O5gF87G+dY3ApbQ2Gc0EIXlCpIjc1f2fIud7DIEE
 q2K+B/NL+BJOKtcpmZ/PG/LnaKCz7yVNwd1THkGJKouh6zbQJ6/k9QeiUVt71vdQ/q4f8y
 h+8fH0Akso8AAeeFHS3V7lMeZkdzUcMCpHcRrTyWJDYb4rzktCHHjiQbtAthQTVBv2WFcQ
 Knxr7zlyCaxiFo1c+THxWBk5lJHP6f/a+xCsO8sp4Z9A+yy2nlBuEWtq5T9seA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h2ShUghR
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to
 version 0.8.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 11 Sep 2024 14:28:22 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aioconsole/python-aioconsole.hash | 4 ++--
>  package/python-aioconsole/python-aioconsole.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
