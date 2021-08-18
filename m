Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D68C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 20:37:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA9AB610FD
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 20:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA9AB610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D564405F7;
	Wed, 18 Aug 2021 20:37:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lXlWyWc5f3U7; Wed, 18 Aug 2021 20:37:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A67E4075C;
	Wed, 18 Aug 2021 20:37:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FF3F1BF344
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 20:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 702E8405F7
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 20:37:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2RAcYGctDF2 for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 20:37:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4562040796
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 20:37:10 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 l36-20020a0568302b24b0290517526ce5e3so5651316otv.11
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 13:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cPM8be1pzy/Dar2NSt7hlq0K7yAep1ZoFZqDc0WXHCs=;
 b=iBGARw4vFRB5fqJFQo8DigX8LLFQ9+m/cUGbb+jIwyvx7WgQEa7BQRohww+wx/n/dL
 SbQN/9fO3J7ArtouYZrCed4oornIguQzG3xNsYeR3IyubYexjGOjB9E/hSPB8nymgl/6
 RRh/2GX7/pM13fnUBdhGolHhyeKsndsbYC+r9UNHxuO6Phj/RcAYddBDs92GA3HJXRg1
 hF6tckcPSUqmhZwD0vaAXuXJYdaHNLjMRZHgF/LX3MALIRFRCuDO4BEZO438FdhiPWuU
 wT6qjPyVDBM80sYA3uU438c+LL1hCTxyTym1PhwlGyoHs2EGw7ddMzVjPHB8fRbjofyK
 5r/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cPM8be1pzy/Dar2NSt7hlq0K7yAep1ZoFZqDc0WXHCs=;
 b=K1MNffgd+4wHMgCQoJzM+k6XURtnhXbTdrPOGDQyQFTEgotjRo7EvRrVgITbYOBlgU
 hqZO/svSwW8yRSVWJJFIiqgAtvBk2/ObMfJHD3CuAfnMCmVAJprXKGghO1nG7gjR6UCE
 N1pbJpPgIap8p0sxN+rRVEg4r63bHusBYqDxsWmItGVc3yETxxHQZVbnaZS+7oWCWO08
 NRsg2UEqY58G0fN829Qn++7DHBiWT3tPNx1xVNmyviMTjS05p+FsCJDI+edjkVKDLnl+
 Ao4KbG4emYbshiyKuikDMZf1fCZqDcsNpc9ptH0ijfFYOZjJ7dxjt0+bHMusCEbWH7oh
 SeEw==
X-Gm-Message-State: AOAM530oI2H9EF5QI3qfHr6CU1NEiCxD/n6HAHIXbDKmWxtCDJCu2wIx
 TJFAVHjaj5JXnMA6sCDdcPSC8LvitkqfPdlHIfA=
X-Google-Smtp-Source: ABdhPJxbM1xgE3oTS1z24p/gZDwvbmWEMzpblZl43Q9CTHuAw0rXJiBRTDSWWbUINVu8S9twwOzaxmKRjezst8SLp1M=
X-Received: by 2002:a05:6830:22e9:: with SMTP id
 t9mr8331416otc.10.1629319029165; 
 Wed, 18 Aug 2021 13:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210818202212.684857-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20210818202212.684857-1-thomas.petazzoni@bootlin.com>
From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 18 Aug 2021 13:36:58 -0700
Message-ID: <CAFSsvmrYDiStTEn=fEBrUX2+ZZoro6KxMx1zS2FLxsaLzuTtfw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Thomas;

It seems like version 1.68.0 fixes the build failures. I have tested
two different
defconfigs that are on the failure list:
  - bf7361dc482d8f3f97d523b7d56eabe5bc515ae8
  - 97aa03f497536462abc85011ba1c94874d18f237

And the new version doesn't produce the failures that are plaguing the
autobuilders.

Instead of removing the package, I would suggest updating it to 1.68.0 instead.

Adam

On Wed, Aug 18, 2021 at 1:22 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This package has had build failures for a very long time, and these
> issues have not been fixed, and it is now the number 1 build failure
> reason in our autobuilders. It is time to acknowledge that the package
> needs to be removed.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
> @@ -1441,7 +1441,6 @@ F:        package/python-schedule/
>  F:     package/python-sentry-sdk/
>  F:     package/python-websockets/
>  F:     package/python-xlib/
> -F:     package/sentry-cli/
>  F:     package/sentry-native/
>  F:     package/unclutter-xfixes/
>
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 8d443ea255..551352482e 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -79,7 +79,6 @@ menu "Host utilities"
>         source "package/s6-rc/Config.in.host"
>         source "package/sam-ba/Config.in.host"
>         source "package/sdbusplus/Config.in.host"
> -       source "package/sentry-cli/Config.in.host"
>         source "package/squashfs/Config.in.host"
>         source "package/sunxi-tools/Config.in.host"
>         source "package/swig/Config.in.host"
> diff --git a/package/sentry-cli/Config.in.host b/package/sentry-cli/Config.in.host
> deleted file mode 100644
> index 3124015367..0000000000
> --- a/package/sentry-cli/Config.in.host
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -config BR2_PACKAGE_HOST_SENTRY_CLI
> -       bool "host sentry-cli"
> -       depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> -       select BR2_PACKAGE_HOST_RUSTC
> -       help
> -         Official Sentry command line interface
> -
> -         For managing debug information files and source maps.
> -
> -         https://docs.sentry.io/cli/
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
> -       CARGO_HOME=$(HOST_DIR)/share/cargo \
> -       RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))"
> -
> -HOST_SENTRY_CLI_CARGO_OPTS = \
> -       --release \
> -       --manifest-path=$(@D)/Cargo.toml
> -
> -define HOST_SENTRY_CLI_BUILD_CMDS
> -       $(HOST_MAKE_ENV) $(HOST_SENTRY_CLI_CARGO_ENV) \
> -               cargo build $(HOST_SENTRY_CLI_CARGO_OPTS)
> -endef
> -
> -define HOST_SENTRY_CLI_INSTALL_CMDS
> -       $(INSTALL) -D -m 0755 $(@D)/target/release/sentry-cli \
> -               $(HOST_DIR)/bin/sentry-cli
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
