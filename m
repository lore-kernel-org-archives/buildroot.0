Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEF4E8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 11:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEE9F81764;
	Fri, 26 Dec 2025 11:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cho47vNfWBCz; Fri, 26 Dec 2025 11:36:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC04781346
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766749018;
	bh=fhX3X00Fuy2VnLLVHbszEQnhLmxeoDS6c/bfo46233w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W8K1ItKIF0IWJYNfEpProBCyuWdzjv1/pMpBZHT12C2Y6lLYQONf7WmDIyU6l+1ry
	 InDk5Ngcg81giqFcfoY7pHGItk130eldV5nTBM3yTXf0eFINqbVc/0TrII654TKJOP
	 wHGxoZSyFY0i+yTxw8psH7jNSb0fcP1kYidS/fF9JBRovePBQyq/nadYjyVUSo+QDk
	 ZK126pSzFtBQFglFNYnS+zgF6Na8XZha2zo1hHPOBHCBNTFoXbJfjhYlycSCqyjwTf
	 UtYvXdOWDRYlgOW3IXZXDTWL+Uh3BkpZ5027pTYq49cmeTOVCwjJtKheSIRB9LJRYu
	 H4VljHeENj7OQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC04781346;
	Fri, 26 Dec 2025 11:36:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9408E119
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A9CF40448
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-7dmbWtdUDF for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 11:36:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF2574012D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF2574012D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF2574012D
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:36:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C50E1B0057C;
 Fri, 26 Dec 2025 12:36:53 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 12:36:53 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 12:36:53 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251223202230.3132006-1-giulio.benetti@benettiengineering.com>
References: <20251223202230.3132006-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <99437fb37c518cce2136f3b496697903@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766749014;
 bh=suAZ+U0suYmCySnCU4wWWFXpYxFV330x5AmWobZPfKY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OM+9zm6WJUinvhwx8635TTtv4ralS3Bk/MNiLAX5ETdfLE90IV7iOXj8JKNHvACnw
 RBgzOYX+YuajzFP81Bo+gdi9pRnneloWkix8AIpmIfYGxyQZCQmnlwxxZPhTUmP4ow
 whWYoKy4CDLJLLxIHTI5G9SS8oosHAqhpYC02dEMF+Y/doJiwJbal1bOv6FsNuPpZk
 +DcwGEGsussVxbrOzLL5U9cBarOF5c1JpSxGh3O4uwLKoq6JViK1aQwMMTNfABVrmZ
 I6zuj9Wr4OaKIck0IrjZVu2rPhTHpHkd+9ILNIIcL1xKDlY2XI96er2kXytbCuj98f
 9+sApJ1ZFzBmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OM+9zm6W
Subject: Re: [Buildroot] [PATCH] package/zlib-ng: bump to 2.3.2
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

On 23/12/2025 21:22, Giulio Benetti wrote:
> Release Notes: https://github.com/zlib-ng/zlib-ng/releases/tag/2.3.2
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
