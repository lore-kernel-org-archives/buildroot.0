Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667AFC3ABB9
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 21:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 172AF405D1;
	Mon,  5 May 2025 21:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0iPbzRJ-rf5; Mon,  5 May 2025 21:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58E56405D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58E56405D6;
	Mon,  5 May 2025 21:33:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 492F820F8
 for <buildroot@buildroot.org>; Mon,  5 May 2025 21:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B4FC40026
 for <buildroot@buildroot.org>; Mon,  5 May 2025 21:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yl3VXF9x4DoJ for <buildroot@buildroot.org>;
 Mon,  5 May 2025 21:33:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B780400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B780400E7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B780400E7
 for <buildroot@buildroot.org>; Mon,  5 May 2025 21:33:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 38B9C78034D;
 Mon,  5 May 2025 23:33:17 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:55136])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 May 2025 23:33:17 +0200
MIME-Version: 1.0
Date: Mon, 05 May 2025 23:33:17 +0200
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aBIOK6jw0uVnsgqM@waldemar-brodkorb.de>
References: <aBIOK6jw0uVnsgqM@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <07b12dcacdfa8edf4a97a68513a21311@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746480798;
 bh=0zfhsnwxVOD41GPhUhu5dw1I9+sipdjafnEf15VW44E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AQdeChf2bxEPTbyY8Rm4FnoPsjp38wu36g1tw5Zibqt+jAjRE1V6/DBSpPRpifQYF
 4wnkrnfhl5TvPYWP7R2EbDozc8VeLl9lnLrVJEo97KfqksKodhp5ozVnP876esCG1L
 mJUj/4JednFhrtu3/lZN9ROkeyNOYMG80z1e39RNesJasiK2tWfRl2nBppSmUaewnS
 bHYRnuOv7dwczbVQ6RnvZXZb3lKu4uqmFjN9Ouw6my4at5fsvWgcZpgGtoaeq5lVQF
 nWs48Q3cg4Wwd7ziqx+RzIdzXni3UTj4nK49gwzo8/KnfE3r5/e6Q9chYBiF0KId8V
 mu0+RYs2SPQ4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AQdeChf2
Subject: Re: [Buildroot] [PATCH] package/ruby: update to 3.4.3
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

On 30/04/2025 13:48, Waldemar Brodkorb wrote:
> See here for a changelog:
> https://github.com/ruby/ruby/releases/tag/v3_4_3
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
