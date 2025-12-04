Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A222FD24441
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 16:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3879240982;
	Thu,  4 Dec 2025 16:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4m0Nm3AZakt; Thu,  4 Dec 2025 16:59:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CF3140975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764867551;
	bh=dWIYUdLx3svMVx8iAPxmDpYERckMnCV3fyd2I8C2LZo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i8Fn6/gbfAkrLVs6xizWZIJuthVnqcksET3cmmUpBU5ttV8xCndsSszoYvSawu8/B
	 p82P9CB1Kd/WdXyrDOLSJQsuZsFaRXBXMhmaI/fLTJJwi4Bkd36hnLoHaMDIPP/yRY
	 UyEfO0RXPitmYRihxJbr72gNF+JDhT3Qwdtpap51grv5l5jwivaWi2SVGgMPRtZ9JK
	 9RM1TNflFF2kHjanqGp06x+fT8lZe1YHktI90DJjX0bRTJGLG2v1WlqzPQ8GgsWKSw
	 V5RRLOvrpzSy29PqaCoA6lnl16m3knPfsZS+OdNgF5hsguFIm1JWsEz5PCL/w7Xss8
	 rkjoWzEdG1ESA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CF3140975;
	Thu,  4 Dec 2025 16:59:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 424BD1A9
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 347B840D86
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tV0uin0UAYx for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 16:59:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2EE6F4105D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EE6F4105D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EE6F4105D
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:59:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 120382003E8;
 Thu,  4 Dec 2025 17:59:01 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Dec 2025 17:59:01 +0100
MIME-Version: 1.0
Date: Thu, 04 Dec 2025 17:59:01 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org, James Hilliard
 <james.hilliard1@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <136a6904-8955-4bb9-a657-beb5f515817e@bubu1.eu>
References: <20251203180334.2117343-1-bernd@kuhls.net>
 <136a6904-8955-4bb9-a657-beb5f515817e@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <1852db1ce1a83c9c828deab9b7d60da3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764867546;
 bh=5a91LxnP0WD9ABiryrYqCLipAIp7pLMY7pGcPVHlwGw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H3+HkUvBc98wiegSta+KAbon2ccIvCR6RxbhTuLgLjTaLCQZoFNFvWWy1PGzfruHK
 0w+qCX5/buzj40UHI7HfDQ/eIX3r1LJfRfFXiQ/xz29p4ojYepLtDjQ8zVhWBdcQaS
 ECnjFkZ+GxrNu8PTtKcLxut55MuePSC7R7rxZDSUfA8RYT5gMBF//66ajnqKoXX7Gf
 Sw0TpVl8/l/NglFp5qpESUfoDmoDMLs8owWvzYNEsKqIsfPYfwEVxDKORNgblE2bFg
 3+lKlFjg/PzaHlz4EmR8Rl/kdOuDRCmNpoXBTOIKhuv+bEFRa76BXl81x+Hf5dGq4P
 5SnAg6aAqpKpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=H3+HkUvB
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.13.10
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

On 03/12/2025 19:09, Marcus Hoffmann via buildroot wrote:
> Hi Bernd,
> 
> On 12/3/25 19:03, Bernd Kuhls wrote:
>> Release notes of this bugfix release:
>> https://www.python.org/downloads/release/python-31310/
> 
> This should probably be marked as a security bump, it fixes multiple 
> security issues: 
> https://docs.python.org/release/3.13.10/whatsnew/changelog.html#security

Thanks for the info. I added the link in the commit log,
and applied this patch to master.

>> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>> ---
>>   package/python3/python3.hash | 6 +++---
>>   package/python3/python3.mk   | 2 +-
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>> 
> [...]
> 
> Best,
> Marcus

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
