Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EB6D5E380
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 20:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A57E60678;
	Sat,  9 Nov 2024 20:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UukJ93ZH-dAP; Sat,  9 Nov 2024 20:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C8716066E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C8716066E;
	Sat,  9 Nov 2024 20:29:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C3EED8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 20:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E18EE6066E
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 20:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DovPEImH1KEm for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 20:29:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0ECB60664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0ECB60664
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0ECB60664
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 20:29:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 674C9780316;
 Sat,  9 Nov 2024 21:29:36 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:39798])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Nov 2024 21:29:36 +0100
MIME-Version: 1.0
Date: Sat, 09 Nov 2024 21:29:36 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20240818235602.1867361-1-james.hilliard1@gmail.com>
References: <20240818235602.1867361-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <f801ef73029a96970d99d8298afe78c1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731184177;
 bh=H0rdOx5AM0yqUAyrbNp6T1BSlnSV2VJEB8UQn7JNLZc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CGHASiKcag3QY0IQrkk5hyZ/bqVXN+A3IqEX+DvpCuFsaJS5wTfEjmfTDnSBzP0ed
 pUkneyqwekwF75it1261TlJqTGr88LmOwtxSh8unA8ybt1ytUzNdzBjLUGAkf+bqoL
 YYplPIbVv1o4ApOj6R0Vow6YCyrKm75xeRpu93rBCZF7unirXSQuKuieFrC0foewAP
 Ekzdj7hK1AljFuR8BO0kin2KVWsOcpgcU2J0sp7BT8j8gH2jX0hpoDlWygAaG1CcNJ
 wXg3jm1i4KTpphbycUqo+HsgLZgHSTtCAQZvJNctBtYGAfQRvLrL4wypmeoWp0badv
 nY8bb8FN+DpzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CGHASiKc
Subject: Re: [Buildroot] [PATCH 1/1] package/uefisettings: new package
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

Hi James,

While running a test-pkg on this package, it seems all
32-bit builds are failing. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1534897225

Does this package needs a "depends on BR2_ARCH_IS_64"?
Can you have a look please?

On 19/08/2024 01:56, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  1 +
>  package/uefisettings/Config.in         |  9 +++++++++
>  package/uefisettings/uefisettings.hash |  3 +++
>  package/uefisettings/uefisettings.mk   | 12 ++++++++++++
>  5 files changed, 26 insertions(+)
>  create mode 100644 package/uefisettings/Config.in
>  create mode 100644 package/uefisettings/uefisettings.hash
>  create mode 100644 package/uefisettings/uefisettings.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d7d0af3543..4b80b2d0a9 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1503,6 +1503,7 @@ F:	package/serd/
>  F:	package/sord/
>  F:	package/sratom/
>  F:	package/stb/
> +F:	package/uefisettings/
>  F:	package/zchunk/
>  F:	support/testing/tests/package/sample_python_rtoml.py
>  F:	support/testing/tests/package/test_python_rtoml.py
> diff --git a/package/Config.in b/package/Config.in
> index f2c63ffb6e..4f2d0cf7b1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -648,6 +648,7 @@ endmenu
>  	source "package/udev/Config.in"
>  	source "package/udev-gentoo-scripts/Config.in"
>  	source "package/udisks/Config.in"
> +	source "package/uefisettings/Config.in"
>  	source "package/uhubctl/Config.in"
>  	source "package/umtprd/Config.in"
>  	source "package/upower/Config.in"
> diff --git a/package/uefisettings/Config.in 
> b/package/uefisettings/Config.in
> new file mode 100644
> index 0000000000..734f9b864d
> --- /dev/null
> +++ b/package/uefisettings/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_UEFISETTINGS
> +	bool "uefisettings"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_RUSTC
> +	help
> +	  The tool to read/get/extract and write/change/modify
> +	  BIOS/UEFI settings from Linux terminal.
> +
> +	  https://github.com/linuxboot/uefisettings
> diff --git a/package/uefisettings/uefisettings.hash 
> b/package/uefisettings/uefisettings.hash
> new file mode 100644
> index 0000000000..505b5de566
> --- /dev/null
> +++ b/package/uefisettings/uefisettings.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  
> 5d4d6f771e615df9fee3d531c85dad9946ed793fc0a0e636dee1d342780f7863  
> uefisettings-f90aed759b9c2217bea336e37ab5282616ece390-cargo2.tar.gz
> +sha256  
> acc0b83e151985bb943d35ac37e7522fef28d707af9a4829678e92baa409aaf1  
> LICENSE
> diff --git a/package/uefisettings/uefisettings.mk 
> b/package/uefisettings/uefisettings.mk
> new file mode 100644
> index 0000000000..0559b1c504
> --- /dev/null
> +++ b/package/uefisettings/uefisettings.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# uefisettings
> +#
> +################################################################################
> +
> +UEFISETTINGS_VERSION = f90aed759b9c2217bea336e37ab5282616ece390
> +UEFISETTINGS_SITE = $(call 
> github,linuxboot,uefisettings,$(UEFISETTINGS_VERSION))
> +UEFISETTINGS_LICENSE = BSD-3-Clause
> +UEFISETTINGS_LICENSE_FILES = LICENSE
> +
> +$(eval $(cargo-package))
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
