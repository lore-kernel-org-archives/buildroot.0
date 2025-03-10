Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E52AC282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 20:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E84A140BB8;
	Mon, 10 Mar 2025 20:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ml_FvvcdKvvt; Mon, 10 Mar 2025 20:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBBF040BB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBBF040BB9;
	Mon, 10 Mar 2025 20:18:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 932781C1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 20:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77A6981397
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 20:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrgMoMlBI0Vc for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 20:18:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E61E81236
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E61E81236
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E61E81236
 for <buildroot@busybox.net>; Mon, 10 Mar 2025 20:18:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3816278035E;
 Mon, 10 Mar 2025 21:18:43 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Mar 2025 21:18:43 +0100
MIME-Version: 1.0
Date: Mon, 10 Mar 2025 21:18:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: Michael Fischer <mf@go-sys.de>
Cc: buildroot@busybox.net
In-Reply-To: <20250310141048.18154-1-mf@go-sys.de>
References: <20250310141048.18154-1-mf@go-sys.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <6a3660b7ea80c5b5e6d56f5ab890e970@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741637924;
 bh=yyAFiOUg8dZcFGsHj2j1Mmk/E6BCYRraH1DY/5EPBXc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DP5VEbZJT96eB9juzS7Kew9kG5YOPNUFraVnILLIJB5iGt88HFGtEE9O5VuqfQ+qC
 6VGCdNamga8O3isIpHTjzrEsK4VrTVKnwgTUbZ5IoX0UdsOoKNICTnPQw3h5CgN/nt
 8rYyD/z1tVuk67/JekPSVd3JrnwuFLq1xyfARIjKqM98hH5v8H/xS5+43irp7jEfNt
 uCjNEOG3RCC8j8KKouyCdpbqz9JRrlY6b4mlKzjpz3JCEXdwGAiyc4hxi17xU60jQE
 YZkxc0YOxZ0mjsU53GOgqP3RVPaksdYT97EcYxrNOVBHR8jhynR+qe+ubYlwhZ0N0K
 ahd7J/InkBE7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DP5VEbZJ
Subject: Re: [Buildroot] [PATCH] package/sdl2: bump version to 2.32.2
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

On 10/03/2025 15:10, Michael Fischer wrote:
> Release notes:
> https://github.com/libsdl-org/SDL/releases/tag/release-2.32.2
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
