Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D5ECAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 16:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F01AA83BB8;
	Wed,  1 Oct 2025 16:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HcGsrvxAS6Wt; Wed,  1 Oct 2025 16:44:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16B9B83C3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16B9B83C3B;
	Wed,  1 Oct 2025 16:44:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F8372A6
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 311EC61375
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2AgLDkiCHeV for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 16:44:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 790B861382
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 790B861382
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 790B861382
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:44:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 23E4313F8A7;
 Wed,  1 Oct 2025 18:44:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 01 Oct 2025 18:44:00 +0200
MIME-Version: 1.0
Date: Wed, 01 Oct 2025 18:44:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250930203145.1197559-1-bernd@kuhls.net>
References: <20250930203145.1197559-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <48558349042e40c8f128b330227d1733@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759337044;
 bh=1DyjYFSyBCc9XkErLGS93s/qnfpwq8JpuVmatLcT2lw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=otD5UtO4xf71MH6d/bQfh3Ei4USSchqHJx8rG9vdRFd63WBXCdGH9G+JApSWaVa7y
 54fL8uuhRroSjsPocXbzcd3s7fm18ZT9pn0A6Hijnm4s1LtFUTpU1d7LsKJ6E8g5cH
 ophpGKcwTgupJc5c1d4DXEcHoBL5s9lAtt8GyMN7EtjBnS34HP9SpZx19xEac38e9C
 sNH6MRs1nua58G6S3H22ENkGYb5qMi95J2U51NQJoRYT+Lr66hFcL/WWpmclEx3Gln
 26VhTILGTN5ufR4ia6k8QbcYwJkERTo3TBnlMLkEMs1S5QXwXL5wpTgc6x4j0slE1w
 tFuToz/s8hYJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=otD5UtO4
Subject: Re: [Buildroot] [PATCH 1/3] {linux, linux-headers}: bump 6.{1, 6, 12,
 16}.x series
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

On 30/09/2025 22:31, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
