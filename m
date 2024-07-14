Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DD9C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DCF2403CB;
	Sun, 14 Jul 2024 20:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0L-T50LXT6Tj; Sun, 14 Jul 2024 20:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F3B24035D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F3B24035D;
	Sun, 14 Jul 2024 20:29:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A2431BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 275F980E13
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTP2yC-JzT1h for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:29:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0ADB880E06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ADB880E06
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0ADB880E06
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:29:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3241360003;
 Sun, 14 Jul 2024 20:29:47 +0000 (UTC)
Date: Sun, 14 Jul 2024 22:29:46 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240714222946.17933c0d@windsurf>
In-Reply-To: <20240712124956.3925574-4-fiona.klute@gmx.de>
References: <20240712124956.3925574-1-fiona.klute@gmx.de>
 <20240712124956.3925574-4-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720988987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=stiCFrD2AfYBK6POxEtwcNr9KaNEmGAdH+uYvlTjWg8=;
 b=bkhaL+fjxkEeJTE1KwjB3OINxGrLzJZ9DiAs4RQOTeWB52olPAsnzDF3bncFwG0TtrRXlJ
 KGkMg/ni617K29Xf4+X7dhO3bz3VgXApUcW8ya914w7aw74YIVpC9taAVoSyiejp4ofFFM
 CU9GnpOo8TjnuwG8bfpn5h8NhP5pKgNqzUUc28Ffl+Ocr0+QSVfxhqn34Z7SDIlryvHP5d
 Ohf2r7Gt29FA4NlxXoEZA3EnM/mutKt0riS3TZUYrGdOqz4MJQYeiJqBJ3ZfcHtZshhrel
 V+09Meo/Y1Q7Wx3sJPVubMuSq65GKUzy5ooeAuqjhLXXxP03VtbKSblfwuBaKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bkhaL+fj
Subject: Re: [Buildroot] [PATCH v2 3/6] docs/manual: include S01syslogd from
 source
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Jul 2024 14:49:53 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> The manual describes package/busybox/S01syslogd as the reference of
> how an init script should be written. Include it from source instead
> of having a copy in the manual to ensure actual code and manual stay
> in sync.
> 
> Also use long options in the paragraph after the script to follow the
> same style.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> Changes v1 -> v2:
> * Update the manual paragraph below the reference script to match its
>   style

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
