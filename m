Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0437CC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 03:02:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6723960F56
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 03:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6723960F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ozlabs.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2546683709;
	Fri,  3 Sep 2021 03:02:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jw75oyxs99pQ; Fri,  3 Sep 2021 03:02:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7790383684;
	Fri,  3 Sep 2021 03:02:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9474E1BF331
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 03:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C82583684
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 03:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IzczI6PULisJ for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 03:02:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB4168367B
 for <buildroot@busybox.net>; Fri,  3 Sep 2021 03:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1630638121;
 bh=HZg7zJpnNqeLok3++uy4hZlRMR8qojjbhVcG0iy3oDo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Sgq8hwR9vguYQ+XQrsJ8ySShEWma8hTXMOR2kZIICUdErSmGamdhGlESVCG1f8Jgg
 smnTWKrXTa+xgzxxt6AWbJw0uTwJLwvZtczw3A1r+wdNCVXH529j2wKpIlsrhxiH+X
 u2rSv3BtOFqA6ucf18b/QucRWEBj02fIMh8JDsMjA6xf+CkQAJxZQtvD5Zh9wf5HnS
 4h5so2qav00mUvzkBeIivfXk55GlkNFZXT5TopB1xVKHL6ahDvwHhdtBR6Kbm1Vark
 /4Y/d5+Be5oYOvIxdCONDJgthgCNkfjX73D/G6tJqvcccuJMRidbrD9MgC60mbc6F4
 MbAQylbhFBGRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H12dM5Nr3z9sRf;
 Fri,  3 Sep 2021 13:01:59 +1000 (AEST)
Message-ID: <690b56e57bebb7a4730273ad3f958d6c23e68680.camel@ozlabs.org>
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 03 Sep 2021 11:01:57 +0800
In-Reply-To: <CACPK8XeXgXtf69BW1f4xQOrixt2OAzXNsCqFaa+zDNeWqfkomA@mail.gmail.com>
References: <YS/GToWU8Wx8XOR6@pevik>
 <CACPK8XcMS1nW446xL--CLShQTZA0opSNE4Yr_cnY1Ayh3vYe=A@mail.gmail.com>
 <20210903092217.7f02055a@canb.auug.org.au>
 <e65b04b32ae2d249310cdd85647e2a69321f8275.camel@ozlabs.org>
 <20210903105610.790366ac@canb.auug.org.au>
 <CACPK8XeXgXtf69BW1f4xQOrixt2OAzXNsCqFaa+zDNeWqfkomA@mail.gmail.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Subject: Re: [Buildroot] What's wrong with patchwork
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Joel,

> I just noticed that my buildroot list filter is no longer working.
> The listid used to be:
> 
> List-Id: Discussion and development of buildroot
> <buildroot.busybox.net>
> 
> but now it is set to:
> 
> List-Id: Discussion and development of buildroot
> <buildroot.lists.buildroot.org>
> 
> It looks like buildroot list changed domains recently. Perhaps the
> subscription for incoming-buildroot@ didn't get moved over to the new
> setup?

Ah, that'd explain missing patches then (assuming delivery is
working...). Patchwork relies on the list ID to correlate mail to
projects. Since it doesn't know about the new list-id, it'll be
dropping those.

I'll update the list-id for the buildroot patchwork project.

Cheers,


Jeremy

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
