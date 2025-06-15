Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71113C61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 14:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E75460752;
	Sun, 15 Jun 2025 14:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRORvuncTUn9; Sun, 15 Jun 2025 14:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80F0460AB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80F0460AB7;
	Sun, 15 Jun 2025 14:29:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47DB8198
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 14:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EAF64011A
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 14:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPCTrYRE6Tom for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 14:29:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 689CB400AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 689CB400AE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 689CB400AE
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 14:29:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 38E2CB0053D;
 Sun, 15 Jun 2025 16:29:53 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 16:29:53 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 16:29:53 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250612165938.3474011-1-bernd@kuhls.net>
References: <20250612165938.3474011-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <f02d95a01a4451da57e64849c6f67d8c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749997794;
 bh=7mSB6NkcL5oTgRNtbkfNNw/t5JvEAWKfp1S4Xw2g3L4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gfEhxbnCkW8iRT/MSpJdDQvipv5nea8BdVIafWMDgxUlnHv1oUhRs/+evJuYRNXYx
 qThweBanJ3IcBrodwbY987g1FyX9aDyUvSXDDymv54Wfj0+SUxj94I6ZP+/9RLA10h
 D7bR7YuDCHrVYqv2mwB/eXRKokoH2YBzexAb5RUuGj237bkWUBBUFCK1ah0kJtqQDR
 3uniADoNjj3HakrekI5kZzTKGBwUjZCyopszL0CGlkteZYoAaa/QkE6p9Ey9TwZ/p9
 Bg1sfpevLKn1kWoq9q2/pkcPtmbNFvMGDE99E2fowZqRfVZcJ5NHUxxlrbN54NvCG6
 ktgICyH+MHwKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gfEhxbnC
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.22
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

On 12/06/2025 18:59, Bernd Kuhls wrote:
> Changelog: https://www.php.net/ChangeLog-8.php#8.3.22
> 
> Release notes:
> https://news-web.php.net/php.announce/460
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
