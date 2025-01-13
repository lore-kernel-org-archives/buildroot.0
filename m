Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF71C02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 20:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8222860809;
	Mon, 13 Jan 2025 20:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KfRy1gHa3ssP; Mon, 13 Jan 2025 20:29:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 858D56080E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 858D56080E;
	Mon, 13 Jan 2025 20:29:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96C41942
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E7F3605A6
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsDrH-YyWBVm for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 20:29:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 57EFD60809
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57EFD60809
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57EFD60809
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:29:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE83CE0005;
 Mon, 13 Jan 2025 20:29:18 +0000 (UTC)
Date: Mon, 13 Jan 2025 21:29:17 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20250113212917.5ed56ab5@windsurf>
In-Reply-To: <20250113200454.3108562-3-fiona.klute@gmx.de>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
 <20250113200454.3108562-3-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736800159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQmTe/XQENKenmNoXVUgB/bzfvftXDIeINHOMkHtI/c=;
 b=OcCbgkSpWnWNo6/IrZJxTWN8CzGUR/pMYDg73liz9erWoxyN9o6fjoaSwUcwiYJup/oyk1
 qlEye2hErEZTUpcJjLpu0UkRF6ojcGFWP7uuo0w+LQh4zSeCmS9gXfIbKDZJIFG4tamjyH
 71jLumbzGWDIR6BFWa6eWMZfjiaLda8YvLyisBcGYOfAtLCcY1L9BKpfQhiRylQtM9UC6m
 6Df6UH1RZaSCYE5nl0UmCwFaEjp+M6VLor5M8BDujZW511MowBe29FhqMPqN25+NRmLTN5
 FF/hXEiBY9insOZoTnKTGecMVpuN0jpx3+kaqaadlDmZhmTwpz3Zp3v5DyP+zg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OcCbgkSp
Subject: Re: [Buildroot] [PATCH v7 2/5] package/gobject-introspection: works
 with musl now
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 13 Jan 2025 21:04:51 +0100
Fiona Klute <fiona.klute@gmx.de> wrote:

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Current versions of gobject-introspection build with musl (Alpine

When you say "current", is this after the version bump of the previous
patch?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
