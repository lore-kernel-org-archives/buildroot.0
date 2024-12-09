Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A109E7717D
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 22:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E908608D6;
	Mon,  9 Dec 2024 22:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3DKvnjRFoOsr; Mon,  9 Dec 2024 22:26:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01E50608FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01E50608FA;
	Mon,  9 Dec 2024 22:26:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99E586F
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8502840B29
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lY6aJ1uypn3n for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 22:26:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 156D340B22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 156D340B22
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 156D340B22
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:26:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 3E0C6B00539;
 Mon,  9 Dec 2024 23:26:48 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42992])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 09 Dec 2024 23:26:48 +0100
MIME-Version: 1.0
Date: Mon, 09 Dec 2024 23:26:48 +0100
From: Julien Olivain <ju.o@free.fr>
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241208164230.87048-1-christian@aperture.us>
References: <20241208164230.87048-1-christian@aperture.us>
User-Agent: Webmail Free/1.6.9
Message-ID: <c39480c885f04495597e2e16f2999f93@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733783211;
 bh=R0yoye03e9CsSaiHQ6pjyzux5uwfrAmwNqsqFCznp60=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d98bX1xtANQ5Oxb5Uv9hW5BnvuaqN5rw99u2EqF4I/UlEa0E+4PqX7MtcKtFeuFCE
 bLO3CCZl7KrwdPUXJlzNXXFaQGHhoRqRfdLYCig3RKd+r7IUD5uql8jokPghfEI7Ea
 mgj9wACGJqWKt2/rhujo4JvzfSp2N+cCnCjMmHVVAPb/zz/PzqaFL2dmt6YDaC1ygR
 yj+LJ6zeWyfRI24zHaa+76fjWC/+GPWngKTwEXOKlozTo4B60Xj+Cmc95Qp5orN4yJ
 Q8SzNdNMzWwArj0b2TbKd8hjAEoaC8NJd7/MQSfsbaOlbO1vwk3K74IgPCUQrnWXR8
 oXnsnPVq9Opyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=d98bX1xt
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.23.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/12/2024 17:42, Christian Stewart via buildroot wrote:
> go1.23.4 (released 2024-12-03) includes fixes to the compiler, the 
> runtime, the trace command, and the syscall package.
> 
> https://go.dev/doc/devel/release#go1.23.4
> https://github.com/golang/go/issues?q=milestone%3AGo1.23.4+label%3ACherryPickApproved
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.

> ---
>  package/go/go-bin/go-bin.hash | 14 +++++++-------
>  package/go/go-src/go-src.hash |  2 +-
>  package/go/go.mk              |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/package/go/go-bin/go-bin.hash 
> b/package/go/go-bin/go-bin.hash
> index 5f008c773e..37e1db20a9 100644
> --- a/package/go/go-bin/go-bin.hash
> +++ b/package/go/go-bin/go-bin.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  
> 8d6a77332487557c6afa2421131b50f83db4ae3c579c3bc72e670ee1f6968599  
> go1.23.3.src.tar.gz
> -sha256  
> 3d7b00191a43c50d28e0903a0c576104bc7e171a8670de419d41111c08dfa299  
> go1.23.3.linux-386.tar.gz
> -sha256  
> a0afb9744c00648bafb1b90b4aba5bdb86f424f02f9275399ce0c20b93a2c3a8  
> go1.23.3.linux-amd64.tar.gz
> -sha256  
> 1f7cbd7f668ea32a107ecd41b6488aaee1f5d77a66efd885b175494439d4e1ce  
> go1.23.3.linux-arm64.tar.gz
> -sha256  
> 5f0332754beffc65af65a7b2da76e9dd997567d0d81b6f4f71d3588dc7b4cb00  
> go1.23.3.linux-armv6l.tar.gz
> -sha256  
> e3b926c81e8099d3cee6e6e270b85b39c3bd44263f8d3df29aacb4d7e00507c8  
> go1.23.3.linux-ppc64le.tar.gz
> -sha256  
> 6bd72fcef72b046b6282c2d1f2c38f31600e4fe9361fcd8341500c754fb09c38  
> go1.23.3.linux-s390x.tar.gz
> +sha256  
> ad345ac421e90814293a9699cca19dd5238251c3f687980bbcae28495b263531  
> go1.23.4.src.tar.gz
> +sha256  
> 4a4a0e7587ef8c8a326439b957027f2791795e2d29d4ae3885b4091a48f843bc  
> go1.23.4.linux-386.tar.gz
> +sha256  
> 6924efde5de86fe277676e929dc9917d466efa02fb934197bc2eba35d5680971  
> go1.23.4.linux-amd64.tar.gz
> +sha256  
> 16e5017863a7f6071363782b1b8042eb12c6ca4f4cd71528b2123f0a1275b13e  
> go1.23.4.linux-arm64.tar.gz
> +sha256  
> 1f1dda0dc7ce0b2295f57258ec5ef0803fd31b9ed0aa20e2e9222334e5755de1  
> go1.23.4.linux-armv6l.tar.gz
> +sha256  
> 65a303ef51e48ff77e004a6a5b4db6ce59495cd59c6af51b54bf4f786c01a1b9  
> go1.23.4.linux-ppc64le.tar.gz
> +sha256  
> 74aab82bf4eca7c26c830a5b0e2a31d193a4d5ba47045526b92473cc7188d7d7  
> go1.23.4.linux-s390x.tar.gz
>  sha256  
> 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  
> LICENSE
> diff --git a/package/go/go-src/go-src.hash 
> b/package/go/go-src/go-src.hash
> index 1a185d011c..0b11d8d392 100644
> --- a/package/go/go-src/go-src.hash
> +++ b/package/go/go-src/go-src.hash
> @@ -1,3 +1,3 @@
>  # From https://go.dev/dl
> -sha256  
> 8d6a77332487557c6afa2421131b50f83db4ae3c579c3bc72e670ee1f6968599  
> go1.23.3.src.tar.gz
> +sha256  
> ad345ac421e90814293a9699cca19dd5238251c3f687980bbcae28495b263531  
> go1.23.4.src.tar.gz
>  sha256  
> 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  
> LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 3dd590bf6f..91d9f8d1c1 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -GO_VERSION = 1.23.3
> +GO_VERSION = 1.23.4
> 
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
