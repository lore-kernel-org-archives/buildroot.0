Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCF5D5B86D
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11BA560F13;
	Mon, 15 Dec 2025 21:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIgALvUkdnCK; Mon, 15 Dec 2025 21:38:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2401C60F0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834726;
	bh=zHV+1zNEn7f7WDPASlLDHsoC5vNU/dF6SPLtsw5Taz8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gp79ydJ0vnVB0XjsLcfjLQEsNMelIM3i2BAPNK+OlkZOyQJbJfhBuENkJL04psIbb
	 sFAStJYpasjme8Lg/SLmoXgmObW6p3knZGyC/5cVdY5JKiNHjs93U+vfa+pyGsdHWF
	 Es3BBnvfGjI8NUGsF58jfWQJHVpn+XnzQRKQ+mKpYWnODMXwMeQHgoIgOrfi4JXTQf
	 1KiMHZa0m+zEC1wdYF387pHYXZreR/lrHachu8wuoHWHcSZW0UlMHKUHhmwAdLGdQW
	 Wculn9am++sepqsTx26HkRdP+EPB+ZhYugJRYj3YkU67I52gyux6GHTX0KW24xKnkv
	 sB5a6Y4aa0W2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2401C60F0E;
	Mon, 15 Dec 2025 21:38:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21D16117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07C3260F0E
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uz6DxWJh3RGE for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C504A606C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C504A606C0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C504A606C0
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 475E413F8A2;
 Mon, 15 Dec 2025 22:38:25 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 15 Dec 2025 22:38:25 +0100
MIME-Version: 1.0
Date: Mon, 15 Dec 2025 22:38:25 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>, Grzegorz
 Blach <grzegorz@blach.pl>, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Guillaume William Brs
 <guillaume.bressaix@gmail.com>, Witold Lipieta
 <witold.lipieta@thaumatec.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Falco Hyfing
 <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>, Steve Calfee
 <stevecalfee@gmail.com>
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <a0c8d54797b1a471474899909972e946@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765834721;
 bh=ucd/dX+DIoQTozEgPtiPkc2CLI0Ct+SvFtV23pmISoU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uKq1bjseGi3b/wmJlB8tNC0WPlRQzB5pEPk4XcuWDvkW4pXS33Ky/9rTreN/JgU9P
 gXugeJg3qoMDnE+5gDtEVbKdNqSyrKuudKSW3y+MoozCftNFGyQQTjaYsjVFiOUp/e
 S6ebKkSkMVg6vTzTQRsrZS6e2s4qN953WoK/AWunEi+QopMZVl5YZyle3eHnQIwGC/
 dikf/wR798tp1AR+Y1oAAkBCl+EQttbNy2zHroemzkIiwMrS+RBAl9hZ9+uiD/d4Zv
 J0oV2206VmiL9ZBNe0oKj3mlm/rDuIwonGA3r+nge414B56TsbTwOgksc8xAnEgGEa
 L0EdzSF7TJM7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uKq1bjse
Subject: Re: [Buildroot] [PATCH 01/27] package/python-posix-ipc: bump
 version to 1.3.2
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

On 15/12/2025 20:13, Bernd Kuhls wrote:
> https://github.com/osvenskan/posix_ipc/blob/rel1.3.2/history.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thank.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
