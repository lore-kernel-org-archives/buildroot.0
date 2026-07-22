Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04736C4453A
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 19:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4D4080FEF;
	Wed, 22 Jul 2026 19:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFjnYUaL7__Z; Wed, 22 Jul 2026 19:46:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D612B80FFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784749559;
	bh=/4Ca5DSPG5AgFYvLQVsJ/onpVgYWuZ9V1vWjg2x5mko=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p9SJoNvpYca4FjJJDXGxgH6MRgccBJQR1ikZM55JFlF+7r0enxPKnJ6OMe8pbVbBI
	 KwmrJ5ygieOUxsRDCbJw+DrHzfqNcml9DB4SL1QqPciZmvB3wC7qTKXsMseWZfTeOa
	 7IidCEpXlOKwmIOpVcZAA7STzo1G4OujQPxvjehgKosmR+bBkLeyVNGi2MjZUtMQw6
	 udRqqG+DxIG3+ZrlsP79eY1hwKzwfDvnKiI/eH2lKd2VtbPbCM5k6QEwDdg9tMM8hs
	 XoAZkdrDYRMzjCIpWBOYloYshqmGSWxRoJ1f3j31kxV7pX+Ztbn9e145xMSqTS/cit
	 WrEZCAQPQSLpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D612B80FFA;
	Wed, 22 Jul 2026 19:45:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C6B339E
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5226A80FAD
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLRcI94IT-92 for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 19:45:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DB0080FA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DB0080FA9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DB0080FA9
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:45:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2FE5E19F57E;
 Wed, 22 Jul 2026 21:45:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Jul 2026 21:45:54 +0200
MIME-Version: 1.0
Date: Wed, 22 Jul 2026 21:45:54 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20260722063338.80807-1-fido_max@inbox.ru>
References: <20260722063338.80807-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.17
Message-ID: <791ad451ed786fcd974f7d17062cceda@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784749555;
 bh=jGDYmTJxdO0vpAyRase3LkJwhilsZ5/mCLaIcN41PFs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Csst7wbepsPP1eq8PCC+9k7BGDsLMtg00dALjLYBu7tP6KiJf1Cxg0zb8tnt7iGzL
 yd0yzya4aFrMgCGYn9KZpNA+dps6Yn7OARCzcoWZuMrLJgmtvd17Zql2V68wRyzgqj
 s9cOQ8Bh0MtCqSIl6ckb16sD/ldEy6HMvIvZj4yj0kYvYiP3zg2lUQJkTgbBrj/Kzc
 F3UxlocKIWN8PQ+3N388EvmWbUQssFQpX4Pgo30NyeHaVEpw/Mql3sTM/Jxxskgpui
 h5bjJMamNafQrB2qJmk43Z7YJfFTh1Ye9uaASD0OxGV+XPPgnAGgBobnX4Uy6bnlV3
 Ky13coOl/4haw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Csst7wbe
Subject: Re: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to
 2.28.3
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

On 22/07/2026 08:33, Maxim Kochetkov via buildroot wrote:
> Changelog: 
> https://github.com/timescale/timescaledb/blob/2.28.3/CHANGELOG.md
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
