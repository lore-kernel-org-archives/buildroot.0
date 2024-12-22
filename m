Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F7EE77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 677C681F69;
	Sun, 22 Dec 2024 14:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKEElN0T2Etv; Sun, 22 Dec 2024 14:09:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 408FA81E4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 408FA81E4C;
	Sun, 22 Dec 2024 14:09:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F115D3
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C6A040744
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RucNZVdgtQxw for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:09:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A5F484073D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5F484073D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5F484073D
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:09:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6C5BE780371;
 Sun, 22 Dec 2024 15:09:13 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53540])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:09:13 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:09:13 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241219010810.237875-1-james.hilliard1@gmail.com>
References: <20241219010810.237875-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <66ef48b1d690be437988cc45a2d2f75a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876555;
 bh=LitQvX7MUdkpsNVkNCEoAc2cguHu1qKZDv/jMiYOJpw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K/hHUuAgsR8Laz2xVc8Dj3BVxXOxgqbJfWf26c9R4p+owlKTXrbK5EroXH1pHYUC9
 XzYxqJYdyoC55ajH7mkh4HsEvDmYhXsGGWVdRGc3GJKWUOuubBJmgDht1Vh+UvbB8v
 7MrEgWUOQGdWjb7+XC8V1iisYZIh2tVrqzMZx2gKwaB3gPXNSqiDVpy9Zf5HrEY+JG
 iH1KLMMR4iJK+rWT1Ay5ORTxRRrsVaXPXW1fsO5Tx5wQbT5dwUDWX7d3tsWVJ6Af45
 wVRt+Urc8TnBzrt5LmrNMwUUKb9xZTQOyO6QMRJ3ABbctjVHrxg+RBLCqjTwYnbY/X
 J4z1GcVzmDpRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K/hHUuAg
Subject: Re: [Buildroot] [PATCH 1/2] package/python-asyncclick: new package
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

On 19/12/2024 02:08, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks.

> ---
>  package/Config.in                                |  1 +
>  package/python-asyncclick/Config.in              |  7 +++++++
>  package/python-asyncclick/python-asyncclick.hash |  5 +++++
>  package/python-asyncclick/python-asyncclick.mk   | 15 +++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-asyncclick/Config.in
>  create mode 100644 package/python-asyncclick/python-asyncclick.hash
>  create mode 100644 package/python-asyncclick/python-asyncclick.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index feb4840a7d..06472aa972 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1013,6 +1013,7 @@ menu "External python modules"
>  	source "package/python-async-generator/Config.in"
>  	source "package/python-async-lru/Config.in"
>  	source "package/python-async-timeout/Config.in"
> +	source "package/python-asyncclick/Config.in"
>  	source "package/python-asyncssh/Config.in"
>  	source "package/python-attrs/Config.in"
>  	source "package/python-augeas/Config.in"
> diff --git a/package/python-asyncclick/Config.in 
> b/package/python-asyncclick/Config.in
> new file mode 100644
> index 0000000000..9264245213
> --- /dev/null
> +++ b/package/python-asyncclick/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_ASYNCCLICK
> +	bool "python-asyncclick"
> +	select BR2_PACKAGE_PYTHON_ANYIO # runtime
> +	help
> +	  Composable command line interface toolkit, async version.
> +
> +	  https://palletsprojects.com/p/click/
> diff --git a/package/python-asyncclick/python-asyncclick.hash 
> b/package/python-asyncclick/python-asyncclick.hash
> new file mode 100644
> index 0000000000..59f00893e5
> --- /dev/null
> +++ b/package/python-asyncclick/python-asyncclick.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/asyncclick/json
> +md5  542e83089a55129ca2fe7ccdbc65ba77  asyncclick-8.1.7.2.tar.gz
> +sha256  
> 219ea0f29ccdc1bb4ff43bcab7ce0769ac6d48a04f997b43ec6bee99a222daa0  
> asyncclick-8.1.7.2.tar.gz
> +# Locally computed sha256 checksums
> +sha256  
> 9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  
> LICENSE.rst
> diff --git a/package/python-asyncclick/python-asyncclick.mk 
> b/package/python-asyncclick/python-asyncclick.mk
> new file mode 100644
> index 0000000000..946325e496
> --- /dev/null
> +++ b/package/python-asyncclick/python-asyncclick.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-asyncclick
> +#
> +################################################################################
> +
> +PYTHON_ASYNCCLICK_VERSION = 8.1.7.2
> +PYTHON_ASYNCCLICK_SOURCE = 
> asyncclick-$(PYTHON_ASYNCCLICK_VERSION).tar.gz
> +PYTHON_ASYNCCLICK_SITE = 
> https://files.pythonhosted.org/packages/5e/bf/59d836c3433d7aa07f76c2b95c4eb763195ea8a5d7f9ad3311ed30c2af61
> +PYTHON_ASYNCCLICK_SETUP_TYPE = setuptools
> +PYTHON_ASYNCCLICK_LICENSE = BSD-3-Clause
> +PYTHON_ASYNCCLICK_LICENSE_FILES = LICENSE.rst
> +PYTHON_ASYNCCLICK_DEPENDENCIES = host-python-setuptools-scm
> +
> +$(eval $(python-package))
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
