Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BF1C531F9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 11:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E4756068A;
	Sat, 25 Jul 2026 11:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IG9EzDVRrWKA; Sat, 25 Jul 2026 11:08:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A75346065F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784977739;
	bh=k9n7DaueFiZtyMnOfu+VF1GN27VHJfumG13A/Wc2GK4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZCEr3a71t3K3aLY5Xt5ouWu5XX9aNE+Rz9B3m66EZ2enMv27yCqjMdDeCC/ErI6e5
	 nGMt5sioKRIOEGJ59UvOT/P3KmqL5gUGf0Oo/ToUTmZoMv1C4qTcyxt6/ZDwbXoxmt
	 OpMJYLddikgsFPhI1zhjjPgI78VCiZWG6zxt2Xqy8QG9UEx+bkibIsQLuX9LMIQ72d
	 rKS/nUK+Y+fcbuGsQhUN8KkGa+CX8WTylpmQ7DR5C1HuR1PpABTxJGDhrj8pmBuBE/
	 o+UwC5Mj0CK4pBeC7OYC96gueFVhXjgekeLFi9TzdBHIlwd5+HpNVO6kxV4/MJf3P9
	 ID1f5Ya1RnYyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A75346065F;
	Sat, 25 Jul 2026 11:08:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F73736E
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64FCA81006
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_huFNyjBDRl for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 11:08:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7935681000
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7935681000
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7935681000
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6F48113F879;
 Sat, 25 Jul 2026 13:08:51 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jul 2026 13:08:51 +0200
MIME-Version: 1.0
Date: Sat, 25 Jul 2026 13:08:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20260724132544.228104-1-bernd@kuhls.net>
References: <20260724132544.228104-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <200041a03c4b23326bf2fa75364102fb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784977733;
 bh=DL1qi0dr7dBDcviXXpVvj7cEEZTA3yExcSPxtAF31hg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u1ojFs2K2u6aOkihi/1T+k7KaGkP1JjJ3dFJxzHkAGgejmp+HouDNWo7H0K2aXJzw
 va3aWHJSYUJKUa2VeqnfLXEPy2tMpkITosGhWZiGA7MNPIvkW+tnlFoLpWYow8KJju
 9+n09AL2BUoG1nZ4KjTNcmmjTWnxOxzX4HDDclFO7PjQEluGGS/c77PStU+5N7hiC/
 6SQ/38ZDpZDDwW5Pm4aSVgPr6SWZpK5YnOKyQUptg6vEWaHxO732Y2BQODZNDVodu3
 uoFnCuB/J7ISOOF7puypGVDFhP8nZV5R0D9AXPh0QSRrPzrzJh8D3hRtqTyBC0D8Oe
 rwwBUGSTzpH7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u1ojFs2K
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump version to 1.97.1
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

On 24/07/2026 15:25, Bernd Kuhls wrote:
> https://blog.rust-lang.org/2026/07/16/Rust-1.97.1/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
