Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9669ED5B15D
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 17:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F71C4083B;
	Sat, 13 Dec 2025 17:13:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OMJ8GMp4aLK; Sat, 13 Dec 2025 17:13:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08E1B40751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765646010;
	bh=T3ZuU3Z8wDXOx0OVU01/O54jez+siooJo6HpT2MIeps=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K4zVoT9Oy14soIZOykaO3AgY+Ch5mGuxszUqFQSGpYH2+Ggj6TO6euojdWj4awt3f
	 HwMDQxjW20FpDRuSIsIHboV8xZrV4fitDXBsmF3VF1MNuDWLoELksrLqjI+Flu8vjT
	 2JTkDOvJ/7wvx8dnUuSl/lV2B+tVI0PGmV29XtRbn+FpUn95BwfjzAWi8vzmKHUxtx
	 zT79hQ6hZF/dHBnAFMqZCEtzPhP2FXYVngBjYpRwWNePz/djK6QiQiTer0cnmjmmty
	 nTkk8dbyMFVwtEieEAO03l425UP8XSJFUdAHtxoBWukuKNb93hql3SrbSXBbGusbAr
	 /0rjVQLKLmypA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08E1B40751;
	Sat, 13 Dec 2025 17:13:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 745CC2C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 627DD80EB1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:13:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VpEpkIRYGNht for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 17:13:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F38680EAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F38680EAF
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F38680EAF
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:13:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8D0ADC1937E;
 Sat, 13 Dec 2025 17:12:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B042E6070C;
 Sat, 13 Dec 2025 17:13:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50423103C8E06; Sat, 13 Dec 2025 18:13:14 +0100 (CET)
Date: Sat, 13 Dec 2025 18:13:13 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, John Stile <johns@msli.com>, Alexey Brodkin
 <Alexey.Brodkin@synopsys.com>, ARC Maintainers
 <arc-buildroot@synopsys.com>, Thomas Devoogdt <thomas@devoogdt.com>, Romain
 Naour <romain.naour@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Maxim Kochetkov <fido_max@inbox.ru>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
Message-ID: <20251213181313.7ba278b9@windsurf>
In-Reply-To: <15a5ac3d391bb8b83ba2c3c504accf5c@free.fr>
References: <20251211161615.503688-1-thomas.petazzoni@bootlin.com>
 <15a5ac3d391bb8b83ba2c3c504accf5c@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765645999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=masy1lZ35P8l1q+6pjVxocIORop4GpFSWZlXsmcOaAg=;
 b=SJO3k7c9QoLDK70d5sxbC21b1BPHU4LsXRt1eyExE92/SHpt5c7OeF3/e87SZnqUdniyJ1
 beq9fZ92iSM13F60ocy2TXTMgS9xemz8eN4fm1GH6bGbzDZ17ir7sOma1hflVe5DE/4Yfw
 /Iom4PYT5uCSvamFgc6kXmnrs2Qabxwk44nziHCPbPLQJIjC4KkbcyvixptWAeELVBf+sd
 lxOUR+nuMwJ3RSfB3q+ZyE5bCNV0Wh4L+3CVN2yA97vzCIKzWM4nUu4vosaarIEvyCXhsT
 IpiWscFiw/ya7yaJgpy0ohuDJ7srZFepNCUJaLLVX52Kz9nZt9nM2E+tZY7RJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SJO3k7c9
Subject: Re: [Buildroot] [PATCH] arch: drop support for ARC big-endian
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

On Sat, 13 Dec 2025 17:49:34 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Applied to master, thanks.
> 
> For info, I had to remove a remaining "BR2_arceb" from pkg-meson.mk to
> fix a check-symbols error.  See:
> https://gitlab.com/buildroot.org/buildroot/-/commit/2d570f8369342590836378e86e3d2a65f7fb6fc3

Dang, sorry about this. I'm wondering how I missed it... :/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
