Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6DBC48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 20:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDF63418C4;
	Wed, 21 Feb 2024 20:19:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JRANeFdzmN0C; Wed, 21 Feb 2024 20:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F08C7418C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F08C7418C7;
	Wed, 21 Feb 2024 20:19:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60FED1BF947
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A0AA60E91
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:19:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dgjkZDkCM0jB for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 20:19:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B96560E40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B96560E40
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B96560E40
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 20:19:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5699913F8A2;
 Wed, 21 Feb 2024 21:19:19 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Feb 2024 21:19:19 +0100
Date: Wed, 21 Feb 2024 21:19:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZdZax_GVXD6kZko1@landeda>
References: <20240221181650.1115046-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240221181650.1115046-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708546761;
 bh=iWbZLS2+1S62Y447VO8ExmtY+s5rCkalhHP5FRHImqE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dtjrXqufiVpaJJEy6fThXdRa2xFPitN6Z8dyf4KQQzHwstihlP4eHcQwnwcKVibWI
 3WpVXjckGzgSz/kJRC9/ozt6BaTI9agxXUzFBiT29SHukP9qmGPsjYLlqNiPtGjxN0
 g+gE9APec7wFBbgw6jNEEdVMBRsAeJPi+xmo057GtHRzndZ4KOP/OrL08lbC4ztNTF
 z4LxRdQ/LWt8t9FTMo8IoQnCxyKVkWgvYOq2Ortkgwer4HnsvpKmV+lGv2cD45xyMj
 om40wegncpz0SELXz9WwHtyDiJD5PIcF3GitgdPknQdcsako8+q0YJ1qf3UQiIZmWI
 kHQ1sj0zCJlOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dtjrXquf
Subject: Re: [Buildroot] [PATCH v2,1/1] package/zlib-ng: fix arm build
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

On 2024-02-21 19:16 +0100, Fabrice Fontaine spake thusly:
> zlib-ng usage uses CMAKE_C_COMPILER_TARGET which is non-standard and
> is not supposed to be used by the CMakeLists.txt machinery of a
> particular package.
> 
> Indeed, [1] specifies that:
> 
>   Some compiler drivers are inherently cross-compilers, such as clang
>   and QNX qcc. These compiler drivers support a command-line argument
>   to specify the target to cross-compile for.
> 
> buildroot is not using clang nor QNX qcc.
> [2] also refers to this variable only for clang [3] and QNX [4].
> 
> Therefore, zlib-ng's usage of this variable is a bit of a hack, and it's
> actually why it works when passed as an argument, because they are in
> fact not supposed to use this variable.
> 
> So set CMAKE_C_COMPILER_TARGET to BR2_ARCH to fix the following arm
> build failure raised since bump to version 2.0.6 in commit
> d2249821d3f30202ca2a35ad24918378d9a0a0e8:
> 
> -- Detecting C compile features - done
> -- Arch not recognized, falling back to cmake arch: 'l'
> -- Basearch 'l' not recognized, defaulting to 'x86'.
> -- Basearch of 'l' has been detected as: 'x86'
> 
> [...]
> 
> /home/buildroot/autobuild/instance-0/output-1/build/zlib-ng-2.1.3/arch/x86/x86_features.c:17:12: fatal error: cpuid.h: No such file or directory
>    17 | #  include <cpuid.h>
>       |            ^~~~~~~~~
> 
> [1] https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_COMPILER_TARGET.html
> [2] https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html
> [3] https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html#cross-compiling-using-clang
> [4] https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html#cross-compiling-for-qnx
> 
> Fixes: d2249821d3f30202ca2a35ad24918378d9a0a0e8
>  - http://autobuild.buildroot.org/results/1551aa69be19239a8d8e081f033e4027d679ab8f
>  - http://autobuild.buildroot.org/results/075d704c0f11710353bac43478e4501addcd747d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni and Peter Korsgaard):
>  - Update commit message
> 
>  package/zlib-ng/zlib-ng.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
> index fbb906503a..33e8754c9d 100644
> --- a/package/zlib-ng/zlib-ng.mk
> +++ b/package/zlib-ng/zlib-ng.mk
> @@ -13,6 +13,7 @@ ZLIB_NG_PROVIDES = zlib
>  
>  # Build with zlib compatible API, gzFile support and optimizations on
>  ZLIB_NG_CONF_OPTS += \
> +	-DCMAKE_C_COMPILER_TARGET=$(BR2_ARCH) \
>  	-DWITH_GZFILEOP=1 \
>  	-DWITH_OPTIM=1 \
>  	-DZLIB_COMPAT=1 \
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
