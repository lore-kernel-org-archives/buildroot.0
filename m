Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6975ED3749B
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 20:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D6F96F47D;
	Fri,  5 Dec 2025 20:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07j7rAGYSqmo; Fri,  5 Dec 2025 20:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79F1861B7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764967647;
	bh=au6rl/c/f1wzazyoqSsPaaHfYN5CFbWpdfUaq0OH7ik=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LyOR+gwBcXovCaN9WgzhT3hueqE16JK+ChEhJiqqXb33ShLbIeX4xM06kfTabVWKQ
	 3JLfBilXnFPENMUTSKT2NLp+OZU2IzwSwNZ4yyqfBJa/IsP9wyLdKMhJbqpiqAQiXN
	 mwR0nRsSOfh9C2CWApLFWVqupSZPbvDj50kVbCj5moo7hzCkf7UVcyq4K6REypq63+
	 FmRgn74rR4eID12CxMjtbP/8y6N9c+7bz3mw7GrRVWrEC5cRFyag5D5RQJPhg6YIiq
	 jlHyDsBLrf4sGLOLfUoLc05/4hKj2AQaWM1pO0S5Zr9f7KWec1uimlbvIvOmpPUND+
	 bzsHk5VpFwwWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79F1861B7F;
	Fri,  5 Dec 2025 20:47:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A65851A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D25184C0D
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYhiE2lkZZy4 for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 20:47:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7EE4F84BC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EE4F84BC7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EE4F84BC7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:47:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6A18D5FFA3;
 Fri,  5 Dec 2025 21:47:19 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Dec 2025 21:47:19 +0100
MIME-Version: 1.0
Date: Fri, 05 Dec 2025 21:47:19 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20251204205412.2158168-1-bernd@kuhls.net>
References: <20251204205412.2158168-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <d92ae7f4f36f1634caccb8633c4785ed@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764967642;
 bh=N9m03UMv9mmMd973ardfOehmDU4b2TtM5kKXzh1jqpU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fz7vjvPKJTAAoV8GIIv+0HZ+ej2DYbUABxzPH9Nl+uB1D/aOCoD/G7mZt4+e9I1Rk
 S0V++/RVvEr5MNJaDWc/3ui62pKQ/8W4rdYcQi8zToBTRTpUWN+FaXjAn1gs8ixkSD
 GaT+aMmJeVzFK+/tAAFqAJNCzccymin2nqidUOFmwthEw+sQh8HAMM6rkctTJZjIqu
 9f2wC3VRn9w7T0ybTSKZGIXUsqjRiri67/6tYQyu/g5+89UxgDed6/cSVX6xxmSv/y
 Aj2MYXEHLCFHugSak7A3NxikfY8Kf/61YpfqT6+Cs9KKhxuR50KPtN/h2trnEeH0An
 xUmazWFpKnPng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Fz7vjvPK
Subject: Re: [Buildroot] [PATCH 1/2] package/go: security bump to version
 1.25.5
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

On 04/12/2025 21:54, Bernd Kuhls wrote:
> Release notes:
> https://go.dev/doc/devel/release#go1.25.5
> https://groups.google.com/g/golang-announce/c/8FJoBkPddm4
> Fixes CVE-2025-61727 & CVE-2025-61729.
> 
> https://go.dev/doc/devel/release#go1.25.4
> https://groups.google.com/g/golang-announce/c/tVVHm9gnwl8
> 
> Updated _SITE because previous URL returns 403.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
