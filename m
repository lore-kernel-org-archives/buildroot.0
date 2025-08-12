Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EF0CA0EDC
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 22:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D893441A4B;
	Tue, 12 Aug 2025 22:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyJI1eQLOXuM; Tue, 12 Aug 2025 22:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1986741599
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1986741599;
	Tue, 12 Aug 2025 22:25:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A97D71B5
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 22:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F80B416EF
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 22:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I3zPdDF-S_xy for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 22:25:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D64F41599
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D64F41599
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D64F41599
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 22:25:01 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id CC146E00346; Wed, 13 Aug 2025 00:24:57 +0200 (CEST)
Date: Wed, 13 Aug 2025 00:24:57 +0200
From: Florian Larysch <fl@n621.de>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>,
 Julien Olivain <ju.o@free.fr>
Message-ID: <20250812222457.7fipi2kzjjekmjtg@n621.de>
References: <20250811153257.3746260-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811153257.3746260-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1755037497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n34/wRPD+zk8ujCLczBPbrqIkaC5JGAY5OgFo4DCY00=;
 b=0UsAeN83aWqSRq4XsbTkluT1mPw/C91F/HGhNWoq8R+iPcYPYs4TR5I2XtAYDRflCbJFW7
 7asDIq06BoDhMbUMxIWylIoI0/HFm2gIlMBBmWussuthCiIe36RAHmoJ6iMnrmlUPj8P1v
 h5uXshYwrq2bsCS+PmRItklnjlfN29k=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=0UsAeN83
Subject: Re: [Buildroot] [PATCH] package/bash: fix build with gcc 15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Mon, Aug 11, 2025 at 05:32:57PM +0200, Yann E. MORIN via buildroot wrote:
> Commit 6d09b25d08fe (package/bash: fix build with host GCC 15) did
> apply a workaround for when the host gcc is gcc-15 (or later), but
> missed the fact that the target compiler also exhibits build issues.

At that point in time, the patch that introduced
BR2_TOOLCHAIN_GCC_AT_LEAST_15 hadn't been merged yet and I honestly
just forgot about handling it afterwards. Thanks for fixing it!
 
> For the same reasons as explained in 6d09b25d08fe, don't try and fix
> those issues, but just paper over the problem by using an older C
> standard.

It seems that bash 5.3 (released last month) fixes these issues[1]. I've
just build-tested this with GCC 15 on my machine and it indeed sems to
be working fine now, so this is probably worth a version bump soon. But
for the old version it makes sense to fix it like this for now.

Reviewed-by: Florian Larysch <fl@n621.de>

Florian

[1] https://lwn.net/Articles/1029079/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
