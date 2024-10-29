Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746A5D3A697
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 20:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 238CC80AC3;
	Tue, 29 Oct 2024 20:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmsHGdM2jROD; Tue, 29 Oct 2024 20:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E447080ACD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E447080ACD;
	Tue, 29 Oct 2024 20:21:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B00EE4EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DA624021E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id toa8aXUNNTcf for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 20:21:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B93940213
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B93940213
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B93940213
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:21:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4782C40005;
 Tue, 29 Oct 2024 20:21:48 +0000 (UTC)
Date: Tue, 29 Oct 2024 21:21:47 +0100
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, Eric Le Bihan
 <eric.le.bihan.dev@free.fr>
Message-ID: <20241029212147.739e0603@windsurf>
In-Reply-To: <20241029151617.3243174-1-buildroot@bubu1.eu>
References: <20241029151617.3243174-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730233308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jYiXQ/qOJvIjQ66ep1ymoDXI25kZ+T/hZBTmdAzjRME=;
 b=HRnzH0AQu2s+QglDBxP8YezsydospMnkGn1CZT2SZBeVQSYzkS1HAqm8Fg6orwP55VCIHY
 9Qs5z/WDN6Roi/TnjDRiJZyqvVuAsj97I7st+7wJEKmbR5caF/u6z2+6lSIKNhgb028kyY
 czJycHKTmYU03Wln/Iou4FD3+14qtyzNZaCgCDkjqeGpfeo27h5Jj+wKyc5yInd/kpMydh
 dsf1UboQP5BlKxHmgXVnh8ILIgisMADu2+79roB45lT9mWXSlp5+FiBOd5TW66zr3cDjJx
 0wth8aB3hjZpyISvZwid5gbFIl8SrmOwqQITeL8ADm+v2Ek+M3/zA0Zu9JFRUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HRnzH0AQ
Subject: Re: [Buildroot] [PATCH] package/usbutils: bump to version 018
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

On Tue, 29 Oct 2024 16:16:16 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Build system has been switched to meson upstream.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/usbutils/usbutils.hash | 2 +-
>  package/usbutils/usbutils.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
