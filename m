Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFA9C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:50:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2AD4610A0
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2AD4610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE60380ED7;
	Thu, 19 Aug 2021 20:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kbSeX9yJqt5; Thu, 19 Aug 2021 20:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4362480F0E;
	Thu, 19 Aug 2021 20:50:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E51A1BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27FFF4011B
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-jNImQV3OPC for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:50:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8F6840001
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:50:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9904:2733:9b91:ffcc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1C12320036C;
 Thu, 19 Aug 2021 22:50:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629406228;
 bh=V8yXqJjPWD/UdAY+DTOn0n8+Js3v0abIOMEvOALgDBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oM4xygALNIFwHkZl7bEfZfsjZdvUyGLR4HEi3UvdFhykR2VKaHsmq+ISyiu1r690w
 uJRnJnniIhLi19Xx5W3WUDyAr+rtRfIZj+5QblccodB80VQny7x8JEWFaQ6UYVMo+f
 yaJkuwU6bcS5SwHHe8iD5yq21VfcPEvbkw2rWL3lQbKS87l2Ubj0NgwfZ9jPZjkqEm
 mPpjEp4KB95F5sno9ainNhi1LHl7Kikjq8DC4S6qDn1lY2haQtiSrWazyi7HbYEVFK
 3QXUMQvPPyB1KY+096bKAHOPiZnjlepNtecY0zOKpjcWfITO+lpkHYCsiRquyfVUKk
 cq5C9DfzVy1Cw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 19 Aug 2021 22:50:21 +0200
Date: Thu, 19 Aug 2021 22:50:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210819205021.GE27036@scaer>
References: <20210818202212.684857-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210818202212.684857-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/sentry-cli: remove package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Thomas, All,

On 2021-08-18 22:22 +0200, Thomas Petazzoni spake thusly:
> This package has had build failures for a very long time, and these
> issues have not been fixed, and it is now the number 1 build failure
> reason in our autobuilders. It is time to acknowledge that the package
> needs to be removed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Indeed, this is a bit sad that we have to remove a package, but since
noone ever fixed the issues with it, meh...

I was pondering whether it was material for master or next, but then I
decided master, because we do not want a release with a known-broken,
never-to-be-fixed package.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                         |  1 -
>  package/Config.in.host             |  1 -
>  package/sentry-cli/Config.in.host  | 10 ----------
>  package/sentry-cli/sentry-cli.hash |  3 ---
>  package/sentry-cli/sentry-cli.mk   | 32 ------------------------------
>  5 files changed, 47 deletions(-)
>  delete mode 100644 package/sentry-cli/Config.in.host
>  delete mode 100644 package/sentry-cli/sentry-cli.hash
>  delete mode 100644 package/sentry-cli/sentry-cli.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index af97de02de..64cd29d7d1 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1441,7 +1441,6 @@ F:	package/python-schedule/
>  F:	package/python-sentry-sdk/
>  F:	package/python-websockets/
>  F:	package/python-xlib/
> -F:	package/sentry-cli/
>  F:	package/sentry-native/
>  F:	package/unclutter-xfixes/
>  
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 8d443ea255..551352482e 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -79,7 +79,6 @@ menu "Host utilities"
>  	source "package/s6-rc/Config.in.host"
>  	source "package/sam-ba/Config.in.host"
>  	source "package/sdbusplus/Config.in.host"
> -	source "package/sentry-cli/Config.in.host"
>  	source "package/squashfs/Config.in.host"
>  	source "package/sunxi-tools/Config.in.host"
>  	source "package/swig/Config.in.host"
> diff --git a/package/sentry-cli/Config.in.host b/package/sentry-cli/Config.in.host
> deleted file mode 100644
> index 3124015367..0000000000
> --- a/package/sentry-cli/Config.in.host
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -config BR2_PACKAGE_HOST_SENTRY_CLI
> -	bool "host sentry-cli"
> -	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> -	select BR2_PACKAGE_HOST_RUSTC
> -	help
> -	  Official Sentry command line interface
> -
> -	  For managing debug information files and source maps.
> -
> -	  https://docs.sentry.io/cli/
> diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
> deleted file mode 100644
> index 3b0733a276..0000000000
> --- a/package/sentry-cli/sentry-cli.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# locally calculated
> -sha256  5d0f7acf6a139d1c1716b9a8ff76c8bfaab09104ba663c957bb9a5dba2ffbabd  sentry-cli-1.57.0.tar.gz
> -sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
> diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
> deleted file mode 100644
> index 7e53f16026..0000000000
> --- a/package/sentry-cli/sentry-cli.mk
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -################################################################################
> -#
> -# sentry-cli
> -#
> -################################################################################
> -
> -SENTRY_CLI_VERSION = 1.57.0
> -SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
> -SENTRY_CLI_LICENSE = BSD-3-clause
> -SENTRY_CLI_LICENSE_FILES = LICENSE
> -
> -HOST_SENTRY_CLI_DEPENDENCIES = host-rustc host-zlib
> -
> -HOST_SENTRY_CLI_CARGO_ENV = \
> -	CARGO_HOME=$(HOST_DIR)/share/cargo \
> -	RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))"
> -
> -HOST_SENTRY_CLI_CARGO_OPTS = \
> -	--release \
> -	--manifest-path=$(@D)/Cargo.toml
> -
> -define HOST_SENTRY_CLI_BUILD_CMDS
> -	$(HOST_MAKE_ENV) $(HOST_SENTRY_CLI_CARGO_ENV) \
> -		cargo build $(HOST_SENTRY_CLI_CARGO_OPTS)
> -endef
> -
> -define HOST_SENTRY_CLI_INSTALL_CMDS
> -	$(INSTALL) -D -m 0755 $(@D)/target/release/sentry-cli \
> -		$(HOST_DIR)/bin/sentry-cli
> -endef
> -
> -$(eval $(host-generic-package))
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
