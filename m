Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDADE77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E358607D9;
	Sun, 12 Jan 2025 11:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1UCI2AgtNvP; Sun, 12 Jan 2025 11:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B65A360866
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B65A360866;
	Sun, 12 Jan 2025 11:35:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E01D942
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EFD740259
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69-0os_w0Kpr for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:35:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B20F4027C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B20F4027C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B20F4027C
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:35:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BA8046012F;
 Sun, 12 Jan 2025 12:35:31 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41924])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:35:31 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:35:31 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111183412.2938580-1-james.hilliard1@gmail.com>
References: <20250111183412.2938580-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <bdb08b5473f4b5f121dc0e1ec378533f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736681732;
 bh=tu/mPz7F5WSwJr6+G3sSrlbk0HHjbczAbQoR0P2ExLQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dLU75j5tzfXj2rFrtDDTDyTSW3qgVp6FNFPuLssdtjF5Alo5EqXdGpXkjrIqmeH5E
 gRJpLRtr72uEy2lTwautZxKDdSrcNm/MGfYZUzkWk7hgsILj92PgKGVgItXKqh9OsY
 MV2NZHZkAiyoqr/J1gsjOxyXJqmvpfVMzMLuojwxcLqaA85HMUFW9+jczEZpgyz2IO
 wpCNgS202I1bmvxixh8Xq+hpf/wg32/bwxS5u2axSvkwJgMA0kSx7CuU0DMqJiuz36
 xWwzmsir98L3dT+yyQKeT+eWoIeroWsasJorlMazYHnHb+EzFj6wqKm/1ilAdffgCv
 /Uk37MUOUIrJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dLU75j5t
Subject: Re: [Buildroot] [PATCH 1/1] package/python-trio: bump to version
 0.28.0
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

On 11/01/2025 19:34, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
