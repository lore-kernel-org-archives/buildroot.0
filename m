Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FFBCCF9E3
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 16:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7598C407F6;
	Sat, 25 Oct 2025 16:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNDngY1CoMk2; Sat, 25 Oct 2025 16:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F9DA4022A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F9DA4022A;
	Sat, 25 Oct 2025 16:58:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B411FD7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 16:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99FF7608BB
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 16:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwMAwulK5Aj2 for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 16:58:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 983A06081F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 983A06081F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 983A06081F
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 16:58:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8CFB519F5C3;
 Sat, 25 Oct 2025 18:58:43 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Oct 2025 18:58:43 +0200
MIME-Version: 1.0
Date: Sat, 25 Oct 2025 18:58:43 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251022163104.17325-1-dario.binacchi@amarulasolutions.com>
References: <20251022163104.17325-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ce82f708b69863b7c2e1f4afea343956@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761411524;
 bh=CnDnX3EGGvunjMqr/HhXPwoKh/4RDB93VEafuM5GBWw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dTLcBrAKps9J7pdtfWi9kIgWNydfrqABGH7GX9D/XGysN7VklD0sv0hW3nWXHNCEl
 mikpAwNLOM4yAhoqSpkQ/XTI2wJD6vj+Uwr/3ddMPqS/qRfs/wmC+rx5dl2DWBh1Wq
 uDihJdNkPKqsZNNGRqOoldKj/W9GX4WGbpEw+AQPxIFOpGt87d0bFp9uyweqNhjuUP
 HBuI4Godw6QyEGD8AVte3A4nsD8PcgATKBAbMACwu3JquLuA0l4EpwW0Q8a6JWDlBO
 pEntuaL0g9mcnP7MfTntkZUaT69AotIq4ruWB56zyl0o70RUFByxbM3md6SLMisnRw
 L7U9T6hitBrWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dTLcBrAK
Subject: Re: [Buildroot] [PATCH 1/3] package/libgphoto2: fix build with gcc
 >= 14
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

On 22/10/2025 18:31, Dario Binacchi wrote:
> The commit adds a backported upstream patch to fix the following build
> failure:
> 
> ptp2/ptp-pack.c:3168:31: note: earlier argument should specify number 
> of elements, later size of each element
> ptp2/chdk.c: In function 'yuv_live_to_jpeg':
> ptp2/chdk.c:1203:41: error: passing argument 3 of 'jpeg_mem_dest' from 
> incompatible pointer type [-Wincompatible-pointer-types]
>  1203 |         jpeg_mem_dest (&cinfo, &outbuf, &outlen);
>       |                                         ^~~~~~~
>       |                                         |
>       |                                         uint64_t * {aka long 
> long unsigned int *}
> In file included from ptp2/chdk.c:31:
> /home/autobuild/autobuild/instance-0/output-1/per-package/libgphoto2/host/armeb-buildroot-linux-gnueabi/sysroot/usr/include/jpeglib.h:989:43: 
> note: expected 'long unsigned int *' but argument is of type 'uint64_t 
> *' {aka 'long long unsigned int *'}
>   989 |                            unsigned long *outsize);
> 
> Fixes:
> - 
> https://autobuild.buildroot.org/results/db742e301a401c9f4bdf3c7e8cfde9f0ba1c4558
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
