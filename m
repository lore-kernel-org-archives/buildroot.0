Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429E9C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 00:41:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F5CB60FC0
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 00:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F5CB60FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ozlabs.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69E0642605;
	Fri,  3 Sep 2021 00:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVPvIeBwpCbD; Fri,  3 Sep 2021 00:41:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9BD6425F7;
	Fri,  3 Sep 2021 00:41:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E1A41C113E
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 00:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DBF4835C9
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 00:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ozlabs.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oi1FG2yl9ihp for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 00:41:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41D52835C8
 for <buildroot@busybox.net>; Fri,  3 Sep 2021 00:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1630629663;
 bh=mchNLYs+tD4witejbzPNOa4FnKuWUjN6HODMhKZDtOk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=a0+idTS+kCnMfW7xpA+gL/ZS1T9PQrGmuzoUebtefieKcTzpEI7N3xXHRWfol00M8
 3+MOWR8R253YyDLvJivcKlJgqDODB5H7V/EVT17IUJjlqENveUjn4YB/duI+dl8/nY
 5rP0ee3Yxwyeu4nxhJoWFSco1couEttv207oQvTvYf6VMkWxmLVMMuhoO0D7ZrJgD/
 6nJwZ2deP6fKSEsaV8UUOy5X+fd36g7psw5PEfTEeQ5STyQjv4RsDEkKqUxxguvUQk
 MmxmwTAWDxa+Tg9+1IFwoErkNqvUVXRv7Ku1PGFSd+i1RFxHqZLdMhYJkwxx82crTv
 cO3562fFkfINQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H0zVk55WTz9sSn;
 Fri,  3 Sep 2021 10:41:01 +1000 (AEST)
Message-ID: <e65b04b32ae2d249310cdd85647e2a69321f8275.camel@ozlabs.org>
From: Jeremy Kerr <jk@ozlabs.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, buildroot@busybox.net
Date: Fri, 03 Sep 2021 08:40:58 +0800
In-Reply-To: <20210903092217.7f02055a@canb.auug.org.au>
References: <YS/GToWU8Wx8XOR6@pevik>
 <CACPK8XcMS1nW446xL--CLShQTZA0opSNE4Yr_cnY1Ayh3vYe=A@mail.gmail.com>
 <20210903092217.7f02055a@canb.auug.org.au>
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
Cc: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi all,

> > ---------- Forwarded message ---------
> > From: Petr Vorel <petr.vorel@gmail.com>
> > Date: Fri, 3 Sep 2021, 07:26
> > Subject: [Buildroot] What's wrong with patchwork
> > To: <buildroot@buildroot.org>
> > 
> > 
> > Hi all,
> > 
> > what's wrong with patchwork? It does not show new patches, nor
> > replies to
> > patches. I checked my reply and patches are on mailing list.
> > 
> > I also checked to reply to another project (LTP) in
> > patchwork.ozlabs.org,
> > thus it looks to be buildroot specific.

Looking through the mail logs, I see there seems to be a period of time
where no messages were received by the patchwork feed (for buildroot),
at the SMTP level. Message counts by day:

  2021-08-31: 37
  2021-09-01: 44
  2021-09-02: 14
  2021-09-03: 0
  04 - now  : 51

Stephen, I assume all has been OK with the SMTP server? Buildroot folks,
has anything happened with delivery through the list?

It might be something on the actual patchwork side, but I'd like to
check that the email feed is OK first.

Cheers,


Jeremy

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
