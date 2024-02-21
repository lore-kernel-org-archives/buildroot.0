Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11B9C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 17:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC8876064F;
	Wed, 21 Feb 2024 17:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iuXKmBZ0ohGV; Wed, 21 Feb 2024 17:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B812460666
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B812460666;
	Wed, 21 Feb 2024 17:59:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1EF21BF29D
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECE55812CA
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mw6cV5FbusPN for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 17:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F1AD0812A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1AD0812A9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1AD0812A9
 for <buildroot@busybox.net>; Wed, 21 Feb 2024 17:59:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DA85213F899;
 Wed, 21 Feb 2024 18:59:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Feb 2024 18:59:46 +0100
Date: Wed, 21 Feb 2024 18:59:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Vetter <jubalh@iodoru.org>
Message-ID: <ZdY6EhxgyarpvZ01@landeda>
References: <20240221143001.30174-1-jubalh@iodoru.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240221143001.30174-1-jubalh@iodoru.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708538389;
 bh=euu4/rdXVhLEVN+Cu2xRQtbNi2zoIFvkRs1qXXIBFAI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=odjSbrDFWA+YEbdbZLtwpEohRXiAkfD4giAD08HnqwDvwRDIluaPAzBJRl81FbIoF
 3a3GXJVGQI/MF7+6Xog0XAsJODF/L9DPTW2pFqdddr0Fv7mvDOm87GKBRFn4BfWLZ3
 X2Rx5NCjonEEG4KVgNor5l3IU2xvtTJlVcZDGAWvfami9rplx0nbiQe9NmsB+UJMcV
 paTxMTyde7MbhhQDZYOrpBEsb5Ow5hypyDh09RiJXsG2dzKDGQ/MttrDjGm9hl6E96
 j2PZgZbyvqARrK0kPnHjKlcR31eRArQbxqMIS9MNnCzBIbHbdIci4oeFUYuArBjxbH
 UkL6PAMXraV5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=odjSbrDF
Subject: Re: [Buildroot] [PATCH 1/1] package/libstrophe: bump to version
 0.13.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2024-02-21 15:30 +0100, Michael Vetter spake thusly:
> Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libstrophe/libstrophe.hash | 2 +-
>  package/libstrophe/libstrophe.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
> index e284e8cca6..ec5a55985a 100644
> --- a/package/libstrophe/libstrophe.hash
> +++ b/package/libstrophe/libstrophe.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  8d7c17c694efff7d2e2d3632684537e7ba874ce3d7f0e750a539f2299021bbaa  libstrophe-0.13.0.tar.xz
> +sha256  86c0abd348ae66feb40b6886f2c7f04525f1d5b20a48c10d4db4ed532dc63f22  libstrophe-0.13.1.tar.xz
>  sha256  82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
> diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
> index 257593bbec..42d582fe9c 100644
> --- a/package/libstrophe/libstrophe.mk
> +++ b/package/libstrophe/libstrophe.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBSTROPHE_VERSION = 0.13.0
> +LIBSTROPHE_VERSION = 0.13.1
>  LIBSTROPHE_SOURCE = libstrophe-$(LIBSTROPHE_VERSION).tar.xz
>  LIBSTROPHE_SITE = https://github.com/strophe/libstrophe/releases/download/$(LIBSTROPHE_VERSION)
>  LIBSTROPHE_DEPENDENCIES = host-pkgconf
> -- 
> 2.35.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
