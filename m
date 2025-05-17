Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFEBC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 13:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FF47832D1;
	Sat, 17 May 2025 13:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DSQ-i-DfbZE; Sat, 17 May 2025 13:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81D9F83224
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81D9F83224;
	Sat, 17 May 2025 13:52:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BC22223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 13:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D77840FB1
 for <buildroot@buildroot.org>; Sat, 17 May 2025 13:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNmzCVFu_u5a for <buildroot@buildroot.org>;
 Sat, 17 May 2025 13:52:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A3DD5404FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3DD5404FC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3DD5404FC
 for <buildroot@buildroot.org>; Sat, 17 May 2025 13:52:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 732E72003C6;
 Sat, 17 May 2025 15:52:44 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 17 May 2025 15:52:44 +0200
MIME-Version: 1.0
Date: Sat, 17 May 2025 15:52:44 +0200
From: Julien Olivain <ju.o@free.fr>
To: Francois Dugast <francois.dugast.foss@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20250427125649.1970194-1-francois.dugast.foss@gmail.com>
References: <20250427125649.1970194-1-francois.dugast.foss@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <83473a112fcc873ce47850e9593b3d13@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747489967;
 bh=CD8kUIQlHpx/ITwsOrIOlIrhU/uM0y/L58o1p3MjN4k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NJ63wZQ0JhZPdh0CwpX/NjReYswUNZfjTfSlsbVxZIvtAd1zVs6EeiPutVnULHvd2
 43aEWHmejcRi0WNzuTaOe8/PnQi1GKtkonEnIclkjcHBG01wTVSD3kLIl5f9yFB1pg
 DIhuarK2qs502JrIK0GPcWlMjVKw/5bRWwH1dZRyb1TNlW9ObYysTp1ijtu5qo2e0K
 qxayPrqpOJHIC7pwxQrD5/5tAjCSPTPWRdhm0p7Jm2Q01THAvxpqq+xzR6elhPDNJi
 Z9JwhkuUUe4QDxh6QCsXp/Wst+zjG8B7+bc24t4zvDO1hZY2sMAIIcZ7MKpxok2g+U
 GOBDhlX6IkdMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NJ63wZQ0
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: remove depends on
 architecture for Iris/Vulkan
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

On 27/04/2025 14:56, Francois Dugast wrote:
> This dependency systematically applied with integrated GPUs but no 
> longer
> with discrete GPUs, so remove it.
> 
> Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>

Applied to master (after resolving conflict after mesa3d bump), thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
