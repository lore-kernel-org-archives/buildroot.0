Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C83C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:48:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1737460EBB
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1737460EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF831605DC;
	Thu, 21 Oct 2021 20:48:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cdqj_cBCllDi; Thu, 21 Oct 2021 20:48:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1025D605EC;
	Thu, 21 Oct 2021 20:48:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F0E451BF9C8
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE30481A2B
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fAkwC-S2FKTI for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:48:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B636780E76
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:48:23 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id ec8so3041364edb.6
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 13:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H3goky3d2gU4skXdbp6ndjMrcpPGJMLtehUUZBr4AEI=;
 b=Sak8L+zaK+PzWtTXqKcKxrSbMd10TXbmADcvOS+KrY2NI3gOcyzlsF0d+zNIPbU+jW
 ZFAP9VVE48OJfeUrsvMUvz1gIu7TBLQ0BtzQIPwTh3xhzdfhv8l7ZWEMSq5J1FgMuaxG
 k34Ieu7EFxbXm2tBYSQy7zUqtdn05Czp2xwsUyfo63cI6FvRsc9tKbLwJNU9wlaD4U4T
 fuennezPMY5VsnQ2naUyNiLYAZwtYOtb3A5nCkv4XS+vG/b0I6TPmv7kWRmgk7LLdVpi
 hSpN1Mu/1P9xy9Gn5ROLKs+GUUwkfpHyxp3dmkcqgUztsAE/TcVArerJNzT2//JYb+S+
 kjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H3goky3d2gU4skXdbp6ndjMrcpPGJMLtehUUZBr4AEI=;
 b=ypc5B+VzmBnX6E49aIHuHPZFQhJYpi1xcreJ+j/dIiZcDIVNuSuTkd5Z6xZwUHrliz
 3XzdABt1ZAaWzkG0sFmTTnj8tRuYzMO9Ni7p9wnZ9ozCtgsJGwBbDEtefQCV0233TyXv
 M+lzJZyHTJ9M1/FTwt0W/jK9PFSr7EL3ATYVz/ZzpNaMvekU846mkccux0ub5jTW61k7
 o9OpEztVVE5XSA4X3twZeeCI1nJu7/1PhiFZVFvRVgE1AxJVRsyZ7AIx4SGPgEzxQS0D
 46fLl4quR7z92FGHIdnpFrFFflSnAsNTBNHKCX9BA+GvFdJVxefuBdYPQHJSS35j9a7l
 5FHA==
X-Gm-Message-State: AOAM533NLE+jww0AeOF5d7LFQ0W5LiEz9Bwwlwmk6SLRvFwu+uUkBVIx
 uoNjLRSGZMgNfnbideFeJGFTUeKOSvaD6MiQ
X-Google-Smtp-Source: ABdhPJwybrjLv5bS1vLpkA2Ph3Xkd6jJ1PsmRehat67dxERfAsd3eZ4vJIwuxaQ/R3miTc+iMRZ1cg==
X-Received: by 2002:a05:6402:3512:: with SMTP id
 b18mr10659057edd.15.1634849301949; 
 Thu, 21 Oct 2021 13:48:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p10sm2955160ejf.45.2021.10.21.13.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 13:48:21 -0700 (PDT)
Message-ID: <b2a7f8b2-be6a-b76c-0ff4-5c0c3f89fcb4@mind.be>
Date: Thu, 21 Oct 2021 22:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211012174838.1222576-1-aduskett@gmail.com>
 <20211012174838.1222576-3-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211012174838.1222576-3-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH 3/4] package/python-pyndiff: new package,
 drop nmap ndiff option
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
 Asaf Kahlon <asafka7@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/10/2021 19:48, Adam Duskett wrote:
> The ndiff package provided by Nmap relies on python2; moreover, there have been
> pending pull requests to move ndiff to python3 for over two years with very
> little engagement by the maintainers (https://github.com/nmap/nmap/pull/1807).
> 
> Remove the option to select ndiff altogether, and introduce a new package:
> python-pyndiff, which provides the same functionality (and more) as the
> ndiff provided by nmap, and is compatible with python3.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

  I split this into two separate patches.

> ---
>   Config.in.legacy                           |  8 ++++++++
>   package/Config.in                          |  1 +
>   package/nmap/Config.in                     | 12 +-----------
>   package/nmap/nmap.mk                       |  9 ---------
>   package/python-pyndiff/Config.in           |  9 +++++++++
>   package/python-pyndiff/python-pyndiff.hash |  5 +++++
>   package/python-pyndiff/python-pyndiff.mk   | 14 ++++++++++++++
>   7 files changed, 38 insertions(+), 20 deletions(-)
>   create mode 100644 package/python-pyndiff/Config.in
>   create mode 100644 package/python-pyndiff/python-pyndiff.hash
>   create mode 100644 package/python-pyndiff/python-pyndiff.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 3ec48edb87..a4b5c88dea 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,14 @@ endif
>   
>   comment "Legacy options removed in 2021.11"
>   
> +config BR2_PACKAGE_NMAP_NDIFF
> +	bool "The ndiff utility has been removed."
> +	select BR2_LEGACY

  I also added a select of python-pyndiff here.


  Applied to master, thanks.

  Regards,
  Arnout


> +	help
> +	  The ndiff utility provided by nmap requires python2 which is
> +	  deprecated. The same functionality is provided by the python
> +	  package pyndiff.
> +
>   config BR2_GDB_VERSION_8_3
>   	bool "gdb version 8.3.x removed"
>   	select BR2_LEGACY
> diff --git a/package/Config.in b/package/Config.in
> index 09e9665f48..fe5c8d43b5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1150,6 +1150,7 @@ menu "External python modules"
>   	source "package/python-pymupdf/Config.in"
>   	source "package/python-pymysql/Config.in"
>   	source "package/python-pynacl/Config.in"
> +	source "package/python-pyndiff/Config.in"
>   	source "package/python-pyopenssl/Config.in"
>   	source "package/python-pyparsing/Config.in"
>   	source "package/python-pyparted/Config.in"
> diff --git a/package/nmap/Config.in b/package/nmap/Config.in
> index 51dd3423ea..fc6312d0fc 100644
> --- a/package/nmap/Config.in
> +++ b/package/nmap/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_NMAP
>   	select BR2_PACKAGE_LIBLINEAR
>   	select BR2_PACKAGE_LIBPCAP
>   	select BR2_PACKAGE_NMAP_NMAP \
> -	       if !BR2_PACKAGE_NMAP_NCAT && !BR2_PACKAGE_NMAP_NPING && !BR2_PACKAGE_NMAP_NDIFF
> +	       if !BR2_PACKAGE_NMAP_NCAT && !BR2_PACKAGE_NMAP_NPING
>   	help
>   	  Nmap ("Network Mapper") is a free and open source (license)
>   	  utility for network discovery and security auditing.
> @@ -32,16 +32,6 @@ comment "a symlink from ncat to 'nc' will be installed"
>   	depends on !BR2_PACKAGE_NETCAT
>   	depends on !BR2_PACKAGE_NETCAT_OPENBSD
>   
> -config BR2_PACKAGE_NMAP_NDIFF
> -	bool "install ndiff"
> -	# ndiff only works with python2.x
> -	depends on BR2_PACKAGE_PYTHON
> -	help
> -	  This option installs the 'ndiff' tool.
> -
> -comment "ndiff needs Python 2.x"
> -	depends on !BR2_PACKAGE_PYTHON
> -
>   config BR2_PACKAGE_NMAP_NMAP
>   	bool "install nmap"
>   	select BR2_PACKAGE_PCRE
> diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
> index f3994e9b38..f22a2295b1 100644
> --- a/package/nmap/nmap.mk
> +++ b/package/nmap/nmap.mk
> @@ -61,15 +61,6 @@ else
>   NMAP_CONF_OPTS += --without-ncat
>   endif
>   
> -ifeq ($(BR2_PACKAGE_NMAP_NDIFF),y)
> -NMAP_DEPENDENCIES += python
> -NMAP_CONF_OPTS += --with-ndiff
> -NMAP_MAKE_OPTS += build-ndiff
> -NMAP_INSTALL_TARGET_OPTS += install-ndiff
> -else
> -NMAP_CONF_OPTS += --without-ndiff
> -endif
> -
>   ifeq ($(BR2_PACKAGE_NMAP_NMAP),y)
>   NMAP_DEPENDENCIES += pcre
>   NMAP_CONF_OPTS += --with-libpcre="$(STAGING_DIR)/usr"
> diff --git a/package/python-pyndiff/Config.in b/package/python-pyndiff/Config.in
> new file mode 100644
> index 0000000000..58ca35ba97
> --- /dev/null
> +++ b/package/python-pyndiff/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_PYNDIFF
> +	bool "python-pyndiff"
> +	select BR2_PACKAGE_PYTHON_XMLJSON # runtime
> +	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
> +	help
> +	  Generate human-readable ndiff output when comparing 2 Nmap
> +	  XML scan files.
> +
> +	  https://github.com/rackerlabs/pyndiff
> diff --git a/package/python-pyndiff/python-pyndiff.hash b/package/python-pyndiff/python-pyndiff.hash
> new file mode 100644
> index 0000000000..0afecfb6e2
> --- /dev/null
> +++ b/package/python-pyndiff/python-pyndiff.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/pyndiff/json
> +md5  32a9f994509cb883bbfeb563171f2668  pyndiff-1.0.2.tar.gz
> +sha256  8a519b18a7bbb315c043d4543719ce9fb6db8098bfcdd04cb8054b276cc91368  pyndiff-1.0.2.tar.gz
> +# Locally computed sha256 checksums
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/python-pyndiff/python-pyndiff.mk b/package/python-pyndiff/python-pyndiff.mk
> new file mode 100644
> index 0000000000..e25374956c
> --- /dev/null
> +++ b/package/python-pyndiff/python-pyndiff.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-pyndiff
> +#
> +################################################################################
> +
> +PYTHON_PYNDIFF_VERSION = 1.0.2
> +PYTHON_PYNDIFF_SOURCE = pyndiff-$(PYTHON_PYNDIFF_VERSION).tar.gz
> +PYTHON_PYNDIFF_SITE = https://files.pythonhosted.org/packages/83/3b/fb13918710c4fba40367140f22e3449998f4f66869a7564d0e547ad99ef8
> +PYTHON_PYNDIFF_SETUP_TYPE = setuptools
> +PYTHON_PYNDIFF_LICENSE = Apache-2.0
> +PYTHON_PYNDIFF_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
