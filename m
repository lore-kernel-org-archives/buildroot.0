Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33132C25B5F
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 11:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDCF141F9B;
	Fri, 10 May 2024 11:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bUPOgrHXwOaB; Fri, 10 May 2024 11:24:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2DCF42437
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2DCF42437;
	Fri, 10 May 2024 11:24:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 191361BF2A1
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1087B42432
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWed0vh3Wnen for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 11:24:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C903D42409
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C903D42409
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C903D42409
 for <buildroot@buildroot.org>; Fri, 10 May 2024 11:24:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2209CC0002;
 Fri, 10 May 2024 11:24:52 +0000 (UTC)
Date: Fri, 10 May 2024 13:24:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240510132451.432db032@windsurf>
In-Reply-To: <20240427084019.13312-1-bernd@kuhls.net>
References: <20240427084019.13312-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715340292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xP1xdMRWn6/4ByUPy4O9PfpYvnvyLRVBM9lgquGej3E=;
 b=kQ0nvice90eFeTrcRSqpMqOCGIM8vSo0jUjcNKtWJvLjfPPG/DpJIPicKSMW402PUWU05i
 hhakC5mrnyPTr9Jj2SrbZZNuq6KtCFnKy9qv+5vzr0rwBVYV4RIVZCb960vKNLJr77u1WC
 DoXXhzl03m7FFMV/cPrrqgmEfTt3irmeto7FYxUOEfeG1EBH8MZRmyQ56p4JeyToCwUvxK
 mq+v4JLITy+bK2IlSCkwxcO4YzDAyJINoe7bM1G+Q7ppCoO/V4AFpgLKpZnBEQ3CavRh1u
 /UcOK75z55lkApYWJK25rQVtmzHr/UWJHy/DwBH9wjelgoTr6uIXXylE45T/Cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kQ0nvice
Subject: Re: [Buildroot] [PATCH 1/2] package/onevpl-intel-gpu: bump version
 to 24.2.1
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 27 Apr 2024 10:40:18 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/onevpl-intel-gpu/onevpl-intel-gpu.hash | 2 +-
>  package/onevpl-intel-gpu/onevpl-intel-gpu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
