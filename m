Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC348C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6101E60E5D;
	Sun,  6 Aug 2023 21:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6101E60E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zH4Z3VNnK26i; Sun,  6 Aug 2023 21:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2C5A60E50;
	Sun,  6 Aug 2023 21:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2C5A60E50
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CB461BF30C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E87E480F89
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E87E480F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bzcSEqOUmWrJ for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:33:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAA1980E34
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAA1980E34
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00ED2FF802;
 Sun,  6 Aug 2023 21:33:55 +0000 (UTC)
Date: Sun, 6 Aug 2023 23:33:55 +0200
To: Victor Dumas <dumasv.dev@gmail.com>
Message-ID: <20230806233355.4e92a27e@windsurf>
In-Reply-To: <20221020115030.483083-1-dumasv.dev@gmail.com>
References: <20221006155217.626248-1-dumasv.dev@gmail.com>
 <20221020115030.483083-1-dumasv.dev@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691357636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WzPosAoJCiPXbgAhSQaIrW0hqUOp6oEPX2obY+O4oK8=;
 b=mG3mLKy0KKtMmRj8wDBFpykrC0eyBz9JAU0nl/D1k6xTMMXtr/zIj8qGtYa1UlYe6jQSQ9
 AvR/VoUcrePPmkmDjF+TMuOg55P7FieTmx3hAi0JqhRU9WDpkP6NeBxsekeXgRNktt78Ga
 r5JB22JYsRo914b3WZ3NOFxMUmfFFT2j9sR7+eDtnrZ+1Jf1+sXwt7rKWwOfZK9zS2oj+7
 PbB9Ex6GpWe7UZOIAjUE1gRQs243OUTDYEfZ0/+kz5KkvByBxBjBeHu6jae6YsJ/6MAeuG
 DMTrrpFTVbWbGCopBhYPOWBYD2aQ3Ue7+845WG5oXsPGtm1uV4VLzJzlXruUzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mG3mLKy0
Subject: Re: [Buildroot] [PATCH v4] support/scripts/fix-rpath: parallelize
 patching files
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 20 Oct 2022 13:50:30 +0200
Victor Dumas <dumasv.dev@gmail.com> wrote:

> Using "xargs" instead of "while read" loop allows for the patching of files to be parallelized.
> This significantly reduces the amount of time it takes to fix all the paths.
> On a larger RFS(~300MB) this script was taking 5 minutes, it now only takes about 30s on a 12 core machine
> 
> Signed-off-by: Victor Dumas <dumasv.dev@gmail.com>
> ---
>  support/scripts/fix-rpath | 66 ++++++++++++++++++++++-----------------
>  1 file changed, 38 insertions(+), 28 deletions(-)

Applied to next after taking into account the feedback from Quentin
Schulz on using $(PARALLEL_JOBS) to specify the number of cores.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
