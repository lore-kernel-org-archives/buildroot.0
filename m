Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156CFCF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 20:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFACF402CE;
	Sat, 21 Sep 2024 20:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ug_dIICh-nIQ; Sat, 21 Sep 2024 20:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64A7440499
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64A7440499;
	Sat, 21 Sep 2024 20:17:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F305B1BF48B
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 20:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF4B560656
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 20:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xz9eq2qcKsX5 for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 20:17:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE02D6061F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE02D6061F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE02D6061F
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 20:17:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3CF7F5FFB4;
 Sat, 21 Sep 2024 22:17:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Sep 2024 22:17:45 +0200
Date: Sat, 21 Sep 2024 22:17:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zu8p6WUIIASFTeOc@landeda>
References: <20240905194023.1103271-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240905194023.1103271-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726949868;
 bh=8EhwW5fIlYi7IzfDwF983m+f4mXyIGFXUylU0sVklAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GnwvPVLOxys0LkazdzllQ2RI5wKWnzbssHqANjW7fAon4oRJiQ5TqG5WICGvxH5lO
 d2HNObfB8JAMD71dNeBLgnfEE6jIWRRKBtJwcWppg8wweZu4kXsr7+YfHIx/Xr+e9A
 wP7F4zi3bbfElxAqbqagq1uDLH/zMHrFbOwfs+pCYGIrShkt5v6CC+7Q4bDukNZzg8
 HlRCz0RGLDotN39dF8O9lqIOBlv1IC8FIOLWoyT9owGsSa0PZBtR4glnuAaHH8zTNp
 QjP1a3dGrSKJ3qZm9AHtHlcaaaB0muzNPVJGEfj3saL7/tKxQUYRY0+GJunkPUpLra
 AbM8msvVfTyUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GnwvPVLO
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cffi: bump to version
 1.17.1
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

On 2024-09-05 13:40 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-cffi/python-cffi.hash | 4 ++--
>  package/python-cffi/python-cffi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
> index 0573d6ec06..2847d38b55 100644
> --- a/package/python-cffi/python-cffi.hash
> +++ b/package/python-cffi/python-cffi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/cffi/json
> -md5  0bcaed453da3004d0bea103038345c1e  cffi-1.16.0.tar.gz
> -sha256  bcb3ef43e58665bbda2fb198698fcae6776483e0c4a631aa5647806c25e02cc0  cffi-1.16.0.tar.gz
> +md5  4336ca58b2df0cc3b163884d5fa2e5e2  cffi-1.17.1.tar.gz
> +sha256  1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824  cffi-1.17.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
> diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
> index 1f83db079b..152009e8ca 100644
> --- a/package/python-cffi/python-cffi.mk
> +++ b/package/python-cffi/python-cffi.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CFFI_VERSION = 1.16.0
> +PYTHON_CFFI_VERSION = 1.17.1
>  PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
> -PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/68/ce/95b0bae7968c65473e1298efb042e10cafc7bafc14d9e4f154008241c91d
> +PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/fc/97/c783634659c2920c3fc70419e3af40972dbaf758daa229a7d6ea6135c90d
>  PYTHON_CFFI_SETUP_TYPE = setuptools
>  PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
>  PYTHON_CFFI_LICENSE = MIT
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
