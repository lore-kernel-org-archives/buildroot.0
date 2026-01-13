Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53669D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AC528434C;
	Tue, 13 Jan 2026 19:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODlimSawijcV; Tue, 13 Jan 2026 19:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24FB984430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333693;
	bh=cim8WsR8kVu/VPudyIxt6ak6lTUtRE2Fq25/CDYBzm0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QErJa36S9IsJQw9u9k7uCcIWXhrYs//GcJ8vL2opzxGbJjZ8wUsN4RnhldNiPfU1D
	 nBgd+M/PMoyiUt8gBBLzzkcD58F502i3WqDCPk1gZS04DY9ocw+iBkbyjxKUTYAKxt
	 IV2D1uVBrPK6sk+aRcfyhNiwOn4UyaijQmRPvUCSziH7be+crOYFSIkbX36PKmjAi+
	 vQsMvKnlBl0fdgi1Oo0auu6LAWu8h02G1cUcI9BLIbc+beP6WXwHXDNSWhDdWRyPHQ
	 BdGFosaUnIdbra37zjQNN67vg+nkQxgEJLGz7OybiJSTMLo8MaLMRl20BHju2PDL7N
	 gCNf6G1epld4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24FB984430;
	Tue, 13 Jan 2026 19:48:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C69F1231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACC8260AB6
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGBwbEXxb6Ci for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:48:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94A2360B91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94A2360B91
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94A2360B91
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A3E5BB97A863; Tue, 13 Jan 2026 20:48:06 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:48:04 +0100
Message-ID: <20260113194805.100383-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223214154.582451-1-thomas.petazzoni@bootlin.com>
References: <20251223214154.582451-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333686; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=XJ/uFsJPHHYPYyJKgPXydlW0ygs/yJJtsRO5P8y7+oA=;
 b=QNQIHZHcxesYJd2v/1K1VZUGPSWGSIeFv+jnu1/03N2iQQpTWVnNHa37dFxRNipzPW+nts
 Dv2y1TVaBqa0GRan+GoPsROAKAHRgsU7tHwdlXlsBdLmahtBJaf6ymvIak7dqelszRSaVt
 hWbjxTBrRgOO9Rb+JHO5TKMGSJ0hmf3JWCwYOIEK1nTs34eTsFZYGNYK9mnIcwzPkCxqTW
 0ZifWnS2l2q6ITIK1OI9toM9jbOCgPPi/4v+lYhSCwtQdaJg9PlQUtFWZlJJVZ4JhBDBO2
 Wbu21lnZV4AoRhD9/fMIQEkT7WxylCR4ff8h9+zJ9kC+hv9DR33qJ5kbGFsCkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=QNQIHZHc
Subject: Re: [Buildroot] [PATCH] package/libdnet: drop support for Python
 module
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The libdnet Python module no longer builds with Python >= 3.13. The
> issue has been reported upstream on August 17, 2025, and there has
> been no feedback:
> 
>   https://github.com/ofalk/libdnet/issues/114
> 
> Until this gets resolved, we have no choice but to drop support for
> the Python module of this package.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/4df6bcaa66d79efac3619a47b08f3cb02c13e276/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.11.x. Thanks

> ---
>  Config.in.legacy           |  7 +++++++
>  package/libdnet/Config.in  | 24 ------------------------
>  package/libdnet/libdnet.mk | 11 ++---------
>  3 files changed, 9 insertions(+), 33 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 75e0ae3c4f..7c598e0e68 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2026.02"
>  
> +config BR2_PACKAGE_LIBDNET_PYTHON
> +	bool "libdnet python module removed"
> +	select BR2_LEGACY
> +	help
> +	  The libdnet Python module is no longer compatible with
> +	  Python >= 3.13, so it had to be removed.
> +
>  config BR2_PACKAGE_CVS
>  	bool "cvs has been removed"
>  	select BR2_LEGACY
> diff --git a/package/libdnet/Config.in b/package/libdnet/Config.in
> index 473e8aea22..9fd6a85c36 100644
> --- a/package/libdnet/Config.in
> +++ b/package/libdnet/Config.in
> @@ -5,27 +5,3 @@ config BR2_PACKAGE_LIBDNET
>  	  routines.
>  
>  	  http://libdnet.sourceforge.net/
> -
> -if BR2_PACKAGE_LIBDNET
> -
> -config BR2_PACKAGE_LIBDNET_PYTHON
> -	bool "libdnet python module"
> -	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> -	depends on BR2_PACKAGE_PYTHON3
> -	depends on !BR2_STATIC_LIBS # libbsd
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
> -	depends on BR2_USE_WCHAR # libbsd
> -	select BR2_PACKAGE_LIBBSD
> -	help
> -	  dnet module for python
> -
> -comment "dnet module for python requires python3 package"
> -	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> -	depends on !BR2_PACKAGE_PYTHON3
> -
> -comment "dnet module for python needs a toolchain w/ dynamic library, threads, wchar"
> -	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> -	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_USE_WCHAR
> -
> -endif
> diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
> index 8eebd1050d..12491a93bf 100644
> --- a/package/libdnet/libdnet.mk
> +++ b/package/libdnet/libdnet.mk
> @@ -12,18 +12,11 @@ LIBDNET_INSTALL_STAGING = YES
>  LIBDNET_AUTORECONF = YES
>  LIBDNET_CONF_OPTS = \
>  	--with-gnu-ld \
> -	--with-check=no
> +	--with-check=no \
> +	--without-python
>  LIBDNET_CONFIG_SCRIPTS = dnet-config
>  LIBDNET_DEPENDENCIES = host-pkgconf
>  
> -ifeq ($(BR2_PACKAGE_LIBDNET_PYTHON),y)
> -LIBDNET_DEPENDENCIES += libbsd host-python-cython python3
> -LIBDNET_CONF_OPTS += --with-python=$(HOST_DIR)/bin
> -LIBDNET_MAKE_ENV += $(PKG_PYTHON_SETUPTOOLS_ENV)
> -LIBDNET_INSTALL_TARGET_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
> -LIBDNET_INSTALL_STAGING_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
> -endif
> -
>  # Needed for autoreconf to work properly
>  define LIBDNET_FIXUP_ACINCLUDE_M4
>  	ln -sf config/acinclude.m4 $(@D)
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
