Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB87D10BF9
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 13:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5DDA402DD;
	Sat, 26 Oct 2024 13:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Bwf8TNpq2pj; Sat, 26 Oct 2024 13:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CD2040342
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CD2040342;
	Sat, 26 Oct 2024 13:21:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EEE065C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE6D8402F0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGQSLB6Z6OuN for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 13:21:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 411B0402DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 411B0402DD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 411B0402DD
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:21:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0037113F861;
 Sat, 26 Oct 2024 15:21:28 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50900])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 26 Oct 2024 15:21:28 +0200
MIME-Version: 1.0
Date: Sat, 26 Oct 2024 15:21:28 +0200
From: Julien Olivain <ju.o@free.fr>
To: Ralf Dragon <hypnotoad@lindra.de>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>, James Hilliard
 <james.hilliard1@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240405175454.14431-1-hypnotoad@lindra.de>
References: <20240401084841.439073-1-hypnotoad@lindra.de>
 <20240405175454.14431-1-hypnotoad@lindra.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <092f3459dc801de7a7f962c3acb25ea3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729948893;
 bh=jac8cXzgiHhx3O8IMOBLbd4DVnOFJhN5Vi1txPIH+v0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eaDBCT77789lKv5a8osNq38SVV2gxVF+CT+ItvwelvIplxkOkXvdQVTBu4UrDtfY4
 Zo3TPguG2bryMIJu8V4N9OZ9OX1vmdwdNOtONQuIBnbkX4He3JHORbGwIvNq/uGOU6
 vqSzBss9r3MUbY6mGNUkO1S6W6PEu09wqWvfaBU5xXcSnJz3rT45+/H52GMSP4fHa/
 dVIHfsJg6PP21xZK5VFXmdTTiiQyYt3mYRuFzOnHmGMthBWCkyuLH5w0zrCNJViPcb
 WzFvwPMOEhDwBS/dyylN9MNKyYjDqAdaewW/1MlYtlsBACYhyQ+zZ6TOKl8Nke+rmV
 EFYUmPxHL52hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eaDBCT77
Subject: Re: [Buildroot] [PATCH v3 1/2] package/python-pyqt5-sip: new package
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

On 05/04/2024 19:54, Ralf Dragon wrote:
> This packages adds the PyQt5.sip module.
> 
> The official documentation [1] mentions that this module is needed
> during PyQt5 runtime. It is currently compiled without any
> dependencies to Qt or PyQt5, but it seems quite useless without it.
> The module was introduced together with PyQt 5.11 [2].
> 
> [1] 
> https://www.riverbankcomputing.com/static/Docs/PyQt5/installation.html#building-and-installing-from-source
> [2] 
> https://www.riverbankcomputing.com/static/Docs/PyQt5/incompatibilities.html#pyqt-v5-11
> 
> Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>

Series applied to master, thanks!

Julien.

> ---
> Changes v1 -> v2:
>  - fix License and make sure legal info passes
>  - document in commit message why this package is needed
>  - split off the runtime dependency to separate patch
> 
> Changes v2 -> v3:
>  - add myself as developer
>  - fix license
>  - improve description
> 
> Backport to: 2024.02.x
> 
> Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>
> ---
>  DEVELOPERS                                     |  3 +++
>  package/Config.in                              |  1 +
>  package/python-pyqt5-sip/Config.in             |  7 +++++++
>  package/python-pyqt5-sip/python-pyqt5-sip.hash |  7 +++++++
>  package/python-pyqt5-sip/python-pyqt5-sip.mk   | 14 ++++++++++++++
>  5 files changed, 32 insertions(+)
>  create mode 100644 package/python-pyqt5-sip/Config.in
>  create mode 100644 package/python-pyqt5-sip/python-pyqt5-sip.hash
>  create mode 100644 package/python-pyqt5-sip/python-pyqt5-sip.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f6fc301373..9808562ac6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2594,6 +2594,9 @@ F:	package/gupnp-av/
>  F:	package/let-me-create/
>  F:	package/nanomsg/
> 
> +N:	Ralf Dragon <hypnotoad@lindra.de>
> +F:	package/python-pyqt5-sip/
> +
>  N:	Ramon Fried <rfried.dev@gmail.com>
>  F:	package/bitwise/
> 
> diff --git a/package/Config.in b/package/Config.in
> index 33039331f7..d897f16120 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1278,6 +1278,7 @@ menu "External python modules"
>  	source "package/python-pypng/Config.in"
>  	source "package/python-pyqrcode/Config.in"
>  	source "package/python-pyqt5/Config.in"
> +	source "package/python-pyqt5-sip/Config.in"
>  	source "package/python-pyratemp/Config.in"
>  	source "package/python-pyroute2/Config.in"
>  	source "package/python-pyrsistent/Config.in"
> diff --git a/package/python-pyqt5-sip/Config.in 
> b/package/python-pyqt5-sip/Config.in
> new file mode 100644
> index 0000000000..3eda2c8d1f
> --- /dev/null
> +++ b/package/python-pyqt5-sip/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PYQT5_SIP
> +	bool "python-pyqt5-sip"
> +	help
> +	  This is the PyQt5.sip module which is needed at runtime for
> +	  the PyQt5 module from package python-pyqt5.
> +
> +	  https://pypi.org/project/PyQt5-sip/
> diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.hash 
> b/package/python-pyqt5-sip/python-pyqt5-sip.hash
> new file mode 100644
> index 0000000000..fb4a8cb04d
> --- /dev/null
> +++ b/package/python-pyqt5-sip/python-pyqt5-sip.hash
> @@ -0,0 +1,7 @@
> +# from https://pypi.org/project/PyQt5-sip/12.30.0
> +sha256  
> 7f321daf84b9c9dbca61b80e1ef37bdaffc0e93312edae2cd7da25b953971d91  
> PyQt5_sip-12.13.0.tar.gz
> +
> +# Hash for license files:
> +md5  9cd437778ebd1c056a76b4ded73b3a6d  LICENSE
> +md5  e91355d8a6f8bd8f7c699d62863c7303  LICENSE-GPL2
> +md5  7ea41d866d6638e430db5287a3f66090  LICENSE-GPL3
> diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.mk 
> b/package/python-pyqt5-sip/python-pyqt5-sip.mk
> new file mode 100644
> index 0000000000..e52081ab45
> --- /dev/null
> +++ b/package/python-pyqt5-sip/python-pyqt5-sip.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-SIP-QT5
> +#
> +################################################################################
> +
> +PYTHON_PYQT5_SIP_VERSION = 12.13.0
> +PYTHON_PYQT5_SIP_SITE = 
> https://files.pythonhosted.org/packages/ee/81/fce2a475aa56c1f49707d9306b930695b6ff078c2242c9f2fd72a3214e1f
> +PYTHON_PYQT5_SIP_SOURCE = PyQt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
> +PYTHON_PYQT5_SIP_LICENSE = SIP license or GPL-2.0 or GPL-3.0
> +PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
> +PYTHON_PYQT5_SIP_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
