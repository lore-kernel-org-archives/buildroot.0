Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25FEC5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 13:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E418760692;
	Sat,  8 Aug 2026 13:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGkIJhagwMWF; Sat,  8 Aug 2026 13:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CBDC60672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786196885;
	bh=ENzoa5yHn65gd8L5iZ6EeSBFXEmR9ztPR5Z8rLFXXhU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DJtAOPjhCJ9mNB+k7qs967osyNVhd12AwVEqZUbyMoABkLUt0gtQKd4/NgmbsD2jG
	 xskHdZ9SEnVrdLVUJh9HUNhuMP8Yyi8zXfWeLD7krrP3ht2Uf4U8FTU2JWSg6X8fGY
	 R828OTZUiu+Ms3gREjxukxQOop2WWhQGwKCb6nQVpvKvA3tJNOxww6Mz1L0yiLJqcs
	 RzyxhjZkykDIumb88bsiddlo7G/qMsRsEHXuTrDXj1tlgLkOY9AW6olIbg4l/+9UYH
	 ARkPtYiZvEnqMd69EhEQvrTSovbonlAZ6HTm8CbsrohaBEgvPQzgN2uAvcbg2eOeVH
	 Po5hyhJJk0b9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CBDC60672;
	Sat,  8 Aug 2026 13:48:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93D0A296
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A12180DE9
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYxEBE1NIIxM for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 13:48:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C502080DD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C502080DD0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C502080DD0
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:48:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E697B13F8A9;
 Sat,  8 Aug 2026 15:47:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 15:47:59 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 15:47:59 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260807202457.394955-1-fiona.klute@gmx.de>
References: <20260807202457.394955-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <292da31dfc09fec9ec31f9ca5419871c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786196881;
 bh=x5IXfnZ8D5DQmisaRZWzydT0TKdYE6X5nAMk+Ut8O70=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YYTbbaGApoB5D0xGzgpFd15sFiQt0AeXa7GSIRKPpQ0CLak74cumr9kjkBbQnhvC4
 PvTcBDibyfCTg0yePB+vX6j7yCl91ANqqUfdsCikpTUKLkSgi5pE2+Xflqh29TNIly
 9SOpffSAqyhRZWyDISMh4H3itcEDgo/EZJcqI2aamLjDjUsrQKLStGxKMxrh0CA+kH
 VOuelWdP0mlRJRGYXAcMiJD721YOl73mXSvPo8xgLGFVQmOt0X86skJZ+VOiEygF7+
 1RzRbuB9uOcyn2AJWOoR+FF3fpgd3SpXa5T9pxoweLpNpo3BwSGCratOyzcQbbMq6X
 O7tgT2yzu0bsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YYTbbaGA
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual/contribute.adoc: mention
 license file changes in commit message
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

On 07/08/2026 22:24, Fiona Klute via buildroot wrote:
> It has been good practice for a while to describe the kind of change
> in the commit message of any patch that changes license file
> hashes. This is important so any substantial changes don't go
> unnoticed. However it wasn't explicitly stated in the manual, fix
> that.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
