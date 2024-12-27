Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9F5E7718F
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B83B80AF1;
	Fri, 27 Dec 2024 14:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ismB61Yfp9MG; Fri, 27 Dec 2024 14:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 135BF80B6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 135BF80B6F;
	Fri, 27 Dec 2024 14:42:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A1F8E0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B53D402B9
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1389ed3yJjl8 for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:42:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 006C0402B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 006C0402B5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 006C0402B5
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:42:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 451725FF95;
 Fri, 27 Dec 2024 15:42:29 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42118])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:42:29 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:42:29 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223164419.1875261-1-james.hilliard1@gmail.com>
References: <20241223164419.1875261-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <d12e5bcbdcb7526eb91320dddc4f6dde@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310550;
 bh=RTI3wcfBqFGUmWMOKYhLmvGyJtXmVs/K6+0lUBTS5tM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CBye43ShldFlX1KqEggHLxwfUTF1+TO4zlwrKan6eYvDa5oLXk9pMf6lKwy5aPwMT
 Cjw1KjhpyLY77tWSpnRftzmf7h+QfanD9gJV9TGU8gws8GoG+MOwW+sQxDsWzO2m5v
 XaP+POUJiqiK3VfHVUy3lUhvsEMNsjfFifosBmAa6BHxa4XXvbagX8LmeEnL6WYVfD
 /Gr3WLVEmnjfFKVbUjiVPjQi2h5SkW3Ti3v2M1zzqAA9j0dhT8sq6G1T1Cbdfoncn4
 CFRtS/p9DQDWhjUYery6KgH8h+IpPOAY1jJvLedL5cJSbR9gZLcnsStt3uE6UyMzCD
 Sh4dVG867Ho4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CBye43Sh
Subject: Re: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to
 version 4.55.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/12/2024 17:44, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-fonttools/python-fonttools.hash | 4 ++--
>  package/python-fonttools/python-fonttools.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-fonttools/python-fonttools.hash 
> b/package/python-fonttools/python-fonttools.hash
> index 3c691fbd89..16209aaf84 100644
> --- a/package/python-fonttools/python-fonttools.hash
> +++ b/package/python-fonttools/python-fonttools.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/fonttools/json
> -md5  ed2b78a3c9b7982608ee605f1fd952b0  fonttools-4.54.1.tar.gz
> -sha256  
> 957f669d4922f92c171ba01bef7f29410668db09f6c02111e22b2bce446f3285  
> fonttools-4.54.1.tar.gz
> +md5  00874aa8f3bea8d706bec0e6882c43e2  fonttools-4.55.3.tar.gz
> +sha256  
> 3983313c2a04d6cc1fe9251f8fc647754cf49a61dac6cb1e7249ae67afaafc45  
> fonttools-4.55.3.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  
> LICENSE
> diff --git a/package/python-fonttools/python-fonttools.mk 
> b/package/python-fonttools/python-fonttools.mk
> index ebb7f14302..d235cf8869 100644
> --- a/package/python-fonttools/python-fonttools.mk
> +++ b/package/python-fonttools/python-fonttools.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_FONTTOOLS_VERSION = 4.54.1
> +PYTHON_FONTTOOLS_VERSION = 4.55.3
>  PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
> -PYTHON_FONTTOOLS_SITE = 
> https://files.pythonhosted.org/packages/11/1d/70b58e342e129f9c0ce030029fb4b2b0670084bbbfe1121d008f6a1e361c
> +PYTHON_FONTTOOLS_SITE = 
> https://files.pythonhosted.org/packages/76/61/a300d1574dc381393424047c0396a0e213db212e28361123af9830d71a8d
>  PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
>  PYTHON_FONTTOOLS_LICENSE = MIT
>  PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
