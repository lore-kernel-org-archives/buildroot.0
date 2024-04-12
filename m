Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641C4C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 18:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E77B8607A0;
	Fri, 12 Apr 2024 18:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DptdOam1KE_8; Fri, 12 Apr 2024 18:43:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEE1F608CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEE1F608CC;
	Fri, 12 Apr 2024 18:43:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E83381BF4E2
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 18:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D534540643
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 18:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DL6DxptDhik4 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 18:43:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1B34405FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1B34405FB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1B34405FB
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 18:43:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 52C2B13F88E;
 Fri, 12 Apr 2024 20:43:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Apr 2024 20:43:11 +0200
Date: Fri, 12 Apr 2024 20:43:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <ZhmAv3-PLMH0BHc3@landeda>
References: <20240412135820.1599-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412135820.1599-1-tianyuanhao3@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712947394;
 bh=Ogzrfi/O5IboMGZP1BRIO9tS7EV8hQOVSVmVj/hJEYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oORdn8fW8stpcbMYkp5tr9wCt27VPihlkD5492+TI5t42JV7l9e+pQxmvsPyivOYQ
 Y/SF5b0MIZK/zF0PfE+s3KWEOUUkQpMG8E2Y89p7cvjqY+EQpzQ01F9RG5qQY9VuEU
 WTfm/YFR8rDTBcsznpVrqDt26EYEssa8NrAj5jJO44m5yIt4EhO3+rcmwle+ycM8bp
 YWLTQWLpZizf7vLIaMNLq+EPFX1JiGRg4UV5Y/T4UtqFtCpNu6PQaVX+TUYdvRhEcX
 j6eEBZa3eZy+wNH3ccvnLuhRPRJ2VcXi/ZQkTMsjVnE9Y732W9ND8fU+vGwPdbO8N2
 BSX9Lhefqv9LA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oORdn8fW
Subject: Re: [Buildroot] [PATCH 1/1] package/ttyd: bump to version 1.7.7
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

Yuanhao, All,

On 2024-04-12 13:58 +0000, TIAN Yuanhao spake thusly:
> Notable changes:
> 
> - The web terminal is readonly by default now, to make it writable, use
>   -W option.
> 
> Also set TTYD_CPE_ID_VALID.

I've moved that part to its own commit, so that it can be backported to
stable branches.

> cpe:2.3:a:ttyd_project:ttyd is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/detail/DBEDA75E-4E19-48C1-92D7-43E4035BC048
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

Applied to master, as two separate commits, one for the CPE_ID, one for
the version bump, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ttyd/ttyd.hash | 2 +-
>  package/ttyd/ttyd.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ttyd/ttyd.hash b/package/ttyd/ttyd.hash
> index b11327c465..9a407a68fd 100644
> --- a/package/ttyd/ttyd.hash
> +++ b/package/ttyd/ttyd.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  300d8cef4b0b32b0ec30d7bf4d3721a5d180e22607f9467a95ab7b6d9652ca9b  ttyd-1.7.4.tar.gz
> +sha256  039dd995229377caee919898b7bd54484accec3bba49c118e2d5cd6ec51e3650  ttyd-1.7.7.tar.gz
>  sha256  8b7e100f8311cb428c57609164d93099bada2599f948359045d1ac876a7a625b  LICENSE
> diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
> index d0e144b252..e6cf791988 100644
> --- a/package/ttyd/ttyd.mk
> +++ b/package/ttyd/ttyd.mk
> @@ -4,10 +4,11 @@
>  #
>  ################################################################################
>  
> -TTYD_VERSION = 1.7.4
> +TTYD_VERSION = 1.7.7
>  TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
>  TTYD_LICENSE = MIT
>  TTYD_LICENSE_FILES = LICENSE
>  TTYD_DEPENDENCIES = json-c libuv libwebsockets openssl zlib
> +TTYD_CPE_ID_VALID = YES
>  
>  $(eval $(cmake-package))
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
