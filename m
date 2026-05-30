Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA961CD4F54
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEDE142DE7;
	Sat, 30 May 2026 08:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OY9PR2cRhT6d; Sat, 30 May 2026 08:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6E9A42CB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780128216;
	bh=dF22Ty0TvW0keEs/cBJpFHJb/+SZvQFumHKSv9+RuC4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KZT9ITjto8PthHQv9iHyozkW3tYVVcnrfTou2qnwToxBK4PukQ5AOc2OKSSe+eWfe
	 yMZFm1P7M7+iwnxTQq7VikhJP4I/RNFhEpvR6kZHJGCwaDhtFatjTTgtvBTTzv/pvw
	 eezgyLSFm640WRe5lhJMmYlKxyiluscOeo485uHQhNGdGIfje5tpAUwsaRT4qvKQMo
	 h+NzxXvRk4XIuPOyudLhZgmJr3qwN2Q2ISP1MSvP1M+QAIp3/uCp9BuNsiJ18+ptLS
	 r09JgpOE58nBFjEFLTUSUF0H1Bx+UTP3wDnA3Z8cQ83bJ9TEJV3cQx6bnm4sWe0E8y
	 QyonV15HysjjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6E9A42CB0;
	Sat, 30 May 2026 08:03:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D1D3D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79BC542CB0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-5nQ__kDiPm for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:03:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 98F5B42C62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98F5B42C62
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98F5B42C62
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:03:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6198A78034E;
 Sat, 30 May 2026 10:03:29 +0200 (CEST)
Received: from 2a01:e0a:1015:b940:caf0:d340:4af7:8ed3
 via 2a01:e0a:1015:b940:caf0:d340:4af7:8ed3 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 30 May 2026 10:03:29 +0200
MIME-Version: 1.0
Date: Sat, 30 May 2026 10:03:29 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
In-Reply-To: <20260529215220.552527-1-buildroot@bubu1.eu>
References: <20260529215220.552527-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.14
Message-ID: <2eec7b8ab905511f128bdda964bb6529@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780128210;
 bh=pG28mBRyE5dpvtDqzXULATnJLiLUcJyEB6reaYvud+c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VnAD7v/AWcXlmnpfnUK8VVDqxKfaf7mfJpgcM/VqXSY4XqEqxZVT/Izoi8hIP6kT5
 mEfGlG1Y3+5GieZJxIeV1ZN/0Jw1uZ+Zeo2DeSSlUHOg7mOedDs83D5b0Lz6i+NnMI
 bFSasa+rm3gePpWCR5XqQoJVIEPdwuHiXYQvCyUDnDB0HPG8d4yitdCTP1COtckQQC
 /XVqLCnlEB0jOTc02GwECvcxdT9JCUaFyJMXjT/CH2rOQQgmKfx7SymCMxJcOO3Z/U
 D/hiB+wxmbxmxzDmgcm7dYEFB/K4UjPRRRrp2bLBYZWH1BKXJkFxg/EvX1nnynp1AG
 M5somBD5rc9Vw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VnAD7v/A
Subject: Re: [Buildroot] [PATCH 1/2] DEVELOPERS: drop Mauro Condarelli,
 email bounces
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

On 29/05/2026 23:52, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
