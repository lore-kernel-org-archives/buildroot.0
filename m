Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BA4C43334
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82BC940C40;
	Wed,  6 Jul 2022 21:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82BC940C40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KwCP-OBI-r1f; Wed,  6 Jul 2022 21:45:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9798840C3D;
	Wed,  6 Jul 2022 21:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9798840C3D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E888D1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C201B40C3D
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C201B40C3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YK2OYiJYynLL for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:45:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96DF94011D
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96DF94011D
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:45:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 70465200005;
 Wed,  6 Jul 2022 21:45:29 +0000 (UTC)
Date: Wed, 6 Jul 2022 23:45:28 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220706234528.51b7537b@windsurf>
In-Reply-To: <20220629185702.8309-1-fontaine.fabrice@gmail.com>
References: <20220629185702.8309-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657143929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2s/sW/xN3NIqQVOi+cWJVbkISeaAmBcdbXyu2K+Pf4o=;
 b=Nj6HKa+vsHOdQi7wV31TODEWt6AzHUks1ol0SlSUsS9PJEVelEpjRnNNaOp36W8jXkeX4V
 kKTMntfFAb+Oz6SPtaUfLbooPAWQimVdfa/XNNt2N5ydRF55QcFU8txtIevH5ZXjlZezB+
 GjLUFCV5wj361T5sq4opZu1NCoN1qnvUYlweLf/OKizMZkOEJSvDSAXR+nvLqa6nqRmsOU
 55ZvrBH6hXLVQl0Dh51azOcduB/G5s+H07GFjbmGmuoCZrU6fAcEvxqH4WSii6HmFbtmo8
 IW7jIiAsZ8wNa5ByxHz51EfdpTwT/7EHW04S7lejGGBkc3r0+a1f44JzILt72g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nj6HKa+v
Subject: Re: [Buildroot] [PATCH 1/1] package/tcpreplay: fix build with
 musl-fts
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

On Wed, 29 Jun 2022 20:57:02 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with musl-fts raised since bump to
> version 4.4.1 in commit cc66cf922b0481b66011b171db7985a27c79c381 and
> https://github.com/appneta/tcpreplay/commit/e1f4c2ac9133584da4be0da855c04c314a2e68c2:
> 
> /home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: tcpreplay-tcpreplay.o: in function `main':
> tcpreplay.c:(.text.startup+0x21c): undefined reference to `fts_open'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e47940b5b158395329c0132bb1bbea429c4dc249
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tcpreplay/tcpreplay.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

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
