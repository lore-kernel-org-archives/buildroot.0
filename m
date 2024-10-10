Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7CDD24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F31F5415E7;
	Thu, 10 Oct 2024 21:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdky4eTpGnV9; Thu, 10 Oct 2024 21:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EBB2415E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EBB2415E1;
	Thu, 10 Oct 2024 21:37:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A37E1BF98E
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C750A412F3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAeFtzWEciCR for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A9DC4137E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A9DC4137E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A9DC4137E
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78DF640005;
 Thu, 10 Oct 2024 21:36:28 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:34:01 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233401.52263e38@windsurf>
In-Reply-To: <20241009152639.3775256-1-james.hilliard1@gmail.com>
References: <20241009152639.3775256-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CxGyQ0n1pBnTZYl7/UxmNIoqmW01VGs6HwovOE8TOdc=;
 b=EB7y3dLBV03n7MynETa9AbKwQ5jYjI+28g0KEvjvdU+/jELT73eBSBNrZusMWfR2bEp5BL
 ju4tMg6q60zKI5vxDoqne900RRFuw5MmEJ3jI3GvoCpDYtrzdYpud2khoJTv1PRDeYf3hs
 AnLkufQB9uxoTwp7e6e3qGhJ90fLexaliBhp9qTVnWv2QHh6L/o1bteWJfvUz1Ed1lVYDv
 n+aUpm7+8Kc1QAdeNH82yp3N3TTcp6J2BrCFXmB9c+hhr7uf2VSOK/yLpgzLf6xnqLO9vr
 SBdYi66R6BtibZm19hMKiEq47Mch8OyjGDiI4bV3U7CDldNdsMn7sql0U7yO7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EB7y3dLB
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.10.9
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

On Wed,  9 Oct 2024 09:26:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aiohttp/python-aiohttp.hash | 4 ++--
>  package/python-aiohttp/python-aiohttp.mk   | 4 ++--
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
