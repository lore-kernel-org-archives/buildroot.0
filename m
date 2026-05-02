Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C70DCD13DA
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 09:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AC4183323;
	Sat,  2 May 2026 09:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abaGyT5iaEag; Sat,  2 May 2026 09:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A7E082D57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777715736;
	bh=o4iUUFhlTbbnDKmJK22on3y6UpJJCPRUifMpggkgXgE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PgXk1+EmMLTA5J6dRG58ZPP8LwlUcgryISuYAJ6hmJ5y9DGHLU+434tgAITbeV47Y
	 OtXqpQwQL/mQteABvz1LK5jmwBq9vmSJUUHzsqa7Ec7j39dnqnQFnnNV2AKGNu0pFI
	 D7img/XjidTjMnaoCFOMExwD3GGp5lJ1izNkInBtlFH3OpgAioMmVualE4JIl2dTxs
	 rJaI8xLYxQpvslFar+tsA1azKZbMbI0axb5s+QBNJ0eWnNsVldzliPD7HlEyZtlCT2
	 MQoGODsqPCHWnHk6XToHRTIkh1yOBFATxdiezc1jarz/ujOcQQmUPJR6QvkbljvWGd
	 bvo4U3CiWxgOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A7E082D57;
	Sat,  2 May 2026 09:55:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1319204
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B36A24101F
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id goHj2YNV73tZ for <buildroot@buildroot.org>;
 Sat,  2 May 2026 09:55:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E211341011
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E211341011
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E211341011
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:55:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3AF0B7804FD;
 Sat,  2 May 2026 11:55:31 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 02 May 2026 11:55:31 +0200
MIME-Version: 1.0
Date: Sat, 02 May 2026 11:55:31 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260430044747.27619-1-bernd@kuhls.net>
References: <20260430044747.27619-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <d3522c5ad5b0aaeb39e1e540dece6e02@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777715732;
 bh=5CvDADu9oTjjqyJpkL+d5N94N9RJXGAKOjMyYHDHolo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tKujymANUOiVG4TiqQTXuKahtUuuZYvngdJ+a9z/vlReCTerEZQ0OjqudhfeqwJFV
 Eh44sAwrpLYCupQMltqV4q5wyF7RydqDYz1bIdomDLZrOnTSlFIY/O3h+2cuUjAK6f
 DywV0zjhuw2gbD5bZ/PUtrkr6nlaPB0+OOk6Bhz9Vnw90btckuUSDEOLpSADy/QkHw
 eY1hztnHHmVD/egUBgWA87x3TEpKUlWdbfOetMgggp0nB2ruWq9tpyFUIMRXRkAq8z
 /e4TB9R3CH0/mwpr3WGlrjRooNZdBV2c+jRi+QH3J0oBD8Zs29t/X1dSf348hHBz6O
 Fhw11cBMGxGWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tKujymAN
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: security bump to
 version 8.20.0
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

On 30/04/2026 06:47, Bernd Kuhls wrote:
> https://curl.se/ch/8.20.0.html
> https://curl.se/docs/security.html
> 
> Fixes the following CVEs:
> https://curl.se/docs/CVE-2026-7168.html
> https://curl.se/docs/CVE-2026-7009.html
> https://curl.se/docs/CVE-2026-6429.html
> https://curl.se/docs/CVE-2026-6276.html
> https://curl.se/docs/CVE-2026-6253.html
> https://curl.se/docs/CVE-2026-5773.html
> https://curl.se/docs/CVE-2026-5545.html
> https://curl.se/docs/CVE-2026-4873.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
