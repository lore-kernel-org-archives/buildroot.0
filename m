Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A807E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C59B80EFA;
	Fri, 27 Dec 2024 14:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxZmI2VndU_f; Fri, 27 Dec 2024 14:34:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7902980EFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7902980EFE;
	Fri, 27 Dec 2024 14:34:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AA4CF1B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77D8760833
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cN9d744o8Yq2 for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:34:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BA3760853
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BA3760853
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BA3760853
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:34:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 827E3B0051B;
 Fri, 27 Dec 2024 15:34:38 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:34:38 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:34:38 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223142247.1712612-1-james.hilliard1@gmail.com>
References: <20241223142247.1712612-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <c1e60e15a62076ceee2344d291edc8c8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310079;
 bh=ir52pIb61cVneiLiG2biF+Xc2vWk8RKxeAIfHXqd5tM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WN7xcitgfkVO2Z1iNADtkZuGGLEaHSZFXPYHozGDfuSzCrDZAOSxh/mTiyRWDSCIi
 EPk2pKCO52Ahhh1IOAoVud3TNprMq1XvKSDr66D05B5GDA4Nm4fSJaiZGED14oWbZn
 +4XWfCaEln+VfM0DrMxqg8TnpsnwtTMGyD1gHS8M+ad8V9+KbUdSDxI18mtIlfqKEW
 piIFjW/l3YrRFkAOEgZbbBl9NaSPOZsUCqDuYcvL088qjGZoyti+4bR/gDo/M+HFKL
 M0s6V0jdE75W94K4XNAo37ln5th3zPfgLMX5YapjM4KqwJRer+Jg/uDynuOTwvEyBT
 gULi+5rjtUfpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WN7xcitg
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.11.11
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

On 23/12/2024 15:22, James Hilliard wrote:
> Add new python-propcache runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-aiohttp/Config.in           | 1 +
>  package/python-aiohttp/python-aiohttp.hash | 4 ++--
>  package/python-aiohttp/python-aiohttp.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiohttp/Config.in 
> b/package/python-aiohttp/Config.in
> index 01a1ed8a3d..08883316d8 100644
> --- a/package/python-aiohttp/Config.in
> +++ b/package/python-aiohttp/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_AIOHTTP
>  	select BR2_PACKAGE_PYTHON_BROTLI # runtime
>  	select BR2_PACKAGE_PYTHON_FROZENLIST # runtime
>  	select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
> +	select BR2_PACKAGE_PYTHON_PROPCACHE # runtime
>  	select BR2_PACKAGE_PYTHON_YARL # runtime
>  	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
>  	help
> diff --git a/package/python-aiohttp/python-aiohttp.hash 
> b/package/python-aiohttp/python-aiohttp.hash
> index fd3ca7d72a..0aa22e9fa3 100644
> --- a/package/python-aiohttp/python-aiohttp.hash
> +++ b/package/python-aiohttp/python-aiohttp.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/aiohttp/json
> -md5  fa0526dab4bf4b755537ae5718a43e25  aiohttp-3.10.10.tar.gz
> -sha256  
> 0631dd7c9f0822cc61c88586ca76d5b5ada26538097d0f1df510b082bad3411a  
> aiohttp-3.10.10.tar.gz
> +md5  17f04b60068122e998a60a3010679501  aiohttp-3.11.11.tar.gz
> +sha256  
> bb49c7f1e6ebf3821a42d81d494f538107610c3a705987f53068546b0e90303e  
> aiohttp-3.11.11.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  
> LICENSE.txt
> diff --git a/package/python-aiohttp/python-aiohttp.mk 
> b/package/python-aiohttp/python-aiohttp.mk
> index 17eeae72b3..19e62745e0 100644
> --- a/package/python-aiohttp/python-aiohttp.mk
> +++ b/package/python-aiohttp/python-aiohttp.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_AIOHTTP_VERSION = 3.10.10
> +PYTHON_AIOHTTP_VERSION = 3.11.11
>  PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
> -PYTHON_AIOHTTP_SITE = 
> https://files.pythonhosted.org/packages/17/7e/16e57e6cf20eb62481a2f9ce8674328407187950ccc602ad07c685279141
> +PYTHON_AIOHTTP_SITE = 
> https://files.pythonhosted.org/packages/fe/ed/f26db39d29cd3cb2f5a3374304c713fe5ab5a0e4c8ee25a0c45cc6adf844
>  PYTHON_AIOHTTP_SETUP_TYPE = setuptools
>  PYTHON_AIOHTTP_LICENSE = Apache-2.0
>  PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
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
