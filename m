Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C36E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECAD680C93;
	Fri, 27 Dec 2024 14:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAZblS0v6N8y; Fri, 27 Dec 2024 14:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0728380D04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0728380D04;
	Fri, 27 Dec 2024 14:35:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6CE9F1B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7C7480D04
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhEK7IHyHuQJ for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:35:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6AA780C93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6AA780C93
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6AA780C93
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:35:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 09983780316;
 Fri, 27 Dec 2024 15:35:53 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:35:53 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:35:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223145338.1721041-1-james.hilliard1@gmail.com>
References: <20241223145338.1721041-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <53b6b56f43bba6958c66be5ed28d0043@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310155;
 bh=lPRrZqn5N8GB/apmFBkuXslypSGHgJg0145BzPAkMRQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VT91Nq/3+lWHe2IyK7v49WWs6s6yvg8bcYwKWN+KyI0GRVEDq1TaUOrqwn9wdkJ5A
 tF5e0pOnIDm1tgDWhzKLz/HiG9j902snLOrhXG5jr4ZLa8hQDNupM+ucfTGgzWnxSP
 UFXyCNQD22vDMrBPAxhQnH5cNQGR6Y05ydiuqwCkXNxK9gRlg1sjpHF4RrHOUam/GM
 FB95pXlO0kFVUtxy2mxJgt/20p/5rUj9DBY+OWYfLTZnL+P4Qkh8XSMJrY8jpUVl46
 rdrtn9PbD/HGkAcQdObi/tnDnyvoHrHBEO42Sa9gxXRxhso7z8R+Drn2VTVAX9+ocu
 UGRpvpczzEdbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VT91Nq/3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiorwlock: bump to
 version 1.5.0
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

On 23/12/2024 15:53, James Hilliard wrote:
> Migrate from setuptools to poetry build backend.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-aiorwlock/python-aiorwlock.hash | 4 ++--
>  package/python-aiorwlock/python-aiorwlock.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-aiorwlock/python-aiorwlock.hash 
> b/package/python-aiorwlock/python-aiorwlock.hash
> index 50a670280f..6ba5269c16 100644
> --- a/package/python-aiorwlock/python-aiorwlock.hash
> +++ b/package/python-aiorwlock/python-aiorwlock.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/aiorwlock/json
> -md5  669ff2887392cfa393205cea23661c2f  aiorwlock-1.4.0.tar.gz
> -sha256  
> 4cea5bec4e9d03533a26919299394822a1422aa519bca9dd09178ec490f8d1cc  
> aiorwlock-1.4.0.tar.gz
> +md5  094d8676f4fa812ab35225e3737edbc8  aiorwlock-1.5.0.tar.gz
> +sha256  
> b529da24da659bdedcf68faf216595bde00db228c905197ac554773620e7fd2f  
> aiorwlock-1.5.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> fa99ee9d7727194a9f8994c67d1948dc42e8e00ab809fd4a47acfae119d11403  
> LICENSE
> diff --git a/package/python-aiorwlock/python-aiorwlock.mk 
> b/package/python-aiorwlock/python-aiorwlock.mk
> index 4209ae407c..7f41b50442 100644
> --- a/package/python-aiorwlock/python-aiorwlock.mk
> +++ b/package/python-aiorwlock/python-aiorwlock.mk
> @@ -4,10 +4,10 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_AIORWLOCK_VERSION = 1.4.0
> +PYTHON_AIORWLOCK_VERSION = 1.5.0
>  PYTHON_AIORWLOCK_SOURCE = aiorwlock-$(PYTHON_AIORWLOCK_VERSION).tar.gz
> -PYTHON_AIORWLOCK_SITE = 
> https://files.pythonhosted.org/packages/ba/c5/882b4c89d71d6f9c7d0d8dee18d267025e71d4c3241eb3b16ab39105a0d1
> -PYTHON_AIORWLOCK_SETUP_TYPE = setuptools
> +PYTHON_AIORWLOCK_SITE = 
> https://files.pythonhosted.org/packages/c5/bf/d1ddcd676be027a963b3b01fdf9915daf4590b4dfd03bf1c8c2858aac7e3
> +PYTHON_AIORWLOCK_SETUP_TYPE = poetry
>  PYTHON_AIORWLOCK_LICENSE = Apache-2.0
>  PYTHON_AIORWLOCK_LICENSE_FILES = LICENSE
> 
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
