Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21427FDEE4E
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 21:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF5FE60F89;
	Thu, 23 Apr 2026 21:04:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYwmwfw2IW3c; Thu, 23 Apr 2026 21:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F9B060F8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776978260;
	bh=YRBZF9gu3EAAFknpjzcaWuVA3K1d35kDqcYQbh0880Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ixd4wx0Z/ZomV5NpLomOrWpWu01QsMcrvH4HTzUetAAsrTKQwJ6KYBhRFOjpPbb3U
	 zXXIz2omazaCyyphA0Ju8F3edGjVbfAAPv0khqceZ6VRuZTmpyzWQ73Rn6AYmGydzs
	 F8A/7TTmTvVmOGFod583GJThPZT6VSAf6HyFm6g8NvlguRRnnlePEHQd3s/uORtvbu
	 LbuKGakvEKkIba3GyUyfRc99TBaCZqRRu8YX4XrG450V96AOYr1WwHcRiokteWXMik
	 KGkAuf+G+4pDOlwqxlbQcuW6UgYtEOasd6THIdCLhAp1v7MoRZxJ/DOYLvurzUThbg
	 T3LFN7Y9NtDlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F9B060F8C;
	Thu, 23 Apr 2026 21:04:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E005231
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 21:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F40D9411F8
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 21:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sptIae5DSEtH for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 21:04:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BDBE140CEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDBE140CEB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDBE140CEB
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 21:04:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7B53F19F57B;
 Thu, 23 Apr 2026 23:04:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Apr 2026 23:04:14 +0200
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 23:04:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260421190704.2723240-1-bernd@kuhls.net>
References: <20260421190704.2723240-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <ae030dd68325a9dcf3783b1a57a1d681@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776978255;
 bh=xHgoC0/X9hPmSPgT+T0fbQU/Zo1znCptHh9Xi3IFlDc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P1bAY6PzDhOVxd8j02Opu5wlNodLkb2d3w47X9IlOV1YK34vkGYD6m/QswsPn7V/H
 EFtsKCLqq1HjG5bPbUsUqOfXOmihc3y414f7dOEAoHlo8EwJQ4kgSCV/+OyPRINAo1
 BnzptcEbPOQH9BApc8j/jLNCf6u//xDV0r2w6N7XeieZF0r/E6L4ud5rQwIg/MQUZH
 hNYb19XgrJSbYN2y7VoeaPx2BKBQY4QOwywZSzabH8/5bsyu8bC761bOZl2WEEh0pH
 seqVX7mu+OfDQxaFyMwOJaeHPzxBYNPOrjVV4YIATWZbAEN+gOJXmhUBeqghu+gHfJ
 mRItw6gqYxUSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P1bAY6Pz
Subject: Re: [Buildroot] [PATCH 1/1] package/perl-net-ssleay: bump version
 to 1.96
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

On 21/04/2026 21:07, Bernd Kuhls wrote:
> https://github.com/radiator-software/p5-net-ssleay/blob/1.96/Changes
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
