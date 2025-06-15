Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F85C61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 13:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 985B080DAC;
	Sun, 15 Jun 2025 13:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nd1-4TfwOMyn; Sun, 15 Jun 2025 13:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E750E80DBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E750E80DBC;
	Sun, 15 Jun 2025 13:33:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6726D1A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 13:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58C854061B
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 13:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvzLWVk6FZwG for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 13:33:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B078405D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B078405D9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B078405D9
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 13:33:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5B59C78050B;
 Sun, 15 Jun 2025 15:33:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 15:33:47 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 15:33:47 +0200
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20250613020220.462260-1-fancp2007@gmail.com>
References: <20250613020220.462260-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <6ef6bd0d2631d9051eb08be2103f56d5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749994429;
 bh=nLdj7F2hRYBsuu+Y7fID3rcynyHRhCEEIygvpHeXPko=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ouovOdQw6YMKre6la4AeunBL7/dKDHAS1/ecuOX3/+K0GLtVcl864W/RIjBryQmdS
 QUGC5SkbJSb5iRuklCij0x31n8RXvAVb1uRm6uHGrkIJcqmHP7439SHxVcDKvnRz93
 wkbNQSUUUVQY3xTMsQSBJmUN1OvxyEauJbp5unMZXF1KlvhtUVa0q6xE76TPH1iyKa
 R7OGrEX5WJ/MxJ5icS/dFkCthFluspcSifewBk2d20fpNA1LWv1knuesTv0C41CPK6
 jGIemR0Ddu6xDLXC0ZC388l/Dymf93uxh5HoO5kDwM+7B03JE3Tl9Z7H3sKcG/H3YS
 9aiG+FHlE5Vwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ouovOdQw
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.20.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13/06/2025 04:02, Scott Fan wrote:
> Release notes: 
> https://github.com/timescale/timescaledb/blob/2.20.3/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
