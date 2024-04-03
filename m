Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE72CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 20:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D937F416CA;
	Wed,  3 Apr 2024 20:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBtBucrgCUpZ; Wed,  3 Apr 2024 20:05:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78D5541836
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78D5541836;
	Wed,  3 Apr 2024 20:05:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 316C21BF408
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B82441847
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2fdVOgP5hWY for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 20:05:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 715BC41836
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 715BC41836
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 715BC41836
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 20:05:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4EAC413F88F;
 Wed,  3 Apr 2024 22:05:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 Apr 2024 22:05:13 +0200
Date: Wed, 3 Apr 2024 22:05:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zg22eduN3ymhGyly@landeda>
References: <20240403192150.107906-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403192150.107906-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712174716;
 bh=RafymjQMmpVWfhEHc908OCVh8/iBlBHdwGffQEksQDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jIf36RIBBhFfG890y5dVVCwcYwmMBUDW5P08l8vhF9PsStJFuiC2/04iI0isBFb1W
 /B38nUzMPywQUkTZceQiIAHG1ejOpXs0JzshTUlM0bTqsJ3LypQ0NKTOhLtPcyIxeR
 Jiovw/aT8pNv5RXAE39U9L8qq+NLUrimvxCv+UYIfSKHHrAnSavmG5xIcA8shu2SiB
 Oss6gPobQoEI+VXJt5fwChXgjPio3rF131a9UQdm2WViGrmWdJbxBaGsBV7XjRwLHm
 nLZNuUPh+hknZeoakSKl6ZHkHFekxk8W/7uEL+AHjzkjBzGzjUDruOPVmGH3XcXDF5
 2O4ywRXFuEa7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jIf36RIB
Subject: Re: [Buildroot] [PATCH 1/1] package/scons: bump to verion 4.7.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-04-03 13:21 -0600, James Hilliard spake thusly:
> Drop no longer needed HOST_SCONS_INSTALL_OPTS.

It would have been nice to briefly explain why...

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/scons/scons.hash | 6 ++++--
>  package/scons/scons.mk   | 7 ++-----
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/package/scons/scons.hash b/package/scons/scons.hash
> index 48b5077b2e..8dca99830e 100644
> --- a/package/scons/scons.hash
> +++ b/package/scons/scons.hash
> @@ -1,3 +1,5 @@
> -# Locally computed:
> -sha256  ce26aac95d350a79a4192196b0beac3cb24f4ccabce0123eb28d3370f576f072  SCons-4.5.2.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/scons/json
> +md5  f5a740e94864408902c62bdb47687d9d  SCons-4.7.0.tar.gz
> +sha256  d8b617f6610a73e46509de70dcf82f76861b79762ff602d546f4e80918ec81f3  SCons-4.7.0.tar.gz
> +# Locally computed sha256 checksums
>  sha256  2f6ac9a1fc98394d18b80dba9bedb9d5626006d44db3fecf7cf3e21cff7e8b1c  LICENSE
> diff --git a/package/scons/scons.mk b/package/scons/scons.mk
> index ffd6abf609..b6bfaa0237 100644
> --- a/package/scons/scons.mk
> +++ b/package/scons/scons.mk
> @@ -4,16 +4,13 @@
>  #
>  ################################################################################
>  
> -SCONS_VERSION = 4.5.2
> +SCONS_VERSION = 4.7.0
>  SCONS_SOURCE = SCons-$(SCONS_VERSION).tar.gz
> -SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
> +SCONS_SITE = https://files.pythonhosted.org/packages/7b/68/6895065c86c65a9388eb760a43ea695ec5b9b1c98a9675a3bcd682dbe9c0
>  SCONS_LICENSE = MIT
>  SCONS_LICENSE_FILES = LICENSE
>  SCONS_SETUP_TYPE = setuptools
>  
> -HOST_SCONS_INSTALL_OPTS = \
> -	--install-lib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
> -
>  $(eval $(host-python-package))
>  
>  # variables used by other packages
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
