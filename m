Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076D0E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD3C080B6F;
	Fri, 27 Dec 2024 14:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSfIiGVE_uFB; Fri, 27 Dec 2024 14:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC44C80BD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC44C80BD1;
	Fri, 27 Dec 2024 14:41:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5ECFE0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6906402B9
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yyx6FO285sC for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:41:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96892402C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96892402C5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96892402C5
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:41:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8E4BB6014B;
 Fri, 27 Dec 2024 15:41:14 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42118])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:41:14 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:41:14 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223162823.1867770-1-james.hilliard1@gmail.com>
References: <20241223162823.1867770-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <5aa65b1795d704ea51f646091866b54c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310475;
 bh=iCKq1zE7O+P3Foo5cB1HQe+3H/C134U3QS9wYDB7cPI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i+RTCtb8CEIq5aHeutd9GlyMvaE5BlDSAZlFYdD3OoyfIkba5CG3CKW3dKf2YdT8K
 AjvK3kK7U+RRIINZBIx8Rd7/y5Elpxt40THfu3xQ/BYaIHzgu017etSy9nP3TEp2jf
 JNMEyTL2xO/fGBY+JgMlXtYD0RcG+G/vem+Ufh1RjQiGpRF5AX148krJK0VhaIbAHz
 8ngQaHh4eClbOkruPT69ROCmkUntXArkEyVKB/aDNaTIBrADUMRLdwL7ZhzlXyW96w
 dnAYjNWIDayZSjXZvbuEwRKRiJi2oelJRSRVz5G1l5lWq5fmehs7tK/D36FxXNk0M2
 ku8bZqPm8mefw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i+RTCtb8
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cppy: bump to version
 1.3.0
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

On 23/12/2024 17:28, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-cppy/python-cppy.hash | 4 ++--
>  package/python-cppy/python-cppy.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-cppy/python-cppy.hash 
> b/package/python-cppy/python-cppy.hash
> index 45b78eab8e..73049c6df1 100644
> --- a/package/python-cppy/python-cppy.hash
> +++ b/package/python-cppy/python-cppy.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/cppy/json
> -md5  7c1f825c43dd66454440932a35b9969c  cppy-1.2.1.tar.gz
> -sha256  
> 83b43bf17b1085ac15c5debdb42154f138b928234b21447358981f69d0d6fe1b  
> cppy-1.2.1.tar.gz
> +md5  522447d934d18484cd4cfe90c1872628  cppy-1.3.0.tar.gz
> +sha256  
> da7413a286d5d31626ba35ed2c70ddfb033520cc81310088ba5a57d34039f604  
> cppy-1.3.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> db7a008bff1e63ccec397cfa033109740c4dc6cb12070a70d0cfe69aba27c4df  
> LICENSE
> diff --git a/package/python-cppy/python-cppy.mk 
> b/package/python-cppy/python-cppy.mk
> index 5bfd5a0f16..3253956672 100644
> --- a/package/python-cppy/python-cppy.mk
> +++ b/package/python-cppy/python-cppy.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_CPPY_VERSION = 1.2.1
> +PYTHON_CPPY_VERSION = 1.3.0
>  PYTHON_CPPY_SOURCE = cppy-$(PYTHON_CPPY_VERSION).tar.gz
> -PYTHON_CPPY_SITE = 
> https://files.pythonhosted.org/packages/c5/7e/6cc5acd93752ee52d2f0423046072a2ce3ae16dfcd44373b9fe2a0222204
> +PYTHON_CPPY_SITE = 
> https://files.pythonhosted.org/packages/1e/84/62a09daa04e732a5763ec22dbc11b988e5140a77b418ea70bba9ab1a77a5
>  PYTHON_CPPY_LICENSE = BSD-3-Clause
>  PYTHON_CPPY_LICENSE_FILES = LICENSE
>  PYTHON_CPPY_SETUP_TYPE = setuptools
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
