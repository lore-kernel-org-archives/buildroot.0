Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6739C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 20:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A97CA605EE;
	Mon,  3 Jun 2024 20:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLwNArYKwxJS; Mon,  3 Jun 2024 20:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAE2960604
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAE2960604;
	Mon,  3 Jun 2024 20:40:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CF951BF2B6
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 20:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A150404DA
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 20:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aK7dH9nqbYE7 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 20:40:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F32784011B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F32784011B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F32784011B
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 20:40:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 20BFF13F846;
 Mon,  3 Jun 2024 22:40:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jun 2024 22:40:30 +0200
Date: Mon, 3 Jun 2024 22:40:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zl4qPmAfUPtS8MNf@landeda>
References: <20240601011733.2964473-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240601011733.2964473-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717447233;
 bh=x9PvN/OVsz65g2aLK/46UkKa6APB0O+gG1aUZbwMF5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=shvs4useAKwp+SiPtA2Eoodp0Q4qUl6JKFhYZs0wzFfW3gQffCwYJrNWyCu2ejHo2
 cuN3s6cWpj5NOR//iI6Dr/QtiI6rcuA9JWDtrpRaDxiqHnZRck7HgUstOkLWEOl5jJ
 febFoDXyQazsrv1BeTtEEhzMjsIzDHrH7oLpvvJYnDGQmUhUtr492Fey061BhLoHNH
 g6uEmiytriEWv3DaPR8ZW6QOvHRCxaX51UY9GKwWLHokAxY7uUOiHpNiZtZEQ5jCqq
 7D/YkMR7JJtqxdOr5Wufzt5dEpcRW3rzYZd1TfugeFt+sy6ngrPBYuDhBCQnlgqP9N
 lZfj6Yy+hAdgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=shvs4use
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: drop glibc Linaro
 toolchain version check
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

James, All,

On 2024-05-31 19:17 -0600, James Hilliard spake thusly:
> It has been well over 10 years since glibc 2.14 was released, I don't
> think we need this check anymore.

To support that claim, I've added references to Debian and Ubuntu, and
when they stopped using glibc versions older than 2.14.

> The distutils module is no longer bundled with python 3.12 so this
> eliminates the need to install additional python modules under python
> 3.12.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  utils/genrandconfig | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index b838dda34d..0889be0d43 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -25,8 +25,6 @@ import os
>  from random import randint
>  import sys
>  import traceback
> -from distutils.version import StrictVersion
> -import platform
>  
>  
>  class SystemInfo:
> @@ -166,23 +164,6 @@ async def is_toolchain_usable(configfile, config):
>              print("      Missing: %s" % toolchainline.strip(), file=sys.stderr)
>              return False
>  
> -    # The latest Linaro toolchains on x86-64 hosts requires glibc
> -    # 2.14+ on the host.
> -    if platform.machine() == 'x86_64':
> -        if 'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y\n' in configlines or \
> -           'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
> -           'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y\n' in configlines or \
> -           'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
> -            proc = await asyncio.create_subprocess_exec(
> -                'ldd', '--version', stdout=asyncio.subprocess.PIPE)
> -            ldd_version_output, _ = await proc.communicate()
> -            if proc.returncode:
> -                return False
> -            glibc_version = ldd_version_output.decode().splitlines()[0].split()[-1]
> -            if StrictVersion('2.14') > StrictVersion(glibc_version):
> -                print("WARN: ignoring the Linaro ARM toolchains because too old host glibc", file=sys.stderr)
> -                return False
> -
>      return True
>  
>  
> -- 
> 2.34.1
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
