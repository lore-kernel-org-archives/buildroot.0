Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552BECCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 17:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D342261587;
	Sun,  2 Nov 2025 17:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TM5QMnsUd59R; Sun,  2 Nov 2025 17:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2E01615B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2E01615B2;
	Sun,  2 Nov 2025 17:44:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 194A52A3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 17:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A21042662
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 17:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WMqkXUEJ4slM for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 17:44:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02CD84265E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02CD84265E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02CD84265E
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 17:44:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2F3A4780502;
 Sun,  2 Nov 2025 18:44:18 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Nov 2025 18:44:18 +0100
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 18:44:18 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aPXAFU-a1sl_aHck@waldemar-brodkorb.de>
References: <aPXAFU-a1sl_aHck@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <df1ffd8c2f88a7acf8e0002cd59785e7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762105459;
 bh=AkBrcqZe57qaF1YY2VGaHkklJl9PhQaDximQsZcKmiU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hBAXsc0yCIEKCQJ/x7PkhBER8B9/IixwKOWThCb1wR79aDs8udP6aNgvdaUFJLh+/
 fFdZobLZG7+sihHq4c3YmaS++JDecCvSnmypvf89wlhk7KAUbpBd8XHsO8gLp9JXkL
 HDDTi3P8MtdxT04UoV9EtttZ8bQYPpQnNa/TX5AtfpgCnXQGgJFi2C3pUDyJQ1q3qv
 xqE0e5gFmuK7ThJGThBrKmMRYLTAQxsyj3Lfrez8443GnT3OSFTqriho9eT96ZxdJC
 zE+qk5XLNt92iN68DRmXXx+s2iF60bKgvOffoAVAvI6KCXpWrw6MvyyQoZhWX0UKCk
 foCI1JOaSOL9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hBAXsc0y
Subject: Re: [Buildroot] [PATCH] package/libpam-pkcs11: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar,

Thanks for the patch. I have few comments. See below.

This patch introduces several check-package errors. You can see those 
using the command:

     utils/docker-run make check-package

On 20/10/2025 06:52, Waldemar Brodkorb wrote:
> The Linux-PAM login module for X.509 certificate based user login.
> 
> https://github.com/OpenSC/pam_pkcs11
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/libpam-pkcs11/Config.in          | 18 ++++++++++++++++++
>  package/libpam-pkcs11/libpam-pkcs11.hash |  2 ++
>  package/libpam-pkcs11/libpam-pkcs11.mk   | 18 ++++++++++++++++++
>  5 files changed, 40 insertions(+)
>  create mode 100755 package/libpam-pkcs11/Config.in
>  create mode 100755 package/libpam-pkcs11/libpam-pkcs11.hash
>  create mode 100755 package/libpam-pkcs11/libpam-pkcs11.mk
[...]
> diff --git a/package/libpam-pkcs11/Config.in 
> b/package/libpam-pkcs11/Config.in
> new file mode 100755

check-package reports the error:
package/libpam-pkcs11/Config.in:0: This file does not need to be 
executable

Could you change it to a regular file, please?

> index 0000000000..6678c48ab9
> --- /dev/null
> +++ b/package/libpam-pkcs11/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_LIBPAM_PKCS11
> +	bool "libpam-pkcs11"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # pcsc-lite -> fork()
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite -> _Atomic 
> keyword
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> +	select BR2_PACKAGE_PCSC_LITE
> +	help
> +	  The Linux-PAM login module for X.509 certificate based user login.

Here, check-package reports:
package/libpam-pkcs11/Config.in:11: help text: <tab><2 spaces><62 chars> 
(https://nightly.buildroot.org/#writing-rules-config-in)

The line is too long and just need to be split..

> +
> +	  https://github.com/OpenSC/pam_pkcs11
> +
> +comment "libpam-pkcs11 needs a toolchain w/ threads, dynamic library, 
> gcc >= 4.9"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> diff --git a/package/libpam-pkcs11/libpam-pkcs11.hash 
> b/package/libpam-pkcs11/libpam-pkcs11.hash
> new file mode 100755

Here also:
package/libpam-pkcs11/libpam-pkcs11.hash:0: This file does not need to 
be executable

> index 0000000000..9ab133f51b
> --- /dev/null
> +++ b/package/libpam-pkcs11/libpam-pkcs11.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 
> 8a853f4e6e136ceecdcffad798570e3d6af2fde08e975656b2dc931989c35aff  
> pam_pkcs11-0.6.13.tar.gz

Here there is a missing space between "sha256" and the hash..
package/libpam-pkcs11/libpam-pkcs11.hash:2: separation does not match 
expectation (https://nightly.buildroot.org/#adding-packages-hash)

You should also add the hash for the license file (see below).

> diff --git a/package/libpam-pkcs11/libpam-pkcs11.mk 
> b/package/libpam-pkcs11/libpam-pkcs11.mk
> new file mode 100755

Here also:
package/libpam-pkcs11/libpam-pkcs11.mk:0: This file does not need to be 
executable

> index 0000000000..9947e58e1a
> --- /dev/null
> +++ b/package/libpam-pkcs11/libpam-pkcs11.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# libpam-pkcs11
> +#
> +################################################################################
> +
> +LIBPAM_PKCS11_VERSION = 0.6.13
> +LIBPAM_PKCS11_SOURCE = pam_pkcs11-$(LIBPAM_PKCS11_VERSION).tar.gz
> +LIBPAM_PKCS11_SITE = 
> https://github.com/OpenSC/pam_pkcs11/archive/refs/tags

The license information are missing here. According to upstream:
https://github.com/OpenSC/pam_pkcs11/blob/pam_pkcs11-0.6.13/COPYING

We should have here:

LIBPAM_PKCS11_LICENSE = LGPL-2.1
LIBPAM_PKCS11_LICENSE_FILES = COPYING

> +
> +LIBPAM_PKCS11_AUTORECONF = YES
> +
> +LIBPAM_PKCS11_CONF_OPTS += --libdir=/lib
> +LIBPAM_PKCS11_CONF_OPTS += --without-docbook
> +LIBPAM_PKCS11_CONF_OPTS += --without-ldap

Could you format the previous block as follow:

LIBPAM_PKCS11_CONF_OPTS = \
	--libdir=/lib \
	--without-docbook \
	--without-ldap

> +LIBPAM_PKCS11_DEPENDENCIES = openssl pcsc-lite linux-pam

To make maintenance easier, could you sort the dependencies
alphabetically, please?  This should become:

LIBPAM_PKCS11_DEPENDENCIES = linux-pam openssl pcsc-lite

> +
> +$(eval $(autotools-package))
> --
> 2.47.3

Could you send an updated version of this patch, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
