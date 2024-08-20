Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B39C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0173840B38;
	Tue, 20 Aug 2024 21:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smS3x3SwLzfs; Tue, 20 Aug 2024 21:27:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1E4E40B4A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1E4E40B4A;
	Tue, 20 Aug 2024 21:27:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A5EB1BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 370B081222
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7rtibPkw8pA for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:27:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25D7D81210
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25D7D81210
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25D7D81210
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:27:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64CE120005;
 Tue, 20 Aug 2024 21:27:31 +0000 (UTC)
Date: Tue, 20 Aug 2024 23:27:30 +0200
To: Woodrow Douglass via buildroot <buildroot@buildroot.org>
Message-ID: <20240820232730.60670833@windsurf>
In-Reply-To: <20240820114015.11119-1-wdouglass@carnegierobotics.com>
References: <77476c0d-9af4-4a75-bd83-8fd7d74a03c4@carnegierobotics.com>
 <20240820114015.11119-1-wdouglass@carnegierobotics.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724189251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZGNEXoFRZiDq76FD94I/rVCslNdkfEPXUojdDu+fvA=;
 b=Fvm9CjEOgVeXAUcCbL9LBHGYu5IrEksVLjpNXHarY5sQ/sLDa7IPaEaF09yOE61KHYblcS
 +Lcw8iHr1Q5EHNoYa+Lwf3Aeoz0aOq0CMvLqMUFG2JtYmHQG4w+N5cudfWqzmuFJKplju5
 PA4yBYXAJsXfAjiCwPylg+IRiy+ruq5jBU42gGlIe/wnrJs4AdYRKz0GhJuYDBSxLOj94E
 FHMK3YTnH3eoAgRfXVRoJMzzgUkOfSMN0OyQsk0F2TtZHv85umqnOBjFfrqFYGwmA7ckqw
 joi77GyLtLUlijDFr/+USAXYh4AltAq3vPN/UDwpBR0altykTL9sDm7GbjmpBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fvm9CjEO
Subject: Re: [Buildroot] [PATCH] package/chicken: security bump to 5.4.0
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Aug 2024 07:40:14 -0400
Woodrow Douglass via buildroot <buildroot@buildroot.org> wrote:

> This release includes a fix for CVE-2022-45145
> ---
>  package/chicken/chicken.hash | 4 ++--
>  package/chicken/chicken.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks for your new iteration... but this time around it lacks your
Signed-off-by line :-)

Also, when you send a new iteration, please label it [PATCH v2] and
include a small changelog.
See https://buildroot.org/downloads/manual/manual.html#submitting-patches
for more details.

Sorry if I'm a bit pedantic, but I believe this helps everyone learn
what the best practices for patch submission are. If you find I'm too
pedantic, let me know, and I'll try to be more flexible :-)

Thanks again!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
