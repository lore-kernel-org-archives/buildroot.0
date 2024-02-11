Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FBEC4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 09:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82C3F60623;
	Sun, 11 Feb 2024 09:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xyJUB3ANyXX; Sun, 11 Feb 2024 09:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E30F6081F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E30F6081F;
	Sun, 11 Feb 2024 09:57:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1808B1BF3C6
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 09:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F363640323
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 09:57:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DWSb7S7hLmCN for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 09:57:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3706E40160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3706E40160
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3706E40160
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 09:57:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2CB1D13F86E;
 Sun, 11 Feb 2024 10:57:36 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Feb 2024 10:57:35 +0100
Date: Sun, 11 Feb 2024 10:57:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZciaD1eOs8jOu0Wa@landeda>
References: <20240210222940.806905-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240210222940.806905-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707645459;
 bh=BiYXmkOpLX/ECEawqqsq1A8m3JuZIRYu3YLhNGs7CMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W2pp00PQ8NBX4Z46qRKqCnQxEJgq7awCbxXb7K8Y/17k6gD/YU+iV4Uze05MgmgAm
 LXVveI5PhVrQP/n0NaYago2ItcHjveIn7wLfVAReUDDhYO6Ff2cf3jQRP66scAtOcn
 PAIiCd5Z9SKOBHhGwq6alooJv50+jjXeyVXCBm+zYtaOXoMxdcAz7NJsBZE8aXCZ/u
 NAg1Nfuo6TqxuJvcvEJbaQR0fUNxCf2OZSisDiXN+1pRjQmlipBIRQSKRFdnf6TsOS
 5YDkJLor0tqGIpMUlci0KAvoVXKiuJN3o+Mlaml2we4wwj5//3Ixt8LZ20XuPyLaaP
 zS1OK00BmopRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=W2pp00PQ
Subject: Re: [Buildroot] [PATCH 1/1] package/jailhouse: bump to commit
 e57d1ef
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
Cc: Carlo Caione <carlo.caione@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2024-02-10 23:29 +0100, Julien Olivain spake thusly:
> The last Jailhouse tag is v0.12. It dates from 2020-02-04, which is
> 4 years old. This version no longer compiles with recent Kernels.
> 
> This commit updates Jailhouse to the latest commit e57d1ef, which
> dates from 2023-01-10.

I wonder how relevant it is to keep a security-related package that
hasn't had any release in 4 years, and that has not had a single commit
for more than a year now.

I mean, the system partitiomnning provided by Jailhouse, apart from
separating resource usage, is a mean of protecting the various cells
from each other, so the compromise of one does not trickle down to
the other cells and to the rest of the system.

Carlo, do you have any insights as to where Jailhouse might be going
in the future?

> For commit logs, see:
> https://github.com/siemens/jailhouse/commits/master/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/jailhouse/jailhouse.hash | 2 +-
>  package/jailhouse/jailhouse.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/jailhouse/jailhouse.hash b/package/jailhouse/jailhouse.hash
> index 297d0f1930..96d5819847 100644
> --- a/package/jailhouse/jailhouse.hash
> +++ b/package/jailhouse/jailhouse.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  3777a553c2acb2b693843fe4d16ab80333879daedd47d9c9f3717c9644e6cf93  jailhouse-0.12.tar.gz
> +sha256  38ea5d2d9672ce7f76fd0c163edaa8968711aca58f245aec3c8934f140e828b6  jailhouse-e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560.tar.gz
>  sha256  3aafb31a2436178323663e00511f16d58fc36ea654b1457532e79d017205efd8  COPYING
> diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
> index c239e75e76..907ad92c0f 100644
> --- a/package/jailhouse/jailhouse.mk
> +++ b/package/jailhouse/jailhouse.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -JAILHOUSE_VERSION = 0.12
> -JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
> +JAILHOUSE_VERSION = e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560
> +JAILHOUSE_SITE = $(call github,siemens,jailhouse,$(JAILHOUSE_VERSION))
>  JAILHOUSE_LICENSE = GPL-2.0
>  JAILHOUSE_LICENSE_FILES = COPYING
>  JAILHOUSE_DEPENDENCIES = \
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
