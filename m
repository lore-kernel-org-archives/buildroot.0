Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B368FC001DF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63D4C8454D;
	Fri, 28 Jul 2023 19:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63D4C8454D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RbHj8daBNbAY; Fri, 28 Jul 2023 19:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9672484187;
	Fri, 28 Jul 2023 19:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9672484187
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B1DE1BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FFBA42172
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FFBA42172
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MYKWyLMInJsL for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:25:06 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C2E842149
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C2E842149
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72018C0008;
 Fri, 28 Jul 2023 19:25:02 +0000 (UTC)
Date: Fri, 28 Jul 2023 21:25:01 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230728212501.7f3b3569@windsurf>
In-Reply-To: <20230728170648.2838566-1-bernd@kuhls.net>
References: <20230728170648.2838566-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690572302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fZarKaoOztLVe0BHkeo6DMoUPzphZ3KYNDbYNB+QC1k=;
 b=AGkZ2P4wcicH8COxrhWEq5P7AgiZacM6uc6U0daWDQ689Yfmg+7JvQEqD1kOj46D2HE0mh
 UBd6/15WOBC6uVrf2Zwvl9DGWcoyI2fdoFPRpzqlSl6W9E7NOyuZSR76HZK/canhX08PSA
 sGljVwnEVkP4d42GbSJDShuTTNG+slhtN0soWkreXAlhQWqmSuLVHDdCy3B1IOxbFf7vQu
 oMLKtLi3bQEOnQ+obt36/bT/J7CYyplIkmBJ4tmyYuF0j4X7Qbgm40Aux3ltlDJdlLLLnp
 4iz4K0wyDYepV85SSO6rGxey2uQiQXF0yt1WZ/cpHug8L0yNYCc9nNTfwMHJkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AGkZ2P4w
Subject: Re: [Buildroot] [PATCH 1/1] package/ntp: needs either mmu or threads
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

On Fri, 28 Jul 2023 19:06:48 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/f2b466853ed296fdc8b4629f36e5a6447658f82d/
> 
> Quoting the first error message:
> ntp_io.c:3793:9: error: unknown type name 'blocking_child'
> 
> ntp needs either fork or threads:
> https://bk.ntp.org/ntp-dev/include/ntp_workimpl.h?PAGE=anno&REV=4d6178063mDeaH-s7PteNqw1DDK-Rw
> 
>   #if defined(WORK_FORK) || defined(WORK_THREAD)
>   # define WORKER
>   #endif
> 
> to enable the blocking_child code based on the WORKER define:
> https://bk.ntp.org/ntp-dev/include/intreswork.h?PAGE=anno&REV=4d617805zzdW7YeB56-WZ4GbGCcXxw
> 
> The build error first occured on April 3rd, 2022:
> http://autobuild.buildroot.net/results/31b/31bfdac8411ebf043a39e3277f6d7b008fe337b0/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ntp/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks. I was wondering if a Config.in comment was
needed, but it's not the usual case, and having neither MMU nor threads
is really a corner case, so fair enough without a Config.in comment.

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
