Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D4CE7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 915DF60836;
	Fri, 27 Dec 2024 14:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVXHiiUGy0k5; Fri, 27 Dec 2024 14:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3452606C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3452606C7;
	Fri, 27 Dec 2024 14:40:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 68D8CE0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48FC560832
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhikJnUa09-1 for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:40:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5FD4D6059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FD4D6059A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FD4D6059A
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:40:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A403713F899;
 Fri, 27 Dec 2024 15:40:49 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42118])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:40:49 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:40:49 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223162536.1865762-1-james.hilliard1@gmail.com>
References: <20241223162536.1865762-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <51bb1671d33b2fc097f0905f9748a442@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310450;
 bh=SvV/wmThAwagxIAk/ktWfkZBQDsjCKoHlvgOcC8YZn8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OxZshAiSk4p+wIpC9mBa2M+HkLCLrGUQCRBR70FrRp+AjXN2fbV+XYUSfR/hcAGRH
 pdD1aK1EGlBfy5RniQ+gmjoAEgxbn7/FEkvcscODIwhFLpYTTnKgG8iDEHxFT70zd1
 RARs75PJdubt/rYRsH7Jvws5aXZBCjzHpdNT+qQMZj9Qj+g8awF0PZWJAsCLKPwun6
 rCg5D6RHtFM+TCn2IY1oJFmtNbHxU86rhkPbh9I4I0SrzdGI0eqncluOBZysO03J8U
 P3H+N/WZlNjHyyomz2zu9cFAM7rRS2oVGQEiNM/L9z39gIB2S3T39SutZwkti1hqCl
 +vhm/lWPzI3nQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OxZshAiS
Subject: Re: [Buildroot] [PATCH 1/1] package/python-contourpy: bump to
 version 1.3.1
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

On 23/12/2024 17:25, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-contourpy/python-contourpy.hash | 4 ++--
>  package/python-contourpy/python-contourpy.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-contourpy/python-contourpy.hash 
> b/package/python-contourpy/python-contourpy.hash
> index 8902607ec8..aef7c3de74 100644
> --- a/package/python-contourpy/python-contourpy.hash
> +++ b/package/python-contourpy/python-contourpy.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/contourpy/json
> -md5  81447a2ceaf933b28db04d02086a22ed  contourpy-1.3.0.tar.gz
> -sha256  
> 7ffa0db17717a8ffb127efd0c95a4362d996b892c2904db72428d5b52e1938a4  
> contourpy-1.3.0.tar.gz
> +md5  06a4ae6ab30b855514797cac7073ed08  contourpy-1.3.1.tar.gz
> +sha256  
> dfd97abd83335045a913e3bcc4a09c0ceadbe66580cf573fe961f4a825efa699  
> contourpy-1.3.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> c7d0a153bffaa104044463ebc633793d451722efd3138b5ffd2527b40f1505a2  
> LICENSE
> diff --git a/package/python-contourpy/python-contourpy.mk 
> b/package/python-contourpy/python-contourpy.mk
> index 3804fce8c3..08c45f3805 100644
> --- a/package/python-contourpy/python-contourpy.mk
> +++ b/package/python-contourpy/python-contourpy.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_CONTOURPY_VERSION = 1.3.0
> +PYTHON_CONTOURPY_VERSION = 1.3.1
>  PYTHON_CONTOURPY_SOURCE = contourpy-$(PYTHON_CONTOURPY_VERSION).tar.gz
> -PYTHON_CONTOURPY_SITE = 
> https://files.pythonhosted.org/packages/f5/f6/31a8f28b4a2a4fa0e01085e542f3081ab0588eff8e589d39d775172c9792
> +PYTHON_CONTOURPY_SITE = 
> https://files.pythonhosted.org/packages/25/c2/fc7193cc5383637ff390a712e88e4ded0452c9fbcf84abe3de5ea3df1866
>  PYTHON_CONTOURPY_LICENSE = BSD-3-Clause
>  PYTHON_CONTOURPY_LICENSE_FILES = LICENSE
>  PYTHON_CONTOURPY_DEPENDENCIES = python-pybind host-python-meson-python
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
