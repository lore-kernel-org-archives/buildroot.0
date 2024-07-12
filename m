Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02931C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7DA4417C4;
	Fri, 12 Jul 2024 14:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qbjknb2WCCsR; Fri, 12 Jul 2024 14:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 700C04196D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 700C04196D;
	Fri, 12 Jul 2024 14:02:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFB541BF59E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA9404196D
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8G4elfyjbBm for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:02:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5369F417C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5369F417C4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5369F417C4
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:02:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A9DB20003;
 Fri, 12 Jul 2024 14:02:31 +0000 (UTC)
Date: Fri, 12 Jul 2024 16:02:30 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240712160230.1e95bb85@windsurf>
In-Reply-To: <20240609195519.1154353-1-yann.morin.1998@free.fr>
References: <20240609195519.1154353-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720792951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MC1YROn1ERmogG9BEqzJOijcqvzYL0FOJeMalZTqRvQ=;
 b=YKeaLyWY36NQXE4XH7McIEUoRgoAkeDJy1+KQa7bJRgBP8+J/wD8A0ecYFu5HiugJYu/Zw
 YcYz9bMjWyF+pxqERsaaZSuxXpcFdzMbO6QuSCSopbdaYbept5nnYfS/D6hsm21Ig79fgA
 9YdoHfrNyrwhH2+yi/2Cf9EmMW1dDYn+UwHw51A0aPC4kwf1P47Nke+vIdMcVEOyI7HgrE
 CzM+iLiHbEaIRyPXCkuXx57Zy/rU8QU6HZ35FmENhcqM8qRZGH1mFqih6bTG8pw/SnAFeV
 8TvMLEVIIpLHHVoXGugyLs4CYNLIPGdnOMFJMukEJoO9C419fk1NKZJJIPsqsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YKeaLyWY
Subject: Re: [Buildroot] [PATCH] package/bcc: add missing dependencies to
 comment
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  9 Jun 2024 21:55:19 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Since its inception in 146498d13c48 (package/bcc: new package), not all
> the dependencies of bcc are mirrored in the comment to be displayed when
> those dependencies are not met.
> 
> Fix that by adding the missing pieces:
>   - wchar,
>   - threads
>   - dynamic libs,
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/bcc/Config.in | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

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
