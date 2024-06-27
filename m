Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C650AC2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 15:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8895F416C2;
	Thu, 27 Jun 2024 15:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZN-ZTjgYdmdx; Thu, 27 Jun 2024 15:46:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16CAC416BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16CAC416BE;
	Thu, 27 Jun 2024 15:46:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFFFD1BF3CE
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 15:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC2618416D
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 15:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h78viojyjatk for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 15:46:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD99484167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD99484167
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD99484167
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 15:46:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C471913F880;
 Thu, 27 Jun 2024 17:45:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 27 Jun 2024 17:45:57 +0200
Date: Thu, 27 Jun 2024 17:45:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <Zn2JNXD3RyEgGZsi@landeda>
References: <20240627145917.190784-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240627145917.190784-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719503159;
 bh=r1mlLh2Mkf0/3/T6IeMaeHJeEH48nzug55yK8C5ViHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SxacRp7DUroyM7A6Y7WI0jEftfbvv3tJ+8KHREfk8zckH1NITHHqkSkvzpK4WfC62
 MHSD6WA2m2UcG6bIdkrWXNjem/mabVKFu2vmqZiGyydtu942dOkN3PXAMVyouqQWTT
 aB+1nQjVMCdnq3y3wJsDjwTB4c4sv3RnXFd4r6lhE3bCgGCk94+pFobS51+zCSBm+D
 skK053SKcCRBrWDkrCyuPkbaKoY/kwrjoT7c6AEYtf9Mth/zmjrpIFo/frsaz4y2Xq
 V3eAJhPzuGK+OuH6Y2otkFgRhGUZNgXjLxTlnLh3Kn8ai/64D4MoSQh8du5aXVXZWA
 6T1AyRY2EE1EA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SxacRp7D
Subject: Re: [Buildroot] [PATCH 1/1] package/libgsm: update patches to be
 applied with fuzz 0
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

Julien, All,

On 2024-06-27 16:59 +0200, Julien Olivain spake thusly:
> Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0" reduced the fuzz factor.
> 
> Due to this change, libgsm fails to build with output:
> 
>     Applying 0001-misc-fixes-from-archlinux.patch using patch:
>     patching file Makefile
>     Hunk #2 FAILED at 96.
>     Hunk #7 FAILED at 424.
>     2 out of 8 hunks FAILED -- saving rejects to file Makefile.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Fixes:
> - http://autobuild.buildroot.org/results/b27/b271ade6069fd25c1877e1e74648d92e88c459c4
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...h => 0001-Misc-fixes-from-Archlinux.patch} | 21 +++++++++++--------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>  rename package/libgsm/{0001-misc-fixes-from-archlinux.patch => 0001-Misc-fixes-from-Archlinux.patch} (88%)
> 
> diff --git a/package/libgsm/0001-misc-fixes-from-archlinux.patch b/package/libgsm/0001-Misc-fixes-from-Archlinux.patch
> similarity index 88%
> rename from package/libgsm/0001-misc-fixes-from-archlinux.patch
> rename to package/libgsm/0001-Misc-fixes-from-Archlinux.patch
> index 11c529b5097..6702a920aff 100644
> --- a/package/libgsm/0001-misc-fixes-from-archlinux.patch
> +++ b/package/libgsm/0001-Misc-fixes-from-Archlinux.patch
> @@ -1,4 +1,4 @@
> -From e8f43832d401ad1e071e6860b2bf4a1e796d4356 Mon Sep 17 00:00:00 2001
> +From ef88ee98855008cd8c8de807a12917a556e2ce7d Mon Sep 17 00:00:00 2001
>  From: Adam Duskett <aduskett@gmail.com>
>  Date: Fri, 28 Jul 2017 08:18:22 -0400
>  Subject: [PATCH] Misc fixes from Archlinux
> @@ -11,12 +11,15 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>  Refresh for 1.0.17
>  [Fabrice: refresh for 1.0.22]
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +[Julien: regenerate with git format-patch for 1.0.22,
> +as Fabrice refresh is incomplete for applying with fuzz 0]
>  ---
> - Makefile | 84 ++++++++++++++++++++++++++++++++--------------------------------
> - 1 file changed, 42 insertions(+), 42 deletions(-)
> + Makefile | 49 ++++++++++++++++++++++++-------------------------
> + 1 file changed, 24 insertions(+), 25 deletions(-)
>  
>  diff --git a/Makefile b/Makefile
> -index d5c0c90..ef61bd5 100644
> +index 2ad5e5d..2cb0b06 100644
>  --- a/Makefile
>  +++ b/Makefile
>  @@ -44,7 +44,7 @@ WAV49	= -DWAV49
> @@ -36,7 +39,7 @@ index d5c0c90..ef61bd5 100644
>  +LN		= ln -s -f
>   BASENAME 	= basename
>   AR		= ar
> - ARFLAGS	= cr
> + ARFLAGS		= cr
>  @@ -139,7 +139,7 @@ LFLAGS	= $(LDFLAGS) $(LDINC)
>   
>   # Targets
> @@ -97,16 +100,16 @@ index d5c0c90..ef61bd5 100644
>   
>   
>   # The local bin and lib directories
> -@@ -425,7 +425,7 @@ semi-clean:
> +@@ -425,7 +424,7 @@ semi-clean:
>   			-print | xargs rm $(RMFLAGS)
>   
>   clean:	semi-clean
>  -		-rm $(RMFLAGS) $(LIBGSM) $(ADDTST)/add		\
>  +		-rm $(RMFLAGS) $(LIBGSMSO)* $(ADDTST)/add		\
>   			$(TOAST) $(TCAT) $(UNTOAST)	\
> - 			$(ROOT)/gsm-1.0.tar.Z
> + 			$(ROOT)/gsm-1.0.tar.gz
>   
> -@@ -473,22 +473,22 @@ $(ADDTST)/add:	$(ADDTST)/add_test.o
> +@@ -473,22 +472,22 @@ $(ADDTST)/add:	$(ADDTST)/add_test.o
>   $(TST)/test-result:	$(TST)/lin2cod $(TST)/cod2lin $(TOAST) $(TST)/run
>   			( cd $(TST); ./run ) 
>   
> @@ -140,5 +143,5 @@ index d5c0c90..ef61bd5 100644
>  -				$(TST)/cod2lin.o $(LIBGSM) $(LDLIB)
>  +				$(TST)/cod2lin.o $(LIBGSMSO) $(LDLIB)
>  -- 
> -2.13.3
> +2.45.2
>  
> -- 
> 2.45.2
> 

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
