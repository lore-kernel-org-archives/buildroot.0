Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7BBC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B599540121;
	Mon,  8 Jul 2024 21:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_n662vlvUXB; Mon,  8 Jul 2024 21:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E7D44014C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E7D44014C;
	Mon,  8 Jul 2024 21:53:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74DDD1BF3BD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EECA4014C
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8AAGm9xeMtE for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:53:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6706A40121
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6706A40121
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6706A40121
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:53:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7EAF240002;
 Mon,  8 Jul 2024 21:53:40 +0000 (UTC)
Date: Mon, 8 Jul 2024 23:53:39 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240708235339.5dbf3da4@windsurf>
In-Reply-To: <20240704101631.1860647-1-fiona.klute@gmx.de>
References: <20240704101631.1860647-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720475620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hCEIMEkKEBIo04gN8L8geZ+c/Ik3RTjygcxHOa0hoqw=;
 b=hNkM+jZ9qCcP1LT/s7dUd/8GKZygH8fN5uqpXDjzzUSS4ABvzNphs46SWqn/2Y6hj1BrRA
 9rSIPDCD8ZNo0ANcog9I0lw2hGFuojMuyiZMm0LUxs9AmfaVZBnHxhFfTdC5Z2LnydDCQ4
 n53Ela7y7WxyFUGAodaCAc/2dn3rr4zXcKHfjSdQpbwYGBQfdiIXU6JBcM8CrDzBoYbBOX
 ydYxQgBTkDZV/UASgVUBnRP9rCwZ3iIPj3GVg5/WHOP8RgqEr+wc/QTuHxFTDIFI+VsY2A
 rt8YG3uQm+K73xCNtW48Bxoua0UCJuBjJZXJkkELakUELFU5/OQilA3rRFnAGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hNkM+jZ9
Subject: Re: [Buildroot] [PATCH v4 0/3] Refactor OpenSSH init.d script
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
Cc: Fiona Klute <fiona.klute@gmx.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Thu,  4 Jul 2024 12:16:28 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> Fiona Klute (WIWA) (3):
>   package/openssh: manage sshd using start-stop-daemon
>   package/openssh: fix init script indentation
>   package/openssh: implement "reload" using SIGHUP

Thanks, I have applied your series, but I have reworked quite a bit
PATCH 1/3 and 3/3 to follow the canonical example of init script we
give in the Buildroot documentation, see:

  https://buildroot.org/downloads/manual/manual.html#adding-packages-start-script

And review the final commits:

  https://gitlab.com/buildroot.org/buildroot/-/commit/8900311b7e5450082cace986533a093d37900efa
  https://gitlab.com/buildroot.org/buildroot/-/commit/df605de1349251687640519fcc2d2147cf146af9
  https://gitlab.com/buildroot.org/buildroot/-/commit/2c14a55c6cf28ada9f1d3d17d3b11370829372ca

Hopefully I didn't mess up :/

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
