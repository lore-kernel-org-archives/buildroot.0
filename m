Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20454C71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E935383B1F;
	Tue, 17 Jun 2025 19:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDRrjYM8Vf6U; Tue, 17 Jun 2025 19:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F68283B0A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F68283B0A;
	Tue, 17 Jun 2025 19:01:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08F8AD79
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE610403DC
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6T8SfU2vhtfb for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 19:01:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2825C40364
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2825C40364
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2825C40364
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:01:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2F259780383;
 Tue, 17 Jun 2025 21:01:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Jun 2025 21:01:42 +0200
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 21:01:42 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250616191456.3479677-1-bernd@kuhls.net>
References: <20250616191456.3479677-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <f594069daed9f281867a461e80138149@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750186904;
 bh=CHFA5X5295c+R8MNTBJ2MIyzh1yiqRpmClPPWZlf7kg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ig0MhxsLYFod3TtJo3fcLuT94ffCvAgr1UX7C4J6RPEYH5VCNSaHqp0ABUaR55gHk
 WLjTmtjlfFRa/Q+5+0TGYr2aswNZLn0bsUPcGJpxrfxGAnT0Lz33229E6Kk/hY02Nh
 PckCy25gKZ8lDBV7i9wBSmQsbykXjnp0fTN4eYT7wHgNADQHWXPV2icczEwLfanLc8
 /vptxG5WcAJyIgNi32+oS9fC6idpsk1pYi5VlgvlWBHFEhm/x7P8gsKAOrLydrT5U5
 l21SX4Vs3MZtJeAksovKCFM/Z9hXElHNIcNJFtltrUDUtl/1ZxJ05+TmXrsPy3l08c
 szB0Z9KXI90Hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ig0MhxsL
Subject: Re: [Buildroot] [PATCH 1/1] package/lcms2: bump version to 2.17
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

On 16/06/2025 21:14, Bernd Kuhls wrote:
> Release notes: https://littlecms.com/blog/2025/02/08/lcms2-2.17/
> 
> Switched _SITE to https.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
