Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72A1CFA465
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9389F40224;
	Wed, 23 Oct 2024 20:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NyWL217qkif; Wed, 23 Oct 2024 20:12:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FD754027D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FD754027D;
	Wed, 23 Oct 2024 20:12:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D71F04960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5B1B403CB
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3FFEVqM65Za for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:12:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6901D4017B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6901D4017B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6901D4017B
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:12:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA2C8FF804;
 Wed, 23 Oct 2024 20:12:00 +0000 (UTC)
Date: Wed, 23 Oct 2024 22:11:59 +0200
To: Sen Hastings <sen@hastings.org>
Cc: buildroot@buildroot.org
Message-ID: <20241023221159.50657e46@windsurf>
In-Reply-To: <20241023095252.2742168-1-sen@hastings.org>
References: <20241023095252.2742168-1-sen@hastings.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729714320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QOgK4MbftVfFwYDyTZsZpvwazywC/r7DeYp31llKLvc=;
 b=N6bUUsXbij3tQyHdLzPJmm68BeurOAG4DO/8j99A1LzvrYoJvsxCAZC1Qtt08Fkl8bap9e
 OC3N/uherfF/mTQz8kZoY5axpt55Z0WSMkBgVX+1Y6BMDbbt0w2mbPEkNZIB4Z3QDToApW
 rBaTSF10RwarR7On/pZrozyi7afRRx3bSCHU6kOH6BXHrhPnwMzdI66XPIxoQXeP9Ohi4U
 N+lTd0zZcx3ZHoXRfxBcq43C3NeGiiYarP0EnSJUhRClI+Jk/yqYVcNa27bSl8x9JCcMLE
 VpF1AeJg7HISDM6+e3TqxLCN5dWi8jFtlR7bwc+Xs5ENIkpEGMNDoW3aRAc04w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N6bUUsXb
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: add
 unsure_cves to cve_total calculation
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

On Wed, 23 Oct 2024 02:52:52 -0700
Sen Hastings <sen@hastings.org> wrote:

> When I initially made the CVE cells collapsible, I neglected to
> count the unsure CVEs. This patch adds unsure CVEs to the cell collapsing
> calcualation to ensure that cells with lots of unsure CVEs actually get collapsed.
> 
> This patch also removes the "+ 1" from the cve_total calculation,
> which fixes the cve_total being off-by-one.
> I'm not sure *why* I did that in the first place.
> 
> demo:
> https://sen-h.codeberg.page/pkg-stats-demos/@pages/add-unsure_cves-to-cve_total-calc.html
> 
> 
> Signed-off-by: Sen Hastings <sen@hastings.org>
> ---
>  support/scripts/pkg-stats | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

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
