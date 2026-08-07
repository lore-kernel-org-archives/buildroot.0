Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D791C2A09B
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 17:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 011DB605ED;
	Fri,  7 Aug 2026 17:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DK1ElXKwIFQ; Fri,  7 Aug 2026 17:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03EC460608
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786124486;
	bh=sIZE87tR9eAWny47g4itktNwgHxWz51VB2Pp0iwOtIA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m2lTNDrrjFNnGogmRzJlE9EcYQj4Km3I+bHjpyyWXegrB8ieHiy1eg/hSrDZ61fVa
	 631DtU9h8hMdx52G+XxuAo4gUS4oT1xJsXFmCriJbTxJ3lKWtS3w5UHBoRTHCOUpq3
	 gamIxvviHVXn3xs5wD5GEMdxtYjqRD/Elz9OO9tYKAdVqAu2EUTvYkAXIoVxQI9I78
	 xDtmxf36MSokxjVA9Lu+TyRhk/D/Jp76ImCC8/8fB7NnzYUurXkiWRIPReM9J6OQUL
	 3h4ipVWoJEIDh12tzpHGOZOd3gOc1wjid4F0ZTBK+K79vHQHqzdulNfnb4YvyE0IIf
	 OJ3CcVBKb/2bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03EC460608;
	Fri,  7 Aug 2026 17:41:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58B301AF
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 17:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4412540029
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 17:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88-9J8M1OaZs for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 17:41:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A5B4A40024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5B4A40024
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5B4A40024
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 17:41:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id EA485780371;
 Fri,  7 Aug 2026 19:41:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 07 Aug 2026 19:41:18 +0200
MIME-Version: 1.0
Date: Fri, 07 Aug 2026 19:41:18 +0200
To: Philippe MONTCHO <philippemontcho@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260805141803.1647733-1-philippemontcho@gmail.com>
References: <20260805141803.1647733-1-philippemontcho@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <4c8da859f1a78442e7364118e6bf4eb2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786124480;
 bh=iQDvYny85E9G/1VGRsJ4RHgIwIHG16rlvW6XPGBvyCY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=io00E18VWK27d3woKMe/rKCWv1+fdn+iOjHRluDiQPng+BudfuRRAxHNWtfDDF9KU
 6FjZmEfSLRsA40qGCJYUjwsHQvIfIVtlWWgfrV0nyIiUudJWWjYFfu26ONs2ycrPHh
 4JtJD7Avm0lhVvXRNJoBlOfVTR2IrgSQtzijtCEiitKINw8herLT1z5bVpqkBCfeyQ
 y1Opz3GeOdH9YLENniGBXOaJUXMNgNkZPwGqCzGwSqUq00uaFpOYU08hB4EUuXsf6C
 hwVu0jjVMY5gV5Q0GM4VgkKlUZRYrYsXS/M8B03wfwO1sxaflFj9brjEfPOZx/rAqe
 GD4K2jQousywg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=io00E18V
Subject: Re: [Buildroot] [PATCH 1/1] package/dtc: bump version to 1.8.1 and
 switch to meson build
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

Hi Philippe,

Thanks for the patch. I have few comments.

On 05/08/2026 16:17, Philippe MONTCHO wrote:
> Release note:
> https://github.com/dgibson/dtc/releases/tag/v1.8.1

Could you also add a link to the v1.8.0, please?

Release notes, since v1.7.1:
https://github.com/dgibson/dtc/releases/tag/v1.8.0
https://github.com/dgibson/dtc/releases/tag/v1.8.1


> - This commit also removes 0002-fix-discarded-const-qualifiers.patch,
> since it has been merged in v1.8.0 already
> 
> - upstream dtc warns that Makefile-based builds are deprecated in
> favor of Meson after version was updated. So we migrate to Meson build.
> 
> Signed-off-by: Philippe MONTCHO <philippemontcho@gmail.com>
> ---
>  .../0002-fix-discarded-const-qualifiers.patch | 88 -------------------
>  package/dtc/dtc.hash                          |  4 +-
>  package/dtc/dtc.mk                            | 52 ++++-------
>  3 files changed, 17 insertions(+), 127 deletions(-)
>  delete mode 100644 
> package/dtc/0002-fix-discarded-const-qualifiers.patch
[...]
> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> index 5b810c6e65..bc4c264a61 100644
> --- a/package/dtc/dtc.mk
> +++ b/package/dtc/dtc.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -DTC_VERSION = 1.7.2
> +DTC_VERSION = 1.8.1

This new version is going to be a bit problematic in Buildroot:

Upstream dtc removed the "graph_child_address" checker in:
https://github.com/dgibson/dtc/commit/cba90ce82064ad1e6d25f20d8eaa940bd2fc97ed
first included in v1.8.0.

This option  was introduced some time ago:
https://github.com/dgibson/dtc/commit/df536831d02c51556a8e88cd8da0be0244484156
introduced in v1.4.7.

When dtc is called with an unknown warning option:
dtc -Wno-unknown-warning
it fails with error:
FATAL ERROR: Unrecognized check name "unknown-warning".

U-boot passes this -Wno-graph_child_address option to dtc since:
https://source.denx.de/u-boot/u-boot/-/commit/5972ff077e0f6db36f327f303b0c381f56238ef3
first included in version v2020.07.

U-boot removed it much later in:
https://source.denx.de/u-boot/u-boot/-/commit/b427decccfe983eda4f815ddcf5dcbe733cd04f6
first included in version v2026.07.

And in Buildroot, we pass our host-dtc to U-Boot with DTC=...

If we merge this patch as is, many defconfigs will fail to build
uboot with an error:
FATAL ERROR: Unrecognized check name "graph_child_address"

Maybe we could add a Buildroot specific patch which downgrade
the unknown check error as a warning? See:
https://github.com/dgibson/dtc/blob/v1.8.1/checks.c#L2057

Any opinions?

>  DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
>  DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
>  DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
> @@ -14,24 +14,25 @@ DTC_INSTALL_STAGING = YES
>  DTC_DEPENDENCIES = host-bison host-flex host-pkgconf
>  HOST_DTC_DEPENDENCIES = host-bison host-flex host-pkgconf
> 
> -DTC_MAKE_OPTS = \
> -	PREFIX=/usr \
> -	NO_PYTHON=1 \
> -	NO_VALGRIND=1
> +DTC_CONF_OPTS = \
> +	--prefix=/usr \

Could you remove this "--prefix" option, please?
It is already set by the pkg-meson.mk infra.

> +	-Dpython=disabled \
> +	-Dvalgrind=disabled \
> +	-Dtests=false
> 
>  # For the host, we install headers in a special subdirectory to avoid
>  # conflicts with the in-kernel libfdt copy.
> -HOST_DTC_MAKE_OPTS = \
> -	PREFIX=$(HOST_DIR) \
> -	INCLUDEDIR=$(HOST_DIR)/include/libfdt \
> -	NO_PYTHON=1 \
> -	NO_VALGRIND=1 \
> -	NO_YAML=1
> +HOST_DTC_CONF_OPTS = \
> +	--prefix=$(HOST_DIR) \

Same comment:
Could you remove this "--prefix" option, please?
It is already set by the pkg-meson.mk infra.

> +	--includedir=$(HOST_DIR)/include/libfdt \
> +	-Dpython=disabled \
> +	-Dvalgrind=disabled \
> +	-Dyaml=disabled
> 
>  ifeq ($(BR2_PACKAGE_LIBYAML),y)
>  DTC_DEPENDENCIES += libyaml

Since the package is now using Meson, could you add here:

DTC_CONF_OPTS += -Dyaml=enabled

>  else
> -DTC_MAKE_OPTS += NO_YAML=1
> +DTC_CONF_OPTS += -Dyaml=disabled
>  endif
> 
>  define DTC_POST_INSTALL_TARGET_RM_DTDIFF
> @@ -52,28 +53,5 @@ DTC_INSTALL_GOAL = install-lib
> 
>  endif # $(BR2_PACKAGE_DTC_PROGRAMS) != y
> 
> -define DTC_BUILD_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) EXTRA_CFLAGS="$(TARGET_CFLAGS) 
> -fPIC" -C $(@D) $(DTC_MAKE_OPTS)
> -endef
> -
> -# For staging, only the library is needed
> -define DTC_INSTALL_STAGING_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) 
> $(DTC_MAKE_OPTS) install-lib \
> -		install-includes
> -endef
> -
> -define DTC_INSTALL_TARGET_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) 
> $(DTC_MAKE_OPTS) $(DTC_INSTALL_GOAL)

Since you remove the use of $(DTC_INSTALL_GOAL) here, you
should also remove all other occurrences and the logic
around it in the dtc.mk file.

> -endef
> -
> -# host build
> -define HOST_DTC_BUILD_CMDS
> -	$(HOST_CONFIGURE_OPTS) $(MAKE) EXTRA_CFLAGS="$(HOST_CFLAGS) -fPIC" -C 
> $(@D) $(HOST_DTC_MAKE_OPTS)
> -endef
> -
> -define HOST_DTC_INSTALL_CMDS
> -	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_DTC_MAKE_OPTS) install
> -endef
> -
> -$(eval $(generic-package))
> -$(eval $(host-generic-package))
> +$(eval $(meson-package))
> +$(eval $(host-meson-package))
> --
> 2.43.0

Could you have a look at those issues, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
