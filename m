Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DEDC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1625181230;
	Sun, 30 Jun 2024 14:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6cbwU3dmP8Q; Sun, 30 Jun 2024 14:56:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C77608135F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C77608135F;
	Sun, 30 Jun 2024 14:56:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF8141BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC660406B8
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtRL8fKziJIV for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:56:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 051A1406A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 051A1406A2
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 051A1406A2
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:56:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-424aa70fbc4so14940135e9.1
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719759362; x=1720364162;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b58CBpcPPcYhFAcRqf24pF9vZ4qouB/Yyu1awUd3NBw=;
 b=QKsk0FmylUHGqqabCNfC8T8wvc1XVWac2is3S2epmTPv9JLAFrsKHqv0Z8mU4/9Rqz
 ua6OGeB3ema620WTUaMd7/AM7znC4GPFM4pNeMIp8pkN0KzM11HALGXHfG1BR/YYh7r7
 1dwxOTV6k6/K3sbiFUZpA3+HQqKAPc2C6Ho2yedQQH8I820OwB5rUYFWtKpgS1XsA4I9
 mahPTPAIXy3JjnSwHsY++cx7f6JzhjD/kHUly9tBf9NUoq6rbeQybWQ2OO0K36hpDYyi
 bW5ZIHgxCXGKKKOsQcbVx1wV5wDlgPeWbBeFZrxDuHwBEiY7ck1fE2T2ZNyPqWK8KvYN
 2tIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV57IoglaMbN5EkeuJZ/kKlBpnzIrCSnR/vZD0c4CjYM2Wt0M2snzouGZkjmK0BTXnvMszzmaMMubZi+goD+Z2PmcV8qNvVZA==
X-Gm-Message-State: AOJu0Yz+Rzfm9iKWuCOfOdJ0JIpwz9EU+VHHgMWqjat+Y1CDqB/PrdkJ
 MXqPBksvhc/DJfKCc6D+8uRobkpEVALHt+bDqeRy3PkGF6C1lxUIIf1mJOzpPIs=
X-Google-Smtp-Source: AGHT+IEXDPHlamKue4XmxCk2bz4M7zmsofJBTBgVpxxN1dlaHs52rq1f+MTPmC1xet9V60dnuYFWQQ==
X-Received: by 2002:a05:600c:41d1:b0:424:ae0c:6587 with SMTP id
 5b1f17b1804b1-4257a034ebcmr22942715e9.14.1719759361655; 
 Sun, 30 Jun 2024 07:56:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a1030c8sm7595193f8f.98.2024.06.30.07.56.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:56:01 -0700 (PDT)
Message-ID: <5814df2d-ee10-483e-ba25-f04ac87e48dd@mind.be>
Date: Sun, 30 Jun 2024 16:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240629211328.812746-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240629211328.812746-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719759362; x=1720364162; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b58CBpcPPcYhFAcRqf24pF9vZ4qouB/Yyu1awUd3NBw=;
 b=IBxRIb7PUMPhNvN7PtStOia9uBV21cx8Xcq/tR5gmTs4p9zqygVn8M5nnBezI00SCx
 tQK17NTTGhAV115T/A3z7tZaGasscneWLyF2DQI+77C6jSNm+Ekx3rXCnQhMf8KylrNN
 ppBRiT5yAlpzU6yUvxNiJiNxMxXF6P0P8XJBKoah9ompp/uEKqmcgzkQznkdejAYhiAO
 Aj146XqS421Oy/58k+AkAUzhRRS2baz0D2jC7czHlK79PY/rrXDO9WePeU4yZRh5/92u
 I3COP6JWoCIwwhMGjgCzbSTGX43HlBPrPxKCF7e8qXd8+7siedWSDUjLUicGzTRpNa01
 EVTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IBxRIb7P
Subject: Re: [Buildroot] [PATCH 1/1] package/nmap: bump to version 7.95
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/06/2024 23:13, Julien Olivain wrote:
> For change log, see:
> https://nmap.org/changelog.html#7.95
> 
> A notable change is the switch from pcre to pcre2. This change is
> reflected in Config.in and nmap.mk.
> 
> This commit also adds the sha256 hash, published at:
> https://nmap.org/dist/sigs/nmap-7.95.tar.bz2.digest.txt
> 
> The package patches are also rebased on this new version. The nmap
> package was failing to build since commit 8f88a644ed
> "support/scripts/apply-patches.sh: set the maximum fuzz factor to 0".
> The patch 0001 was regenerated with "git format-patch". This operation
> renamed the patch file. This change is reflected in the
> ".checkpackageignore" entry.

  It would have been nice to have sent the patch upstream (and add an Upstream 
tag). Fabrice, perhaps you remember still if you ever sent the patch upstream, 
or if there was a reason not to bother?


  Anyway, applied to master, thanks.

  Regards,
  Arnout

> 
> Fixes:
> http://autobuild.buildroot.org/results/417ef0b2a80e8ec5859813a9f16f773881899025
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit d09597b with commands:
> 
>      utils/docker-run make check-package
>      ...
>      0 warnings generated
> 
>      utils/test-pkg -p nmap
>      ...
>      6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>   .checkpackageignore                           |  2 +-
>   ...ibdnet-always-build-a-static-library.patch | 25 +++++++++++++++++++
>   .../nmap/0001-libdnet-wrapper-configure.patch | 11 --------
>   ...pto.cc-fix-build-with-libressl-3.5.0.patch | 14 ++++++-----
>   package/nmap/Config.in                        |  2 +-
>   package/nmap/nmap.hash                        |  5 ++--
>   package/nmap/nmap.mk                          |  4 +--
>   7 files changed, 40 insertions(+), 23 deletions(-)
>   create mode 100644 package/nmap/0001-libdnet-always-build-a-static-library.patch
>   delete mode 100644 package/nmap/0001-libdnet-wrapper-configure.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 313201b0e68..1ffe9f79c1a 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1097,7 +1097,7 @@ package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch lib_patch.Upstre
>   package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch lib_patch.Upstream
>   package/nginx/S50nginx lib_sysv.Indent lib_sysv.Variables
>   package/nilfs-utils/0001-nilfs_cleanerd-link-dynamically.patch lib_patch.Upstream
> -package/nmap/0001-libdnet-wrapper-configure.patch lib_patch.Upstream
> +package/nmap/0001-libdnet-always-build-a-static-library.patch lib_patch.Upstream
>   package/nodejs/nodejs-src/0001-add-qemu-wrapper-support.patch lib_patch.Upstream
>   package/nodejs/nodejs-src/0002-check-if-uclibc-has-backtrace-support.patch lib_patch.Upstream
>   package/nodejs/nodejs-src/0003-include-obj-name-in-shared-intermediate.patch lib_patch.Upstream
> diff --git a/package/nmap/0001-libdnet-always-build-a-static-library.patch b/package/nmap/0001-libdnet-always-build-a-static-library.patch
> new file mode 100644
> index 00000000000..b34e44e389d
> --- /dev/null
> +++ b/package/nmap/0001-libdnet-always-build-a-static-library.patch
> @@ -0,0 +1,25 @@
> +From aeadf40bc0ebbb9fea8de8bc6786a2eccf02fa34 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Sat, 29 Jun 2024 16:50:36 +0200
> +Subject: [PATCH] libdnet: always build a static library
> +
> +Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> +[Julien: rebased patch on version 7.95]
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +---
> + libdnet-stripped/configure.gnu | 3 +++
> + 1 file changed, 3 insertions(+)
> + create mode 100644 libdnet-stripped/configure.gnu
> +
> +diff --git a/libdnet-stripped/configure.gnu b/libdnet-stripped/configure.gnu
> +new file mode 100644
> +index 0000000..989fee4
> +--- /dev/null
> ++++ b/libdnet-stripped/configure.gnu
> +@@ -0,0 +1,3 @@
> ++#!/bin/sh
> ++
> ++exec "${0%.gnu}" "${@}" --enable-static --disable-shared
> +--
> +2.45.2
> +
> diff --git a/package/nmap/0001-libdnet-wrapper-configure.patch b/package/nmap/0001-libdnet-wrapper-configure.patch
> deleted file mode 100644
> index a85242ad941..00000000000
> --- a/package/nmap/0001-libdnet-wrapper-configure.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -libdnet: always build a static library
> -
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -
> -diff --git a/libdnet-stripped/configure.gnu b/libdnet-stripped/configure.gnu
> ---- /dev/null
> -+++ b/libdnet-stripped/configure.gnu
> -@@ -0,0 +1,3 @@
> -+#!/bin/sh
> -+
> -+exec "${0%.gnu}" "${@}" --enable-static --disable-shared
> diff --git a/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch b/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch
> index f2bdf5904dd..700b8585f13 100644
> --- a/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch
> +++ b/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch
> @@ -1,4 +1,4 @@
> -From 4ebea5c1d1a10be0d0165da3b9c0e1fa82c3db3c Mon Sep 17 00:00:00 2001
> +From 0a79771c302bf398150da78cd18b67cb9b67f47a Mon Sep 17 00:00:00 2001
>   From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   Date: Sat, 21 May 2022 17:51:37 +0200
>   Subject: [PATCH] nping/Crypto.cc: fix build with libressl >= 3.5.0
> @@ -15,15 +15,17 @@ Fixes:
>   
>   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   Upstream: https://github.com/nmap/nmap/pull/2480
> +[Julien: rebased patch on version 7.95]
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
>   ---
>    nping/Crypto.cc | 4 +++-
>    1 file changed, 3 insertions(+), 1 deletion(-)
>   
>   diff --git a/nping/Crypto.cc b/nping/Crypto.cc
> -index 850438352..9f7c88686 100644
> +index 6f05db6..1d11d55 100755
>   --- a/nping/Crypto.cc
>   +++ b/nping/Crypto.cc
> -@@ -70,7 +70,9 @@
> +@@ -69,7 +69,9 @@
>    #include <openssl/evp.h>
>    #include <openssl/err.h>
>    
> @@ -32,8 +34,8 @@ index 850438352..9f7c88686 100644
>   +	((!defined LIBRESSL_VERSION_NUMBER) || \
>   +	(defined LIBRESSL_VERSION_NUMBER && LIBRESSL_VERSION_NUMBER >= 0x30500000L))
>    #define HAVE_OPAQUE_EVP_PKEY 1
> - #define FUNC_EVP_MD_CTX_init EVP_MD_CTX_reset
> - #define FUNC_EVP_MD_CTX_cleanup EVP_MD_CTX_reset
> + #else
> + #define EVP_MD_CTX_new EVP_MD_CTX_create
>   --
> -2.35.1
> +2.45.2
>   
> diff --git a/package/nmap/Config.in b/package/nmap/Config.in
> index 6e097a9884c..c9fcf9771df 100644
> --- a/package/nmap/Config.in
> +++ b/package/nmap/Config.in
> @@ -34,7 +34,7 @@ comment "a symlink from ncat to 'nc' will be installed"
>   
>   config BR2_PACKAGE_NMAP_NMAP
>   	bool "install nmap"
> -	select BR2_PACKAGE_PCRE
> +	select BR2_PACKAGE_PCRE2
>   	help
>   	  This option installs 'nmap' itself.
>   
> diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
> index 99c5d5fb07d..4f6ea20731a 100644
> --- a/package/nmap/nmap.hash
> +++ b/package/nmap/nmap.hash
> @@ -1,5 +1,6 @@
> -# From https://nmap.org/dist/sigs/nmap-7.94.tar.bz2.digest.txt (lowercase)
> -sha512  a55cddf9c1d9272243d01251eb3315b26f232d0596818857083222a385398618b428dc2bd8282c3e832527e135a74aeb020ca8609d83d8337342f5d8a04d7f2c  nmap-7.94.tar.bz2
> +# From https://nmap.org/dist/sigs/nmap-7.95.tar.bz2.digest.txt (lowercase)
> +sha256  e14ab530e47b5afd88f1c8a2bac7f89cd8fe6b478e22d255c5b9bddb7a1c5778  nmap-7.95.tar.bz2
> +sha512  fd95a8bc627a2b8b507353f761dc9fdc8e880a0dd2d75a51b9cb3ec664318796af9bb16a6ff9a1358bd77ad669c2a54e333be630f201f69287692a7d2d41c17e  nmap-7.95.tar.bz2
>   
>   # Locally calculated
>   sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
> diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
> index 6cd9d961198..077840b1923 100644
> --- a/package/nmap/nmap.mk
> +++ b/package/nmap/nmap.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NMAP_VERSION = 7.94
> +NMAP_VERSION = 7.95
>   NMAP_SITE = https://nmap.org/dist
>   NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
>   NMAP_DEPENDENCIES = liblinear libpcap
> @@ -62,7 +62,7 @@ NMAP_CONF_OPTS += --without-ncat
>   endif
>   
>   ifeq ($(BR2_PACKAGE_NMAP_NMAP),y)
> -NMAP_DEPENDENCIES += pcre
> +NMAP_DEPENDENCIES += pcre2
>   NMAP_CONF_OPTS += --with-libpcre="$(STAGING_DIR)/usr"
>   NMAP_MAKE_OPTS += nmap
>   NMAP_INSTALL_TARGET_OPTS += install-nmap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
