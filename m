Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C5B1061B1F
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 19:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C19F240E7A;
	Mon, 30 Mar 2026 19:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UY4OilS_31tC; Mon, 30 Mar 2026 19:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EACF40E6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774900372;
	bh=K2sz35LPk2h2o9uYRNNBQzwv6T6q95fnWv/KxSoOgDU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sjylI7QmTrCoJwVS+ApEKRHc4tjTi04MRPalMjfE7mwTdjMyw6UMTbTBQl+eoSjLk
	 nXfbpgAhVwUIXuxW9+D9QJNShR8ziWhtGasWwae+2e/4KMR9Msv0rppglJ+7p0vIUa
	 OxOe0McgbYg7N6bfPyRYSFGvu7EaiFcHIv9cUIFqmLCCqPT7M3+HvIeSSU0PfufVVt
	 eelWMH3XjKs7PiQXdyOT+6JJg5G2sn9nO2FU2DdcZZlVM6WjXK87C66GAPK+YeA/gv
	 xii6yetTT5el3+L2L+gsTMtRweyoKA0Cc2Qp44svXDg41UZH6xkff9Ta7LRIVNO39O
	 ydipIQS3JVbrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EACF40E6E;
	Mon, 30 Mar 2026 19:52:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 182FD4D2
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 19:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F265E4055A
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 19:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNkfHx6Qjumm for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 19:52:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 203BE4002A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 203BE4002A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 203BE4002A
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 19:52:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7F76113F8B5;
 Mon, 30 Mar 2026 21:52:42 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 30 Mar 2026 21:52:42 +0200
MIME-Version: 1.0
Date: Mon, 30 Mar 2026 21:52:42 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>
In-Reply-To: <20260203224414.192218-1-petr.vorel@gmail.com>
References: <20260203224414.192218-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <a65039752d2ca87b1b3c6e673c163ff4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774900366;
 bh=DruDp9tIeoHFMx1YEgsYbdl0/TRiAYYUgODETo1kv+4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HZOXCVU8Xzv8lIQV2O9tDgGvWxZbk7zzXEySIDzJNFF73tBTkkrkQgH6oFheAWCtt
 30qrGCGB5jU/6tY+i8Q5zbAcnuftvsPlzIdtSHcewQRDu/ZZZXmOWZ1DY2Zi5XELHE
 dFmNn5105l1jVPv4baRnhImk5tro6IOwhJXWoPd+HIeFbvRefb7ZrvlL6KfKjqq7cG
 qdlTu35Cu3nhHTqZzh9cYr/vpYZHafs6KXO/wMUgMF+fQhV2bfn3/pWJHfMb3PUMj9
 A3RFxQoKkwLy+AQJgaDTrapraLDAlgEFW83t2MDH3uhVocoYYWorp83H4VPuZlvQuZ
 OwvBIitMDi6Zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HZOXCVU8
Subject: Re: [Buildroot] [PATCH 1/2] package/ltp-testsuite: Always require
 host-pkgconf
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

On 03/02/2026 23:44, Petr Vorel wrote:
> Require host-pkgconf only for libtirpc is not enough because libmnl
> requires as well.
> 
> Upstream added it since 20200515 commit
> 553ca8ea3b ("net/route: Add netlink based route change tests")
> using it in m4/ltp-libmnl.m4.
> 
> Later, in 20210524 in commit
> 6e17e2ba13 ("configure: Improve error message on missing pkg-config")
> configure.ac required it explicitly:
> 
> m4_ifndef([PKG_CHECK_EXISTS],
> 	[m4_fatal([must install pkg-config or pkgconfig and pkg.m4 macro 
> (usual dependency), see INSTALL])])
> 
> This fixes error:
> checking pkg-config is at least version 0.9.0... ./configure: line 
> 7419: br-mips64r6-el-hf-glibc/host/bin/pkg-config: No such file or 
> directory
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Series applied to master, thanks.
For info, I added a link to the changelog, and fixed the ltp
runtime test. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/fc6377f7f949ac23d38fb58c2c4a2f27bba73b1f

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
