Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33B1D39011
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 20:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF09A60BEF;
	Wed, 14 Jan 2026 20:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wq0fcXYP33oQ; Wed, 14 Jan 2026 20:16:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9BE560BF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768421784;
	bh=w2eNPm113fbOi+NhpCf+GjFXWJptLHwzTd8p/WaAGb8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ifWbzsxHO3kZ6SBGyeygL0aLDRQNlInx2hgKsOkKyyh4RgEcqBPh4P79Dx7CArmvJ
	 PLD1lECtRsSOrZKNFSYNBW6R3yRlZyVeFRrCbyHNVA/RVVpXxIF+yQUc5TpOy9R1UW
	 6jqUUCW7OUVN8m3qM0xnQqyJ1mhP3dc7nVi5Pk2e8KOyTS8w1Ds+2FpfQoftOzK2pv
	 c12fKVQrKEGZY/blAjGu0EKm+Ogwqh72LFTwQlqVhXDkkTkwU/6Mg7rx1Vn7Aus4mj
	 dXC0ip12lkqn8ddy74uzf+E1YbGalhp6hNewqMU3DimQfKXZnzz43eIZaEz325JjyJ
	 AHBEeixbzTYLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9BE560BF2;
	Wed, 14 Jan 2026 20:16:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B3FA232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F01DC833AE
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbfH77QKnJLc for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 20:16:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6723783FA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6723783FA6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6723783FA6
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:16:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AB9EAB0051E;
 Wed, 14 Jan 2026 21:16:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 14 Jan 2026 21:16:13 +0100
MIME-Version: 1.0
Date: Wed, 14 Jan 2026 21:16:13 +0100
To: Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, Fabio Urquiza
 <fabiorush@gmail.com>
In-Reply-To: <20260112210929.3767530-1-bernd@kuhls.net>
References: <20260112210929.3767530-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <249b604fb4e11c43ee3813eafdc765cd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768421779;
 bh=vp4EmPS2kUEsGmS5WQe+KGCRPwY966ijEjwOfwxsLhs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ePfDV9CqC8C+ISLeS1OBdmmWvSV3wKKK9Lq1uER1l2c7KyQvcjMcrC4TFEleTsZlL
 lmcAApvVYy9mTAkkb3nLO7Nly16Ubcqp0LvxrVChSriEmaVTjMs3GJUczyNQSlXETJ
 w/zsG+a5/4+vjc541HfOAY19xRMsh7tqmlStEdx+k2d/0nb3K9aZta5ggvUJOgGncZ
 tGVKXTCPhET5eYr9pPfmySLecqFyfdn+rRw/XREnpd8NSuHRYKVExZ3ulCKPQaDgix
 +xg7eHplqeM8lenF71VpFgyI4wHOz/F0hiTOB76/8EgXT0WBXH+TDsGPn6tMyv7rw5
 2IHdVcuYWZdIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ePfDV9Cq
Subject: Re: [Buildroot] [PATCH 1/1] package/bitcoin: bump to version 30.2
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

Hi Bernd, All,

On 12/01/2026 22:09, Bernd Kuhls wrote:
> https://bitcoincore.org/en/releases/30.2/
> 
> Updated license hash due to copyright year bump:
> https://github.com/bitcoin/bitcoin/commit/ed0774bd08b83813f162be33672b7d6c7fff9933
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I applied this patch to master. I added a link to the blog post about 
the wallet
migration bug fix and the explanation why the 30.0 and 30.1 source 
archives were
removed. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/2f4d619a4ca82f8c179f083f44895888b5880b97

Also, I would like to point out to the LTS maintainers Thomas and 
Titouan that this patch is a
candidate for branches containing bitcoin-30.0.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
