Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AE4CCD19A
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 17:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C4DE821BD;
	Sun, 16 Nov 2025 17:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYcqSqtSdSXM; Sun, 16 Nov 2025 17:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDEAA8216F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDEAA8216F;
	Sun, 16 Nov 2025 17:50:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AC4DD5
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 17:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BEFD40974
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 17:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YO0vQRq2wwE4 for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 17:50:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E3B154093E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3B154093E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3B154093E
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 17:50:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D32EC19F734;
 Sun, 16 Nov 2025 18:50:42 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Nov 2025 18:50:42 +0100
MIME-Version: 1.0
Date: Sun, 16 Nov 2025 18:50:42 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20251115222824.1304870-1-bernd@kuhls.net>
References: <20251115222824.1304870-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <1d5b472522f2972e7a64af270fe94524@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763315445;
 bh=KV8lNKeNTCB1fPTqTxz41eYu2mnELoi5hgNywrF6ucU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nQhk+ZYDs9BMcqc98hYXV1NiIQ1NE3CqcZBhTdJfnbvZNBBZcBMyA/xmF/I2Fp+nu
 bghlDsMBrHWql7FtcY18uhjI/UiatXBb8Fq+LYudiNUP5BblRMoGU/cRFOmv7Wat55
 EaF1PJ9UNGNiLd/2yPCa77mV0AD18c3wS6b1CCk1R4qFBvgR7H2ZhpUeoIbz94JPt9
 uo/tTBzk/NoBNPOnUOfJLg1PGOlG9+doYuYSDrZNzBz8Xfa6NfOhQl0UAFNxNLt5SL
 hOhsldbjKSfG3qNV4ky0oBkAcmAtlXiblBli4I611sQH5Im04b/jCnNvccZlpV2/cH
 aC2eOCXu9+nHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nQhk+ZYD
Subject: Re: [Buildroot] [PATCH 1/1] package/batman-adv: bump version to
 2025.4
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

Hi Bernd,

Thanks for the patch.

On 15/11/2025 23:28, Bernd Kuhls wrote:
> Changelog:
> https://git.open-mesh.org/batman-adv.git/tree/CHANGELOG.rst?h=v2025.4

The changelog mention the "network coding" feature was removed. See 
also:
https://git.open-mesh.org/batman-adv.git/commit/?id=2cefbadba8b2c547058b7d2e5da96692ef3580d7

So this bump should also remove the Buildroot config
BR2_PACKAGE_BATMAN_ADV_NC (and create the corresponding legacy entry).

Could you send an updated patch doing so, please?

> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
