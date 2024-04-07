Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D7ECD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 08:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62C2C4049F;
	Sun,  7 Apr 2024 08:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wrE6-UcWzrR; Sun,  7 Apr 2024 08:52:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 549C140430
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 549C140430;
	Sun,  7 Apr 2024 08:52:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 006971BF57C
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF53A40430
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNBGiTAA3PlP for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 08:52:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EC6F9400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC6F9400D6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC6F9400D6
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 08:52:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A49F713F8C0;
 Sun,  7 Apr 2024 10:52:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 10:52:00 +0200
Date: Sun, 7 Apr 2024 10:52:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZhJesBKzhu2jg4r0@landeda>
References: <20240404205548.1859771-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240404205548.1859771-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712479922;
 bh=llfJ7Ohv0H7HxjzCN+JsAyB3O09mqzEPGPomfC6PZDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=flq+MVyvpMIY7a3ZDU6Y/TRR5J/KDI8FzXyXXU6YCMJLP45xAQYLDzgk+3AbHTgHm
 UPiHo83qDbmFMeMnZttz1dVeWuIIbJeXQtHVIYretN/wyqwxZ90xk+1QAXwN2jAovE
 MH5zpWeNAUrjnbB1gU+aIq0SicLO5rsyWg9ybRxb4QiNScQwRVo2yVk9CnSXt/3moZ
 P0Qgev8ofmKbsaMKuIGnPhxj5n5PtkP6jNTGh1O3Qp2U+2eQt2wY+PVgrQIwMEYBei
 LS4IsHITYYbVm7cPcsrcZUYNZgUy43YQbgvPLsKwZ3vgge4+2C2DtY50I8nE8GqnjQ
 M8kAnWhREe8oA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=flq+MVyv
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-pam: select libxcrypt
 with glibc
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

On 2024-04-04 22:55 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> /home/autobuild/autobuild/instance-6/output-1/per-package/linux-pam/host/bin/../lib/gcc/or1k-buildroot-linux-gnu/13.2.0/../../../../or1k-buildroot-linux-gnu/bin/ld: .libs/pam_pwhistory_la-opasswd.o: in function `compare_password':
> opasswd.c:(.text+0x26c): undefined reference to `crypt'
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - http://autobuild.buildroot.org/results/e17911978febb7b25112940a7c40037b3f98d491
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-pam/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
> index b17716f2f7..c8aca97ac6 100644
> --- a/package/linux-pam/Config.in
> +++ b/package/linux-pam/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_LINUX_PAM
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
>  	select BR2_PACKAGE_FLEX
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  A Security Framework that Provides Authentication for
>  	  Applications
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
