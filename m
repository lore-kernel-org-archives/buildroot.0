Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1705C71135
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 20:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73E5680DF2;
	Sun, 15 Jun 2025 20:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9w1TIDNorCq; Sun, 15 Jun 2025 20:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A806180DD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A806180DD0;
	Sun, 15 Jun 2025 20:21:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5860C151
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ED2680DD0
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrFZT4qCCbhf for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 20:21:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 53D2780D8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53D2780D8E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53D2780D8E
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:21:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 26A87B00571;
 Sun, 15 Jun 2025 22:21:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 22:21:32 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 22:21:32 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250615161932.2499787-1-bernd@kuhls.net>
References: <20250615161932.2499787-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <5ee1a582fa21b3f4ad2f702c43aa8eae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750018894;
 bh=9g9sg8sPwfmp9nZmflJ9dI+QP/ASFdyHEvTsrq7IzWk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IdMXrSDT+SZZQcnIUgCC0Qih6yBKWTvKiV/SGV3p+r04iay4+pgD6faRMoej1sBdI
 /eUndOkdzYdBcHHiBWDYs/lzvfK/uRsQkt5np7SWQiBNicxoft7zUYc+6ioX0ct71y
 JkLMycntWsA+xOex8idK8BY4vc5SwB/jTZ7McWucZNh8J8bOyavkLvKFYCKfIJy295
 5NvWVOdoyisNjRl5kLgWzJuILzZf1UB9SZLGL2QS2iIAynZiSx0cOg8fivLcjF3e3F
 dX4aN9o/3D11KFrjwSrg+QNovlqQafU//KyomMrCs6+FiWuu/lluCl3x9vIhDibY2d
 H3FkvFaifU5hg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IdMXrSDT
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.31.8
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

On 15/06/2025 18:19, Bernd Kuhls wrote:
> Release notes:
> https://www.kitware.com/cmake-3-31-6-available-for-download/
> https://www.kitware.com/cmake-3-31-7-available-for-download/
> https://www.kitware.com/cmake-3-31-8-available-for-download/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
