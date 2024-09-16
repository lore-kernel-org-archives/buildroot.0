Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861BEC3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1762D60A88;
	Mon, 16 Sep 2024 10:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjeoKcLvqtF7; Mon, 16 Sep 2024 10:12:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1A4C60A99
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1A4C60A99;
	Mon, 16 Sep 2024 10:12:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 680941BF5A4
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 574B780B6F
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybMxVuk2xBNh for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:11:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47D3080B6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47D3080B6C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47D3080B6C
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:11:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.117.145])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2C241B00535;
 Mon, 16 Sep 2024 12:11:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 12:11:48 +0200
Date: Mon, 16 Sep 2024 12:11:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZugEZGPkWpJC5kUJ@landeda>
References: <20240915221018.1655380-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240915221018.1655380-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726481515;
 bh=NY3zmyyrtWtRn8F/+rhoPndAZiRMwuvrpnWxJD5xuVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ATYlIXI42BmTU0nl8FbmeY9QJjYMUa48TlR8/1EexzhYo/VojRrhj3iODvNohsBCF
 8wUXdTQ1sGnDQsg4DIqRJNRWXOGY4cfVS7Y2g7PbSk/SP43UUdKe5eo3OWCpTUoxau
 C0yPW5QQ2kbL2K+9xzi3HeTNh+jum142y3StFwJ9VJYZZOe+tjbsFdixUki5yfFpz4
 TrBBu37Vn+/siA6lkAcwvd+Iz2wx06QekkE3KnAju1qEWUiXRFHAAHqm5iMtMufYEy
 q4eRsoDpjvH7E2YwI8HK9qO4cWmV5loxyrPokCpT7YXxa5uh3DZgeG4XY1GRgHvkh7
 n6RaZG9c/A5dQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ATYlIXI4
Subject: Re: [Buildroot] [PATCH 1/3] package/python-iterable-io: new package
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-09-15 16:10 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series of 3 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/Config.in                                  |  1 +
>  package/python-iterable-io/Config.in               |  7 +++++++
>  package/python-iterable-io/python-iterable-io.hash |  5 +++++
>  package/python-iterable-io/python-iterable-io.mk   | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-iterable-io/Config.in
>  create mode 100644 package/python-iterable-io/python-iterable-io.hash
>  create mode 100644 package/python-iterable-io/python-iterable-io.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index c0f4d9ece5..a0d2f329b7 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1167,6 +1167,7 @@ menu "External python modules"
>  	source "package/python-ipython/Config.in"
>  	source "package/python-ipython-genutils/Config.in"
>  	source "package/python-iso8601/Config.in"
> +	source "package/python-iterable-io/Config.in"
>  	source "package/python-itsdangerous/Config.in"
>  	source "package/python-iwlib/Config.in"
>  	source "package/python-janus/Config.in"
> diff --git a/package/python-iterable-io/Config.in b/package/python-iterable-io/Config.in
> new file mode 100644
> index 0000000000..e85159eb2f
> --- /dev/null
> +++ b/package/python-iterable-io/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_ITERABLE_IO
> +	bool "python-iterable-io"
> +	help
> +	  Adapt generators and other iterables to a file-like
> +	  interface.
> +
> +	  https://github.com/pR0Ps/iterable-io
> diff --git a/package/python-iterable-io/python-iterable-io.hash b/package/python-iterable-io/python-iterable-io.hash
> new file mode 100644
> index 0000000000..aae6ad547e
> --- /dev/null
> +++ b/package/python-iterable-io/python-iterable-io.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/iterable-io/json
> +md5  d6027af37f8e15edd346bdff6d5c5e3c  iterable-io-1.0.0.tar.gz
> +sha256  fb9e1b739587a9ba0d5c60a3e1eb71246761583bc9f18b3c35bb112b44b18c3c  iterable-io-1.0.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  5de72116ec3738168bbaea5bd3405d161246ac542456470dc074f23d336252c0  README.md
> diff --git a/package/python-iterable-io/python-iterable-io.mk b/package/python-iterable-io/python-iterable-io.mk
> new file mode 100644
> index 0000000000..e59c7d6455
> --- /dev/null
> +++ b/package/python-iterable-io/python-iterable-io.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-iterable-io
> +#
> +################################################################################
> +
> +PYTHON_ITERABLE_IO_VERSION = 1.0.0
> +PYTHON_ITERABLE_IO_SOURCE = iterable-io-$(PYTHON_ITERABLE_IO_VERSION).tar.gz
> +PYTHON_ITERABLE_IO_SITE = https://files.pythonhosted.org/packages/40/be/27d59b5c1d74ecbd26c1142f84b61d6cb04f0d0337697149645f34406b2d
> +PYTHON_ITERABLE_IO_SETUP_TYPE = setuptools
> +PYTHON_ITERABLE_IO_LICENSE = LGPL-3.0
> +PYTHON_ITERABLE_IO_LICENSE_FILES = README.md
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
