Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9043E77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95B11605CB;
	Sun, 22 Dec 2024 14:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9Xq8HQSyT8y; Sun, 22 Dec 2024 14:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E1D260A3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E1D260A3F;
	Sun, 22 Dec 2024 14:09:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44B22D3
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2642F81F69
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51vipYH_6k23 for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:09:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20BAF81F66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20BAF81F66
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20BAF81F66
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:09:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 00CF1780505;
 Sun, 22 Dec 2024 15:09:40 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53540])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:09:40 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:09:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219012018.239934-1-james.hilliard1@gmail.com>
References: <20241219012018.239934-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <dd14c0162cb5c05c2c3a9f06e97f4e5a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876582;
 bh=/jympmcAgIfnIB8ztRqVX46icgBQpTxJmTkqYY3eRjQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IGoZz/+b/MSIJzQw3DkeDHL3xlYj4zYmW0PncERljfLgUmTM/ODacQn9Qb6fG+79R
 1COT3IrMfNkxZ5Q0R1wsGhJz4ZiAHqzdHc4Buz7tVkq2QNjgH69T34BAuozCshj7Jd
 ShXWgeIE/905fqON4s6Mis+2qAICF4DJgnrTNtbm5pDP7JJU4ZuOOqBpuSnwjneF90
 hT5Eb5au6MzwApSLAiCqAdMm92gd1NpWjgBzQlPxlv/k+7Uj3JAr9zlF2RL3vtnO7l
 YEuIpHuZwklEiFluHTjLL6hhipBeWLSt8htsvlWFCXZY1+oRmAyUzjq2tjr/U+WC7r
 pjhnVw89GAOqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=IGoZz/+b
Subject: Re: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version
 4.7.0
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

On 19/12/2024 02:20, James Hilliard wrote:
> Add new python-typing-extensions runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-anyio/Config.in         | 1 +
>  package/python-anyio/python-anyio.hash | 4 ++--
>  package/python-anyio/python-anyio.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-anyio/Config.in 
> b/package/python-anyio/Config.in
> index d843f37af0..353c7e4629 100644
> --- a/package/python-anyio/Config.in
> +++ b/package/python-anyio/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_ANYIO
>  	bool "python-anyio"
>  	select BR2_PACKAGE_PYTHON_IDNA # runtime
>  	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
> +	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
>  	help
>  	  High level compatibility layer for multiple asynchronous
>  	  event loop implementations.
> diff --git a/package/python-anyio/python-anyio.hash 
> b/package/python-anyio/python-anyio.hash
> index cfd65ee92f..6896b7d516 100644
> --- a/package/python-anyio/python-anyio.hash
> +++ b/package/python-anyio/python-anyio.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/anyio/json
> -md5  3aae01d9007bd08538158c7a7fa18c39  anyio-4.6.2.post1.tar.gz
> -sha256  
> 4c8bc31ccdb51c7f7bd251f51c609e038d63e34219b44aa86e47576389880b4c  
> anyio-4.6.2.post1.tar.gz
> +md5  6d0431fec06206d2bdbf57d449f1616b  anyio-4.7.0.tar.gz
> +sha256  
> 2f834749c602966b7d456a7567cafcb309f96482b5081d14ac93ccd457f9dd48  
> anyio-4.7.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  
> LICENSE
> diff --git a/package/python-anyio/python-anyio.mk 
> b/package/python-anyio/python-anyio.mk
> index 74c49c2e73..8c814abfdd 100644
> --- a/package/python-anyio/python-anyio.mk
> +++ b/package/python-anyio/python-anyio.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_ANYIO_VERSION = 4.6.2.post1
> +PYTHON_ANYIO_VERSION = 4.7.0
>  PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
> -PYTHON_ANYIO_SITE = 
> https://files.pythonhosted.org/packages/9f/09/45b9b7a6d4e45c6bcb5bf61d19e3ab87df68e0601fa8c5293de3542546cc
> +PYTHON_ANYIO_SITE = 
> https://files.pythonhosted.org/packages/f6/40/318e58f669b1a9e00f5c4453910682e2d9dd594334539c7b7817dabb765f
>  PYTHON_ANYIO_SETUP_TYPE = setuptools
>  PYTHON_ANYIO_LICENSE = MIT
>  PYTHON_ANYIO_LICENSE_FILES = LICENSE
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
