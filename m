Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4A5E66882
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 20:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26DE460B98;
	Fri, 19 Dec 2025 20:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyXze_jGMQtP; Fri, 19 Dec 2025 20:52:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7425060B05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766177540;
	bh=Qb+0XJRWqg8uPcn0JVfqjW3fI0LKgUP3JIyweg9AQ7Y=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LNm1kdHlZ8wd48WKxYeLlNOtNsuWbGxsDaNPuZiKG/+q+k9LVzaX0+2HWnWp9HIVZ
	 48YZJzjf3kDwH9tQE3pZ2yOIiRdNmaYgOHkc1vxLs8t+BJnA9HeGWoxPNcIB9iL9Iv
	 e4TkosOBqrfaqElrqzhBu6A4Uq3o+hF7f+Wznv0zYC3FERS/dAT1iMW8mvVD83DxR4
	 7qWojXNf1XwI9TfFWrCg2PKvUxKe5YJKJ6Jsb+7syNG34GphikthOF+14pY5DXTgUZ
	 +5yPNUPqNYGF6Qc+MKeIIs9lZ6cNyJnzSY0n1mtTfLn6ZNdVZz7zYp0cWvu4c00wPJ
	 GyzYhO4lp6pnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7425060B05;
	Fri, 19 Dec 2025 20:52:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B719D293
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 20:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E0A140E46
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 20:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJxrzdJi9NAJ for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 20:52:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C779440D71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C779440D71
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C779440D71
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 20:52:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id ACD3620039C;
 Fri, 19 Dec 2025 21:52:03 +0100 (CET)
Received: from 2a0d:e487:418e:8c09:857b:bc67:c232:7cba
 via 2a0d:e487:418e:8c09:857b:bc67:c232:7cba by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 19 Dec 2025 21:52:03 +0100
MIME-Version: 1.0
Date: Fri, 19 Dec 2025 21:52:03 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20251219181944.1912692-1-bernd@kuhls.net>
References: <20251219181944.1912692-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <bbc264df9cef61e1e4d2114bac857cac@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766177527;
 bh=9+4ngzIjS/CBt5srpdm/OSyVUC1ruyQzrSl93cscKNE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lumCmcknWR/9ZT/damBjYfDcuw5CnEu4Sx/gRWOlq9grMUgRjbf7e6nMRDTVow8L9
 kVP4cJ2nDFHbHXmRQQWAdCIaz39F2oyPvB9B6J/URtxw9+0vvEuINyAbS0iDwCM32/
 dFHNHGkbhbwLVyykkosKV9AJaFsaxezuwtBYgVv/IjXwsy/ebbWSC0vVFHiBGJ9Hub
 8uHjUnv1enipermOV37OizY3AV7zsGCuDKhpG3GxZo29UAam0KTqSCgxrUUfxbC8jQ
 irgwEhYH9ZSdBiMZW+evKqPMKpoVigmDxZJ0Ct8NdUzQDeYQqdoIm2KGbjDnR32stF
 WUgeKUwRlFDTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lumCmckn
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gpiod: fix md5 hash
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

On 19/12/2025 19:19, Bernd Kuhls wrote:
> Buildroot commit b243b77ebe5eedf8fbc683d5539d9bf386da4420 added this
> package including a hash file containing a typo of the tarball filename
> for the md5 hash. Updated comment as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
