Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373B2C83F10
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 22:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0791581EB8;
	Wed,  9 Jul 2025 22:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2cgRlk_Uj4Uv; Wed,  9 Jul 2025 22:36:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EC4C81ED1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EC4C81ED1;
	Wed,  9 Jul 2025 22:36:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C7F315F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 22:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E61F40794
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 22:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pELdieYoHrQF for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 22:36:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D5E840090
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D5E840090
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D5E840090
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 22:36:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E194D2003A4;
 Thu, 10 Jul 2025 00:35:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 10 Jul 2025 00:35:58 +0200
MIME-Version: 1.0
Date: Thu, 10 Jul 2025 00:35:58 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250708123001.4124948-1-aperez@igalia.com>
References: <20250708123001.4124948-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <877da723a4175410d81c3b1b42da2f94@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752100560;
 bh=5OZTpv+YM+BMHhrlEBdwVDw0MZNDuiBr0SeU+o5ojrg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YdF81amDBaN2ps9JmBcJ5RREgIXOszVeLpZf3VoO8YVkrzfA0NiyhKqmPcLmvMlv7
 wbnK43L52PT1SjD4ZyzH0c+DxlT5l+J2ACxSJc4qWCabN8E3nIAuj20RTil4ak3XCN
 eZPaG5L2BqtVnDUlrpDBfDRP3ZSP9WtK1YVtYoh423zIlkkz/USOvNEovYkGWg62c8
 eU4vGMKlF/dV5L1v7yrLsnjwZ/cy6P7yvENNh7j9djRcL9Q5GNOWzKaE9e3bT/RFdZ
 wZfQ8AZhSdhFMQSf2TOUYWbnWugI6+yJ8h8HgtUbfIvhYqq32besrDcMi1CE9kdzxu
 kV7J0+VHvvDDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YdF81amD
Subject: Re: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version
 2.48.3
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

On 08/07/2025 14:30, Adrian Perez de Castro wrote:
> Fixes a number of crashes. Release notes:
> 
>   https://webkitgtk.org/2025/05/28/webkitgtk2.48.3-released.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
