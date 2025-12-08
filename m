Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB139D3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 21:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F90383CA2;
	Mon,  8 Dec 2025 21:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNfkhaJ5QheW; Mon,  8 Dec 2025 21:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A021821F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765228005;
	bh=U9I9jLxZLJGUkXF6ghuVh3hw3i9nrWitGS73A1fGnO0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R57n2bhANtIPmZbfQlZcSZ6//1TLzqfQcxdbPvMg8+VKJOPK70GDjlKGqmBIDFfbA
	 q8gXtk3x4zttBEwpNxwgi5pKQKKAZIK/ejaql/MG8zd0sqJnPk2y1VyhzS+vL5jJ+y
	 NFYzfjT+pQGrnQtYMQUaS9uHP7ttp9x/52RJws3AYE0drI28fpnDCj+zY9qMboL94b
	 WCOnEhXboZV184BCwTj7sGb7dk1U20MLDvFPFhnDr/fcVhi7k/IJ690Kfk/0t4hUsc
	 bztuJkiVqG49Ve713nCgOWyEaAeJpju5LiiBOjyyD7TLNTlJKUrYQAZAvQvbKNaBHE
	 uwOrKh+Nh6y+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A021821F9;
	Mon,  8 Dec 2025 21:06:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3253D197
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 21:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23DD540058
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 21:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dhkmKiWKm15 for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 21:06:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CEFA40042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CEFA40042
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CEFA40042
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 21:06:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F11335FFB1;
 Mon,  8 Dec 2025 22:06:38 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 08 Dec 2025 22:06:38 +0100
MIME-Version: 1.0
Date: Mon, 08 Dec 2025 22:06:38 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251208203114.3649526-1-bernd@kuhls.net>
References: <20251208203114.3649526-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <41e1295cc86aced3ab6814a8ced431df@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765228000;
 bh=3rcCGaBIW6ro9U+hY+5+/wvQcbgSCne6vzCvYLT8rLo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G/dIMKOOpoXP7pDRR2HNib3eeE/HuX0xsr8036I41yFcRKNTh7zgFTa6vMpCqPcXR
 z99XWWhXyjq6Ndlgju9gzrvQcbyzMBX2jU/tx+o7YLnqziv85Pe6HioZfJfSKHnbF3
 z6OEvtBuNBLzEbAG8OLNmn0k8CnYbqrd/cjSvuJnQ4gSH/GFepj4mAl0s+0m/NT+Hq
 WMCocHsSjZyK/twOndrRUwOPpwfTGd/OvJgLFwUJfUa61KCnmQ0KTosNjfbSL0ayhd
 91uMLqWgGhd/gg6AEoDsiwaPat8USxYTLMdjMXKVbDja+xoypj/T+cHVkCHIGZQgpF
 Ytqymf4gDUiZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G/dIMKOO
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: security bump version
 to 1.6.53
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

On 08/12/2025 21:31, Bernd Kuhls wrote:
> Release notes:
> https://raw.githubusercontent.com/pnggroup/libpng/v1.6.53/ANNOUNCE
> https://raw.githubusercontent.com/pnggroup/libpng/v1.6.52/ANNOUNCE
> 
> Version 1.6.52 fixed CVE-2025-66293 (high severity).
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
