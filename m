Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F233D5E37A
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 18:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 659E684101;
	Sat,  9 Nov 2024 18:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8TR7jp8b6mW; Sat,  9 Nov 2024 18:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7821C84164
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7821C84164;
	Sat,  9 Nov 2024 18:27:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F388D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F1494021A
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TfY6fDCOzbX for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 18:27:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 977C440462
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 977C440462
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 977C440462
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:27:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BAB1AB00571;
 Sat,  9 Nov 2024 19:27:40 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54012])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Nov 2024 19:27:40 +0100
MIME-Version: 1.0
Date: Sat, 09 Nov 2024 19:27:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20241104212118.1442429-1-petr.vorel@gmail.com>
References: <20241104212118.1442429-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <7795ac034059913362bcd00f948099f7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731176863;
 bh=07iszn4D3uQ9zsfLFSMq7OmTBneUEeeRaS9DrFJZxy0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RupOIsOL8CE3wxvWTNHhBMMEfX07d/Wx4ESeeqy8QBRyjFNhzbdFaYIbMOK0Yjbft
 0SdOI7UWwMmepnxQ0PrRXANB/vnN5uXI3Eh74N6quN6133YU+RR/pEblUSm+zqwc6Q
 M9PPs9Yr+6UdxmkjXYE6E2RXDKbiKKcweSlZD2pyjqtRynZFSy4IuIEentDCiBazBn
 1eC4OOdIvEEGeJXb776Qd5AbxqNBzlzfLd+fGSG/vCLhYVUL7REDLRgioO9B5H9T/j
 XQgFRceSzLQZ87Z44fcszjqeoG6KEz8tXddTcNmmpyRnprfxJh553vAlOzLk/5Unqh
 bqkPVXAFhRHvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RupOIsOL
Subject: Re: [Buildroot] [PATCH] package/libtirpc: bump version to 1.3.6
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

On 04/11/2024 22:21, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks!

> ---
>  package/libtirpc/libtirpc.hash | 4 ++--
>  package/libtirpc/libtirpc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libtirpc/libtirpc.hash 
> b/package/libtirpc/libtirpc.hash
> index b1113264ae..946e30b807 100644
> --- a/package/libtirpc/libtirpc.hash
> +++ b/package/libtirpc/libtirpc.hash
> @@ -1,5 +1,5 @@
>  # From sourceforge's info on download page:
> -sha1  f5b209b2a7f3ffcdcff5b5b54fefc6a90ddec0d3  libtirpc-1.3.5.tar.bz2
> +sha1  03352908461ad2122e5be4a678893aaa2ad2ac45  libtirpc-1.3.6.tar.bz2
>  # Locally computed
> -sha256  
> 9b31370e5a38d3391bf37edfa22498e28fe2142467ae6be7a17c9068ec0bf12f  
> libtirpc-1.3.5.tar.bz2
> +sha256  
> bbd26a8f0df5690a62a47f6aa30f797f3ef8d02560d1bc449a83066b5a1d3508  
> libtirpc-1.3.6.tar.bz2
>  sha256  
> 17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  
> COPYING
> diff --git a/package/libtirpc/libtirpc.mk 
> b/package/libtirpc/libtirpc.mk
> index 1020c512a0..2d2675895c 100644
> --- a/package/libtirpc/libtirpc.mk
> +++ b/package/libtirpc/libtirpc.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBTIRPC_VERSION = 1.3.5
> +LIBTIRPC_VERSION = 1.3.6
>  LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
>  LIBTIRPC_SITE = 
> http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
>  LIBTIRPC_LICENSE = BSD-3-Clause
> --
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
