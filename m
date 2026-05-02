Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E4CCD3423
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 12:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 428FD82F8A;
	Sat,  2 May 2026 12:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kr4Pn7c7XbFi; Sat,  2 May 2026 12:05:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4958D82F20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777723536;
	bh=P2/Ozl5EPTz+jbJ03fqt/ld6cgFvVpDviuiW/KHuTTc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rpAzqXXW/ZIEMIz+Pd5NX8Bd2qGF9X2WwN8vu38YkYsL05f64QLNLR67yA0g0qd3y
	 s7S0u948YreqvVOkoTwyfIzeC/OpX0IpKjZe34/GpSPFN9kG0KcnBJQWplTPpoetKZ
	 lfDj7kF59l2MfTLA30Mu3xVZatLtUKdHdlhig4rmy43pSSStg+QaI3eePYBJ9GQLBu
	 iQEivTgQzYdvkuf4TCwURNT6YAYy86SMGIG/g3xxNTXNRY2j3bvcif3wBhnPA7BGii
	 2f1vV9rnuVpGktJIr7/HZUfNglk2U6tdx4NMXaXaD9LUpZ8hkTlAOdoErt3BzmHoEX
	 HJYn7pZaA4VEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4958D82F20;
	Sat,  2 May 2026 12:05:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F93B24E
 for <buildroot@buildroot.org>; Sat,  2 May 2026 12:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05A1082ED1
 for <buildroot@buildroot.org>; Sat,  2 May 2026 12:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkkqHTZbNU7n for <buildroot@buildroot.org>;
 Sat,  2 May 2026 12:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F008782E9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F008782E9D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F008782E9D
 for <buildroot@buildroot.org>; Sat,  2 May 2026 12:05:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 76850B0053D;
 Sat,  2 May 2026 14:05:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 02 May 2026 14:05:14 +0200
MIME-Version: 1.0
Date: Sat, 02 May 2026 14:05:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>, =?UTF-8?Q?Rapha=C3=ABl?=
 =?UTF-8?Q?_M=C3=A9lotte?= <raphael.melotte@mind.be>, =?UTF-8?Q?Fl?=
 =?UTF-8?Q?=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>, Grzegorz Blach
 <grzegorz@blach.pl>, Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>, James Hilliard
 <james.hilliard1@gmail.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Falco Hyfing
 <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>, Fiona Klute
 <fiona.klute@gmx.de>
In-Reply-To: <20260501123100.1918951-71-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
 <20260501123100.1918951-71-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <1f627256623f8f08cb2abe0b384b6db6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777723532;
 bh=DXxv6LUGfwXSldjucwrlJKjewLbdGBL47tOFGBJbALY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cn0a/jUCEoybmVac98Whtuv+siMaeeHZbKAXhIdyHT0QosErDknaVGjzIGozJSEmZ
 k6Bj2CrpQyS+7x0c212Hc2x8kfiu56AGAM93NiWxZ7KNJq9XJgJ3qNhijzMlSfqNi5
 yUHVDgRLx6C0W77+XdKw2fHx4z+tOPEGroma0fCZ/d8Xb9syIb7fbGym1jnj321Ken
 p0EwbFIbCi4q197LQlwpgxzH3RZeLWPBhcqtCvB89RySGMgAv0EMA69ZAGMaZneWgX
 IFSGEAy/WtQjh9HC8BjoqrmvPnf/xR9PnuOF97LWyhTl9pZWm0eIEC0Wi6BVnVwsYw
 /J/ly4V6cpVQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Cn0a/jUC
Subject: Re: [Buildroot] [PATCH 71/75] package/python-wheel: security bump
 version to 0.47.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd, All,

On 01/05/2026 14:30, Bernd Kuhls wrote:
> https://github.com/pypa/wheel/blob/0.47.0/docs/news.rst

I can't find any reference of a security fix in this news,
while this commit title mention "security".

Could you provide more details (or confirm it is not needed), please?
No need to send a v2, I can fix while applying.

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
