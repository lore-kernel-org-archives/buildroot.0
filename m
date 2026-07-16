Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ECDC44512
	for <buildroot@archiver.kernel.org>; Thu, 16 Jul 2026 16:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CBE480FFD;
	Thu, 16 Jul 2026 16:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkCeIvJE6p9G; Thu, 16 Jul 2026 16:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 681DB80FD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784218244;
	bh=pU3W0p7F+aSWKnw4Q9GKblPmPmi7TrnRMNI4iPSXnz8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z8/nMYigI1ukW8Ttw9SZWXEE/vms2pTj777z8db3Av9ZJv3dxzYA8k5AZcN5VBXGo
	 a0L05E/u/YbSZJiQp8A2O9PsEi7zAfjDKHliZwGiHVTDRArtH+XV1i0oTu8aqsM/Tx
	 HoLEJmuvN3RQQrISoU4u64JF4qhIw2Yuq80aVLPwsLbipZmSPj/PpmgiYJB7EUgrC/
	 k5/hJuVl7diUcx6AoOgDhJZ42HdddCnHytHdljh9+xEWzoZ711kR7Mo9UvpeDUMl4d
	 Klo7yhD8thgOTPNveUbd2f2UipN8mMZcJwbrojYlOWBmW2w+/rrR0SLb0TpA5tS0Hh
	 KNz4kxprcg9Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 681DB80FD7;
	Thu, 16 Jul 2026 16:10:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E14C136E
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 16:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D32FE608B5
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 16:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQqYiW30-G7K for <buildroot@buildroot.org>;
 Thu, 16 Jul 2026 16:10:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A93D60725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A93D60725
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A93D60725
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 16:10:41 +0000 (UTC)
Received: from L30177.local (unknown [213.36.7.12])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5357E78034D;
 Thu, 16 Jul 2026 18:10:38 +0200 (CEST)
Date: Thu, 16 Jul 2026 18:10:37 +0200
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org
Message-ID: <alkCfZWNE7eKjSSx@L30177.local>
References: <20260716130715.101592-1-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260716130715.101592-1-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784218239;
 bh=ss3KZHp7rTuPKqWc3Khbqb96iTgFF5KarP3kPoVSzRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=icC5faCUfkwYQJ6XPvTZ+1lta7EzKNWswa4ZCBZ5FO/HMQS8IqqOn5zCKtOXFgQTt
 PhCX4NeTmg6hpsKVqbL9Q5YoSwwqs9odhlGXbuiK5rIH7WqRf1X8qiJJbfsenDCqHq
 Be2sDqhvMAfuqFjsBNdoq5z3T3s9FS3lxOleVZhFfLVdqUzjqYHT8R011tgUBEJOGs
 AIxEwwsVXbmLudIWYQwrLmxc/3Y4pL5K/0YsIGHWRM8WadvhFmmXIAySIv6Vg/+fQk
 X/YGYeJKyrvcMAHHi0Y8g1MawTg4Ytk1UzCFzkK4aQwbwW3XWdhv6lycU0e/bbdrFg
 aGmVKUN35oNRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=icC5faCU
Subject: Re: [Buildroot] [PATCH] package/dpdk: bump to 25.11.2 version
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks Maxime

OK for me

Reviewed-by: Vincent Jardin <vjardin@free.fr>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
