Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8350CAC592
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 19:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEC8A61BD9;
	Mon, 22 Sep 2025 19:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6Um6UJW-QEp; Mon, 22 Sep 2025 19:39:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A922D61B8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A922D61B8C;
	Mon, 22 Sep 2025 19:39:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60BCE1F1
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 476D640B85
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IxUkXfsHAOqH for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 19:39:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 86BA340A90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86BA340A90
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86BA340A90
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:39:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A3F4878035E;
 Mon, 22 Sep 2025 21:39:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 22 Sep 2025 21:39:31 +0200
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 21:39:31 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aNEHNhC3tCHIasx8@waldemar-brodkorb.de>
References: <aNEHNhC3tCHIasx8@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <f34f2c8379b9f2bb82c3c6dafcc8bdce@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758569972;
 bh=+AkWtA9+jUMPHsN9joV0DaUqMrBWv6L4qOT2i8428oM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K4988F6Qk145f3EDWLqMVLqKEgx88Wtp4u716mhtc6dMRrHYf8ECYezHyKT0x0A8N
 h1eoEgjHW4ONMhh9c5OQ3hFB+qoDKeYuc4zGScxUqtyqnvQyTaw6mz8Y5y8PgS+EJV
 fISCcjkx0z9WKUQ9C3po/JjjuhtbBDTK6muqR/zG1YXX0bEN57AWXeJgwEdp2EEIKE
 tOGwSQdkIAe4HNzLE8/KUi1TSVUrAwcFiScZp6SPIIX5yelxux/3o48rTXIRhI317s
 59t1tbxu5imMP/ksC03BKYIEcObx5VAYwreJWLAsk6CUF2IFG/YsvYEkzMdmtuC/9y
 8yYcSwv93toUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=K4988F6Q
Subject: Re: [Buildroot] [PATCH] package/icu: bump to 77.1
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

On 22/09/2025 10:22, Waldemar Brodkorb wrote:
> Update icu to 77.1.
> 
> The LICENSE file contains a lot of changes, so no diff
> is presented.
> 
> Patch 0002-workaround-toolchain-bugs.patch is no longer required.
> Reorder the other patches accordingly.
> Update patch 0003-fix-static-linking-with-icu-uc.patch so that
> it applies cleanly.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
