Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF58C27C6E
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 08:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A11D810D6;
	Sun, 16 Jun 2024 08:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BrjwJmauDbhp; Sun, 16 Jun 2024 08:57:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 749A781204
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 749A781204;
	Sun, 16 Jun 2024 08:57:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB8481BF2C9
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 08:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B193A402C7
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 08:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GZfe3rVXEvq for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 08:57:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3A1D4015E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3A1D4015E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3A1D4015E
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 08:57:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 343BA13F86A;
 Sun, 16 Jun 2024 10:57:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Jun 2024 10:57:14 +0200
Date: Sun, 16 Jun 2024 10:57:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zm6o6hFptzclDC4Z@landeda>
References: <20240615204233.3339310-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240615204233.3339310-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718528237;
 bh=rmpzA2kUHuE6DxRKMG2N+pwKpXjLpZGkIIyduf/CCXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m9s4T6292g/8/JoKfEyhjjRvxrU0hMbljcbOWoHsHwMzufQLAj+AHjvuMFk4botVj
 woYZGgyxDl3TJmFPh9/05rdMgTtGLViyLZxtVB/igmfA2I4RSBlQ53k/w+o4v8/FIR
 tlra1LBZlhl/VBcMZnhaJjiYAWVaxZTJDnpDsO6A75/UHq4xpYF732FpsJ6rEzqSI3
 +Z/pvm6tEaDyzZxAZa/L/m4AegO+lbv3BqUkaInLAVOTGSe555VfPp3rFoIl9XQ2Bs
 mGzaNN4E+OBW+L06pzC7QCkYddXfBDZg0oe6x9H026XudhkNqLPaF9nk10Db6CkesA
 3M40aA2q3lIAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=m9s4T629
Subject: Re: [Buildroot] [PATCH 1/1] package/beecrypt: fix build with gcc 14
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-06-15 22:42 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with gcc 14:
> 
> blockmode.c: In function 'blockEncryptCTR':
> blockmode.c:162:42: error: implicit declaration of function 'swapu32' [-Wimplicit-function-declaration]
>   162 |                                 buf[i] = swapu32(fdback[j]);
>       |                                          ^~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/651e0e31305b1f211071d94ea74f7b7a5793b03e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/beecrypt/0004-beecrypt-4.2.1-c99.patch | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 package/beecrypt/0004-beecrypt-4.2.1-c99.patch
> 
> diff --git a/package/beecrypt/0004-beecrypt-4.2.1-c99.patch b/package/beecrypt/0004-beecrypt-4.2.1-c99.patch
> new file mode 100644
> index 0000000000..489ce437f6
> --- /dev/null
> +++ b/package/beecrypt/0004-beecrypt-4.2.1-c99.patch
> @@ -0,0 +1,17 @@
> +Add missing header to fix C99 conformance in blockmode.c
> +
> +Upstream: https://sourceforge.net/p/beecrypt/patches/13
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for this effort.

However, beecrypt 4.2.1 was the last version to be released, in
2015-07-12, almost nine years ago now. After that, there has been
no development activity on that package.

I looked on Github and Gtilab in case there was something there that
would vaguely resemble a new maintenance effort, but there is
virtually nothing of interest there.

Using a cryptography library that has had no release in almost 9
years is not a good idea, to say the least.

beecrypt only installs a library, and nothing in the tree depends
on it.

I suggest we just drop that package instead.

Regards,
Yann E. MORIN.

> +diff --git a/blockmode.c b/blockmode.c
> +index 46d1fde..9998c23 100644
> +--- a/blockmode.c
> ++++ b/blockmode.c
> +@@ -29,6 +29,7 @@
> + # include "config.h"
> + #endif
> + 
> ++#include "beecrypt/endianness.h"
> + #include "beecrypt/blockmode.h"
> + 
> + int blockEncryptECB(const blockCipher* bc, blockCipherParam* bp, uint32_t* dst, const uint32_t* src, unsigned int nblocks)
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
