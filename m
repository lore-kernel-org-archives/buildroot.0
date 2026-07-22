Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA254C4453C
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 20:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 687DD80F76;
	Wed, 22 Jul 2026 20:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKlgu7dfQvd9; Wed, 22 Jul 2026 20:20:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEF4280DC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784751647;
	bh=g6257PBIPjmaqGFvAxBi5Cnv2hlIg6F6qe258EpNXLc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Evgobor6FVgZXvKULuiqqHiAYWY0cyDjAzQnOxSCunGA5Aojhckr+61WZm6j5aYnY
	 88bVP5GUAU+MMjwwUz7nMOOr2n7M71v9lm2iYZAWjUDPZq4YEJOpWEMFAPaQhkaf+F
	 qfkHKvg9dMjXdGBRcLnQg3sDj6VZ27SfK8CbAnpP/yScbyK7xAdtgHG1H6NqnjLDXr
	 L37sXS42M8xlcKIVj6FJg20ErbR20oIBEjPrwd3+z3LtNks7zIdUU8WSV/G8/UaFe5
	 8u+efuzfCJQRgs72A26qmWvtAphCUbP9p2QdaVIgARrfJPatIPhjWCMxAlC7f+bnHc
	 6jV+wVA8vmfsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEF4280DC5;
	Wed, 22 Jul 2026 20:20:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4A2D224
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A614880DC5
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btIBoVfI2nPM for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 20:20:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A27E080DAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A27E080DAF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A27E080DAF
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:20:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9330AB00565;
 Wed, 22 Jul 2026 22:20:42 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Jul 2026 22:20:42 +0200
MIME-Version: 1.0
Date: Wed, 22 Jul 2026 22:20:42 +0200
To: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260721073346.267538-1-andrea.ricchi@amarulasolutions.com>
References: <20260721073346.267538-1-andrea.ricchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <c16916d4ce2414f7987ad133c26a8c39@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784751643;
 bh=yJPaif4QmsxLJZUN03sUssGy22lPW+AADypk9XjNUqs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vEyQlzWIIDlalc8CPLE/aolTwyNz31PWPeIMVFxI3IqpP5J2nBvKx6SSburdMimim
 kqw1a3BNTDDSYZW0cxzRyS9WBB6Itr3sciIv+gz7g1ZklwGGqqk+CKEgCLGRqBA5V3
 AGpwD8dTd6tbLrx5BJu9xyDpcOyeoyxprkk3sYoOukto9mNU3Mav9ClzItvLovWsBQ
 TRVh0dqIJqeowoseJBvJwPpU7ovLDEvlv/tZwErSMljJEUtmOZmBnP4fusyQ6rtsei
 b8cXdhLSeqIaUjQh3D6IwpVwpNk86EsrfA41dlo70o+ZW0S9ur3g1VmSxHhP0DEXnw
 9pCPJtqBBWsNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vEyQlzWI
Subject: Re: [Buildroot] [PATCH v4] package/libcppconnman: add new package
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

On 21/07/2026 09:33, Andrea Ricchi wrote:
> libcppconnman is a C++ library that provides an easy-to-use API
> to communicate with ConnMan over D-Bus using GDBus.
> 
> https://github.com/amarula/libcppconnman
> 
> Also add myself to DEVELOPERS for this package.
> 
> Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
