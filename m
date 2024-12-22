Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB378E77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAC1980BFE;
	Sun, 22 Dec 2024 14:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZ9dGPjAYXuO; Sun, 22 Dec 2024 14:14:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABE9780C3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABE9780C3D;
	Sun, 22 Dec 2024 14:14:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A51C45E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 922D7408A5
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:14:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXvby8ExxdMg for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:14:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5581B40884
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5581B40884
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5581B40884
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:14:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 82330780502;
 Sun, 22 Dec 2024 15:14:05 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52362])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:14:05 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:14:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219023616.288769-1-james.hilliard1@gmail.com>
References: <20241219023616.288769-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <38e3a11da923347dfd9127c6f9a7d79f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876846;
 bh=YQTlcnipEhIayyLUmALArNpmJ8D2BYSsL0Y+rVxOQgg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S61r41ddp0mjhOrPcg7om8GoJfnoXyDdOkaKEDgtQY6wILGCD7HrlbagG9TlKKBvw
 xY/StF48jcHVsjKWeRjSUOIMkmCPgOMCGLBKubWc0qoes04grxjRYcCqZaQz6iKZ7J
 TgpzsuzHjloj4sKfK20a9yWpFhRjVmvcciEFnujUi/Yz4HK/ok6CxxDc2r+pEYKS+i
 33A38JBjag62/u2tXOWlENhb2D9f7yCCkWMFTvdOf3WOJcCIArzDYcJkSThdJRY2V4
 lsTorCQdwUeV8q8Z4Sqz+MfblQ6lHYjdR2H6WrP/TzE15nmpnY0wdql4nZeG9e9twJ
 CmvR5wxm5EyBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S61r41dd
Subject: Re: [Buildroot] [PATCH 1/1] package/python-six: bump to version
 1.17.0
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

On 19/12/2024 03:36, James Hilliard wrote:
> License hash changed due to year update:
> https://github.com/benjaminp/six/commit/8cb688f32f24b6ebe94938b15e92ec5c75dd8f12
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-six/python-six.hash | 6 +++---
>  package/python-six/python-six.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-six/python-six.hash 
> b/package/python-six/python-six.hash
> index 17615e8699..bb636c9634 100644
> --- a/package/python-six/python-six.hash
> +++ b/package/python-six/python-six.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/six/json
> -md5  a7c927740e4964dd29b72cebfc1429bb  six-1.16.0.tar.gz
> -sha256  
> 1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926  
> six-1.16.0.tar.gz
> +md5  a0387fe15662c71057b4fb2b7aa9056a  six-1.17.0.tar.gz
> +sha256  
> ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81  
> six-1.17.0.tar.gz
>  # Locally computed sha256 checksums
> -sha256  
> 8bb850c565aa389fdc16f3a46965ad23d82adff60f2393fc2762b63185e8e6c9  
> LICENSE
> +sha256  
> 4375ba20e2b9c6c4e7cad2940a628fd90e95cc3d50ee92aae755715d8ba1fbd0  
> LICENSE
> diff --git a/package/python-six/python-six.mk 
> b/package/python-six/python-six.mk
> index 9e3e5fcf50..84ba78161e 100644
> --- a/package/python-six/python-six.mk
> +++ b/package/python-six/python-six.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_SIX_VERSION = 1.16.0
> +PYTHON_SIX_VERSION = 1.17.0
>  PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
> -PYTHON_SIX_SITE = 
> https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e
> +PYTHON_SIX_SITE = 
> https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2
>  PYTHON_SIX_SETUP_TYPE = setuptools
>  PYTHON_SIX_LICENSE = MIT
>  PYTHON_SIX_LICENSE_FILES = LICENSE
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
