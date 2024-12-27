Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72062E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CD8880413;
	Fri, 27 Dec 2024 14:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6A3A3xLlOiZy; Fri, 27 Dec 2024 14:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CA8980567
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CA8980567;
	Fri, 27 Dec 2024 14:37:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52019E0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 305F840582
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 293V-MLIkGYB for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:37:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D801C400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D801C400AB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D801C400AB
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:37:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 180BF2003E3;
 Fri, 27 Dec 2024 15:37:33 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:37:32 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:37:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223151548.1728545-1-james.hilliard1@gmail.com>
References: <20241223151548.1728545-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3076457904ffabe23df2f19adc010f10@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310254;
 bh=xYf5txsxdrlOJyVQUEGzuAcM29PCKwBuRC5dmrlsVaQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=olSfIPPcfmHlOEsVuK/DrKVz2MJtSKeIpJn/AiucWENlLHqgwwKJqt5H2Zvq9Ey22
 8nzxulUvKRrxgr0yWiB1+97qL9oB2UcWT5Pk2DiPJFSjTHahtn9G0fHwBujP8AAVHn
 4ryU8qOIFDIMrH9UT4hmQIYXfTXumZ8VuGGe3I6lKPZE1gfJODuaQxoxcvGMXW3xjZ
 IetYzU42iAeS2L8CMTctAJKl7t7aIrm8vGm9qrKP4FKbg22Kv7kUsmHlD+kzh2pSNS
 pidUMLUZAw3CYvRmoMYOZxGsKQX+h+N3RaXXxndgeGNDfwfqTnd35Lco6Jkc8gsjsw
 bTV08PqLoTqwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=olSfIPPc
Subject: Re: [Buildroot] [PATCH 1/1] package/python-asttokens: bump to
 version 3.0.0
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

On 23/12/2024 16:15, James Hilliard wrote:
> Drop no longer required python-six runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-asttokens/Config.in             | 1 -
>  package/python-asttokens/python-asttokens.hash | 4 ++--
>  package/python-asttokens/python-asttokens.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-asttokens/Config.in 
> b/package/python-asttokens/Config.in
> index 2732b8124b..66c46bb013 100644
> --- a/package/python-asttokens/Config.in
> +++ b/package/python-asttokens/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_PYTHON_ASTTOKENS
>  	bool "python-asttokens"
> -	select BR2_PACKAGE_PYTHON_SIX # runtime
>  	help
>  	  Annotate AST trees with source code positions.
> 
> diff --git a/package/python-asttokens/python-asttokens.hash 
> b/package/python-asttokens/python-asttokens.hash
> index 9042c3002d..a8b552913b 100644
> --- a/package/python-asttokens/python-asttokens.hash
> +++ b/package/python-asttokens/python-asttokens.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/asttokens/json
> -md5  c353679585a40f43c24ca60fca33bbf6  asttokens-2.4.1.tar.gz
> -sha256  
> b03869718ba9a6eb027e134bfdf69f38a236d681c83c160d510768af11254ba0  
> asttokens-2.4.1.tar.gz
> +md5  7d99c4c80190c3ba64839138ea827970  asttokens-3.0.0.tar.gz
> +sha256  
> 0dcd8baa8d62b0c1d118b399b2ddba3c4aff271d0d7a9e0d4c1681c79035bbc7  
> asttokens-3.0.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  
> LICENSE
> diff --git a/package/python-asttokens/python-asttokens.mk 
> b/package/python-asttokens/python-asttokens.mk
> index 4806d17915..327ee6af91 100644
> --- a/package/python-asttokens/python-asttokens.mk
> +++ b/package/python-asttokens/python-asttokens.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_ASTTOKENS_VERSION = 2.4.1
> +PYTHON_ASTTOKENS_VERSION = 3.0.0
>  PYTHON_ASTTOKENS_SOURCE = asttokens-$(PYTHON_ASTTOKENS_VERSION).tar.gz
> -PYTHON_ASTTOKENS_SITE = 
> https://files.pythonhosted.org/packages/45/1d/f03bcb60c4a3212e15f99a56085d93093a497718adf828d050b9d675da81
> +PYTHON_ASTTOKENS_SITE = 
> https://files.pythonhosted.org/packages/4a/e7/82da0a03e7ba5141f05cce0d302e6eed121ae055e0456ca228bf693984bc
>  PYTHON_ASTTOKENS_SETUP_TYPE = setuptools
>  PYTHON_ASTTOKENS_LICENSE = Apache-2.0
>  PYTHON_ASTTOKENS_LICENSE_FILES = LICENSE
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
