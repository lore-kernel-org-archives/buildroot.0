Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870C6CD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53A7361558;
	Fri, 15 May 2026 13:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id azlamTjW3dDv; Fri, 15 May 2026 13:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BEED61374
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778850896;
	bh=jSwl9Xzgy//+ZRTx+bgleYZm054+FDJdGFv1rLCX8Gw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cLXwW7fyhbcCIDyWpFHnapSV15kTmzQcehKHb4jIiNjzWIoMiqb4o9jzwI9Bv6goX
	 878PQ0Gkn5665Sv3YWaiVqk+eSlWzfhSXdBDNLjmfNRUJo0ap7pOp0HJ4XhMxcjJX1
	 M/Mwn/fn99Z4pHebqo8WDRza9wR1hcn1GIBfJVs8eCqN6Oy0S4F94useRqZyZyPIj4
	 12aI63dhd/34q9pITyJDZ804jLC1gjnPBW848qs1Vrt4xvvy2AWB79Py0Tex/9V3x3
	 bHhVlf6iRlBj91ihbnunlHr1mRYpv7yRbmpC+gm8Ejxdr3sHWbWMkJ9V39mb2AXVe9
	 TQqLaZFbbOxbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BEED61374;
	Fri, 15 May 2026 13:14:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9338B36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84B5340E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LAgrVSw4bwas for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:14:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F37340E23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F37340E23
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F37340E23
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:14:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E124CB0051E;
 Fri, 15 May 2026 15:14:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 May 2026 15:14:49 +0200
MIME-Version: 1.0
Date: Fri, 15 May 2026 15:14:49 +0200
To: Xukai Wang <kingxukai@zohomail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260428143020.2129906-1-kingxukai@zohomail.com>
References: <20260428143020.2129906-1-kingxukai@zohomail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <6f370e51856c3d3dd5319fa13f4d313d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778850892;
 bh=POjazILMbJQNACFBmzFijjOEI/kBhJ8g5KJnUSb593I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pLO/Enm/0PUNmNacO2GjNGnlKYaCbC6t8aW9Ado88ZXy+Z3JQ61FpKHBNJT9ZphMP
 usHF4j3vr/W6ILLOwOU53twir/5+96I5MucdH72qzAoJPGWBsgvDeioMZc1WYWG6IQ
 Dx907aUcRDgFZlKkQW5lA+WEq3Ubso91HeyJcgUhm5aX5KFMokoaoAbaZ4wCUmj1Bh
 dto/ia+C08TkNiFceEKH8Z7a27QkQf9dfzxWODBbKt+gj8mGVgtTfUFS5uv9A4S+I4
 om6ngbYIc5zHvTj8M30x+2c5O6+fx/iMEYtgIDbxRDIE0xPldMtev/LDl8cTfkmUAv
 U3yD11LJx1ggA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pLO/Enm/
Subject: Re: [Buildroot] [PATCH 1/3] package/python-gymnasium: add missing
 toolchain dependencies for numpy
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

On 28/04/2026 16:30, Xukai Wang via buildroot wrote:
> python-gymnasium selects python-numpy, but does not inherit the 
> toolchain
> requirements of numpy, which can lead to automatic selection of numpy
> without proper toolchain support (C++, gcc >= 9, glibc/musl).
> 
> Fix this by adding all necessary toolchain dependencies that numpy
> requires. Also update the help URL and add a comment explaining the
> toolchain requirements.
> 
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
