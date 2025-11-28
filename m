Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DFAD116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 17:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41336845CA;
	Fri, 28 Nov 2025 17:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkCTs5L0D3ds; Fri, 28 Nov 2025 17:41:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9521F8381F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9521F8381F;
	Fri, 28 Nov 2025 17:41:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB0671A9
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D290400B0
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfeOrAlGt2eh for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 17:41:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E117C40092
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E117C40092
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E117C40092
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:41:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 510F82003D3;
 Fri, 28 Nov 2025 18:41:49 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 18:41:49 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 18:41:49 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251125220354.851214-1-bernd@kuhls.net>
References: <20251125220354.851214-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <40a7a105721213b98c9b5dc0079899d5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764351710;
 bh=X4N4GTZvcXPeTpi3sU7RWzUSQfZS004jrTOpnprjrTA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qJxJC7uPOLs7KtiP/z+3PSwh97GwX1qaJjtcodBiedH+cvksDtVDUonzMFFsn2g3r
 EDdve/WAWMJsqgwoBv7lthPTJUirgJOWdk73wscUHVg9LwVj0aIpv3pu15KgJnpE+Y
 3szL8GeXVozNB4bDJsM8ijUlgC+e801WE1HQxChzqOuog3n8gedr0cVNg0Hz+JQj1t
 qcym6x3h1tyYo6NklVAknx9Lzp2JHgpExNd5Ma0RUmyzR7WsxYLuHQKndsD+A0nCtc
 Eu9KqOMgsNQBi8HISJ6LrE5PBl8pPpEtPk7Gh0Ej5xO0eUcgWDbY2z1sZ+DAOMHpd4
 6Hc3SAEdwWagQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qJxJC7uP
Subject: Re: [Buildroot] [PATCH 1/1] package/lmbench: fix build with newer
 gcc
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

On 25/11/2025 23:03, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/189/189219853fbe1b7daf0aaad29279858c6e60507b/
> 
> Sent patch to active fork:
> https://sourceforge.net/p/lmbench/patches/3/#4472
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
