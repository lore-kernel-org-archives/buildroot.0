Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21554C02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 20:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E55C76082A;
	Mon, 13 Jan 2025 20:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nONirYIYuYc6; Mon, 13 Jan 2025 20:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1869A60831
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1869A60831;
	Mon, 13 Jan 2025 20:30:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A667A940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 840AA4048F
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WpYiTZCoXgu for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 20:30:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DDB9F400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDB9F400BD
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDB9F400BD
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:30:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC39BE0004;
 Mon, 13 Jan 2025 20:30:04 +0000 (UTC)
Date: Mon, 13 Jan 2025 21:30:03 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20250113213003.0b2ef4ec@windsurf>
In-Reply-To: <20250113200454.3108562-4-fiona.klute@gmx.de>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
 <20250113200454.3108562-4-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736800205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V72GdOGxZKUUHPu+TDYf9XZemgYNcFeA9Z5AXRIEIzU=;
 b=XI//d9EpMigqNS3t/rctgIpPiAo4j7wvYhCRf3Jha2ViaUYdWfUXf/OzTB7s5/Hm5RvybZ
 4t1dEASvGHfdQ8ggwW3asGiV/qWczVQprI7iyvyrtmnJfkLXfSAngpqj+nFumn5sAgdmRW
 qO/SZrGcLN+HQOH0fzITvrXNTgccURIceetubHzSP7N9u9wdy1zDw37CcUsjR1xU39mD+b
 nAstKv+9RYDKDT6hSHgIBnTnAukznOcwb3WbKwfdwmUYaxwXU3x8jnLJ7BV/ZetPZCcJ6N
 yTqoDd7EKDIS06LH1aLJ+CCiSa9RmEISJ0GB/72ExxtbU1PKrT356hjGhyRb3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XI//d9Ep
Subject: Re: [Buildroot] [PATCH v7 3/5] package/python-gobject: bump to
 version 3.50.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Mon, 13 Jan 2025 21:04:52 +0100
Fiona Klute <fiona.klute@gmx.de> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Current gobject-introspection releases work with musl, so relax the C
> library requirement.

Is this change thanks to the bump of python-gobject to 3.50.0, or
related to the previous patch? I'm trying to figure out if this
dependency change has anything to do with the version bump.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
