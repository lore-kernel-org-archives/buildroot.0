Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B618C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 20:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6505880E3A;
	Sun, 28 Jul 2024 20:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hb0HmzpAaRx1; Sun, 28 Jul 2024 20:17:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8151980EFE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8151980EFE;
	Sun, 28 Jul 2024 20:17:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04AB51BF47D
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 20:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F25C280EFE
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 20:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THIGkJ1Z5iCV for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 20:17:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C45C380EA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C45C380EA7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C45C380EA7
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 20:17:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC2B5FF805;
 Sun, 28 Jul 2024 20:17:18 +0000 (UTC)
Date: Sun, 28 Jul 2024 22:17:17 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240728221717.3a0aa287@windsurf>
In-Reply-To: <20240727180101.1742370-1-bernd@kuhls.net>
References: <20240727180101.1742370-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722197838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CB03rrVMeVSGULZ+KDC1ismMiLnoH9bv7YLyM6+OJg4=;
 b=h5/6zv61FmoMxr4oS9UzboKVWpoXoiApHD0tbomhIv88cl7dY4pllB1iwkkiXeYhAKU9mE
 fY8dWky/yvfdBjLhbegde1xG56zqNWRshvxYLmb1bjpvHdxF6OG+iL7wth0MhhqJLJYkon
 viXHoH9MJhV+pVFeNbSxI1izHAyeHTXd1TLXVdAXbQil0pdfx16J8RZ4y53078JNf95jbM
 TIr6dG83s2KV8PSJX1RaI/KWLABKtG7j0a3jlHsjtZSxU5xWTY1iNOmrRRymuFPpGK5rv6
 Q3Gu69CdkQrTb74J6l8eG/YkFP6exNOlfIUIX+8RWONnOyw3fBIk1zbn/S09RQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h5/6zv61
Subject: Re: [Buildroot] [PATCH 1/1] package/ytree: bump version to 2.09
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

On Sat, 27 Jul 2024 20:01:01 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://www.han.de/~werner/ytree.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ytree/ytree.hash | 2 +-
>  package/ytree/ytree.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
