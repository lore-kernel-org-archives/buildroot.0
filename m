Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5047BC531D0
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 19:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0013F607C3;
	Thu, 23 Jul 2026 19:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w4y6pNySODFh; Thu, 23 Jul 2026 19:25:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28EC560835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784834703;
	bh=3DNP3dYjGFcul8Ja5OVBP1JAVqh8jRl2xLZQXNEEveg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P2iPWnz1w9i1GJczMCnjGvknUQdDgFUwJoqPHKykOTjva7nW7w9XDQshB0Ke7PCOk
	 XCRUMGGs0biZbDg0DWiPW1ryoB/64MK5cu9qIXQgX4C/49Gr4liPLSHp/TNyj7HR1p
	 PsUnRYUSNllRZOG2oHQ7fK0QAzK+HzKlnzVSKjaDZ7oQy/1pcRe4V0ws54JdmcbqGb
	 7SHnpuTmvtm7jfp3DWEx6WTlPzAgrupdXKaK9VazKbFxQDWJN7Ht2f7ovwaptT+7pE
	 MdJOu2gea/mI6qi0/HBjIhd0DjnUW2PBOQZE4AFyOh87XEu2rLNuUY8n81FHin5cRY
	 IsLyd3vzgfw2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28EC560835;
	Thu, 23 Jul 2026 19:25:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8958A47
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 19:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A35660835
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 19:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rh095kcMMhHX for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 19:25:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA718607C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA718607C3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA718607C3
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 19:25:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5C2C613F879;
 Thu, 23 Jul 2026 21:24:56 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Jul 2026 21:24:56 +0200
MIME-Version: 1.0
Date: Thu, 23 Jul 2026 21:24:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20260723180724.2215379-1-bernd@kuhls.net>
References: <20260723180724.2215379-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <7bb5b72e5a8736eb5778cf69e564b8cd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784834698;
 bh=5st2f23wgT0O6lvdgRDzqVb3vI2WbbNIhYJ8Bnf+BDM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E2yaEJHOEMvLeiPJev1PCA1Ov9g0zagmC8zb6EffE50DJHieJXpwGmGhFcMKqQLml
 uuwVUjhmaQHtVzsZmOuTvwwBw1sHUpe5uz8qpZ3y6ftPJ+HrxSXsk2YwYPvorF+z8F
 gJAjLXJBA+mw/f8d4Ty26LmkEvQKcmejMAv+8rvwP0zH8gRBZhjVEXVjyEgSfK2fpH
 V9o8AxRFUuj4EG8Wk8wU+VYYG3iK8gMc/cB1yHtQjKR3FiAlDD0vP8ukTjZjWlxW9b
 K1JH/uSSB7J3TNQXUv9Xs9nABNVH85UrFbBEDEKP7TFKUaIZw3df+1vEliRVLJp3Dd
 y9zNTNDjFIq2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E2yaEJHO
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.99.5
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

On 23/07/2026 20:07, Bernd Kuhls wrote:
> https://lists.exim.org/lurker/message/20260722.140124.4feb2a88.en.html
> https://www.exim.org/static/doc/security/EXIM-Security-2026-06-22.1/
> 
> Fixes GCVE-25-2026-07-45-1.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
