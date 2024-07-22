Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41751C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00C794063E;
	Mon, 22 Jul 2024 12:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZuhjqCZNT8g; Mon, 22 Jul 2024 12:13:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0DBB40640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0DBB40640;
	Mon, 22 Jul 2024 12:13:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF6E61BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACCD040640
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnKMIZsvtC28 for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:13:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C7284063E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C7284063E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C7284063E
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:13:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EBD31C0006;
 Mon, 22 Jul 2024 12:13:49 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:13:48 +0200
To: Saeed Kazemi <kazemi.ms@gmail.com>
Message-ID: <20240722141348.18756600@windsurf>
In-Reply-To: <20240721183223.2792367-1-kazemi.ms@gmail.com>
References: <20240721183223.2792367-1-kazemi.ms@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721650429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rLgotwt4XSD7Em2DTQTsVLQf6vcWsmQqVTYdcIISE5U=;
 b=Ayfq3hmzgEREVaaELOCuNhVOd0vAw60+GN5Bq9JKGFqjmXFZolJkQQL5U4Uqzl2oX6P+El
 T6hJFpmwK1j0SBFtcomVrWSpC9sZzqLw5/T5OXBHnx5aQa7fjeb6mUyaxEBcpHGgeph2gm
 rzbkZNvF3YzaEJyXT8qzuFn+oetdABV51er6bUVVZaKXByrAw5DcVk68VfezhayIHhhfLG
 mUlEwiCIJKFEsoiKHENbZ+V7SkVtFZTyXRvvcsaHuwx+5W325KRbzIAHVGVscp+gr4hLEY
 Jt57giNRyk2lBXqIEU+6K3IW5nrYRxDPNQl7mwEG7AOaYm14GpWciGUs/bWwvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ayfq3hmz
Subject: Re: [Buildroot] [PATCH 1/1] package/parsec: new package
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

Hello Saaed,

On Sun, 21 Jul 2024 20:32:23 +0200
Saeed Kazemi <kazemi.ms@gmail.com> wrote:

> Hardware/platform abstraction service for TPMs, HSMs, and Root of Trust
> 
> https://github.com/parallaxsecond/parsec.git
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>

Thanks for this patch. Two questions below.

> +Subject: [PATCH] Fix compile errors with latest Rust version
> +
> +Upstream: N/A not applicable directly but based on:
> +https://github.com/parallaxsecond/parsec/commit/82320d345e08fe6310b684191151c78fc5648693

Why are you saying N/A (not applicable), if in fact your change is a
partial backport of an upstream commit? If it's a partial backport,
just state it so:

Upstream: partial backport
of https://github.com/parallaxsecond/parsec/commit/82320d345e08fe6310b684191151c78fc5648693

> +PARSEC_VERSION = 1.3.0

Why 1.3.0 and not 1.4.0 or 1.4.1 that contain the
82320d345e08fe6310b684191151c78fc5648693 fix already ?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
