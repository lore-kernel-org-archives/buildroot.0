Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7C6C25B7E
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 12:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B00C606CE;
	Fri, 31 May 2024 12:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZTy86ZWFvzR; Fri, 31 May 2024 12:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D9B66112B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D9B66112B;
	Fri, 31 May 2024 12:55:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87DF51D5276
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 12:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 727A5843C9
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 12:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uU4hi1F-ITnT for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 12:55:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D79B8451F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D79B8451F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D79B8451F
 for <buildroot@buildroot.org>; Fri, 31 May 2024 12:55:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A806D13F8D5;
 Fri, 31 May 2024 14:55:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 31 May 2024 14:55:04 +0200
Date: Fri, 31 May 2024 14:55:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Message-ID: <ZlnIqJhR87WF2P7Q@landeda>
References: <20240531100519.1273674-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531100519.1273674-1-mika.westerberg@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717160106;
 bh=dsPHLrfHkmboZMmjwHxtc2Sg8NgdH/9TCJzKwUzoCFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rq3rG6MZAWi6bDHAy4duo55oMr6qsn535b+M8gsFjrNaOhgBTZQmYGpZ9Ie8JrtIl
 3n90rbMJdpZBE5E8loMyXRuXpPbDRiK+JrbNK2Ri4FUE7vBzRo3clTdRsuC6DmCdK+
 hswldOY/pjs7fs1llz+sO7L/ytMTg+gFWJ2dzoqs4jAnFNZwf6EQAZyYnccn0OvhxE
 Wy8oqGzD1MNDJ9aAqAkZ+XKZS0oPAF4PuyTR8Z0Wy/TBEwPLdqYXNDZRDcMpL/bWrZ
 NVXo7Ic/chw1m7OJbkZay/XVscPIE11u5JgLeB6VW5pAAMDM7KzN+gRtE6t7yrmeC3
 fjAZmHUxfzPAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Rq3rG6MZ
Subject: Re: [Buildroot] [PATCH] package/tbtools: bump to version 0.4.0
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

Mika, All,

On 2024-05-31 13:05 +0300, Mika Westerberg spake thusly:
> Update against the latest release of tbtools.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tbtools/tbtools.hash | 2 +-
>  package/tbtools/tbtools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
> index ebd838ebe1..06705fc19d 100644
> --- a/package/tbtools/tbtools.hash
> +++ b/package/tbtools/tbtools.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  e5ddbcb3dcf6315a1fe6fe2d4846b5208e75f24e626d43a0ea68358e8b15dba7  tbtools-0.3.2-cargo2.tar.gz
> +sha256  1276ded79276d42c06a16293e26de32566c023383416fb8c91f86d141acce691  tbtools-0.4.0-cargo2.tar.gz
>  sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
> diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
> index 36bfcd7f49..fc5ffc4215 100644
> --- a/package/tbtools/tbtools.mk
> +++ b/package/tbtools/tbtools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TBTOOLS_VERSION = 0.3.2
> +TBTOOLS_VERSION = 0.4.0
>  TBTOOLS_SITE = $(call github,intel,tbtools,v$(TBTOOLS_VERSION))
>  TBTOOLS_LICENSE = MIT
>  TBTOOLS_LICENSE_FILES = LICENSE
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
