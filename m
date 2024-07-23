Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C35AC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 20:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1C8880EEA;
	Tue, 23 Jul 2024 20:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXCzvAR1JQzg; Tue, 23 Jul 2024 20:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD0F780FF5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD0F780FF5;
	Tue, 23 Jul 2024 20:31:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC7761BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A55C480FF5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5dQRLbQvIvh for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 20:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 95BBB80EEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95BBB80EEA
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95BBB80EEA
 for <buildroot@busybox.net>; Tue, 23 Jul 2024 20:31:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DDEEC0003;
 Tue, 23 Jul 2024 20:31:47 +0000 (UTC)
Date: Tue, 23 Jul 2024 22:31:46 +0200
To: Kurt Van Dijck via buildroot <buildroot@buildroot.org>
Message-ID: <20240723223146.34a7dff1@windsurf>
In-Reply-To: <20240723150347.9498-1-dev.kurt@vandijck-laurijssen.be>
References: <20240723150347.9498-1-dev.kurt@vandijck-laurijssen.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721766707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sWW8gq2e8clvsUj4cu3LvWesh36Qrp/etl20s+dikdI=;
 b=WtIkbA8gyHrToH+TScylApHBSaoJI6rwmiQA+vZv/WFoNV+CHLGSz0J4Il3/3i4qoODswr
 cb+Zy8eoiMtnkmhzM8Qupg/laLyo2DZBFAjiR1ZJhbDHS6MgYIckBz6OmAnd9Z9RObt9FD
 sQkMeicKXvlxzlAM+BBdziXGfglPNcncIsMq8bSKz9e+0ZL2WBZrW4YWtUkac/M+vkFkQn
 gn+q3txTF6ShRsAW4fSc//iPhJpclS8OtFLbj/h8zUrNGPmL0ye/1WlwkEZLkSyd9cOR48
 68jPEErol443waRL3oKkOPJPi/c59F2niVlNcTIE3Q/WgerZCAJ7/TUjQwN9Wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WtIkbA8g
Subject: Re: [Buildroot] [PATCH] nilfs-utils: bump to 2.2.11
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
Cc: buildroot@busybox.net, Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Jul 2024 17:03:47 +0200
Kurt Van Dijck via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> ---
>  package/nilfs-utils/nilfs-utils.hash | 2 +-
>  package/nilfs-utils/nilfs-utils.mk   | 2 +-
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
