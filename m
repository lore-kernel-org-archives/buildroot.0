Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD95C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 15:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0976D60609;
	Sat, 25 Jan 2025 15:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zssPQVToEEU; Sat, 25 Jan 2025 15:12:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30E6F607A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30E6F607A1;
	Sat, 25 Jan 2025 15:12:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C1FD941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E36A480EF1
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTtbjTPh6fgs for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 15:12:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F50381BCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F50381BCB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F50381BCB
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:12:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9A21B2003DC;
 Sat, 25 Jan 2025 16:11:58 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35960])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 16:11:58 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 16:11:58 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124195318.3826029-1-james.hilliard1@gmail.com>
References: <20250124195318.3826029-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8fc18e20f2362dbf75105182ee448de3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737817919;
 bh=cuVERXF+WqKum7FSd924doqPb/YYPv4o5auJWbAiqWg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FQC1RQ/x1dxoqtnxVe7+xZmqmqmvJK3vLExcSIicxCFZnxRg3KAtBpAVHVPG89YX7
 t/bb5NwMyWmuRxbr6eUU+g+Jk0ouI4Klkj0K7rjU2R9fBX6/kUAkgtbwRdJapyb6XE
 XQtrRNWejKT6A+ovGrWZ2pLcC06HSE/L0cNO3AdqoO6MOZy3bPJdIvIC2ZKHnaCpSM
 CKDsTXeSz2Pu6CtJOAtL6O1JoO4a01V0YFcYG4oM8Rm6R415MKB19s/ACVl7s0eVsf
 EAaf9dpMLKImdjOp2gVRZhmzGUACJiDFOaakgMnTyW7fveqxEm0zafhPeTfLQLLsve
 xjrvQBMgh/t+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FQC1RQ/x
Subject: Re: [Buildroot] [PATCH 1/1] package/python-more-itertools: bump to
 version 10.6.0
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

On 24/01/2025 20:53, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
