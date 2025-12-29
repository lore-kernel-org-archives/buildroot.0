Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC6CD3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 13:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A4C081801;
	Mon, 29 Dec 2025 13:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M4gCBkE_dqk5; Mon, 29 Dec 2025 13:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D655B81836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767016656;
	bh=5+8/bJHGeRDFUAUvWS7zlERy5RHwT52DpS3+dRTtAuw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rNkZ2W6mkFeV9ce8eCbTQZpDmkq8rXHJH2Khe/mPJ3Ec189HVfJPkXh/isT3Z+/yh
	 ZT5WwB3bIUCBCFN9kiY+K8qrP7Pfhh4Z2EnjBhcKUpgFJr+C17DSAtBNyIgKGceTf1
	 ha2yaV1coYIr3kL9kw6NsDl3c2tRTk404CAR9ps4pd6Y2Qo/i/ejc1Tm/cZwZdlkSY
	 56gwXS+UO4pPoUcEFcR9lNds5XuctSFmwtLkhEr+ppRKHdc+8pqIyERsa2PgtanSy/
	 fj//VFxBkphthjDVT8olaa9hnTTbOaJJE0b/tiNQwtYxuVRAtv6BxrlKnHOKh4fjWn
	 5ZnwGpVLlx9Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D655B81836;
	Mon, 29 Dec 2025 13:57:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46632B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 381F140780
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBzQ1iXMed9N for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 13:57:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 49BB1404A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49BB1404A8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49BB1404A8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:57:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id DFFE15FF95;
 Mon, 29 Dec 2025 14:57:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Dec 2025 14:57:28 +0100
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 14:57:28 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20251229110416.56538-1-dario.binacchi@amarulasolutions.com>
References: <20251229110416.56538-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <11241fc52cfef38d05bd4e5fa1db598b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767016651;
 bh=bFI4x17YlYtSHAQ5ldXYErB6RImcNISpHSWXTNCtvHI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GG3xZrAdfYjTHYjzSSY4UOy0ZX0ZsEriTnALoFuFLjzvH3DYJFrDRmA0kE7qSpV+o
 JbHIVf9SLR+AYK07i0qnTrYrgBpBjjfcJKrR4QwEJfM2UXWsZ305vpAJEScDAbQduv
 R0C01+o25e1G4GzPymj30eUCDe9JOQc0I2DHKfAnxmtaOrjkPEMWtqoe82FDdTt/V0
 22zLh8XJBbnPid6vghZpOIhC6grNynYErDoAH/QHu0+KxW2vpWhR39jKFmeOZmaCzd
 WWOTYRGHcWXgt0MeYLqL5bDlNnww+S86gN5fjL0YwJ4f9n8DsqMSLGl7nA9/huuKLK
 RWR6d/MRjQhbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GG3xZrAd
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.243
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

On 29/12/2025 12:04, Dario Binacchi wrote:
> Release notes:
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.243
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
