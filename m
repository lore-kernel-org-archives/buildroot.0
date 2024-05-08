Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C60C25B4F
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 19:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC609400C6;
	Wed,  8 May 2024 19:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ze8fguz3haJY; Wed,  8 May 2024 19:08:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0A85400B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0A85400B4;
	Wed,  8 May 2024 19:08:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A15DA1BF3D8
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 19:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B7E480EB4
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 19:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yTZ3ljEMNwe for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 19:08:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 88D1A80E96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88D1A80E96
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88D1A80E96
 for <buildroot@busybox.net>; Wed,  8 May 2024 19:08:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 73AEE13F846;
 Wed,  8 May 2024 21:08:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 08 May 2024 21:08:24 +0200
Date: Wed, 8 May 2024 21:08:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <ZjvNqFeRpGWQUW9A@landeda>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506210440.323ccb15@windsurf> <Zjk7W9fZXDBusRc2@landeda>
 <20240508172111.1fadde15@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240508172111.1fadde15@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715195307;
 bh=pbvCqyXyxLGrz6uqwDEBeL/5oLwtR63+Q4bxYdlNYLs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q+J3P7KazGgspD4JX3cGeN4Tsww4cQcyNZWVsLXNBtuHkqN3oC7xrcF73WRU9mnb3
 dSNmO8XwOT2cRg4+6jjRb8bs4kxdtBr/h3LNNBUtqYoBjo3mlazMeR42CXRE4jRQ4H
 gxAqQW3H+YSizWhXxjoaaIe5fdi0wE7S+3Oo+54gfRkkQENqkLQUkjd+B6jueAkiUd
 PqPHpllD5GRcUDDGa2gTpKbZvOgzNHMhq1WXOhBegYmB10FuhckpyzA5pCEpcDEYwE
 ua1o409X/Y8HBVz1oM6uZE3emxVwLCFtoqz/dO4C3otCIx4agt2jJABCBEs1nn+l3q
 pvOpkKEYUu0QA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q+J3P7Ka
Subject: Re: [Buildroot] [PATCH v1 0/8] support/kconfig: bump to
 linux-v6.9-rc5 version
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
Cc: buildroot@busybox.net, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-05-08 17:21 +0200, Peter Seiderer via buildroot spake thusly:
> On Mon, 6 May 2024 22:19:39 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2024-05-06 21:04 +0200, Thomas Petazzoni via buildroot spake thusly:
> > > On Mon,  6 May 2024 16:45:43 +0200
> > > Peter Seiderer via buildroot <buildroot@buildroot.org> wrote:
> > [--SNIP--]
> > > > The kconfig version dump itself:
> > > >   - support/kconfig: bump to linux-v6.9-rc5 version
> > > So this commit without the next two leads to a broken situation,
> > > correct? (Note: this is not a complaint, I agree with them being split).
> > Except they should be reversed: the new commits can work with the
> > kconfig we currently have, so it looks like it should be OK to do the
> > required changes before doing the kconfig bump.
> A solution for the two remaining patches working with the old/new kconfig would
> be nice..., will test if it works for the escape problem...

Right, making the env vars work in both caes would be quite difficult...

However, the source-in-choice fix can very well be done before the
kconfig bump.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
