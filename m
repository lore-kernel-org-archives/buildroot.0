Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8D7C3601A
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 19:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8F7740E2E;
	Thu,  3 Apr 2025 19:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0A6U7cBpzBY; Thu,  3 Apr 2025 19:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06BBC417CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06BBC417CB;
	Thu,  3 Apr 2025 19:20:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1B7A119
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C388F8124C
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrGC16cNrFee for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 19:20:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 91B6C81289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91B6C81289
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91B6C81289
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:20:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CFE3378035E;
 Thu,  3 Apr 2025 21:20:00 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48944])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 03 Apr 2025 21:20:00 +0200
MIME-Version: 1.0
Date: Thu, 03 Apr 2025 21:20:00 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250402203218.1969523-1-thomas.petazzoni@bootlin.com>
References: <20250402203218.1969523-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <8d8bf5c470feffb820e88eb325740b15@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743708003;
 bh=y5O7f04XrEYkxLS0GvShu9ClUxNbZjC80x4xomdD/yI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D/x1eN4a5oLCdwcUQo7nnhNxnAkuJvR1NWnvb/z22IDm1fUAl+UAnGd4Ne4OlrgkH
 DXrJOAXRuknmUiFo1+/pa8hkpUW0A/834dBC8QrfRpp2KLc3Imx576aZlC9RVtHL3X
 hmxAe9Wzhzsqe0A8CPV0PIKYBYnzDqQfTYs771ATl7TjADnuNwjypXWyZVBvj2+CPj
 RAAhYdWsut+xv2nGiEifoUgwIp0WXJ5dkF/pFPcix+9uaELHWvoz9iyhJ39nytyNjG
 xSFhcrNOy3JJUr5pvgio96WJmUf+/0SOw3i0r5dc5zzkU2d5OW7P4w7IUHnNZfdrWq
 cNAjeKXyFT/bQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=D/x1eN4a
Subject: Re: [Buildroot] [PATCH] package/python3: backport upstream patch to
 fix pyatomic.h headers
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

On 02/04/2025 22:32, Thomas Petazzoni via buildroot wrote:
> Since the bump of Python to 3.13.2, cracklib fails to build when
> Python support is enabled, due to an issue in the Python headers. This
> issue has been fixed upstream in the 3.13.x branch, and this commit
> simply backports the upstream fix.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/26f6fe75f75c65bb9d58bbdbec733ebfe9b8565c/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
