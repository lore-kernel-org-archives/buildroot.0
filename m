Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F60D6408D
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 21:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 014796079B;
	Fri,  8 Nov 2024 21:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LP8jkmWVKs_8; Fri,  8 Nov 2024 21:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0621860A77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0621860A77;
	Fri,  8 Nov 2024 21:31:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5A56D8F
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 21:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90AA7431D6
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 21:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmwEsHdZuQ4z for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 21:31:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 563F44021C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 563F44021C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 563F44021C
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 21:31:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6D462B0057C;
 Fri,  8 Nov 2024 22:30:56 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60242])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 Nov 2024 22:30:56 +0100
MIME-Version: 1.0
Date: Fri, 08 Nov 2024 22:30:56 +0100
From: Julien Olivain <ju.o@free.fr>
To: Ralf Dragon <hypnotoad@lindra.de>
Cc: buildroot@buildroot.org, Martin Kepplinger <martink@posteo.de>
In-Reply-To: <20241004172105.2050317-1-hypnotoad@lindra.de>
References: <20241004172105.2050317-1-hypnotoad@lindra.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <7c7ce73dc8e4e01fa7fda713eababd97@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731101458;
 bh=T5a3ARZdLOtEfG5fYtLrPLuVnoQqIcaxJyMOdaKlDy8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sVlXcX1yR9coBqoJYCORNOJtR0uaV2Iipl/se1MkRwqMGVOXNE0gT5Qnm3HWH3h5J
 iwQk3OBJwOIYQO+R7C3IxklcROblHZGmk0CpM+KbHkAXJko9Fjq0fanA6hBNCO7xAa
 1uLt1B8rmFUBB/6imJbiavo8t4aHmqCUhhHFFtgiGfR5L5cEa7UWD+A3gGn9ccNpwb
 xWASIFYICkZ/EynD8tKvntb3aZyaOKKeyLUmCGwYAIGotTtLkNEEABeBbFVwLmMkce
 xhhimfgt70yZpg3v91WoJvzx3qMzOWjkVT5w51SergJLBcrjh/p9J2e+ltrSdH+5yB
 BjdXr6PNCSvoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sVlXcX1y
Subject: Re: [Buildroot] [PATCH] package/x11vnc: Fix multiple symbol
 definition error
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

Hi Ralf,

Thanks for the patch!

For info, I applied a similar patch:
https://gitlab.com/buildroot.org/buildroot/-/commit/e5bb457d5d703aa327354236729dff1f261348ac
It was adding the "Upstream:" tags.

On 04/10/2024 19:21, Ralf Dragon wrote:
> Error seems to happen if LIBVNCSERVER_HAVE_LIBPTHREAD is defined:
> /bin/ld: x11vnc-xwrappers.o:(.bss+0x494): multiple definition of
> `clientMutex'; x11vnc-8to24.o:(.bss+0x59600): first defined here
> 
> Patch is from https://bugs.gentoo.org/706840 . It moves the
> implementation from header to a source file, thus avoiding multiple
> definitions.
> 
> Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>
> ---
> Backport to: 2024.02.x
> ---
>  .../x11vnc/0003-Fix-multi-definition.patch    | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/x11vnc/0003-Fix-multi-definition.patch
> 
> diff --git a/package/x11vnc/0003-Fix-multi-definition.patch 
> b/package/x11vnc/0003-Fix-multi-definition.patch
> new file mode 100644
> index 0000000000..504159efe9
> --- /dev/null
> +++ b/package/x11vnc/0003-Fix-multi-definition.patch
> @@ -0,0 +1,45 @@
> +From a48b0b1cd887d7f3ae67f525d7d334bd2feffe60 Mon Sep 17 00:00:00 2001
> +From: Alexander Tsoy <alexander@tsoy.me>
> +Date: Tue, 28 Jan 2020 22:21:01 +0300
> +Subject: [PATCH] Fix build with -fno-common
> +
> +GCC 10 defaults to -fno-common
> +---
> + src/util.c | 3 +++
> + src/util.h | 6 +++---
> + 2 files changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/util.c b/src/util.c
> +index a82a1a4..6a52ebf 100644
> +--- a/src/util.c
> ++++ b/src/util.c
> +@@ -47,6 +47,9 @@ int hxl = 0;
> + #ifdef LIBVNCSERVER_HAVE_LIBPTHREAD
> + MUTEX(x11Mutex);
> + MUTEX(scrollMutex);
> ++MUTEX(clientMutex);
> ++MUTEX(inputMutex);
> ++MUTEX(pointerMutex);
> + #endif
> +
> + int nfix(int i, int n);
> +diff --git a/src/util.h b/src/util.h
> +index 35c1afd..99b5dd1 100644
> +--- a/src/util.h
> ++++ b/src/util.h
> +@@ -102,9 +102,9 @@ extern struct timeval _mysleep;
> + #ifdef LIBVNCSERVER_HAVE_LIBPTHREAD
> + extern MUTEX(x11Mutex);
> + extern MUTEX(scrollMutex);
> +-MUTEX(clientMutex);
> +-MUTEX(inputMutex);
> +-MUTEX(pointerMutex);
> ++extern MUTEX(clientMutex);
> ++extern MUTEX(inputMutex);
> ++extern MUTEX(pointerMutex);
> + #endif
> +
> + #define X_INIT INIT_MUTEX(x11Mutex)
> +--
> +2.24.1
> +
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
