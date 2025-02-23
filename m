Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1939C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 12:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D03A40649;
	Sun, 23 Feb 2025 12:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3V7B41GbTk0P; Sun, 23 Feb 2025 12:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CFCB4065A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CFCB4065A;
	Sun, 23 Feb 2025 12:34:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EE3A943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F26781118
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4C3NvTWWG9DI for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 12:34:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 709FB81159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 709FB81159
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 709FB81159
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:34:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 41CC22003C8;
 Sun, 23 Feb 2025 13:34:16 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 13:34:16 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 13:34:16 +0100
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20250222080249.2134474-1-fancp2007@gmail.com>
References: <20250222080249.2134474-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <3a2b77ece83e285a42f8dafd7a910889@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740314058;
 bh=SNh12C36E1xKX40RFjLXbTQhY4PETqfktFX8oA37Uas=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BbMi6zzi+sASFL1BsfPENuCXfsA3ZyOE85ZjOObLTS2GtxgsAd3nG9U24ExtScvMx
 YQ3JXxKPlmut9GqiCfprOoIRgEqJZcRwzMeX5TzXoXP3F8dTdWCtTaL2i6sFB16BYT
 9uvPaHg0WyE3ZqCaPPKO83cD7BGkaSXE2NRY6uU35Ltby15UP8ll/wJhZLwVvbme6S
 KPHBp8s+quXMJGUeGIF2FIz//eKTc7e6UypVgz2ueAdUKhOeJ6XCWaTy551XQvnSKw
 B8LwQmv3hbAn82xny98IhvJWPT2bPLRMc0CKA9nhQYCP6q/rC6PP2z2zDy/MkQP+Nq
 n6D0v43OnRurQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BbMi6zzi
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.18.2
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

On 22/02/2025 09:02, Scott Fan wrote:
> Release notes: 
> https://github.com/timescale/timescaledb/blob/2.18.2/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
