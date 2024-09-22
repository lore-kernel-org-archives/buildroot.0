Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320ADCF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 16:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D64046070A;
	Sun, 22 Sep 2024 16:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tzxy1Yuh4W1J; Sun, 22 Sep 2024 16:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8C3C605FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8C3C605FD;
	Sun, 22 Sep 2024 16:04:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F6E61BF3E8
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05E52605FD
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLJ1RXccPKQW for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 16:04:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE2AA605E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE2AA605E9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE2AA605E9
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 16:04:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1CDB16013F;
 Sun, 22 Sep 2024 18:04:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Sep 2024 18:03:59 +0200
Date: Sun, 22 Sep 2024 18:03:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZvA_7_HU2Ht90JLN@landeda>
References: <20240922103055.1130268-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240922103055.1130268-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727021043;
 bh=IiyzMXhaspM9FQ8wgng7QweIeWBU0OZ0TvklNmXw1PQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lm32rbQhWjk64in7bGzu02dHfBtYp043XYlpv7aUOblpyzLltxGoU6DiMvZo8ML/y
 3/kCBjurysw3q4Um1Y6jN138NGRTJxFJHoPbYPKAKw3cXjUpaYZbY3ikmvxTDLH4Jx
 rZxj8oVjksJHwXCRv6utg3B6j+zk3+LOyLh7AX3+S8le+0eCI02yusSJIwY9W5pUTT
 nep0TYpBvLpbaIA5W7pFjC6QhQzPenT62xt22o4YA5KTUlz5dakfjgaA4gI1EK0cwK
 ghtnIe0FRBc5u3wLEb3CzTeesw9DUoIM3EjKA6sQTZ2iaty03uRMQ2lsu2y62fCm0W
 kW+7W+A1t3zXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lm32rbQh
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-configobj: bump to
 version 5.0.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-09-22 04:30 -0600, James Hilliard spake thusly:
> Drop no longer required python-six runtime dependency.
> 
> License hash changed due to removing extra "2014" in license:
> https://github.com/DiffSK/configobj/commit/fdf3634418d9acfc72a534b26a796d195c4a7e42
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

I accidentally applied v1 earlier today, so I reverted that and applied
this now.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - add comment about license hash change
> ---
>  package/python-configobj/Config.in             | 1 -
>  package/python-configobj/python-configobj.hash | 6 +++---
>  package/python-configobj/python-configobj.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-configobj/Config.in b/package/python-configobj/Config.in
> index 365aa17fcb..cb9d914745 100644
> --- a/package/python-configobj/Config.in
> +++ b/package/python-configobj/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_PYTHON_CONFIGOBJ
>  	bool "python-configobj"
> -	select BR2_PACKAGE_PYTHON_SIX # runtime
>  	help
>  	  Config file reading, writing and validation.
>  
> diff --git a/package/python-configobj/python-configobj.hash b/package/python-configobj/python-configobj.hash
> index 682dc987f1..b173f0cdd7 100644
> --- a/package/python-configobj/python-configobj.hash
> +++ b/package/python-configobj/python-configobj.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/configobj/json
> -md5  8dda7b31bb3aea87ecfe3b7a87812b17  configobj-5.0.8.tar.gz
> -sha256  6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c627a97  configobj-5.0.8.tar.gz
> +md5  496b60edcd943a900ddc0cb04132e81c  configobj-5.0.9.tar.gz
> +sha256  03c881bbf23aa07bccf1b837005975993c4ab4427ba57f959afdd9d1a2386848  configobj-5.0.9.tar.gz
>  # Locally computed sha256 checksums
> -sha256  0d95e648469a711f5ec1e59e6d4492150ec65d968c1ea6c6d96154a92879997a  LICENSE
> +sha256  fd227649f1956788444397bf0899e977140a5bc662d86826657bc2aad833fe2a  LICENSE
> diff --git a/package/python-configobj/python-configobj.mk b/package/python-configobj/python-configobj.mk
> index fe1776f79f..963bbcb2b8 100644
> --- a/package/python-configobj/python-configobj.mk
> +++ b/package/python-configobj/python-configobj.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CONFIGOBJ_VERSION = 5.0.8
> +PYTHON_CONFIGOBJ_VERSION = 5.0.9
>  PYTHON_CONFIGOBJ_SOURCE = configobj-$(PYTHON_CONFIGOBJ_VERSION).tar.gz
> -PYTHON_CONFIGOBJ_SITE = https://files.pythonhosted.org/packages/cb/87/17d4c6d634c044ab08b11c0cd2a8a136d103713d438f8792d7be2c5148fb
> +PYTHON_CONFIGOBJ_SITE = https://files.pythonhosted.org/packages/f5/c4/c7f9e41bc2e5f8eeae4a08a01c91b2aea3dfab40a3e14b25e87e7db8d501
>  PYTHON_CONFIGOBJ_SETUP_TYPE = setuptools
>  PYTHON_CONFIGOBJ_LICENSE = BSD-3-Clause
>  PYTHON_CONFIGOBJ_LICENSE_FILES = LICENSE
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
