Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128F3CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 18:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC6A140124;
	Sun, 22 Sep 2024 18:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rc_mdhX3raTl; Sun, 22 Sep 2024 18:05:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CD224027F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CD224027F;
	Sun, 22 Sep 2024 18:05:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A08B1BF44A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D08D940124
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nd9YXHy9MNHh for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 18:05:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A1CC40586
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A1CC40586
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A1CC40586
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 18:05:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D75D25FFAA;
 Sun, 22 Sep 2024 20:05:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Sep 2024 20:05:03 +0200
Date: Sun, 22 Sep 2024 20:05:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZvBcT9947Krho7fO@landeda>
References: <20240918002220.414668-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240918002220.414668-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727028308;
 bh=rd2iJTxuZV50qWxqD6h85Df6THamfWMBImWybRlCxS0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lqDcLgY2bkQ8Eq8se0meZ8DuOFgEC8soscPLWr4Ix/B5+COpC9rVbDdgRNx6cBRBF
 4es32miFZUUvJhbl3TgiWtOzhIo6AWzPd+qHRwMDGKCUYD2kjtEMAKGr5FIyWg3GCL
 xfBb+FROUTQ+dB0EK71wtKCIA0hUHnoIymrlm4U9h9hJsZ0fz/11oGNkXuQmUN95nV
 8eFduc6URfT5rgmVvBz31Sm8xSunIrI12bmEALfQ+BdIbRJ1J9HfuWniv822s3lwjx
 ZrLXaJVtwbIMfZA1PyHED/cUD4irq0jc7hWMhrkl8bIF144m5+ksyONm5YFsWHZIMw
 6m5A2Za+H17mw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lqDcLgY2
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pysnmpcrypto: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-09-17 18:22 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/Config.in                                 |  1 +
>  package/python-pysnmpcrypto/Config.in             |  9 +++++++++
>  .../python-pysnmpcrypto/python-pysnmpcrypto.hash  |  5 +++++
>  .../python-pysnmpcrypto/python-pysnmpcrypto.mk    | 15 +++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/python-pysnmpcrypto/Config.in
>  create mode 100644 package/python-pysnmpcrypto/python-pysnmpcrypto.hash
>  create mode 100644 package/python-pysnmpcrypto/python-pysnmpcrypto.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 2200f16520..c0b64de7f9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1322,6 +1322,7 @@ menu "External python modules"
>  	source "package/python-pysmi/Config.in"
>  	source "package/python-pysnmp/Config.in"
>  	source "package/python-pysnmp-mibs/Config.in"
> +	source "package/python-pysnmpcrypto/Config.in"
>  	source "package/python-pysocks/Config.in"
>  	source "package/python-pyspnego/Config.in"
>  	source "package/python-pytablereader/Config.in"
> diff --git a/package/python-pysnmpcrypto/Config.in b/package/python-pysnmpcrypto/Config.in
> new file mode 100644
> index 0000000000..da9dd6cf43
> --- /dev/null
> +++ b/package/python-pysnmpcrypto/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_PYSNMPCRYPTO
> +	bool "python-pysnmpcrypto"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
> +	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
> +	help
> +	  Strong cryptography support for PySNMP (SNMP library for
> +	  Python).
> +
> +	  https://github.com/lextudio/pysnmpcrypto
> diff --git a/package/python-pysnmpcrypto/python-pysnmpcrypto.hash b/package/python-pysnmpcrypto/python-pysnmpcrypto.hash
> new file mode 100644
> index 0000000000..d36d20b43f
> --- /dev/null
> +++ b/package/python-pysnmpcrypto/python-pysnmpcrypto.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/pysnmpcrypto/json
> +md5  969f3690cf2ba4309c047af31d17617e  pysnmpcrypto-0.1.0.tar.gz
> +sha256  ee6819247ceee09aa2de54b998c51ccf595d75a9ccc2e303383b39a5ac63816c  pysnmpcrypto-0.1.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  24c90090900edc62b49e27888132293a096248408f73993dc8f0147a6fe200ae  LICENSE.rst
> diff --git a/package/python-pysnmpcrypto/python-pysnmpcrypto.mk b/package/python-pysnmpcrypto/python-pysnmpcrypto.mk
> new file mode 100644
> index 0000000000..4472434286
> --- /dev/null
> +++ b/package/python-pysnmpcrypto/python-pysnmpcrypto.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-pysnmpcrypto
> +#
> +################################################################################
> +
> +PYTHON_PYSNMPCRYPTO_VERSION = 0.1.0
> +PYTHON_PYSNMPCRYPTO_SOURCE = pysnmpcrypto-$(PYTHON_PYSNMPCRYPTO_VERSION).tar.gz
> +PYTHON_PYSNMPCRYPTO_SITE = https://files.pythonhosted.org/packages/e6/70/b71f5f1321ea548a7152fc23926258caaec353c8c3edce1aaafbb030ba76
> +PYTHON_PYSNMPCRYPTO_SETUP_TYPE = pep517
> +PYTHON_PYSNMPCRYPTO_LICENSE = BSD-2-Clause
> +PYTHON_PYSNMPCRYPTO_LICENSE_FILES = LICENSE.rst
> +PYTHON_PYSNMPCRYPTO_DEPENDENCIES = host-python-poetry-core
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
