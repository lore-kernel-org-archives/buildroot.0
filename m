Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A216D5B144
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 502A68109E;
	Mon, 28 Oct 2024 20:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JgsDDAq_2R8A; Mon, 28 Oct 2024 20:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C96880DA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C96880DA8;
	Mon, 28 Oct 2024 20:14:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF57B4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9B9940257
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8otSRM5AVOKu for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:14:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3FD3B4024C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FD3B4024C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FD3B4024C
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:14:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57AEB60003;
 Mon, 28 Oct 2024 20:14:22 +0000 (UTC)
Date: Mon, 28 Oct 2024 21:14:22 +0100
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20241028211422.1049398e@windsurf>
In-Reply-To: <20241028163137.2136109-1-fiona.klute@gmx.de>
References: <20241028163137.2136109-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730146464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JFOgQHVQMvOeYI9PkmTLEJl4++iO+BjYAAmtwto27co=;
 b=Q2HyHnzp0nsCZSjQyUpMhOvXrUOp3TNtf4XYhUNo2+IcnFA/TxD2/f1VW3QAc7GomQI9oc
 TR5WvSzsr5EfXJ/rckPt1J7kvue8K4drZceIv+jS3BVo6XD1IH9iCt87pGcHUYHG9OZYJd
 wClH86+PvTSo4zpQx5JEOKLc/dHeajptXM53NEb/JH3ADzTtwzpZzJu8QojgscFkdqoNLj
 6oLzfYL3StbMdIvBqQnpm7H5N+IAqmbEUnbvuj/IMsGJuokl2MioerTS6oSqqjwkjDDcI9
 I8G6YNOzpjvvR0116CCsr9QWnDoGpYKr5KqUoHIDK8cYu2meeg/iiUkjr3IbxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q2HyHnzp
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: fix musl compile issue
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

On Mon, 28 Oct 2024 17:31:37 +0100
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Building package/openssh 9.9p1 with musl failed during linking because
> construct_utmp() was referenced due to "use construct_utmp to
> construct btmp records" [1], but not built as utmp is disabled in the
> Buildroot package. The fix comes from upstream and ensures the
> construct_utmp function actually gets built when USE_BTMP is set [2].

It would have been nice to include more explicitly since when this
issue started occurring. I assume it's since the bump of OpenSSH to
9.9p1, but this should ideally been made explicit. Could you keep this
in mind for your next fixes?

I've also added a reference to the autobuilder failure being fixed, and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
