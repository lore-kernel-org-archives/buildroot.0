Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D322AE7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A446F80C63;
	Fri, 27 Dec 2024 14:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsIMTCeTj0c0; Fri, 27 Dec 2024 14:42:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A679680AF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A679680AF1;
	Fri, 27 Dec 2024 14:42:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44D23E0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 330E580834
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ll7qlposcUx for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:42:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 323BB80CD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 323BB80CD2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 323BB80CD2
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:42:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 802C95FF95;
 Fri, 27 Dec 2024 15:42:50 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42118])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:42:50 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:42:50 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223164645.1877142-1-james.hilliard1@gmail.com>
References: <20241223164645.1877142-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <7f874989db96733cb2fde39172e3f80e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310571;
 bh=gV4PMhsY75+yKnNyqOWGfZ5Zitbkm9q/cDwt1B5QGhU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VCHKL+Bm/00Id/pq468VJkV6ZnEu7Dw24/tqfOoebgoMa2BafXYzZn95JsXzCTull
 +pFg6lzJxWh/R8Whew5q02VZKw3MYXCci1C9G0hVr+d6UG4/+bUV4X0xaFJoddGgpv
 SnWXhscCGjog/EXdHqc0unLT1ae3jgXZ6Ef+3aW/rmu8OcqaOPhxmzJlEqgdUwZIaZ
 Og0tCrJxUtYYA55uk70fAJYObg1zNjAP1YYKnqn9zjdXG32J9IZNiYwJKhMFsOfowX
 KyPDmF0hvYhIIBkyCv6aOHeKFt5xSXui71xp/C+8nltjcqGqRPmVqKhb3YzwXpdZDS
 ygwOke2W6xlJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VCHKL+Bm
Subject: Re: [Buildroot] [PATCH 1/1] package/python-google-api-core: bump to
 version 2.24.0
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

On 23/12/2024 17:46, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-google-api-core/python-google-api-core.hash | 4 ++--
>  package/python-google-api-core/python-google-api-core.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-google-api-core/python-google-api-core.hash 
> b/package/python-google-api-core/python-google-api-core.hash
> index 397ce7cb40..43bf50a5f2 100644
> --- a/package/python-google-api-core/python-google-api-core.hash
> +++ b/package/python-google-api-core/python-google-api-core.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/google-api-core/json
> -md5  b69067b81abd55aa7eecc22858ea326c  google_api_core-2.22.0.tar.gz
> -sha256  
> 26f8d76b96477db42b55fd02a33aae4a42ec8b86b98b94969b7333a2c828bf35  
> google_api_core-2.22.0.tar.gz
> +md5  5e5fbe5e5e6b14b9243b74055b8a50b4  google_api_core-2.24.0.tar.gz
> +sha256  
> e255640547a597a4da010876d333208ddac417d60add22b6851a0c66a831fcaf  
> google_api_core-2.24.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  
> LICENSE
> diff --git a/package/python-google-api-core/python-google-api-core.mk 
> b/package/python-google-api-core/python-google-api-core.mk
> index b48d934e73..d79d0eb749 100644
> --- a/package/python-google-api-core/python-google-api-core.mk
> +++ b/package/python-google-api-core/python-google-api-core.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_GOOGLE_API_CORE_VERSION = 2.22.0
> +PYTHON_GOOGLE_API_CORE_VERSION = 2.24.0
>  PYTHON_GOOGLE_API_CORE_SOURCE = 
> google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
> -PYTHON_GOOGLE_API_CORE_SITE = 
> https://files.pythonhosted.org/packages/00/c2/425f97c2087affbd452a05d3faa08d97de333f2ca554733e1becab55ee4e
> +PYTHON_GOOGLE_API_CORE_SITE = 
> https://files.pythonhosted.org/packages/81/56/d70d66ed1b5ab5f6c27bf80ec889585ad8f865ff32acbafd3b2ef0bfb5d0
>  PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
>  PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
>  PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
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
