Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5768ED116F3
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 10:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 671E38222D;
	Sat, 29 Nov 2025 10:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQNGhtZhdHoL; Sat, 29 Nov 2025 10:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2734F8221A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2734F8221A;
	Sat, 29 Nov 2025 10:35:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BD8F1A9
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 10:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52CF4820E2
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 10:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8IMTU83AJI3 for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 10:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 36147811F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36147811F3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36147811F3
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 10:35:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0B77313F89C;
 Sat, 29 Nov 2025 11:35:15 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Nov 2025 11:35:15 +0100
MIME-Version: 1.0
Date: Sat, 29 Nov 2025 11:35:15 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Brock Williams <brock@cottonwoodcomputer.com>
In-Reply-To: <20251129074011.686916-1-bernd@kuhls.net>
References: <20251129074011.686916-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c8fe7549e09419d12bc812c3a7eaa355@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764412518;
 bh=0WcEXosANupAOpusjRXOoZZvpmcfMbS5rP9cd6GymlU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OUzFKHA00zE1xpGMGf0eTV1egHTYhT+ytAgo1uJh1lQhK3rTBsGB8zV0wIdBM9kSC
 43nACoe5unT5e2rfV74v8Prvqq1jjdofHOgOCOgk54PeYVMpHqF66rO9jQRdnqoHuC
 KihGaw7zHzu9OgX30zc4HbicmnQnw6pnNSi01L2jxH5NDIttOPiJMirhD/+G/czj+h
 w4LUGIuu+N+FQdHNMJV9snFXDWhxD4GUM25idHyk4JOo/o2/snnbjDNaV8gQ1D4/Bd
 x4rW0qe0IJAsqaL/pRiqDHvS7GrIzzm40dQdSqAtnmvlt3v25q/7F7Kgm0DWPKFmF2
 FEUJlZ3Fixwnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OUzFKHA0
Subject: Re: [Buildroot] [PATCH 1/1] package/pdmenu: fix build with gcc-15.x
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

On 29/11/2025 08:40, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/554/5545162ca0206cacfca1617280f074237e72aec1/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
