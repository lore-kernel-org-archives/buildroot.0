Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF95F3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DEB161085;
	Sun, 15 Mar 2026 22:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoQvmp_AK27h; Sun, 15 Mar 2026 22:22:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC6626071C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613369;
	bh=dnh55ZKsvlcr5XC+mSpvDsFmkeNvuCKcYcUHLyNmMag=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fHe8XlseYENnJh8Zv3DA6Ykk0dDthZYnMeo2k5VQP5bA1e15+dEyy8NlkA0LwPZZx
	 2UBGpxCCxFT0Xeed3H6XsWwzYMTCZ+pyFUtP56unaLAkZxNjiD92Qm4fHJQyqIdw4q
	 bVHs6bzEJpODPl4WGuHlarZ9zAKltxs6fy7IueSDhKHi7OTlFSOnKg27gR0Y0bjkE7
	 IZUHVVELANxNbqnGXFLZ5MpIS1dlNHfv9yRmA+JLj6r9sfakuWY9gdBK7SGl5afitS
	 HELJarCEfOAfia+f+c5F7xhvxEC/FWn7xWi+wUxtElLn7epAn/kmjSOT6BuBhV+ZUj
	 c1JODyaJnyFPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC6626071C;
	Sun, 15 Mar 2026 22:22:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A83C1B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F087B40CC6
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wM0pUYf01bkV for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:22:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0EEB640CB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EEB640CB4
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EEB640CB4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:22:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1F1402003B4;
 Sun, 15 Mar 2026 23:22:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Mar 2026 23:22:20 +0100
MIME-Version: 1.0
Date: Sun, 15 Mar 2026 23:22:20 +0100
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
In-Reply-To: <20260314140633.2967249-66-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
 <20260314140633.2967249-66-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <936e821f0146f4365231f8c2fe576964@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773613363;
 bh=ElIIaZ/xJ401DkzVEEds1A6XsZcVBfatEWRys/M0Hf8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nbtOFB7GRmifJYZvSMKbZt6m9cXm6W1lrJc+2cO9X3D9gRFuQ5RPwshczeBcZomKi
 0j0Z9clMVkswVaPaQWPyVmrZWqgOBFxyxtta1bq99XBWBaGEGT4q4DYKoTL2eu5fIP
 uGmoWwoTiUZPd+5MgqxYN8d2x3UZ94jKk1FJTlkFGlUPXJeRSOen684bYV9EsjLcoz
 +A8jWvepnK/mtVIuH8yCK1lWymDXOOOA6PlB6YC6OLWBBI/RS1XjpaPLIy0jxqXMAs
 LSxkbEwGdQv7FdhruE9cDSB6yNCTO6oxdvlkzof8v4oQn2aKFgUDyf31uu5nj4szz2
 CNaYiiUtnvshg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nbtOFB7G
Subject: Re: [Buildroot] [PATCH 66/96] package/python-setuptools: bump
 version to 82.0.1
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

On 14/03/2026 15:06, Bernd Kuhls wrote:
> https://github.com/pypa/setuptools/blob/v82.0.1/NEWS.rst
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I did not applied this python-setuptools bump. I'm thinking about
reverting the previous bump, merged in commit:
https://gitlab.com/buildroot.org/buildroot/-/commit/51365ff06379aaf6fcc9a751e8ff32ac694f3e92

The "pkg_resources" removal is breaking binman in uboot < 2026.01,
so it breaks many defconfigs:
https://gitlab.com/buildroot.org/buildroot/-/pipelines/2379542849/failures

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
