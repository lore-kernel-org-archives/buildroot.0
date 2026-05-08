Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C966CD3447
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 10:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6601C615C7;
	Fri,  8 May 2026 10:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYZ1kYGK1DgN; Fri,  8 May 2026 10:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15891615C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778234796;
	bh=i+hHdId3PS9S4ZuoJN1Cnn4ZSOkXvvmAC31zuE6O8WQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CA6YL1zCgo5i1V1X2qT/gOYujWKBM2Oy+iaEhHPZg8LuLJWEuqdZE4wJsk36u1s/o
	 Vqp5s8UXCtAiTiGT9kM+99j0gRJBBXCZlV2CDnwTmVZDUxQd5M9THiX8LTuJglh9vC
	 ubaqT+qKmJ0uXxeY7iXjFWBXtmSBEQ81iYcUgCk8s88TzUr8HsV0hj9j+MBlXJ2Gik
	 0oDEkG92wf3zQ5OO7rM+qNTZ5etBYv2kz+13mzVfuWGNJCRg2tAgCm7SVKxrCGPEMk
	 umjIfMGUcV/9eNqb8rPlP4brHfbfxYb6nl87PsDo3E+BlYX9GN2AwWZReW+xNcVaLU
	 GVi5JGSZDU1kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15891615C5;
	Fri,  8 May 2026 10:06:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C3FB358
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E26F841B7
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWZDlO5gWlR5 for <buildroot@buildroot.org>;
 Fri,  8 May 2026 10:06:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F144841B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F144841B5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F144841B5
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:06:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 144FA13F854;
 Fri,  8 May 2026 12:06:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 May 2026 12:06:28 +0200
MIME-Version: 1.0
Date: Fri, 08 May 2026 12:06:28 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Robert Marko <robimarko@gmail.com>
In-Reply-To: <20260507071539.1117087-2-buildroot@heine.tech>
References: <20260507071539.1117087-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.14
Message-ID: <2d789b56bfb4d8838645bf6158ddfa68@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778234791;
 bh=NGb4YWJrG9U0W7kRUx3CNOsZGjTKcVj75xsW1sZGLPc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TktqmlBRWziOv6j77h5HTVxbKuhOADEprHGEC811mLJ9QAKwH/snCEX+R1IYMeMrG
 8Pj7IkoFgZuBGC8gRCClOtKofetlGJvy/2us3+dnqRqLi7NuO52TpYOkuGV1a6oEaw
 n+xY4Hf1TOPUJHNb4FvY8MPwvHfdXHiQdkUWmkTsJQgsI4Prh1zPodaEul/UIDmv9v
 BE14Sqd5Q49wukhD3B5B5r1N8yNA6q9Bl4vyvOhJYf7C8jdl/0Cg+M8XCSuRrBEMvk
 gsIY/Q5l/57cxQ8zhookq3Q/YMJmZoUqZ+f1bW4JbE0wOn7gi2qH+vTl51Ew0DC7vK
 mWlkoRQwqYTyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TktqmlBR
Subject: Re: [Buildroot] [PATCH] mdio-tools: bump to version 1.3.2
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

On 07/05/2026 09:15, Michael Nosthoff via buildroot wrote:
> adds support for Microchip's paged PHYs.
> 
> Release Notes:
> https://github.com/wkz/mdio-tools/releases/tag/1.3.2
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
