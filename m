Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D571091917
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 20:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DF04615D7;
	Thu, 19 Mar 2026 20:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etHGvz0Qpgro; Thu, 19 Mar 2026 20:55:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DEAB61631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773953729;
	bh=KdMtVmjIVj7Zn8IKfNxKtvrP+JKqYLKzbGtXQAHbiaI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GpQT4aIJ71v4NJgaqC9P0hP7y0vEPqeQksV/0xYdXKd0Vs+Tw99Pj42LoWCqCNIU7
	 PlaPMGscHLZzN5uRnUqEa8rHBSQs85eldwIsm00o0siPa607DwgBAHYLma/0cOTy6W
	 NvMerW0+NwWwBt6vUVe7EvK0bIFRYq38xI0Ytf0gohFF/Jeflxq8FUSv/5h/ZqIbck
	 p/PEjebFR1MudWVkC5ypTTwuzsIezBG3S4qIlFH89tY/fKm85KwUDeoViHmoF6qyEP
	 ZQCx94EuaF86oPzsX4me8/1PdqtH/zZ7B3b4ZXlGFCaQPVbRLZCFLMAeAoQ51uEy/n
	 AqKzJzmgEoYxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DEAB61631;
	Thu, 19 Mar 2026 20:55:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 717E525C
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63112411F2
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 20:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hsY7H77CuDu for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 20:55:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7128C40DD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7128C40DD6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7128C40DD6
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 20:55:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id F271D2003B4;
 Thu, 19 Mar 2026 21:55:22 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 19 Mar 2026 21:55:22 +0100
MIME-Version: 1.0
Date: Thu, 19 Mar 2026 21:55:22 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260318213805.640458-1-ju.o@free.fr>
References: <20260318213805.640458-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <9c2d07bd0a2ebf510ae496045cc593c0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773953724;
 bh=eccymW0KFTX1MlsYBpZb7nRf9z33A2N2PQvLQ/0P5lw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aGJFZSI+JhIl21QSp3ris2Rym3hBTBiWO99g1Lld7Ww1rhi8WAGuFJxyDvWfUcS9V
 0e4Nj1sEre6ewfpeY4plOI8ddicexSyH526TmQJJITa0dpJ2A1ZXdhpWYHZ/YIDa7B
 /Pp4y9++3aap4aa7UcFJKAqvAdtPklxC6n4Cd2vRmmPqFkJHmH4GEjjh6k8l0tAi0z
 dCJ8RY2eHq7i++CatVbBfIxLPdEbOg5k3phbYDYzsPb9ebfq7PrgtbA2KGk2JOQP2P
 FleZj/R24d8VUu5f5ALGkH6z2MiQwRkbIy72bg+2Lx5/Pq0NStJhYJhabHmH8B0iJe
 uuU43Qd3GZP8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aGJFZSI+
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_aichat: improve
 test reliability
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

On 18/03/2026 22:38, Julien Olivain via buildroot wrote:
> Since llama.cpp update in Buildroot commit [1], the test_aichat can
> fail for several reasons:
> 
> The loop checking for the llama-server availability can fail if curl
> succeed, but the returned json data is not formatted as expected.
> This can happen if the server is ready but the model is not completely
> loaded. In that case, the server returns:
> 
>     {"error":{"message":"Loading 
> model","type":"unavailable_error","code":503}}
> 
> This commit ignore Python KeyError exceptions while doing the
> server test, to avoid failing if this message is received.
> 
> Also, this new llama-server version introduced a prompt caching, which
> uses too much memory. This commit completely disable this prompt
> caching by adding "--cache-ram 0" in the llama-server options.
> 
> [1] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/05c36d5d875713521f99b7bad48be316dcde2510
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
