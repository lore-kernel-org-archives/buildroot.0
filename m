Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE390EA3F0D
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 07:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B194D825C3;
	Tue, 10 Feb 2026 07:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4i1oKlRJO5i; Tue, 10 Feb 2026 07:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0A15825C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770708081;
	bh=aYpXF5ELWisznenhOQiZ+Yi0bET1As/JtpLOykFxKwM=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NhG/vhsXd3M6V1O68i+TaLfHzZIJAgHfMc7GY08qgLBi0gWq+B12nu6w+lcHM1irq
	 ls+xepnlUNVEUKeC6vboXGOYB9PvA4rDDy8g9DN6SAjKL6yftqr2nCdiGjyYJZMYon
	 +C+0IfCj0uO9YiB70XuKOUR073xoPxT8gabG4HeMUqw4xG5fwX/t/PnC8t5r6ems0K
	 h3CECxzCsFM98JjDdqWslIDpoeg8TXe2GK1ywvLk2K3D/VMx9BJp1f8WcQjiFd3gHj
	 XbaFoTxGcBkG+BZ9sVvldo+hkCWrp7x9GC2iOl7quLopgAsQ9XVuKaZYVAdGH7hVlP
	 kLo9wURvrJ3fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0A15825C6;
	Tue, 10 Feb 2026 07:21:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF62CF2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 07:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD91940D4F
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 07:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3V1A6YF9Uqa for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 07:21:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7EDDF40D03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EDDF40D03
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EDDF40D03
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 07:21:19 +0000 (UTC)
X-CSE-ConnectionGUID: SpvWo4FrSpyZfguN0fLmug==
X-CSE-MsgGUID: kChk4ILmTReO8zRVbIto4w==
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 10 Feb 2026 08:21:16 +0100
Received: from unknown (HELO OPE16NORMBX607.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 08:21:15 +0100
Received: from OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] by
 OPE16NORMBX607.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 10 Feb 2026 08:21:15 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Tue, 10 Feb 2026 08:21:14 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 10 Feb 2026 08:21:13 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: 2ztjvNXdQWmetCKPwLmGwA==
X-CSE-MsgGUID: QPA7qIfWRFKN1YM/3qpsCw==
X-IronPort-AV: E=Sophos;i="6.21,166,1763420400"; d="scan'208";a="392923918"
Date: Tue, 10 Feb 2026 08:21:13 +0100
To: Peter Korsgaard <peter@korsgaard.com>
CC: <titouan.christophe@mind.be>, <buildroot@buildroot.org>, Scott Fan
 <fancp2007@gmail.com>
Message-ID: <aYrcaeU2kIm4a7sD@yd-6wlzhs3>
References: <3c42d6a8803c28ce34156eee659e25875b916075.1770703119.git.yann.morin@orange.com>
 <87tsvpqeqz.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tsvpqeqz.fsf@dell.be.48ers.dk>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX605.corporate.adroot.infra.ftgroup
 (10.115.27.29) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1770708079; x=1802244079;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=LYqQVjyoRN1nm0lPwPJt1QIt0Nm/6oVbhAO8q6a4a6g=;
 b=JXTrImmK4lPornh7pbLvzyjtxR8d5VnriilL1TO7LlD0LXpqoHapSi2v
 X9g57b2PkmiprBYrpTjuDvSXeMettX5xhw3R2ZLjXDFvs8GxGlNnLZQuA
 gwjyqK+u/N3VJSYFogtqpCUjIdSpptaPPCa5ascUwQYfI0PkEMKhfBJL2
 SLrKTbSqgSlD+t687McRImQceapESZTcPbpJUz4PHErbp+js1OyERnTLF
 f33qU+gZiPUU+tnJT4UcbbHQf7hS306DuOhtCIamv3JrK5mnEQ1j/LNAi
 JtRxyKWy6+WNo8zu9l3srK4KZcJEh8N8KTUj8Rpq0rNuXOswD+mbdGZnd
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=JXTrImmK
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2026-02-10 07:44 +0100, Peter Korsgaard spake thusly:
> >>>>>   <yann.morin@orange.com> writes:
>  > mosquitto 2.1.x has been released recently, but has changed quite a bit,
>  > which needs quite a bit of tinkering in the .mk file. This commit also
>  > serves as a sign that I am working on the version bump.
> Great, please coordinate with Titouan who was also working on it during
> the Buildroot dev days.

Sure thing!

Titouan: were you working on migrating to using cmake, or were you
planning on doing just the bump first?

I dived head-first into the cmake conversion, because in the end I found
that it made things easier (the Makefile-based build was anyway borken,
so the switch to cmake was inevitable I believe; and it helps clean up
the .mk a bit while at it).

Hopefully I can send an RFC patch by the end of the day...

> Also notice that upstream released 2.1.2 yesterday with more build
> fixes:
> https://mosquitto.org/blog/2026/02/version-2-1-2-released/

Yeah, there has been 2.1.0, soon folowed by an untaged-but-released
2.1.0.1, then 2.1.1, now 2.1.2... I was planning on waiting a bit for
the dust to settle before actually sending the bump, specifically
because of all those fixes.

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
