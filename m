Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B90CD13DA
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 12:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DABDB61037;
	Sat,  2 May 2026 12:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoz4TYQW-wbl; Sat,  2 May 2026 12:10:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2E1E61030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777723824;
	bh=Le1qFBsPoOvG/eqh8Qy3Rg9p/4P54ZBrZlYYPjJQZzI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rgFss8wwmHO+71jZfwpZ+01h28oFbCh+27IXWljeTT2oacifjbzM3sNGMVB6VSoG0
	 Qxq6cAMyHcWf5KiBJfAZp1jiGXpyBFhBB/3bEefd5ma44d64F1SkJ6TOoqAp6Ubzr6
	 31mxhQbLJGjZLtE9TY8x76eCaxqvsR7UznW4siIy6bI11ku5pmm1QDTFAnZBvYBCsk
	 pmgRPkiJHVJYNmEPSkl2z3vkz4w+oSSdaNbXvWojp8bgg7Zh350+LYDWxr0C7w75/x
	 nFY8m4RtNU5gILV1U55v4ClmEHuKpNdLA90HLmc5YeT/DccdgZp6PvtxukVmDGw9RX
	 ct78fsvHO9SCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2E1E61030;
	Sat,  2 May 2026 12:10:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30EF024E
 for <buildroot@buildroot.org>; Sat,  2 May 2026 12:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22B1761030
 for <buildroot@buildroot.org>; Sat,  2 May 2026 12:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MW6YBPG-72q5 for <buildroot@buildroot.org>;
 Sat,  2 May 2026 12:10:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6275E60FB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6275E60FB2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6275E60FB2
 for <buildroot@buildroot.org>; Sat,  2 May 2026 12:10:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CA3E019F5AF;
 Sat,  2 May 2026 14:10:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 02 May 2026 14:10:19 +0200
MIME-Version: 1.0
Date: Sat, 02 May 2026 14:10:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260430172212.581885-1-bernd@kuhls.net>
References: <20260430172212.581885-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <0bbcd55b760e56e567ca9b909cf9b7f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777723820;
 bh=N/ORwT0Sui/4aCtl+3GsrXifoupILAJwfDpmJkvB/WE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nOgSYgoesV+P1CEBeu2ciIhtzsTTLeWXBOo0ceEcVjBXNCNmfUFgbFxsmNDlUnmnQ
 ZsdR3ejfEdEPcItBncg/0oSLgRSjcEkWpLacw98WK2X+rHFDL4qo2dgWX7yyR9hhU/
 BNpxqC8XVXKRg0sf4vT5X3lRaWX26EitSrrDVq4+Z7zk55I2hqWV74XOzfVapSfQar
 Z+U8Vxmr4nOIotMFur3U7jxAas9Jm4lEkiV1KO326o2T7axjvOWai3RsHbkRsz1gsV
 J4e0K5zBQCSsEyEtDW/2hc92uGAjG0wBLWgdRDs5T52Mjo4HKHwqBRp+BM7Xqdc26P
 uULsgbYe2ilGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nOgSYgoe
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18}.x / 7.0.x series
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

On 30/04/2026 19:22, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
