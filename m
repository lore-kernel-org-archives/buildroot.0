Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20629CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E09B24011A;
	Sun,  7 Apr 2024 15:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDubd3L3pjtg; Sun,  7 Apr 2024 15:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1B6840299
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1B6840299;
	Sun,  7 Apr 2024 15:39:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F0E51BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C28E608BD
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICWVM2Xtqd08 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:39:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 107BC60733
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 107BC60733
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 107BC60733
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:39:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3A35913F8B9;
 Sun,  7 Apr 2024 17:39:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 17:39:36 +0200
Date: Sun, 7 Apr 2024 17:39:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZhK-OL16YbCYL7uZ@landeda>
References: <20240407134801.1839680-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240407134801.1839680-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712504379;
 bh=SKAXZvdPJJ6CiGynhYbyEv9p8pHiZfybth3diL3ojWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OHr3rdj6Ez/0hcjWU68U6aYKXtYGeAvGWjo+eDO4zSRBy6dXt9P3LkzUF4vcf1TI8
 3tBUz9mF06qcd/flMlwMa28GOL9u9a16FN+y9xxTLqXGydgTD9avcuEcGyifHlGhz/
 k6AxtSRxqbI+Fq0PMOoNbzlHDWUA0EuqC4ktxjkZW2uZfrrmbXFa0SPaiuCqnLLBec
 GkXjGfVD7A4eSuh+hgJWY8e+MqYfICn/TN8nwyF+lQWHLs12HWJq7sBfZBUfuGLaff
 wijrL9hStakpbtnq3VCJy9Fx9XkAHkeaLaZXB2UUIVz8Pqb4/BterBpE1Tis7rLbor
 341dYydyPRQGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OHr3rdj6
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: add libxcrypt optional
 dependency
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
Cc: Vadim Kochan <vadim4j@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fabrice, All,

On 2024-04-07 15:48 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> /home/autobuild/autobuild/instance-1/output-1/per-package/frr/host/bin/../lib/gcc/i686-buildroot-linux-gnu/12.3.0/../../../../i686-buildroot-linux-gnu/bin/ld: lib/.libs/libfrr.so: undefined reference to `crypt'
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - http://autobuild.buildroot.org/results/668da3829cacbe883e6cf97ce6191a8180441db6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> index 29a9e7b3e8..d20dc07bb7 100644
> --- a/package/frr/frr.mk
> +++ b/package/frr/frr.mk
> @@ -13,7 +13,8 @@ FRR_CPE_ID_PRODUCT = free_range_routing
>  FRR_AUTORECONF = YES
>  
>  FRR_DEPENDENCIES = host-frr readline json-c libyang protobuf-c \

This protobuf-c dependency is not present in master. What branch did you
base this change on?

Otherwise, applied to master, after applying the patch manually because
of the above conflict, thanks.

Regards,
Yann E. MORIN.

> -	$(if $(BR2_PACKAGE_C_ARES),c-ares)
> +	$(if $(BR2_PACKAGE_C_ARES),c-ares) \
> +	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
>  
>  HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
>  
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
