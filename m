Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9752C55173
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 11:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B1CD4072F;
	Sat,  1 Aug 2026 11:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHmleco_fqbQ; Sat,  1 Aug 2026 11:52:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C8034073F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785585150;
	bh=Ad91mJGZ3cgu682pDgWHFJVP9Na+/mPOtEjLsR+p8as=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oO7GT40VDMRa4+J/wXd6TJS2V9Y7q9ht0i7ydONwhSmhMMqn/I9pee3bkP/SgBxnS
	 TRoLa1e5a/QaQx2Y1bU5x+1O2n0JsCjblCWwi4etlF/S+3EyCII3ogirripGkmkLZX
	 kdfITmgqyU13sSMW+DPuxc466DFOO2aEQb5JIN8H6W2Yf6LV2RoEOAE+cGYEd5YmZJ
	 o5w4c6EyYSDLI4+jx+8XG39dXN28wll9hM/ZVQx6RzqeJ9849utl3PFE4gBZoUumVx
	 9iuSFejhZx35n5ey4ejGWmkBbk4GV0FpD/kCegKX9tzFhOUnBdlctkq/EnGAUBSEXa
	 9r3Fg3Om9JEfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C8034073F;
	Sat,  1 Aug 2026 11:52:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FCA726C
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 360344073F
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-FiwIAQBIvG for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 11:52:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3247F4072F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3247F4072F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3247F4072F
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:52:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 32280780503;
 Sat,  1 Aug 2026 13:52:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Aug 2026 13:52:24 +0200
MIME-Version: 1.0
Date: Sat, 01 Aug 2026 13:52:24 +0200
To: viper@landau.one
Cc: buildroot@buildroot.org
In-Reply-To: <20260729152659.3813837-1-viper@landau.one>
References: <20260729152659.3813837-1-viper@landau.one>
User-Agent: Webmail Free/1.6.17
Message-ID: <720f85aa2477fe660f66a45354973035@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785585146;
 bh=0/v9T9MRB62zOcesZMEPENaBlTBGzuB6YULW34Z4F/s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WhbHWsDCoIU5/yAuySowUxwxPKIEJAFtvA48ReJR533EYOBsId7cPW6fcxJnx8Tat
 Oq5aKgWEbmeFjsolIVXfh3BE8QdMMa+lJ2Q0Y0Uy1Dqyu51b5uXxbEaKf03gv1tjXl
 4+RtXaKaCKxVKCo92a/GvpTJU39HWyHmqTX3mVnYlXmmvbkXQJAiSfSVDTDi3GWxWD
 3Hz69EkftuCb7QJnuf8j6dHtngeq3qKCw8heuoK4gmJI3nFwRHchJJeWnDqisV4vRc
 0AmHY6xQfAV+fgZY3cjuFf2d/t8Yoc2n42VVNH+uRV1l0jSe44NHugwzcF67EkgK+3
 80CdZWcIzZTBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WhbHWsDC
Subject: Re: [Buildroot] [PATCH 1/1] package/cpp-argparse: new package
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

Hi Konstantin,

Thanks for the patch. I have few comments, see below.

On 29/07/2026 17:26, viper@landau.one wrote:
> From: Konstantin Menyaev <viper@landau.one>
> 
> A Modern C++ header-only library
> for parsing command-line arguments.
> 
> https: //github.com/p-ranav/argparse
> 
> Signed-off-by: Konstantin Menyaev <viper@landau.one>
> ---
>  package/Config.in                    |  1 +
>  package/cpp-argparse/Config.in       | 12 ++++++++++++
>  package/cpp-argparse/cpp-argparse.mk | 16 ++++++++++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 package/cpp-argparse/Config.in
>  create mode 100644 package/cpp-argparse/cpp-argparse.mk

Your submission misses the cpp-argparse.hash file. Could you add
it please? See:
https://nightly.buildroot.org/manual.html#adding-packages-hash

You can check that with commands:

make cpp-argparse-source
WARNING: no hash file for cpp-argparse-v3.2.tar.gz

make cpp-argparse-legal-info
WARNING: no hash file for LICENSE

[...]
> diff --git a/package/cpp-argparse/Config.in 
> b/package/cpp-argparse/Config.in
> new file mode 100644
> index 0000000000..7ad91f7bbc
> --- /dev/null
> +++ b/package/cpp-argparse/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_CPP_ARGPARSE
> +	bool "cpp-argparse"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7

Upstream says the package requires gcc >= 8. Could you align to
this version please?
https://github.com/p-ranav/argparse/blob/v3.2/README.md?plain=1#L1432

> +	help
> +	  Argument Parser for Modern C++. A header-only library
> +	  for parsing command-line arguments.
> +
> +	  https://github.com/p-ranav/argparse
> +
> +comment "cpp-argparse needs a toolchain w/ C++, GCC >= 7"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7

Please adjust the gcc version here too.

> diff --git a/package/cpp-argparse/cpp-argparse.mk 
> b/package/cpp-argparse/cpp-argparse.mk
> new file mode 100644
> index 0000000000..7978fd224c
> --- /dev/null
> +++ b/package/cpp-argparse/cpp-argparse.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# cpp-argparse
> +#
> +################################################################################
> +
> +CPP_ARGPARSE_VERSION = v3.2
> +CPP_ARGPARSE_SITE = $(call 
> github,p-ranav,argparse,$(CPP_ARGPARSE_VERSION))

For automated release monitoring, could you please move the 'v'
to _SITE to have instead:

CPP_ARGPARSE_VERSION = 3.2
CPP_ARGPARSE_SITE = $(call 
github,p-ranav,argparse,v$(CPP_ARGPARSE_VERSION))

> +CPP_ARGPARSE_LICENSE = MIT
> +CPP_ARGPARSE_LICENSE_FILES = LICENSE
> +CPP_ARGPARSE_INSTALL_STAGING = YES
> +CPP_ARGPARSE_INSTALL_TARGET = NO
> +
> +CPP_ARGPARSE_CONF_OPTS = -DARGPARSE_BUILD_SAMPLES=OFF 
> -DARGPARSE_BUILD_TESTS=OFF
> +
> +$(eval $(cmake-package))
> --
> 2.55.0

Could you send an updated patch addressing those comments, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
