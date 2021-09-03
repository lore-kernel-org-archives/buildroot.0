Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269CFC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 06:49:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66BFC6101A
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 06:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66BFC6101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ozlabs.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6FCE401F5;
	Fri,  3 Sep 2021 06:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1xcbYynbcQgv; Fri,  3 Sep 2021 06:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC9A4400DE;
	Fri,  3 Sep 2021 06:49:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFB481BF44C
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 06:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE9CE82C7C
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 06:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ozlabs.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVQzSqMoPomq for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 06:49:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 195C982C5E
 for <buildroot@busybox.net>; Fri,  3 Sep 2021 06:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1630651768;
 bh=b4XHGfMSX7vwDJrc5bLV2pB0qHqWL+qehzTq/spvDgI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=kdkic47hfQwsgoaXozyCjapkwRn8g9yf+Dtavt00Vhb8/HlYP+k1yQs6rFXGL+1KH
 NxElUArR+3AWVvfkMPtWlcFY2tvk4ndm0qJx7bVlsMw3dm7DlNBB5xFHfF7MVccxmP
 3Kcsnzf1gJfsY5eGc42PLFBWTtuZZ6mYSbvNjZ+YDmpiA/Cmz5pbRoQGzMgJlIsOKS
 sUBXzsI2zE51ullyyTD0UpmiXdEuXtG7FheyO257pYmZrGejwvXdzWTSkqFvq56b3A
 7YoSm2eDvfc2ohX6a6R3yuqUapyHxzbtJUtJTyTzex7X/eWNEnUXvV/uDGpBgkUtrb
 UEVyDZSN7XskA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H17gq4MH8z9sRf;
 Fri,  3 Sep 2021 16:49:27 +1000 (AEST)
Message-ID: <c5e8cb0935a4a00a94d8105b19c7e482fd530dda.camel@ozlabs.org>
From: Jeremy Kerr <jk@ozlabs.org>
To: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Sep 2021 14:49:21 +0800
In-Reply-To: <877dfyrwao.fsf@dell.be.48ers.dk>
References: <YS/GToWU8Wx8XOR6@pevik>
 <CACPK8XcMS1nW446xL--CLShQTZA0opSNE4Yr_cnY1Ayh3vYe=A@mail.gmail.com>
 <20210903092217.7f02055a@canb.auug.org.au>
 <e65b04b32ae2d249310cdd85647e2a69321f8275.camel@ozlabs.org>
 <20210903105610.790366ac@canb.auug.org.au>
 <CACPK8XeXgXtf69BW1f4xQOrixt2OAzXNsCqFaa+zDNeWqfkomA@mail.gmail.com>
 <690b56e57bebb7a4730273ad3f958d6c23e68680.camel@ozlabs.org>
 <877dfyrwao.fsf@dell.be.48ers.dk>
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
Cc: buildroot@busybox.net, Stephen Rothwell <sfr@canb.auug.org.au>,
 Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Peter,

> Sorry about this. The mailing list setup had a number of annoying
> issues (the busybox.net vs buildroot.org, how uclibc/busybox lists
> were also shown, TLS certificate not matching the hostname, ..) so we
> recently worked with the OSUOSL guys to fix it.
> 
> We've had some teething issues, but I believe it is working now, if
> not let me know.

Yep, it looks OK after changing the List-ID in patchwork - I see there
has been at least one new patch parsed since updating.

Note that there may be some patches missing from the period where the
list IDs did not match. Let me know if you need a way to manually feed
those in.

Cheers,


Jeremy

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
