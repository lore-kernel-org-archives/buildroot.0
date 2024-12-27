Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B81E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F260480F2F;
	Fri, 27 Dec 2024 14:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFmF5JvKNMB6; Fri, 27 Dec 2024 14:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D06380B6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D06380B6F;
	Fri, 27 Dec 2024 14:40:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20A96E0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE94B402B5
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQLNineRRJRP for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:40:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93589402BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93589402BE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93589402BE
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:40:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1E9E15FFAF;
 Fri, 27 Dec 2024 15:40:31 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42118])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:40:31 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:40:31 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Mauro Condarelli <mc5686@mclink.it>
In-Reply-To: <20241223162013.1860033-1-james.hilliard1@gmail.com>
References: <20241223162013.1860033-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <d0d5db77b3cf304bb3f3df89366a5a2e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310433;
 bh=qljHWYhRSLye2almZE9xX6d1yBjeIL71QAh4RD16VgQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kKmO3k56Q1OMvr2tQswAHI4zywoJ9L5L0hiAJq6z9DV3FYy82YkbfshDhs+7K4hXA
 2jCs3OPXHAjFCmTZTorn7hVQmixR/6E1GZQJ+FBiUWi2LOKgltTyVJhqkxxJJivGsk
 6iqS04dLjWlPgIYCtb7JnejZsNpKlOToHaMlHCNvA0vAORjj/RMOWb/s8xwjNJSHv/
 PJkdiMjBaBqp6FVsLNZzvLgaP8Ct8pX5McI+74riViVDv3cmTJWaIIG7TdW46/js4a
 oCd2y5YsIhQYpKlTp2bbsjffayL0U108PFFKM0G0n62A+d6erBOqr4Aw2MTWxLuRCW
 FChiUkZNgOcUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kKmO3k56
Subject: Re: [Buildroot] [PATCH 1/1] package/python-click: bump to version
 8.1.8
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

On 23/12/2024 17:20, James Hilliard wrote:
> Migrate from setuptools build backend to flit.
> 
> License file renamed without content changes.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-click/python-click.hash | 6 +++---
>  package/python-click/python-click.mk   | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/python-click/python-click.hash 
> b/package/python-click/python-click.hash
> index 0fc04d638a..3511954a5d 100644
> --- a/package/python-click/python-click.hash
> +++ b/package/python-click/python-click.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/click/json
> -md5  7c3b52c56fd30699f453a7dc7b42cecb  click-8.1.7.tar.gz
> -sha256  
> ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de  
> click-8.1.7.tar.gz
> +md5  b52ee8e6c33d88a2b4626e6a6002245d  click-8.1.8.tar.gz
> +sha256  
> ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a  
> click-8.1.8.tar.gz
>  # Locally computed sha256 checksums
> -sha256  
> 9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  
> LICENSE.rst
> +sha256  
> 9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  
> LICENSE.txt
> diff --git a/package/python-click/python-click.mk 
> b/package/python-click/python-click.mk
> index 0e29ff034e..8597c65cec 100644
> --- a/package/python-click/python-click.mk
> +++ b/package/python-click/python-click.mk
> @@ -4,11 +4,11 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_CLICK_VERSION = 8.1.7
> +PYTHON_CLICK_VERSION = 8.1.8
>  PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
> -PYTHON_CLICK_SITE = 
> https://files.pythonhosted.org/packages/96/d3/f04c7bfcf5c1862a2a5b845c6b2b360488cf47af55dfa79c98f6a6bf98b5
> +PYTHON_CLICK_SITE = 
> https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b
> +PYTHON_CLICK_SETUP_TYPE = flit
>  PYTHON_CLICK_LICENSE = BSD-3-Clause
> -PYTHON_CLICK_LICENSE_FILES = LICENSE.rst
> -PYTHON_CLICK_SETUP_TYPE = setuptools
> +PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
> 
>  $(eval $(python-package))
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
