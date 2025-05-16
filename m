Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C57C3DA6D
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 13:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE25F612BB;
	Fri, 16 May 2025 13:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNQ04GH8JJm8; Fri, 16 May 2025 13:33:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7FBE61237
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7FBE61237;
	Fri, 16 May 2025 13:33:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96C7E185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C3DD831CA
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFYPCjpZgM0a for <buildroot@buildroot.org>;
 Fri, 16 May 2025 13:33:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C4FBB81ED3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4FBB81ED3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4FBB81ED3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:33:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6B61960143;
 Fri, 16 May 2025 15:33:20 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 16 May 2025 15:33:20 +0200
MIME-Version: 1.0
Date: Fri, 16 May 2025 15:33:20 +0200
From: Julien Olivain <ju.o@free.fr>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: buildroot@buildroot.org, Phil Eichinger <phil.eichinger@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250515123547.571910-1-olivier.benjamin@bootlin.com>
References: <20250515123547.571910-1-olivier.benjamin@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <de9002df8ddd27899c790221f94342e1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747402403;
 bh=diVTlRHO5bcFmI0nw9dMO5cnQ1BiDgv3+VPaRmnNTNw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JlxiyXAyEJBJrQzvNOvlbSsqM4W7uVg0I1rpTPz5NRhCGMjSiNtW0J6hBNiD7qVcL
 Yf4qM/VyiRdXIdJCR6RdEJSzU3OKQn4YHnHCWgL76CIrMbYQMTbwfb0D3VM5ixCIWM
 q02AikflavjAQCzUgvBy9HmJgwce+89TUpIclYzznKv5Rjhgc/uQqaqRiW3Pii9nRH
 +kFVYZDg2D3DTkOs4WujKRYNKbjWQyFWus9LsVctd0QV+FJpU3VPIqPtlMdVkRV9VO
 Y93l1/SfowuLF+pDF/9lYLw0f5FzrPtZfKDw2NboJiYQr2iALwXQi3qRjHG9BBdjv7
 uGbSkvuwPOgRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JlxiyXAy
Subject: Re: [Buildroot] [PATCH 1/1] package/psplash: bump to revision
 53ae74a
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

On 15/05/2025 14:35, Olivier Benjamin via buildroot wrote:
> This includes the following changes:
> 
> 53ae74a configure.ac: fix autoconf code for img_fullscreen
> ec1ed35 configure.ac: standardize default-enabled options
> 1f64c65 README: Update mailing list to point to yocto-patches ml
> b1a75fd psplash: Only define bool if using C standard older than C23
> 5a32cf6 psplash.c: fix crash from length becoming negative
> ecc1913 SECURITY.md: Add file
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
