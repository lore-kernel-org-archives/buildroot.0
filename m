Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DEE1091916
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 20:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4568D6163B;
	Thu, 19 Mar 2026 20:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vT6Hbtr2KgFf; Thu, 19 Mar 2026 20:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40B3061638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773953485;
	bh=o49YHHm6oLfu8r+xpDARA2QmgJJD9giqZYdPYoQvejM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d3UaeU5/r6O1WQskiL+P+L0VNO1RYZy09DP7TzZEYiMgL09t8aeys4fJxKkpgQ0XU
	 F9CjEmBG/e/CWV3M2+g3+RURJKXhcLKSa9lGEPQz80DbIIdrARArNzjO7K+UXwu2MP
	 TVfJsP3LXQgMvPw9QR8mqIVr/J3sQBjqIlvCcM8lCoZYPfVA5r22QtSNDhhoCYi+KU
	 Yw2l7ywgJ7L6PqP7decN1Cf6NYA0RqH+Valvnc+kGxjeQQu6H6nb8gzIw3o+JP4ZGT
	 wy0aJkHoRyeA/l0ASNxYm0UF3VcHJJomm2foCnjdtERFhKe94unp6Rr+fRASxHZ2Mt
	 9wOkQkMwKEs2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B3061638;
	Thu, 19 Mar 2026 20:51:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 269E6265
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 20:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17FEA411F7
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 20:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85kaV6yp0fL0 for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 20:51:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B988411F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B988411F3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B988411F3
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 20:51:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B9FB15FFBA;
 Thu, 19 Mar 2026 21:51:18 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 19 Mar 2026 21:51:18 +0100
MIME-Version: 1.0
Date: Thu, 19 Mar 2026 21:51:18 +0100
To: cp0613@linux.alibaba.com
Cc: buildroot@buildroot.org
In-Reply-To: <20260310081850.33001-2-cp0613@linux.alibaba.com>
References: <20260310081850.33001-1-cp0613@linux.alibaba.com>
 <20260310081850.33001-2-cp0613@linux.alibaba.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <50127bcac46304384fa17899ac8fd5c6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773953479;
 bh=PAKaO2Yt/SEWNm845w8eDixfU29wfIWt4n79zve457E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PzeDrP/La9rMK874gsNbWFcIlHJXja22nMd6RyKaQH4PuxZlyG5ADGCCWgLijek+F
 B4DGr4MGKGOy+gKJeBPb+Jf80v7uXvts4KURSIqa598WHTmMnMWs2DDPxFOK8/hnFj
 vW4nv0xaD1AtdWw8aImLjLZTnMai+RyesfTYYFMQCrUxBgl1sXTspgzrGb41tpllGL
 Um7iV6Z4e4pXzUmMStzE/yumzuBWq9RckctWPEOELAlLN6MMNGprYmSTgou+s2XnG9
 N/t/twCScApd6ONwbCvHLHvtaWUZVTEhmkQ0215wz/dM5FTqA4C2C0YUnp03UuTFVa
 RsmX/0gdSbEsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PzeDrP/L
Subject: Re: [Buildroot] [PATCH v2 1/2] package/ndctl: new package
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

On 10/03/2026 09:18, cp0613@linux.alibaba.com wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> A "device memory" enabling project encompassing tools and
> libraries for CXL, NVDIMMs, DAX, memory tiering and other
> platform memory device topics.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Applied to master, thanks. For info, I relaxed the minimal
toolchains headers to 5.10. Looking a bit more into this,
I realized this was backported to 5.10 and 5.15.
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/039c1ae13ec12f7cebddf86f37080d0a1fee28e6

Doing this review, I also saw that a new v84 version was
also released, in case you would like to update:
https://github.com/pmem/ndctl/releases/tag/v84

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
