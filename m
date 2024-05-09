Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAEEC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9097F612D1;
	Thu,  9 May 2024 20:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhFYFQeQJE2l; Thu,  9 May 2024 20:20:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82224612E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82224612E1;
	Thu,  9 May 2024 20:20:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA21B1BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3EA141DFD
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hKK_ih_O0iC for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:20:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D74041DEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D74041DEA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D74041DEA
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:20:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7229013F89C;
 Thu,  9 May 2024 22:20:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 09 May 2024 22:20:39 +0200
Date: Thu, 9 May 2024 22:20:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zj0wF-MTo9dhhreA@landeda>
References: <20240509172325.1493586-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240509172325.1493586-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715286041;
 bh=oXCCbubpi7HZtBmTWU34Pb0D5mBw4I6FVrv5MOZcxfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NA/643WCMJKibYt6hpQCWPGa+p+5ORbL70zBSxqc5pI/G4/sSfjYhrLQe8MPBd8gX
 ehKAs8sVKUM6ImfEOWXvy81SK1RThWtIjjpoqhETNGlxdsaUUcWQIjYrh6ltN/pSq1
 I/srhRVzpbGbdhRyhCIe+gtm2/ypTcKBs+ly617BlvEMIgnvpN06PdypTjrOWwg0L9
 0tUrtFV8Yg2ZsaHdWqpYPlkN9RGvqCrVFqkBCxc0eVfS8BiGZAlKaGAdUEfNAGQsX4
 DxUOps+kwg36jJ4VYte/IHxmvSp7CdbSc3+Idd/rb3rVE9X1GD+zEFc3IDzw3/1XWt
 uLX4ef8Y6YooA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NA/643WC
Subject: Re: [Buildroot] [PATCH] package/pkg-generic.mk: really make
 DL_SUBDIR inheritance work
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

Thomas, All,

On 2024-05-09 19:23 +0200, Thomas Petazzoni spake thusly:
> While bumping kodi, we figured out that the kodi-texturepacker and
> kodi-jsonschemabuilder were both re-downloading the main Kodi tarball,
> even though they contain:
> 
> KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
> KODI_TEXTUREPACKER_DL_SUBDIR = kodi
> 
> Both are host packages, and turns out that changing those variables to
> HOST_ ones made the download sharing work.
> 
> Commit efa7712b092950c92f994e2ee30c120a64e5451b ("package/pkg-generic:
> host variant inherits target download settings") introduced
> inheritance of host variables from target variables from a number of
> variables, including DL_SUBDIR. But it missed the fact that earlier in
> pkg-generic.mk, the following line was defined:
> 
>   $(2)_DL_SUBDIR ?= $$($(2)_RAWNAME)
> 
> So, when this later code kicked in:
> 
>  ifndef $(2)_DL_SUBDIR
>   ifdef $(3)_DL_SUBDIR
>    $(2)_DL_SUBDIR = $$($(3)_DL_SUBDIR)
>   endif
>  endif
> 
> In fact it never did anything because $(2)_DL_SUBDIR would never be
> undefined. This commit fixes this issue by properly adjusting the
> logic to inherit the value of the target variable when it exists, or
> defaulting to $$($(2)_RAWNAME) otherwise.
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks for fixing my mess!

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 577a148c1e..a2749320c3 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -525,7 +525,6 @@ endif
>  
>  $(2)_BASENAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
>  $(2)_BASENAME_RAW = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
> -$(2)_DL_SUBDIR ?= $$($(2)_RAWNAME)
>  $(2)_DL_DIR = $$(DL_DIR)/$$($(2)_DL_SUBDIR)
>  $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASENAME)
>  
> @@ -538,6 +537,8 @@ endif
>  ifndef $(2)_DL_SUBDIR
>   ifdef $(3)_DL_SUBDIR
>    $(2)_DL_SUBDIR = $$($(3)_DL_SUBDIR)
> + else
> +  $(2)_DL_SUBDIR = $$($(2)_RAWNAME)
>   endif
>  endif
>  
> -- 
> 2.44.0
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
