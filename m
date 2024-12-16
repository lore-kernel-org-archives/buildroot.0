Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9045E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 21:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DA42612DF;
	Mon, 16 Dec 2024 21:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xhe3gkJrqM-X; Mon, 16 Dec 2024 21:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40E16612FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40E16612FA;
	Mon, 16 Dec 2024 21:16:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64A8EC5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 454984142C
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2C4xPK0Rnn5B for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 21:16:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D709D41427
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D709D41427
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D709D41427
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:16:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1183A19F5B2;
 Mon, 16 Dec 2024 22:16:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60160])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Dec 2024 22:16:04 +0100
MIME-Version: 1.0
Date: Mon, 16 Dec 2024 22:16:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org
In-Reply-To: <20241216102249.282732-1-yegorslists@googlemail.com>
References: <20241216102249.282732-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <aed6e8583c5bf2d04523ce07c3283d9e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734383766;
 bh=iqtTSunkkRqan3Op77HCGPSJjF8aTaI+umF/1iQNtt4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M2U0Mv1hu5N+DLhbWeusfG8gq08IRFOp/uPY1ckGUoTiFqDbQh5KrAOCQHxhVFmcM
 eVGqWePvTLy+5X1x/qIvofNmqIjTAmtyL3IjCR0PHDX4nTlXo8EWYumxOfeWPOq/IH
 6f1apGQZ9Iq32YpAiQEbxy3ldUbhy1dw/6Vau1hd0sPkFxLjxRLADtwRCfk95LKUl0
 Sy1j1AKB25qmvkFB+6PQCT0g7rjnv0wCDX96G8gRseTngINQhLmXimk/njX2iU6cEz
 Zb0LSikM2RcMI4XhjIC1fcmRDcu6mKhOTp5yEz1py0ukC76T6lIiTvemTv/rwFkhoT
 U7BLNALVttE1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=M2U0Mv1h
Subject: Re: [Buildroot] [PATCH v2] package/python-m2crypto: remove package
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

On 16/12/2024 11:22, yegorslists@googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The python-m2crypto package was removed as it is in maintained
> only mode and is not recommended for new projects.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.

> ---
> Changes v1 -> v2:
>     - also remove the python-m2crypto entry from the DEVELOPERS file 
> (Baruch Siach)
> 
>  Config.in.legacy                             |  7 +++++++
>  DEVELOPERS                                   |  3 ---
>  package/Config.in                            |  1 -
>  package/python-m2crypto/Config.in            |  9 ---------
>  package/python-m2crypto/python-m2crypto.hash |  5 -----
>  package/python-m2crypto/python-m2crypto.mk   | 18 ------------------
>  6 files changed, 7 insertions(+), 36 deletions(-)
>  delete mode 100644 package/python-m2crypto/Config.in
>  delete mode 100644 package/python-m2crypto/python-m2crypto.hash
>  delete mode 100644 package/python-m2crypto/python-m2crypto.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 066be19a75..2e6dfce5ea 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
> 
>  comment "Legacy options removed in 2025.02"
> 
> +config BR2_PACKAGE_PYTHON_M2CRYPTO
> +	bool "python-m2crypto has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The python-m2crypto package was removed as it is in maintained
> +	  only mode and is not recommended for new projects.
> +
>  config BR2_KERNEL_HEADERS_4_19
>  	bool "kernel headers version 4.19.x are no longer supported"
>  	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 047dc4a88f..eabbc7eb20 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1351,9 +1351,6 @@ 
> F:	support/testing/tests/package/sample_python_scipy.py
>  F:	support/testing/tests/package/test_python_pybind.py
>  F:	support/testing/tests/package/test_python_scipy.py
> 
> -N:	Gustavo Heinz <gustavo@gsthnz.com>
> -F:	package/python-m2crypto/
> -
>  N:	Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>  F:	board/terasic/de10nano_cyclone5/
>  F:	configs/terasic_de10nano_cyclone5_defconfig
> diff --git a/package/Config.in b/package/Config.in
> index 5fa344c321..1541c85e53 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1206,7 +1206,6 @@ menu "External python modules"
>  	source "package/python-logbook/Config.in"
>  	source "package/python-logstash/Config.in"
>  	source "package/python-lxml/Config.in"
> -	source "package/python-m2crypto/Config.in"
>  	source "package/python-magic-wormhole/Config.in"
>  	source "package/python-magic-wormhole-mailbox-server/Config.in"
>  	source "package/python-magic-wormhole-transit-relay/Config.in"
> diff --git a/package/python-m2crypto/Config.in 
> b/package/python-m2crypto/Config.in
> deleted file mode 100644
> index af710d5351..0000000000
> --- a/package/python-m2crypto/Config.in
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -config BR2_PACKAGE_PYTHON_M2CRYPTO
> -	bool "python-m2crypto"
> -	select BR2_PACKAGE_OPENSSL
> -	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
> -	select BR2_PACKAGE_PYTHON3_SSL # runtime
> -	help
> -	  M2Crypto: A Python crypto and SSL toolkit.
> -
> -	  https://gitlab.com/m2crypto/m2crypto
> diff --git a/package/python-m2crypto/python-m2crypto.hash 
> b/package/python-m2crypto/python-m2crypto.hash
> deleted file mode 100644
> index 98307af0cf..0000000000
> --- a/package/python-m2crypto/python-m2crypto.hash
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# md5, sha256 from https://pypi.org/pypi/m2crypto/json
> -md5  75c50150857eb60e4f447b04d13ff507  m2crypto-0.43.0.tar.gz
> -sha256  
> 6c2c1c7bb0e8aa768f7ca803da7dbc2666d4003b26bd7adf70233afc59d8cf33  
> m2crypto-0.43.0.tar.gz
> -# Locally computed sha256 checksums
> -sha256  
> 4eca478396f4b2b020729a111fce3f096456d74500bfd8f2b0388c3c69f997c0  
> LICENCE
> diff --git a/package/python-m2crypto/python-m2crypto.mk 
> b/package/python-m2crypto/python-m2crypto.mk
> deleted file mode 100644
> index b5142c9bb2..0000000000
> --- a/package/python-m2crypto/python-m2crypto.mk
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -################################################################################
> -#
> -# python-m2crypto
> -#
> -################################################################################
> -
> -PYTHON_M2CRYPTO_VERSION = 0.43.0
> -PYTHON_M2CRYPTO_SOURCE = m2crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
> -PYTHON_M2CRYPTO_SITE = 
> https://files.pythonhosted.org/packages/ff/1b/4771f0ecfdd9df6752ae5d0cf040545bb3cfe8a504af87e05c9ac4a6a499
> -PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
> -PYTHON_M2CRYPTO_LICENSE = MIT
> -PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
> -PYTHON_M2CRYPTO_CPE_ID_VENDOR = m2crypto_project
> -PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
> -PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
> -PYTHON_M2CRYPTO_ENV = OPENSSL_PATH="$(STAGING_DIR)/usr"
> -
> -$(eval $(python-package))
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
