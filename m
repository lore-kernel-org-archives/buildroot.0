Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8257C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79912821B7;
	Sun, 11 Feb 2024 21:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dymwf8ohDqlV; Sun, 11 Feb 2024 21:27:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B0E983DE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B0E983DE6;
	Sun, 11 Feb 2024 21:27:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 469081BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 337DD41860
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xm27NitB9ayY for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:27:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D66DB41852
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D66DB41852
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D66DB41852
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:26:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19AB1C0003;
 Sun, 11 Feb 2024 21:26:57 +0000 (UTC)
Date: Sun, 11 Feb 2024 22:26:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240211222657.4861ec2a@windsurf>
In-Reply-To: <20240210073659.5018-1-bernd@kuhls.net>
References: <20240210073659.5018-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707686818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tXIbwYkcWHMBQQJW7q4wUWdHezUR7v/3pnsX1rPgXSM=;
 b=je1uEfNuNrsEL9qXqbaBeRjxyKi+wcUx1uyxgUXwWzwiOee9t6KL6YVtp2nU9bfBu91TRk
 CUYvfqGBgttYK9RupI7EdlgjSOfVwfdN71Ggro12GEsd1IPUb7DuYdh8wff+2c3ohEDCei
 D263euQt2698Hvg6qxSEGMEYl6U9DOo+W0R715nGAgNwYdotEppGiS7HBNSbEl/x7liY4D
 R6Yl5+db4KWbflcyxr15H+EAgynQT8dYtrtNAZKKCwU0CPePYSilLVxn1MlL9yBUPSfgt8
 lG7hkn4CJ92Gg9OHMUH71l5YZc8TKjlr4cfsYix36AoAdLLLBofDkdDGaBB51Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=je1uEfNu
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1,
 6}.x series
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

On Sat, 10 Feb 2024 08:36:59 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  linux/Config.in                      | 2 +-
>  linux/linux.hash                     | 4 ++--
>  package/linux-headers/Config.in.host | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)

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
