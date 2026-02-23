Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10668EC1128
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 20:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3B5741B88;
	Mon, 23 Feb 2026 20:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyqVGE_v7jeU; Mon, 23 Feb 2026 20:02:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9D0541B5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771876969;
	bh=Yrp7+4IlAaxGETOnt59AjmMCLSkJNiQoXQrtVgXKsQw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dq/ElrJfVW7dPjr6kZnMRpTjp0WrptroIxplPScQcODiBWpVyMY5i3xZ8arb53+S7
	 uTvOsGRIcDO1NyZM4QtTQc2+h4LwpSP39udVsduLKg5Z5Gk6I3g/tekrZlKzoOtXcn
	 yi3E7i3oHp5J9m7ca2MxsKFXjdMHWwDG4IFy79/XbcDcCwb45WU5an51SKRZtn09Kn
	 bCIz/ocb+k13EBk6TM9/adVTyAm7xf0yoyjtfQplakf/6WBbCFQJUorwcJ3xc/Mybh
	 KzRqLj/lb3e1AGwYXsxeuSEhKfGwyT83KpQjrUaag3B3A9h+Dcmxg8aYwkDrjVIgS9
	 K6pftBrYF1AGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9D0541B5A;
	Mon, 23 Feb 2026 20:02:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 694C61B8
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F3E441B5A
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iiv6uyss7eNR for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 20:02:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B84AD41B53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B84AD41B53
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B84AD41B53
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:02:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1D636780504;
 Mon, 23 Feb 2026 21:02:42 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Feb 2026 21:02:42 +0100
MIME-Version: 1.0
Date: Mon, 23 Feb 2026 21:02:42 +0100
To: Pedro Aguilar <paguilar@paguilar.org>
Cc: buildroot@buildroot.org
In-Reply-To: <20260223183551.25008-1-paguilar@paguilar.org>
References: <20260223183551.25008-1-paguilar@paguilar.org>
User-Agent: Webmail Free/1.6.13
Message-ID: <6affd6078f6649af30dc7e4ac65048ce@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771876963;
 bh=LBW5WJhxKTfzcNVfpM66gIyH/0zYGaH0Jy63x1P2f0A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tEYwLEAtiTZJAwTAIBW04MoF0MfJRIK0aE8Dd/6dIeGpZwHwSHtZwiQM1ym9bCNT8
 mOz6y5rhKDh4QRU03FW1DY61/u9z26OgehqEVG4ZW9+K1vmeOEcpbYSih/C6iGHgYv
 2u0IRR8GH6QqZ5BqLaiZ5HMDBOHAAP6aj+k3X+MFwwpVKa5LpdTnmdbptqDlYl5pTQ
 UxAah2poHBRoLZitu7zsr2ChMZXh8u8+0CThL1sOD9a/GZB+Tx0sIW8EIrvYN0RJ6H
 CoBzvRVb+wNYWR4I4ofx4X5zPaL3uDOC1Wldja1e+QdygukhH3wgTLts6g7i5DAjyn
 pL/+r/keGIycA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tEYwLEAt
Subject: Re: [Buildroot] [PATCH 1/1] package/bdwgc: bump version to 8.2.12
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

On 23/02/2026 19:35, Pedro Aguilar wrote:
> Changelog: https://github.com/bdwgc/bdwgc/releases/tag/v8.2.12
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
