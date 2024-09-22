Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07607CF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 18:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A324940018;
	Sun, 22 Sep 2024 18:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcNjLaX8G5KM; Sun, 22 Sep 2024 18:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28FBB40247
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28FBB40247;
	Sun, 22 Sep 2024 18:05:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D01CC1BF44A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE57E405AE
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9QTdLS2slpe for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 18:05:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 666AC40469
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 666AC40469
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 666AC40469
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 18:05:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9158C60137;
 Sun, 22 Sep 2024 20:05:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Sep 2024 20:05:30 +0200
Date: Sun, 22 Sep 2024 20:05:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZvBcagz98OSWJlvG@landeda>
References: <20240918004359.422768-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240918004359.422768-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727028334;
 bh=eTB3TvkTcXXWaM2ZXg4GbprovumPrfPK9tQT07GDE/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DS5NPXlsw9DF8cRNyifAPyfvtU8bo1iQHftY7yK/JrNfTXArQyIs7kal2ZkKCw2G4
 c/UsmBNBq/EIDfYGNWrOw8ErDflf/d6+h3T5E+6cBpAvftEgE0NANqjL0yp3Ho5Z57
 tSgmXaf6JW+UNvDwOc0Z+H5CBKk8doudlq3rCTQNVpaoDfcelPBZh+a925uhtcLuqx
 wgs1S1Alw+ToUQLbQjU3818c+WIhGm2K83NVWvnTTwg0ZsnBmhNBbz6/mPmceW+7/J
 D74dk2WdsiLKEDl931saQcLj3mvE4kq28De48ki8Vd5MSIcfpAtrP1TU7U7o6o+xh+
 TfeFe81AGly2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DS5NPXls
Subject: Re: [Buildroot] [PATCH 1/2] package/python-path: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-09-17 18:43 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/Config.in                    |  1 +
>  package/python-path/Config.in        |  6 ++++++
>  package/python-path/python-path.hash |  5 +++++
>  package/python-path/python-path.mk   | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-path/Config.in
>  create mode 100644 package/python-path/python-path.hash
>  create mode 100644 package/python-path/python-path.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 2200f16520..1033cfdef1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1246,6 +1246,7 @@ menu "External python modules"
>  	source "package/python-paramiko/Config.in"
>  	source "package/python-parso/Config.in"
>  	source "package/python-passlib/Config.in"
> +	source "package/python-path/Config.in"
>  	source "package/python-pathpy/Config.in"
>  	source "package/python-pathspec/Config.in"
>  	source "package/python-pathtools/Config.in"
> diff --git a/package/python-path/Config.in b/package/python-path/Config.in
> new file mode 100644
> index 0000000000..a03b568593
> --- /dev/null
> +++ b/package/python-path/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_PATH
> +	bool "python-path"
> +	help
> +	  Object-oriented file system path manipulation.
> +
> +	  https://github.com/jaraco/path
> diff --git a/package/python-path/python-path.hash b/package/python-path/python-path.hash
> new file mode 100644
> index 0000000000..9a0d1a3681
> --- /dev/null
> +++ b/package/python-path/python-path.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/path/json
> +md5  b970d0bcde985133cae6926a02e496b9  path-17.0.0.tar.gz
> +sha256  e1540261d22df1416fb1b498b3b1ed5353a371a48fe197d66611bb01e7fab2d5  path-17.0.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
> diff --git a/package/python-path/python-path.mk b/package/python-path/python-path.mk
> new file mode 100644
> index 0000000000..6e094aaad5
> --- /dev/null
> +++ b/package/python-path/python-path.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-path
> +#
> +################################################################################
> +
> +PYTHON_PATH_VERSION = 17.0.0
> +PYTHON_PATH_SOURCE = path-$(PYTHON_PATH_VERSION).tar.gz
> +PYTHON_PATH_SITE = https://files.pythonhosted.org/packages/ff/a3/5dac44ce60ad6543578736a5729c5c2130cdac1c3117c61aad0583c2e3c6
> +PYTHON_PATH_SETUP_TYPE = setuptools
> +PYTHON_PATH_LICENSE = MIT
> +PYTHON_PATH_LICENSE_FILES = LICENSE
> +PYTHON_PATH_DEPENDENCIES = host-python-setuptools-scm
> +
> +$(eval $(python-package))
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
