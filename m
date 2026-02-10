Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC63FE7E0DB
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 11:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7642382E9C;
	Tue, 10 Feb 2026 11:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwqihY1wBSCU; Tue, 10 Feb 2026 11:23:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90F6E83C01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770722606;
	bh=mMVbvKfl64aTa1tzvXqgHW2UM8kIPPFdLZx/VGCnrgY=;
	h=From:Date:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qn0gCmt5RiawTfOYgooQ8BTkqeSFdQc65xSGvEXc0Fo81T3J1CyrMxk8ezuiYuRdm
	 FFz1Y0wsBsVw7seKfRJY+hycyMt92ZUXK5HgLeLc/EnOUqTA1Wr9XUau2qv2QOzHmh
	 RBemHzdGRdwD7xa/Q1JLVSn0Wi5I2d7b2qaxUZccT0H6uegfB/tG35lFyUbfxPAVIJ
	 5Yju6A86l00haO0bKL549HoCUT23xxEpvOkFnBKfkZTXteohHY8V5H9Wtc7+gsKYvM
	 Kl1W325l/nLCrFXx9yDhPfMl4LJymUjba56uQhxv/zI+FpBUKneLlR55DxXc6UeWZY
	 s129w7vS9p0ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90F6E83C01;
	Tue, 10 Feb 2026 11:23:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7655B219
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 11:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73B0D402F3
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 11:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oibJaxt7vmQu for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 11:23:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F140C401FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F140C401FD
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F140C401FD
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 11:23:22 +0000 (UTC)
X-CSE-ConnectionGUID: Pv2Z6R4VRCytjyyx7VS8hg==
X-CSE-MsgGUID: ts5hiSTvSGqQkju8nZFP+w==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 10 Feb 2026 12:23:20 +0100
Received: from unknown (HELO OPE16NORMBX607.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 12:23:19 +0100
Received: from OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] by
 OPE16NORMBX607.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 10 Feb 2026 12:23:19 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Tue, 10 Feb 2026 12:23:18 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 10 Feb 2026 12:23:17 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: 5VdgfGmxQUOiMfehtcaOYQ==
X-CSE-MsgGUID: O+yTM7swSzK4X9I6LWeIPA==
X-IronPort-AV: E=Sophos;i="6.21,283,1763420400"; d="scan'208";a="394275916"
Date: Tue, 10 Feb 2026 12:23:17 +0100
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <aYsVJQJPozEGM4z1@yd-6wlzhs3>
References: <3c42d6a8803c28ce34156eee659e25875b916075.1770703119.git.yann.morin@orange.com>
 <87tsvpqeqz.fsf@dell.be.48ers.dk> <aYrcaeU2kIm4a7sD@yd-6wlzhs3>
 <8ea6c2c9-ab1e-4262-878c-bbbefa35b554@mind.be>
 <aYsIfWMrnwXvDB2b@yd-6wlzhs3>
 <547c9175-b7de-42aa-a363-52f18c344877@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <547c9175-b7de-42aa-a363-52f18c344877@mind.be>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX507.corporate.adroot.infra.ftgroup
 (10.115.27.27) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1770722603; x=1802258603;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=GikLQ94QbT/UaegNiXmN9CAxHB0Dd4OB0c1ItKSiD8o=;
 b=FRBfAG+MXkkyLcyt58XDcYwVSnJXc9qjzzlx4nVB5ys72AgOfHGRlLiu
 xHLRI/AOkkh7+axMhhg5WJ+p8AKy6MtEYTVVcalUGGh2+U8RVnwUkaDBb
 rRnT9i7xa7UYsZdliq+ck6HERoRItTdz0Rl8Q2ePwceEDik99r38dlVaZ
 vtAlzf1lbtef/GHgscJxVnbTMU7eqgNfck/T0+NTc1t4cMn1a+EUzdkBw
 7v/qwipJyebtHq3GDdXXTmUHpR/tHdTSjzHRqvJyLrYYJPRSBPEBGDvWu
 7Xtd4QxELnxlV/u8+rcOVTEa69BMaUERbRjbzzwtfbJp8zyo9OWE+3MLn
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=FRBfAG+M
Subject: Re: [Buildroot] [PATCH] DEVELOPPERS: adopt mosquitto
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
Cc: Scott
 Fan <fancp2007@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Titouan, All,

On 2026-02-10 12:14 +0100, Titouan Christophe spake thusly:
[--SNIP--]
> On top of my head:
> - cjson is now a required dependency
> - the http api is enabled by default, so we must disable it if libmicrohttpd
> is not selected

Yet it still compiles fine without it.

> - similarly for the client shell (?) which uses libeditline

Ditto.

But those two I saw in your patch, indeed, so I'll carry them.

[--SNIP--]
> > > For the remaining failures:
> > > - Is getrandom() supported on musl ?
> > Yes it is, at least since 1.0.2, 11 years ago. Thing is, the mosquitto
> > code is... not accounting for that case.
> We can then update that patch https://gitlab.com/essensium-mind/buildroot/-/blob/114db281da52b342a95d2aea6199bbf9c2e20cdb/package/mosquitto/0001-Fix-build-with-uclibc.patch

Nope. I have a better one: check at configure time whether getrandom()
is available. It works for all C libraries (but is untested for win32),
of course).

I also already fixed the fact that C++ was mandatory; I made it
optional.

Similarly to getrandom(), the check for getaddrinfo_a() was borked, I
fixed it.

On to the next issue! ;-)

[--SNIP--]
> > Would you mind if I inject the interesting bits from your patch into
> > mine, and credit you as a Co-developped-by ?
> Sure, please go ahead :)

Wonderful, thanks!

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
