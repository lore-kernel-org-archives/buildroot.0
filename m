Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A7CC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 15:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD91400F7;
	Sun,  5 May 2024 15:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wp3QJzCUeu9Q; Sun,  5 May 2024 15:40:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26F4040270
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26F4040270;
	Sun,  5 May 2024 15:40:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6DCBA1BF82D
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 663C7400F7
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TS7Jx_UW_FLV for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 15:40:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03E7940270
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03E7940270
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03E7940270
 for <buildroot@buildroot.org>; Sun,  5 May 2024 15:40:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4BEAC13F861;
 Sun,  5 May 2024 17:40:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 17:40:04 +0200
Date: Sun, 5 May 2024 17:40:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZjeoVFEHUkKluaqP@landeda>
References: <20240503195304.1277312-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240503195304.1277312-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714923607;
 bh=ucgvXdRYjCID95SGmNM5nGGADkRp+fYWE3JIUri8LfE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j88rFWx823xVT4Ksecfi0d1ymzCQxTKucd2dFKk9yNLFfb1DxbVryRDtE6wxHZnBd
 NV9+clKzXrmiXWYQSoZ6teXQzKZtQHEltpunoK9SCFNCtxJMkjuMNPjoR07tUj28/a
 jGkhaht77q3Fd5zSIFVfFumyUvEQrNsW6VyBmPRcUBQ40n55jcQBNxLAYyLx2OgYld
 VK/MSsHxGQmDwhl4HE0JgjFnGB5klFvZo7UmVI+6a1CaSpLwzE63OAWtKU5ziVDDGF
 PE+ke8IW+QG92SBlafnbkv2bz8ThDK58ZXwn7u2dJONcU/Pl0NnyKqy+Znh2py8wEv
 P3gofIQ2ByM4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=j88rFWx8
Subject: Re: [Buildroot] [PATCH 1/1] package/zziplib: bump to version 0.13.74
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-05-03 21:53 +0200, Fabrice Fontaine spake thusly:
> - Drop patches (already in version)
> - docs/copying.htm renamed to docs/copying.htm.md with
>   https://github.com/gdraheim/zziplib/commit/b8138ba56ecb9d5d27c22d85fae37bdd594d2edb
> 
> https://github.com/gdraheim/zziplib/blob/v0.13.74/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/zziplib/zziplib.hash b/package/zziplib/zziplib.hash
> index b6a75ae0cb..3bff51f07f 100644
> --- a/package/zziplib/zziplib.hash
> +++ b/package/zziplib/zziplib.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  93ef44bf1f1ea24fc66080426a469df82fa631d13ca3b2e4abaeab89538518dc  zziplib-0.13.72.tar.gz
> +sha256  319093aa98d39453f3ea2486a86d8a2fab2d5632f6633a2665318723a908eecf  zziplib-0.13.74.tar.gz
>  sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  docs/COPYING.LIB
>  sha256  c2aa7d58cebd24cb877bbf11d6b13a4bb7cd08b9d7db5d3037ca06c46bf4cfd8  docs/COPYING.MPL
> -sha256  1c6da11efe8c43ee853fe5b21501dd72b81831ae84d58ea376bddc0620a5c361  docs/copying.htm
> +sha256  9418aca218090f0bebfa91298c8145c7342de095eced3d72ea241c178df59368  docs/copying.htm.md

docs/copying.htm was not just copied to docs/copying.htm.md, its content
was also changed, so we need an explanation why the hash changed. In
this case, that's because it was reformatted from HTML to Markdown.

I've added a little blurb about that, and applied to master, thanks.

Regards,
Yann E. MORIN.

> diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
> index 6cb9dedce8..0ef53436d2 100644
> --- a/package/zziplib/zziplib.mk
> +++ b/package/zziplib/zziplib.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -ZZIPLIB_VERSION = 0.13.72
> +ZZIPLIB_VERSION = 0.13.74
>  ZZIPLIB_SITE = $(call github,gdraheim,zziplib,v$(ZZIPLIB_VERSION))
>  ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
> -ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm
> +ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm.md
>  ZZIPLIB_CPE_ID_VALID = YES
>  ZZIPLIB_INSTALL_STAGING = YES
>  ZZIPLIB_CONF_OPTS += \
> -- 
> 2.43.0
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
