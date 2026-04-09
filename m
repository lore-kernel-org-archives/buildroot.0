Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF071F364AF
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 20:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7575810CB;
	Thu,  9 Apr 2026 20:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGLUyF93ka28; Thu,  9 Apr 2026 20:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3471380AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775765143;
	bh=VL3S+68CrlnocSKfzFWwCerhJlr71tRf6912DuWdYwk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=roe3Vva2EaJK1jW+UYaM41MBYNuYkQULlw1Fs1VS/bVpasWBMNvyqRXapyIMB7ZvM
	 S8S43qOG7BzE+Zv8YJXQTfKEhnvfHx/wutQnKvexWjGl2FlfdGqJtxbaKXtHHxoYsF
	 HRfe60bJDAFfLWjfYDLzr8lqbDzJgDbFm4V65cXbGjKGplmlS/h9X4FAlON1gDzs//
	 vCGfomg6gTQbw4nqrd6cOFAH2oiNjlWwQe3Z3iTyF0MrocRCWdDL/XfpDaXxEn+IQr
	 VM7jEjPrVkGzhERjO1IDF+rRytEHG4pwODSF+3RV5H7MP50HCIRlLqLgcRHxoucgJb
	 /0WY2EHp1v8fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3471380AFF;
	Thu,  9 Apr 2026 20:05:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BF98194
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 220A680AFF
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYzDp9R9OJIZ for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 20:05:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F4068089D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F4068089D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F4068089D
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:05:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1F63719F574;
 Thu,  9 Apr 2026 22:05:36 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 09 Apr 2026 22:05:36 +0200
MIME-Version: 1.0
Date: Thu, 09 Apr 2026 22:05:36 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260409174104.3949042-1-dario.binacchi@amarulasolutions.com>
References: <20260409174104.3949042-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <a592de1c7b661e7a65e86f9dd9f37da4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775765138;
 bh=PU2A6GAqRJP36QZ2qb6a3yiB3YqjK8qbR5M2+3uQj7c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lUN9nfvrXLtK0rqZQvLwUcALkZMKFThfUqFEuLcO9W8D24SuaA2g0yOS1thWPejiv
 yH2qPTNLPnSJ67fuLxyHQRg9ivQWuVFpwkT60DuNnWZ+GuqnqfIEvw8UASUkp5Q0Tk
 LOFIrWMyeTGKfl2X+ZghC5Hj3h7M/jtm/Il/XRbHw4/7mmiN2P+VfTjxu2yLWXn1yl
 y660ymZCjZ78cXikNor+9WkzLtWZj4YgrI1E1W1Ky1tQCoZYEHymsVVNxs2+neK9XY
 kpEazDMQn1Li+3PPqdviDaFBfeU36A+YuV00p+e3pSWvCZzg+s2f38xWGpaYh6r2dr
 dYd112fb3CB8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lUN9nfvr
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f746_disco_sd: bump Linux
 to 5.15.202 and U-Boot to 2026.04
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

On 09/04/2026 19:41, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 5.15.202 and U-Boot to
> version 2026.04.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
