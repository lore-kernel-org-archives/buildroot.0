Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB05DD1BDC0
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 18:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7482680C37;
	Mon,  4 Nov 2024 18:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCyF5edXXAR9; Mon,  4 Nov 2024 18:35:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F7DC80B90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F7DC80B90;
	Mon,  4 Nov 2024 18:35:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D9DF3B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 18:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DC7280AEC
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 18:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlkwCN_-uSPs for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 18:35:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1D2880AE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1D2880AE9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1D2880AE9
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 18:34:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3EB0F19F5AF;
 Mon,  4 Nov 2024 19:34:55 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41222])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 04 Nov 2024 19:34:55 +0100
MIME-Version: 1.0
Date: Mon, 04 Nov 2024 19:34:55 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241103221340.1770246-1-romain.naour@smile.fr>
References: <20241103221340.1770246-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <e98ba88d11ca0103bc65d71df800a4cb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730745296;
 bh=IxyvBk0NOYrtMC71WjRJaMG3ojmLuq+mHUFs+CsiaMg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nQogmhPs/r01+7qpe09Hb1iqvgKD7GF8s7c/zVw98RonIitWE5SFyaaxQ95eIVxkH
 +IiyDXBmcR6OeFag66AK+OTapJzMBxisvXHjGo8jX1+lL34brvqAuwN44b+t3Q1c+t
 21318g6Cr+uYW+uHvH3/6UxLfmU9UHDlRFJg+Da9zlqXvlqvetv7X8BzX6CM6H0aCz
 78S4jPcf3ZguZriiCQeDZFivDVLKN9BJ92ZLdbZ5fU1oXy4xWNPZoo735J2vguSBT4
 RAe+vdm5PSbqv6aLzgEwlcWfcChPL2lSbNEAABnDS0BgeIc0QVQJ2Ah6iyCbukq9CZ
 Kr+uyb9b1X1kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nQogmhPs
Subject: Re: [Buildroot] [PATCH 1/2] package/opkg: bump to version 0.7.0
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

On 03/11/2024 23:13, Romain Naour via buildroot wrote:
> Since the toolchain-external-bootlin version bump to 2024.05-1 the
> TestOpkg fail due to a "spurious error check" fixed in opkg 0.7.0 [1].
> 
> With toolchain-external-bootlin 2024.02-1 (gcc-12) and opkg 0.6.2:
> 
>   opkg install example-snmpd-package_1.0_arm.ipk
>   Installing example-snmpd-package (1.0) on root.
>   Configuring example-snmpd-package.
>   Starting SNMP daemon: OK
>   echo $?
>   0
> 
> With toolchain-external-bootlin 2024.05-1 (gcc-13) and opkg 0.6.2:
> 
>   opkg install example-snmpd-package_1.0_arm.ipk
>   echo $?
>   255
> 
> The new gcc-13 seems to be confused while compiling opkg 0.6.2
> without the "spurious error check" fix [1]
> 
> With toolchain-external-bootlin 2024.05-1 (gcc-13) and opkg 0.7.0:
> 
>   opkg install example-snmpd-package_1.0_arm.ipk
>   Installing example-snmpd-package (1.0) on root.
>   Configuring example-snmpd-package.
>   Starting SNMP daemon: OK
>   echo $?
>   0
> 
> Keep new ACL and XATTRS support introduced in opkg 0.6.3 disabled.
> 
> Update opkg to the new upstream url [2].
> 
> [1] 
> https://git.yoctoproject.org/opkg/commit?id=b5cc53d56e381803d3f55019254ab7d608160ae1
> [2] 
> https://github.com/openembedded/openembedded-core/commit/6ff8b43e08840582ee8d88261cbaffd33c2304f9
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992571
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Series applied to master. Thanks!

> ---
>  package/opkg/Config.in | 2 +-
>  package/opkg/opkg.hash | 2 +-
>  package/opkg/opkg.mk   | 6 ++++--
>  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/opkg/Config.in b/package/opkg/Config.in
> index 1f6a39343f..ccea63cf7f 100644
> --- a/package/opkg/Config.in
> +++ b/package/opkg/Config.in
> @@ -17,7 +17,7 @@ config BR2_PACKAGE_OPKG
>  	  conforms to a subset of debian's policy manual regarding
>  	  control files.
> 
> -	  https://code.google.com/archive/p/opkg/
> +	  https://git.yoctoproject.org/opkg/
> 
>  if BR2_PACKAGE_OPKG
> 
> diff --git a/package/opkg/opkg.hash b/package/opkg/opkg.hash
> index c6ecefba21..3928a2ce01 100644
> --- a/package/opkg/opkg.hash
> +++ b/package/opkg/opkg.hash
> @@ -1,4 +1,4 @@
>  # From http://downloads.yoctoproject.org/releases/opkg/SHA256SUMS
> -sha256  
> ac73a90a2549cd04948e563d915912c78e1b8ba0f43af75c5a53fcca474adbd5  
> opkg-0.6.2.tar.gz
> +sha256  
> d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee26704bf8fe757c54567  
> opkg-0.7.0.tar.gz
>  # Locally calculated
>  sha256  
> 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  
> COPYING
> diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
> index a550543f3e..f86149a519 100644
> --- a/package/opkg/opkg.mk
> +++ b/package/opkg/opkg.mk
> @@ -4,13 +4,15 @@
>  #
>  
> ################################################################################
> 
> -OPKG_VERSION = 0.6.2
> +OPKG_VERSION = 0.7.0
>  OPKG_SITE = https://downloads.yoctoproject.org/releases/opkg
>  OPKG_DEPENDENCIES = host-pkgconf libarchive
>  OPKG_LICENSE = GPL-2.0+
>  OPKG_LICENSE_FILES = COPYING
>  OPKG_INSTALL_STAGING = YES
> -OPKG_CONF_OPTS = --enable-sha256
> +OPKG_CONF_OPTS = --enable-sha256 \
> +	--without-acl \
> +	--without-xattrs
> 
>  ifeq ($(BR2_PACKAGE_OPKG_GPG_SIGN),y)
>  OPKG_CONF_OPTS += --enable-gpg
> --
> 2.45.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
