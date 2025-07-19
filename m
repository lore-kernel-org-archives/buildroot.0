Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB8DC83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 10:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D18041BA4;
	Sat, 19 Jul 2025 10:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dCaABztBIl1; Sat, 19 Jul 2025 10:23:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D69BF41BC8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D69BF41BC8;
	Sat, 19 Jul 2025 10:23:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 559E7117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A044E40DB1
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOut0h50QX5f for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 10:23:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B333341BA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B333341BA4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B333341BA4
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:23:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 65D6360137;
 Sat, 19 Jul 2025 12:23:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 12:23:51 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 12:23:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Julien Boibessot <julien.boibessot@armadeus.com>
In-Reply-To: <20250714183517.2354615-1-bernd@kuhls.net>
References: <20250714183517.2354615-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <2e63e5ebc931a6969145658d1e6504df@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752920633;
 bh=PdL8cZQIwpB9NyqMmmp2+pqu9EvkiRmU7KcVS0vC+yE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HO6sd4YbeRqK7PftKXHsQteDApigShTRUFydhoJs0rRDyJAKtMbzR7xN4q4UYD5GK
 Qf+k1ERhTgc6tALdHUbJEDMHpl5S2oVzKDQjNWlW1e/bvqPopm6Zg01KrKG1la6uS6
 ARPFqqE4tdTb93K+6a5WMjYunRvkOWHl2Jz+YN0+hXi9wbR/CZ5CqDYCXz6IbLRl7P
 htWatny4pr7hd78aji1RGYO3TIBVTr1ITWmBIPDbrYAMH2JA1+GEFcEOeALu63RMay
 DNatY2A0kWzvKWGKfJYNkpDL6j1RSMe25HKS6jcGqRxUxFj3ofxoRoehRqy4if9jQ/
 RvHT3WKA08asA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HO6sd4Yb
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libcddb: Fix build with
 gcc-14
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

On 14/07/2025 20:35, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/723/7236cf5fd4f33aabd3178586f877dff04d754abe/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
