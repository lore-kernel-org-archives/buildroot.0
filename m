Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7235CCFA13
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 18:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EEE560AB1;
	Mon, 10 Nov 2025 18:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l09jxCuJEIxi; Mon, 10 Nov 2025 18:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C20660A8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C20660A8C;
	Mon, 10 Nov 2025 18:19:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CC46FA
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 18:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ECED60A8C
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 18:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nt4kKMR-Jy4M for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 18:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6759860A81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6759860A81
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6759860A81
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 18:19:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C3D816012D;
 Mon, 10 Nov 2025 19:19:47 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Nov 2025 19:19:47 +0100
MIME-Version: 1.0
Date: Mon, 10 Nov 2025 19:19:47 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251109074253.246336-1-bernd@kuhls.net>
References: <20251109074253.246336-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <1d110c2a0ad339a9cb1b55277ebb8735@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762798788;
 bh=H8po0YmfzLHgiidzRoGGy6h4ZwSdg3OHeSsh7GpUQMo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t5XQLre/XggU/TnhUnuBmgoaP1uYMFmo4I/BkPASM694NBZKkY9T5hQSLBwiTB7Yh
 wluFummcXNe0JLO2yFNUCPtVTnM4XkJXSy7EdfzIfmP/CRDwVJUZlwuapzNIkGK1um
 LrdqQENsm0RfEey9rI5RNDgI80ssQSSITTcalmnhGdQ9UOfBIkJVjKKR242rmZy3Uo
 Joii1fPRBu/3ph6tRBjJmTtaTTQZGKFie1ieviRe/rKx+/CYkiV0XbYEvomutF5jaX
 KaKcR2Mp+otTjwlmOmvtrNYG6dChLgwKOc72NT6NHrTnpJX0n925gNwtoGQMCugsGg
 zu3vNBB6xKAMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=t5XQLre/
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: add upstream patch to
 fix riscv64 build
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

On 09/11/2025 08:42, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/573/573c2dc9a144da25e2d1962af09e5931a72cd8d3/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
