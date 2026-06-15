Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE04CD98CE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 19:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 530B14192E;
	Mon, 15 Jun 2026 19:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPd2JCLEqboT; Mon, 15 Jun 2026 19:54:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89D24406F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781553266;
	bh=8l8oiw+a7dttH5K+3oVlc7T9R99dKApAoOr1ffOOZ6s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BguwqmbNchHh9x2ZLkU6t1LUJ9p6yVE1uHOwKU2Hn9K1TffRbjDxCrhgtvndX4A8R
	 rqhRBg0I/uqrQ/zlootOuF0825AkT+nxjK84+5JgNhTNyH61MC+pR87YgwOOK8I2xh
	 b+A/0rgaLIF/sf7e38Xzv7n7TBlX2+UFSWzSx+OBKz5QAD9VJF3I4kg9a5HCKmRtIJ
	 kGnsYCGloA66wPlfAu67ZfNzTXYjtDtRJILCm6iAUuFDXAPBuww8UTYM/A6sUSl3IN
	 MsMuK2H3gN0q73OkycN4lOcr67jlHk3HScujzDdr2Rcuaoi4jTllTCJXiTB+krMbe4
	 wTKrnn1y6yI4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89D24406F5;
	Mon, 15 Jun 2026 19:54:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ACC24169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA9AB6085C
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDPRpES_xush for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 19:54:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD08761531
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD08761531
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD08761531
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:54:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5B01919F576;
 Mon, 15 Jun 2026 21:54:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 15 Jun 2026 21:54:17 +0200
MIME-Version: 1.0
Date: Mon, 15 Jun 2026 21:54:17 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
In-Reply-To: <20260615073047.862958-2-buildroot@heine.tech>
References: <20260615073047.862958-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.16
Message-ID: <33748e18e82b755a574d0a6e82403cdb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781553260;
 bh=fkE7h56tLmqoXiuyH67GJk3Grz5qqfXIgDx6O7h8xYg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oGyuHKb4e2i4C8ItQeniexVfA+NyDd0pgTSh5u3CAYwP5/q9RqWD+AEXHzzLMEXKC
 HByETvXLuu/LwFKAJPSy5APFpbpKhyyiKJfIK33GVK5YUS4TtegvUtsVq7LkWXO5pN
 u/4T7dw/ryrZC9kAzL0pj/AQiuSltRtYZYpCQrEP5MWxq79gQG1yR90y/uaSfM7RiI
 FilZf87qWGQN4ejr4OmGxghTsdbL3Imcloriou2ohfRIyyEeW2gL3wXxHweL3K1Lw8
 sNDwPtUmvHZH4EiZYUMvBPcILryn0LzbkKDe/xx6kDnhQ32x5yvNAFZWFrNKqVNmAs
 ctmVqY9WSM49w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oGyuHKb4
Subject: Re: [Buildroot] [PATCH] package/{python-}protobuf: bump to version
 35.1
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

Hi Michael,

On 15/06/2026 09:30, Michael Nosthoff via buildroot wrote:
> Release Notes:
> https://github.com/protocolbuffers/protobuf/releases/tag/v35.0
> https://github.com/protocolbuffers/protobuf/releases/tag/v35.1
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 
> --
> 
> This release contains a workaround for the issue in libabseil with gcc 
> <= 12 [0].
> Buildroot introduced a patch in 
> 955fb2f7c41f49e8d7fc8c60b8557f6f7c1d84c4 fixing this
> in libabseil-cpp.
> So for protobuf this patch is not needed anymore. But it might make 
> sense to keep it
> for other consumers of libabseil-cpp.

The libabseil patch I proposed is not a complete fix. See:
https://github.com/abseil/abseil-cpp/pull/2044#issuecomment-4407040866

So we could probably remove it from Buildroot, now protobuf is fixed.

> [0] 
> https://github.com/protocolbuffers/protobuf/commit/78dc67e4d598d4e2ec8929105eb2ddbb4bf50935
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
