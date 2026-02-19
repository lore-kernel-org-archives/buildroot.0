Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D68E9A059
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 18:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F3CB4177A;
	Thu, 19 Feb 2026 18:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCMRfSTg5goD; Thu, 19 Feb 2026 18:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F29E240C12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771527342;
	bh=4c1FSfckv9rC4lD3jKByGbgYcJ3Gzs9p4t6gJ7fSA3I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GzZoR7bsUAX4l2k+PEDTg3ZF2Q7aC21+OeFiTo1NU43WHAVTGDkmmc/CKdgU5KhEq
	 umvp+MUlf9GcOBtB/JyrvEegPSPl11rBFdJpCSo6RQIHaHMeF81prtcUz3RWRVdymr
	 eezGXbiMcYnI+zm3EL5lOsTTNVdExecGaEl96Nas098NyLLFvZIFbk1z2ue5N8UcI4
	 M16Mxrza0n6+dHM6/caczSQmOhFcvCegjatK+SVZTMxpS6AaLWEl7wpEnhajPMzSUz
	 Ip/PZvy8xCaXMPrmF7LMX8Q7GrkThdUy94Qu0BZlDwElZElqstW2WK/UBIHcMiLu31
	 MeLxSxLMELRtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F29E240C12;
	Thu, 19 Feb 2026 18:55:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FA6B1CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 18:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 315B760ED1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 18:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2atUtGzJbbr for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 18:55:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4FC11606F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FC11606F6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FC11606F6
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 18:55:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F06345FFAA;
 Thu, 19 Feb 2026 19:55:33 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 19 Feb 2026 19:55:33 +0100
MIME-Version: 1.0
Date: Thu, 19 Feb 2026 19:55:33 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20260219104341.2640089-1-giulio.benetti@benettiengineering.com>
References: <20260219104341.2640089-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <9260a4825de5d6711ba1032eb38fb5ec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771527336;
 bh=rEyjFPkajGzMX5V071xA7mDYvM2Gh7f+5mzvbOQnebQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aRsIUuNflIPTqyEDksNrKK+sSiqp9qVoiXdChbOW+2+qH8t8uDXaSGKuIzzXGSAV/
 hIN6Xq6JIhZwD9YYWHJOOPgVe+TznsCNoMgFbd0uO4Ji7BHAY1p2n1vfd/2aKrJ61Q
 ccEe5whJfFZzJo6mDJNJtHgAacQp1HPPYGGqSEY0c6NmgMoOyeEYiJRQ8H992RzT0m
 kvNzLFtWHUjCC+TUMZSackihMD1KytzyCgXGh1IFVxTuQC+mFsDha6rARWEI16q2sZ
 4dPk+ICqfkPrzZGHKViIfaNAWXUjvC3GozttNY2SQdnFxIHqg+zr7bKUnjOwVQXDyv
 gwwxYRn0OLL1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aRsIUuNf
Subject: Re: [Buildroot] [PATCH 1/3]
 configs/olimex_a20_olinuxino_lime_defconfig: bump Linux to version 6.18.8
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

On 19/02/2026 11:43, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
