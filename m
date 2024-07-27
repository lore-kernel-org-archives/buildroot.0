Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464C4C3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 14:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E06D2406DD;
	Sat, 27 Jul 2024 14:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tsz-01ic03uq; Sat, 27 Jul 2024 14:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDFD1406DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDFD1406DF;
	Sat, 27 Jul 2024 14:37:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E62B01BF84C
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D351640137
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqQe-FTXQczo for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 14:37:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 725A6400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 725A6400C6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 725A6400C6
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 14:37:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 945F4C0003;
 Sat, 27 Jul 2024 14:37:31 +0000 (UTC)
Date: Sat, 27 Jul 2024 16:37:30 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240727163730.2b29a8a3@windsurf>
In-Reply-To: <20240726160152.2182074-1-fiona.klute@gmx.de>
References: <20240726160152.2182074-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722091051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lWn8Cj979xBToOum6AfLteJMWI3Sa8epP9GbVbo6UqM=;
 b=d8AKdQpu09m3wtRwokKhV0fNgLbHKIN0U39utABRr1seoXtbiRt222DF6hUdAkVlpFqbGC
 Z3CwkjvtyZQ5DrltawtCj6YUJfUWhhVmOtfrBX3s7dHXbVV+BogSOPn85KHA/YWyeQ42nG
 7Pt811SqZdMs7LaPNOz78nP0P19ifKm2kTcWF3NWiWdFrVzpUN5qqyGZkXZ4L5cmH/r0MX
 tBn3Mg6CEfhyRaolXEv4DhSXjAqmJEzzlTIEnBrDECWIh2VlppgzeJIxlK47Bb3qJhdKVA
 YdcDUNk0RaUe7Xgu2wJamI2ewWruoYq1Bl9WEOur4XMBxcHkeTnQ8nU8g7Y2wA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d8AKdQpu
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: fix menuconfig with
 GCC 14
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
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Jul 2024 18:01:52 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> GCC 14 errors out on the implicit return type of "main() {}". The
> patch also removes the /dev/null redirection of GCC stderr that hid
> the actual problem.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  ...-failing-saying-ncurses-is-not-found.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch

Applied to master, thanks a lot for addressing this issue!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
