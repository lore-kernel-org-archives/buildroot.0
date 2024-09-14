Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE1BC021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36EE4406CC;
	Sat, 14 Sep 2024 21:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTH-OCiS3k2Y; Sat, 14 Sep 2024 21:53:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21A824072D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21A824072D;
	Sat, 14 Sep 2024 21:53:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4998E1BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4637A840F6
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ru9xrQZXTrn for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:53:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 39726840B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39726840B2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39726840B2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:53:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F9FE60002;
 Sat, 14 Sep 2024 21:53:31 +0000 (UTC)
Date: Sat, 14 Sep 2024 23:53:30 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240914235330.0ada3e30@windsurf>
In-Reply-To: <20240914205958.1174180-1-james.hilliard1@gmail.com>
References: <20240914205958.1174180-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726350812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbN8LrDRucLxH+/kLgvZOmW/Y0wcaYyHn3jbDkJFAzo=;
 b=oTZN5UWJXC4TYedLXsKYnctrxWMhdMk1VL4KU/qJW55c3AW9TcPLEhZSW9VY76qPkZ0a8N
 ea94cXSgCBDYinc8hwk8jKDA9ej/k03U/XWoy+wYXyPhUqw1dQrElOP6nPruwdGBek4g8c
 CrFJPC0YXoesjzrx7pij6Fb/1Jc8zEmUUx/VIZwiEmVIF59EZxcZSX7N0EXtr9R0Cu9ro+
 LKgl8/F+nkPAHUPtv4ym/47jLiKtoq5KUwJAc7UZqaQp9SlDsDlCPVomlrWd7FIgdIpy3M
 4TWDH2d89ROzYUZ+jKal+Kn9svnBAdDPx2bGVTk6OcpxVvZ5EX7PyOqTl3lVRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oTZN5UWJ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiorwlock: bump to
 version 1.4.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Sep 2024 14:59:58 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aiorwlock/python-aiorwlock.hash | 4 ++--
>  package/python-aiorwlock/python-aiorwlock.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
