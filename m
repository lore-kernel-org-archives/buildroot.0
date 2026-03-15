Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64955F3028D
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30450614F8;
	Sun, 15 Mar 2026 22:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMkSAeKwRYaf; Sun, 15 Mar 2026 22:20:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5318614EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613207;
	bh=haBXkT3z6rfMFL3KgNIH9BVwSqF5+Zilpkq+XqyO5tY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U2Q8CSgnwf+W6PtsmD+mRk12ihknbG5Pm/16V49haFmG4Dbhxk3rccAjFYaZ1m2hf
	 z83MMiEiXapxnqxy7Ju+KxR0Nq9YwTe08WcM/F1P2E56GPySONKM0zM9C/wFPYcGil
	 WbrbI+va/5owSfaqgSK483wCH+hJcQXP/N6wIbUVqDkc9kHSA45eSgRf26ACHsHX40
	 KK+N+LD6+eKjKLlCONghMwIxq2PZYNxoRTpY90U6nqwO6VnMMkq0tXTgA0tY8ZWZpd
	 wif+M2EC2ryBdGKCNOCtK7eAIy2XIB/WP6utqi9YGkiVIuYWuvFq9xn1cA4mQapJsA
	 d74oThFczHf/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5318614EA;
	Sun, 15 Mar 2026 22:20:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AF3B1B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 603CE40711
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRGXr0QBnOxK for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:19:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3152240721
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3152240721
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3152240721
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:19:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2BF2FB00535;
 Sun, 15 Mar 2026 23:18:57 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Mar 2026 23:18:57 +0100
MIME-Version: 1.0
Date: Sun, 15 Mar 2026 23:18:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Louis Aussedat <aussedat.louis@gmail.com>, Ralf
 Dragon <hypnotoad@lindra.de>, =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?=
 <flavio.tapajos@newtesc.com.br>, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Marcin Niestroj
 <m.niestroj@grinn-global.com>, Mauro Condarelli <mc5686@mclink.it>, Heiko
 Thiery <heiko.thiery@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>, Joseph
 Kogut <joseph.kogut@gmail.com>, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>, Grzegorz Blach <grzegorz@blach.pl>, Gwenhael
 Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, Christophe Vu-Brugier
 <cvubrugier@fastmail.fm>, =?UTF-8?Q?Martin_Hundeb=C3=B8ll?=
 <martin@geanix.com>, Lionel Flandrin <lionel@svkt.org>, Fiona Klute
 <fiona.klute@gmx.de>, Colin Foster <colin.foster@in-advantage.com>, James
 Hilliard <james.hilliard1@gmail.com>, Falco Hyfing <hyfinglists@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <749c6c8e86472dfe53fd680a3a92571e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773613161;
 bh=skUcUEzjemwWCUa4fpp4H4CXj8x4fZ+rdSQCwoX/6M4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P57R1+mnv+lR9shKfUyTaxFIkGKLoxT9Vo13SC4JuYdQvZqofn8Y50gg0VW2XWHL+
 Ps1hhlhA0L3wIXkFdNf7Cr55PvuTOZercTv9qkC9ykfMHWAssZy7RH84IaWBA601H7
 ES1uoYG9f/W0jzCFY/Z1M6+7/Th5pBNVaBIp4xQUuHfJUEd80rB/qyrLiOnZhsk3Xu
 p94T7UJdHH5iaDbhqPZANRDnZfKBQtXCBCuQy3JAlBSsmfvozMoxN1PRUe4IkXY224
 4X5giK5u0VyrX3Eaxzx17NQlcmcqOGx+mtJCZo6d0aqDexeo9lYVkV3kJASD80mOJw
 fBNZuasn+AGdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=P57R1+mn
Subject: Re: [Buildroot] [PATCH 01/96] package/python-hatchling: bump
 version to 1.29.0
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

On 14/03/2026 15:04, Bernd Kuhls wrote:
> https://github.com/pypa/hatch/blob/hatchling-v1.29.0/docs/history/hatchling.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I applied the series to master.

I did few minor reworks.
- marked python-wheel bump as security,
- remove LICENSE.txt entry in python-jmespath.hash
- add python-cryptography depends in python-google-auth

I did not applied the python-setuptools bump. See my separate answer.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
