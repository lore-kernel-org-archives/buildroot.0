Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFB7C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 13:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AC318206D;
	Sat, 25 Jan 2025 13:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hR45H6FUCHZK; Sat, 25 Jan 2025 13:03:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A05882073
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A05882073;
	Sat, 25 Jan 2025 13:03:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1462D1183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 13:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E798882065
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 13:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIjwYUXNc9F5 for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 13:03:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D80882051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D80882051
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D80882051
 for <buildroot@busybox.net>; Sat, 25 Jan 2025 13:03:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0AA185FFA3;
 Sat, 25 Jan 2025 14:03:21 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41824])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 14:03:21 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 14:03:21 +0100
From: Julien Olivain <ju.o@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20250124113428.2808219-1-francois.perrad@gadz.org>
References: <20250124113428.2808219-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.9
Message-ID: <5d59bbbb90f6c482ccd41d385915ab68@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737810203;
 bh=qREcgHHqFysm0EHSQbCvYu6dLmcknMhgHAbkHKEqMGE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QGHHOlAxr5cjcYoCfviYBeZJxCH45W5NS/AyqlFSsM/ERo+EmynV2566DA5SpXEPn
 mXBGkBw7Ml8JIFvhu1bRQ2Rr5UUIlApxxiPAC9WIm7zJlwao1hSjRvTLxF1J7DmF7H
 CXTzrM5SD9qxLyh/DaRyrkZXavckLVHEraLee3nnOXHxvOIR31kQBULNxLYdjZHmtL
 MI1XNj5cZogkPN/pgS2EUKC1hacdD6bKsoFiIPaU/EfFJYk/racDhhTyZYb0wuuk3F
 Dcn0Rdnn1H6CQR5KAnLeQbjT03Ru0k8beVAcGwhjyoH26Q8uO6brkLtncmY8hjpMut
 IdGb0D8tU4MQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QGHHOlAx
Subject: Re: [Buildroot] [PATCH 1/2] package/lua-periphery: bump to version
 2.4.2
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

On 24/01/2025 12:34, Francois Perrad wrote:
> diff LICENCE:
>     - Copyright (c) 2014 vsergeev / Ivan (Vanya) A. Sergeev
>     + Copyright (c) 2014-2023 vsergeev / Ivan (Vanya) A. Sergeev
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
