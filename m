Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4A4CD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 19:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DB50418CC;
	Mon, 15 Jun 2026 19:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25pturz90L87; Mon, 15 Jun 2026 19:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1387740EC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781551977;
	bh=be8eblYZmDts+ud1j5JNU8qsgDF3vJCCJ2610PFGIYs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cM5deOiGiLkigfdFHYonX5pitWAeV1PZV63g76jko0/F89p8Oe4l5ZDAwf24s9CKQ
	 aqrqqVVMmknujQVEPAxwjxyfgejp+txahWp05JOoCgb6grENy3+fTNYRL7uIk6RyrQ
	 eqEPrfN1SBCNlgMzvQmhSPiymvw/vv907Ks2S9vWL2uIQEUmccOX52zT9VXFMpemWV
	 l5YmKjHaJkrqtBD25kJOpzIFx6uVBnVu1GSzaBjGJEymjW7cVSPj20ZgPpRsFN8+2I
	 rsjreEkS2tCAL2p75bNnpkkqnljRN8AkuXzRzO9Kr7xeH3AKsVSZxnmJHqEjlR3pNW
	 5dKk8UddcV6LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1387740EC8;
	Mon, 15 Jun 2026 19:32:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5D492B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7F6961514
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3df-XOgzK5Fo for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 19:32:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F045561513
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F045561513
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F045561513
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:32:54 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id CE8772C891D3;
 Mon, 15 Jun 2026 21:32:51 +0200 (CEST)
Message-ID: <b7140a4c-05d2-4fd2-9527-d876ad3b308c@bubu1.eu>
Date: Mon, 15 Jun 2026 21:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
References: <20260615073047.862958-2-buildroot@heine.tech>
Content-Language: en-US
In-Reply-To: <20260615073047.862958-2-buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781551972; bh=Tl/Jxmv4PzpNdcI5mRcR5cof8X1TXpHUGWhb6T4wmME=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=sENDKxkqf24EyfEvj5RtugIEd/u+ghum83tPlTLjN2+8OC7TGcZ+Tir95g441yOvp
 DajNQVSyANE4ivR80gMMn79/DLV57l3M7RPnYb+02KRIpp8ZwYeBg7FrZ/GIxd7YRu
 Co3VGZmO8DsTMe+YqDwEwo5x+PGOOpNgl2K7JxPzez4HoW0n4fLRweSyX1Cr3aALmV
 v1eaXQi2GdgSGPPbniGIn4A3FGxNdS0fdtO7SoxOtwVrVxkuVZh3d7Zyo+zGPJT6cY
 QP/mQvpZF/EhgLYRz9Gm8PXqd2rwiNSxc1y2d8QNMQcbPS2QIxVlIwx/jrPcAtAQ6E
 I/Qz1GlDVIuRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=sENDKxkq
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

On 6/15/26 09:30, Michael Nosthoff via buildroot wrote:
> Release Notes:
> https://github.com/protocolbuffers/protobuf/releases/tag/v35.0
> https://github.com/protocolbuffers/protobuf/releases/tag/v35.1
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 
> --
> 
> This release contains a workaround for the issue in libabseil with gcc <= 12 [0].
> Buildroot introduced a patch in 955fb2f7c41f49e8d7fc8c60b8557f6f7c1d84c4 fixing this
> in libabseil-cpp.
> So for protobuf this patch is not needed anymore. But it might make sense to keep it
> for other consumers of libabseil-cpp.
> 
> [0] https://github.com/protocolbuffers/protobuf/commit/78dc67e4d598d4e2ec8929105eb2ddbb4bf50935
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
Applied to master, thanks!

I noticed that we don't have any tests for protobuf/python-protobuf in 
buildroot. Do you think you could maybe contribute one? [1]

[1] 
https://nightly.buildroot.org/manual.html#_using_the_runtime_tests_framework

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
