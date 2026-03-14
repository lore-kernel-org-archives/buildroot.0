Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B8B10854B2
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 21:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26B3C60FCD;
	Sat, 14 Mar 2026 21:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKs05l8sK8-6; Sat, 14 Mar 2026 21:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6622660F79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773525354;
	bh=GjdHzkgwvdblAVzdaOMeGbMYe7HtYD/Tgt32tA16mNE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CaZb0jH3GBVaKp60CJb80xI3Pz1Af1epjH/qvY4nefWpl3sKwWKJ7ZK6iqHpNJL7X
	 w4tF2blvq9oDf3qwi5Flu0DxgJr830YrP6FAkjlw8pRPoDz5Z3xamFxSdRodjfsXoa
	 QeyIT0zKKjRAfnMTpSSQ3mPcz2uU/7DE+87X5OD4IEuB2kCloi7TM40YD9HpJ/2QFL
	 tdyVUzewtjfUKSatR29UsA3UfbAIWencEUftZy9/hKT61u01/BSzYqWRYwaPxQbRs1
	 tuiJTW+p/I7a0VhgfWN6TmvM2uK26LLLWL7z31iaeiQZg6C8KTXWP+fXA5KppJqXv/
	 DKwXj7zUv+uMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6622660F79;
	Sat, 14 Mar 2026 21:55:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D1391B2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 21:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3522823FF
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 21:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgNaj3fsDNuM for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 21:55:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 010E781F36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 010E781F36
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 010E781F36
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 21:55:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DB5DAB0053D;
 Sat, 14 Mar 2026 22:55:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Mar 2026 22:55:47 +0100
MIME-Version: 1.0
Date: Sat, 14 Mar 2026 22:55:47 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260314165307.2987410-1-bernd@kuhls.net>
References: <20260314165307.2987410-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <4df95730fe5030f63f3263766e3dd499@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773525349;
 bh=s2BFzpcTdMgD0YNzvdWWfFHMMDzQy1oMS5w0on4QAxE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S6y9QPQsuaxS1ZW+ZgcGZy8j2D/oxfhWazItlYXigt3Wa3F3BUC/vE6D5vCX4IHNH
 cNDZcJAubtcs+gBJycseqZIt4Wc9zV79+9PxQENbEQjlRbL0dhlF1uhIRIqhESuUSC
 0WmoQHqHDwIXdd7EzffGoLLj8obs8wAo42YXo0Bfgy5HVbkkZVPY+74Ll7h/mu+MoU
 S9xk0XGP+/9XraZOmzQmxdmqwrpU93UzDyvHynhL2gDs9dRahCiMAhXRhm9u7tS+us
 9FIegyP1bDnxCGgQ8m6hwmKEwJU1u8sUoGOnMt6gryypS4ZWBOmIiASK65tWNvLn/b
 ZEIPJyQr75HvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=S6y9QPQs
Subject: Re: [Buildroot] [PATCH 1/1] package/dos2unix: bump version to 7.5.4
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

On 14/03/2026 17:53, Bernd Kuhls wrote:
> https://waterlan.home.xs4all.nl/dos2unix/ChangeLog.txt
> 
> Updated license hash due to copyright year bump:
> https://sourceforge.net/p/dos2unix/dos2unix/ci/0ab159a6c80bd647f4830fb45059472eb1e11d3e/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
