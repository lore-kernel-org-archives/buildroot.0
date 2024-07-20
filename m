Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E496DC3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7BF2403D9;
	Sat, 20 Jul 2024 21:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65f9rJW9bsKw; Sat, 20 Jul 2024 21:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 731CC40405
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 731CC40405;
	Sat, 20 Jul 2024 21:03:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B3E01BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05D4640504
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bS1joieAcqQL for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:03:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16D7F403D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16D7F403D4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16D7F403D4
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:03:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B8521BF203;
 Sat, 20 Jul 2024 21:03:18 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:03:17 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720230317.40abc402@windsurf>
In-Reply-To: <20240720204341.1521701-1-fontaine.fabrice@gmail.com>
References: <20240720204341.1521701-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8RLBNKdh+Q7lN8tqk/v7xz/PfPHBCg9GARnhryFIJU=;
 b=RzA7Ry+55CeRIICO/+kJLs3u1fBxM67Ji28/QgqgZxF9lkojF5FNqWHtiJn3hqjQX8pcjy
 XOyYUsF14OWWjCBYb0J9vCz/NMl1bjDv+bfHPcXtq31kWDtQnTZoHXjk5uzZ8AfoH/jieP
 vAQbn7pOnRMwObYPF9ov2jMZAvVsLGh2AgTRkLEuDOtJ/GhycwoG28tdhT00sW0y3u6Iy/
 i+vtoamlyh2b9HBzohZFXxOEIWfCBbiR0QDXiEq4Kv0Ollmjzqb1H77Av33PNVW8RtFCKG
 UdK6sQjW4CFNQgYVH+DQ7t5pcxCnjyzyPEvBKp74ISETV8ob2gRczZMtoFfAVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RzA7Ry+5
Subject: Re: [Buildroot] [PATCH 1/1] package/gtkiostream: fix version
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Jul 2024 22:43:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update GTKIOSTREAM_VERSION to make it compatible with what is returned
> by https://release-monitoring.org/project/373420/
> 
> Fixes: fab48302865e5c0c98d91b696bc90e75e38189bb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gtkiostream/gtkiostream.hash | 2 +-
>  package/gtkiostream/gtkiostream.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Indeed, I had missed that during the review. Thanks for spotting and
fixing!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
