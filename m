Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08773C87FCA
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 11:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDB6483E52;
	Sat, 26 Jul 2025 11:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcTTA8asIr6b; Sat, 26 Jul 2025 11:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D12CE83E5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D12CE83E5B;
	Sat, 26 Jul 2025 11:44:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0195CDA
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E703741347
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08DU-y5VKJrn for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 11:44:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 169C5412F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 169C5412F5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 169C5412F5
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:44:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2A47B2003AE;
 Sat, 26 Jul 2025 13:44:15 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 26 Jul 2025 13:44:15 +0200
MIME-Version: 1.0
Date: Sat, 26 Jul 2025 13:44:15 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250726055908.3395125-1-bernd@kuhls.net>
References: <20250726055908.3395125-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <3202baa2c319abbef5e38ccc9793e0c9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753530256;
 bh=K6Yyt1PUfTQB99OKtgAuytGYYUGYyORd0vvMaMcrEcI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I90pVXztb32FO9VPChq21/L1uYzDK9guNG1BwQxHmr0yHmFvPGnEH9g8I4SovwBdn
 0gGutL1BlJD8rzNEpd1eT861sE+6wretqMGOHzkt3z4haXD8xjjcG5EitoMuVtRz+5
 DaZZNV2Zxy5Egy63dPn0llHIKpB9l0j+/zEEKbLvnz3XT78cpKU0Wgi9IremNFb61s
 IZejRIWhGbihOp4e0pcF9DIWMsXmBdrGtXk/GmPCwNjeBChNysd9J93ZTDWSRvrVSK
 WQ8JQTbF7K1MkToGvVuUmOOmULgyqFiU1G1sgL7TMhkzfqNFk6ebD7V6IdaBVVT/jg
 ZxJX44zBFBYpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I90pVXzt
Subject: Re: [Buildroot] [PATCH 1/3] package/libcurl: remove configure
 option --disable-ntlm-wb
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

On 26/07/2025 07:59, Bernd Kuhls wrote:
> Upstream removed this configure option in version 8.8.0:
> https://github.com/curl/curl/commit/50def7c881ba560ab6e0235990e8f07fa69f4bc8
> which was added to buildroot with commit
> 50bdb2a3b7ace71065dc0b8a81bebc173f84a8c4.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
