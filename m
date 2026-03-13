Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FD6107BCE2
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB5F040C96;
	Fri, 13 Mar 2026 21:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNl1K-dhnNhx; Fri, 13 Mar 2026 21:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EDB140C51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773437625;
	bh=uoNkRwJADp3dldMg+CBxaPOGy4OUdlWw1poqwzNeZ6k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OXN82NQLA+huv+ug17kz6ztIWwcQwDkf0yfoLDoFZJEFYiL7cxAM+zGrsWb30AEP9
	 KlrBRArRif+9JmUXl3Ha23K83X2Dn/BOeAMpF06M68+ERJXTNe8EG6+VIMQxspfYI/
	 QVZO8fjuKuL1BWUYKHQrFVQM2k+tXZwI3Ez5SWwl9dc5DnEfkANjcnCtV5W9Bvkqu3
	 /Qs9xNYccpCk1tDavilhvx9QZoqWGgMw2Eri6pvgAYhxoerPlr2SaSJ4ZWy3X7tFG3
	 aP7tnH7LsTVFuKizdSGOdtBzbPiqFPsPAgz2qCRvhYxz8IgEUm0RxT2zXDrvg3TQgG
	 VqlxogHSDX4MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EDB140C51;
	Fri, 13 Mar 2026 21:33:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B25ED1AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9864C405D8
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tUXQp0Py3FJ for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:33:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C4B2E4005A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4B2E4005A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4B2E4005A
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:33:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id F422413F86A;
 Fri, 13 Mar 2026 22:33:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Mar 2026 22:33:39 +0100
MIME-Version: 1.0
Date: Fri, 13 Mar 2026 22:33:39 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260311175811.3371430-1-bernd@kuhls.net>
References: <20260311175811.3371430-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <6d8b692842e057344221a5d86316b912@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773437621;
 bh=rQKk9zZFksOZ8XQR8G0ExubVEBw0qfK/F6Ox7UNNnr4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eRRp4GIau5D1FGpWNNmgYXONqmaMEI4Jm6oyWsDcVgUdvvHAOgJ1hEuNBnk4Vev3U
 88kSdmIGvVHJI4qVyjp/zSVL81OhiNSCBhwxbGKBlKn98vdHTkEKxjbBJKSkBowtuj
 1RQceaVp6yOaxDev5g2TwmsMbVnQWRG070rpFrEX2HeI4Ga2FFnAoEUDQBkx8K1o5H
 R5J7PMueHW6Q6p2MwLwgLiDOs72hsSS8qN2pe5+iDeXewhKppBM7hWa0uaOMhIl7QR
 fKeJvkJNG16rYjBf48Sj4jasdbOjwf/NUP6EIgSErVBP4LYfq1fJD3KTR6NQHp+lc8
 8sNNywgVc+PSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eRRp4GIa
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.13.1
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

On 11/03/2026 18:58, Bernd Kuhls wrote:
> https://ccache.dev/releasenotes.html#_ccache_4_13_1
> 
> Updated license hash due to copyright year bump:
> https://github.com/ccache/ccache/commit/91a090aa0295b9c55cda1bda7b048d77c65400e6
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
