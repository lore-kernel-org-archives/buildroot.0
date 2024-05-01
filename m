Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8083C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A75D480BDD;
	Wed,  1 May 2024 21:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OEBJwxYygUQ; Wed,  1 May 2024 21:28:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B43B280BF5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B43B280BF5;
	Wed,  1 May 2024 21:28:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 522981BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F02280BF5
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBkNbj8-kEQ0 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:28:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29DB180BDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29DB180BDD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29DB180BDD
 for <buildroot@busybox.net>; Wed,  1 May 2024 21:28:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0606820005;
 Wed,  1 May 2024 21:28:48 +0000 (UTC)
Date: Wed, 1 May 2024 23:28:47 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240501232847.6558267b@windsurf>
In-Reply-To: <20240415170556.35245-1-francois.perrad@gadz.org>
References: <20240415170556.35245-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714598929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GzxpjibaoGMmYWJJAXEHQYSq/GZ7CTR82acHVXIDVos=;
 b=kOnLISlMuSQakh1pKzhu4SQ+FuQ1zYElKLmbo8D0GZiSoF8FPBcA+8Xe1SYvgpcgDMIWmB
 4qG9APtKrQrh+IRaqxaETFRTXfQhq1X1n0vup20gV3C3zEIHFyqmrUf9aCn9J9ocV98RZS
 BFy41GJmWOYRIrYoQIZMaG+W0FHrzQfEb8TZ63yiol6XhWBMedcdQLJ3I2gq4rRtdyrogp
 UAf/sj6jEOxm/HvFIpkOGpUxmyPItPSyYdbhByuc6GUsus2pXJrfBzz5PT+KsKxoDHL5s8
 Re/wJNh5GRuUDNy2L0RZ85+U3FB/mYNztytmF7yM938UBu9cfthqQElswUNfQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kOnLISlM
Subject: Re: [Buildroot] [PATCH] package/libarchive: bump to version 3.7.3
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Apr 2024 19:05:56 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../0002-autotools-do-not-add-iconv-for-Requires.private.patch  | 2 +-
>  package/libarchive/libarchive.hash                              | 2 +-
>  package/libarchive/libarchive.mk                                | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

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
