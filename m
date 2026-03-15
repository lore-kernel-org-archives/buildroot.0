Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B39F3026E
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 16:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6868F40CC0;
	Sun, 15 Mar 2026 16:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlVj7IVcFycf; Sun, 15 Mar 2026 16:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FF2340CEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773592487;
	bh=8c4y6h46RnbHPhcGhRkc1Zuuz+OtcxawO27mEXxZaKI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B7l3PkvQz/RctCTgY6YrgPKlTLfFJIWchJWHag+k5y18Qny2l4xxNjmEg/qi8c4MJ
	 +OFvio3yoIJczTMQvuGeInyGIrxWvJQ+mCOh/5+dsmRywBQyPdjbjUz5WK8vGIVziC
	 4LooZAod9WKdz0y7Ki18InFSeGTR1YtmAbmBROrXs67TIaRpjRUzEOssVKpPBelzVc
	 tsAq+L8GdwT6rLOT6oAG0qv14Ku4sfjw6jwgsihB5VZKIQO0dCv1MZVtB7iYm9+CsB
	 nzTVs5mnHV82/3f5kjhtagSMUcPa91L5OaLmzMqhyMOigxKedrStUbhJygeAxEdKGZ
	 0EI3RZlR8RWXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FF2340CEE;
	Sun, 15 Mar 2026 16:34:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FBFC201
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 16:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5144660724
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 16:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olLDkDkehWS5 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 16:34:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3021060723
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3021060723
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3021060723
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 16:34:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id F2FCEC42739;
 Sun, 15 Mar 2026 16:35:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BFF615FC4A;
 Sun, 15 Mar 2026 16:34:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5E0B910369EBA; Sun, 15 Mar 2026 17:34:40 +0100 (CET)
Date: Sun, 15 Mar 2026 17:34:38 +0100
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: buildroot@buildroot.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <abbeWoojTqlSCJwr@windsurf>
References: <20260312111331.391639-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260312111331.391639-1-kory.maincent@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1773592482; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=6dvBHusuwuzEa1NI8v4nOnmgjHULiDIP8g+S5KuCALg=;
 b=eQM9Uo/2UGP73wUTpRWPp9gCsVXs0m0HtgYKepZPrENTMbtVLRSTjN8LmLi3YqZkJPfVUx
 24mm0Vx9+AEzQmrfZU6rQT3RVDhCKDuVTUpcjAvW+LUqsrvrzi7n0ku4g9rq0thZYWhQ0b
 yl5+Knq+Y3EGQzC/ViID6TUA3prnWg+uaG+KKW806Wub9uv8RXeDepedH3cUDvY27qIUMh
 MO412OJ6lKSPsvtLtFOtttLoddDIyLOqBIom35LGwdWE94ic2ayXxDlOWQ5tFW/CCRFtVm
 drt1KEnXJ9zO7Z/GeEteq09YY/D0JvX3VhLjFNLYWb+6XyTrVvDjxvCI8Mpe3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=eQM9Uo/2
Subject: Re: [Buildroot] [PATCH] package: Add drm_info
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kory,

Thanks for the patch.

The commit title should be:

    package/drm-info: new package

On Thu, Mar 12, 2026 at 12:13:30PM +0100, Kory Maincent via buildroot wrote:
> drm_info is a small utility to dump info about DRM devices.
> 
> Link: https://gitlab.freedesktop.org/emersion/drm_info
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  package/Config.in                             |  1 +
>  ...0001-meson.build-Fix-Buildroot-build.patch | 34 +++++++++++++++++++
>  package/drm_info/Config.in                    |  8 +++++
>  package/drm_info/drm_info.hash                |  5 +++
>  package/drm_info/drm_info.mk                  | 15 ++++++++
>  5 files changed, 63 insertions(+)

The package should be named drm-info, not drm_info.

Also, please add an entry in the DEVELOPERS file.

> diff --git a/package/drm_info/0001-meson.build-Fix-Buildroot-build.patch b/package/drm_info/0001-meson.build-Fix-Buildroot-build.patch
> new file mode 100644
> index 0000000000..b709ab8a1f
> --- /dev/null
> +++ b/package/drm_info/0001-meson.build-Fix-Buildroot-build.patch
> @@ -0,0 +1,34 @@
> +From 785525a74878bdf688c5466d83e193e207abed6a Mon Sep 17 00:00:00 2001
> +From: Kory Maincent <kory.maincent@bootlin.com>
> +Date: Wed, 11 Mar 2026 19:03:46 +0100
> +Subject: [PATCH] meson.build: Fix Buildroot build
> +
> +In cross compilation case pc_sysrootdir variable contains the sysroot path,
> +but includedir from pkgconfig already contains the full absolute path
> +(sysroot + /usr/include), so concatenating them double the sysroot prefix.
> +
> +The fix removes pc_sysrootdir + so includedir is used directly, which
> +already points to the correct absolute path on the filesystem.
> +
> +Upstream: N/A

Clearly doing cross-compilation properly with meson is possible. So an
upstreamable patch must be possible for this. I think using
pc_sysrootdir here is incorrect, but I haven't checked thoroughly. But
in any case, this is not a "fix Buildroot build" patch, as this issue
is unrelated to Buildroot, any other cross-compilation scenario would
encounter the same issue. This means a patch must be submitted
upstream.

> diff --git a/package/drm_info/Config.in b/package/drm_info/Config.in
> new file mode 100644
> index 0000000000..a664485d03
> --- /dev/null
> +++ b/package/drm_info/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_DRM_INFO
> +	bool "drm_info"

	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm

must be added here.

> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_JSON_C
> +	help
> +	  Small utility to dump info about DRM devices.
> +
> +	  https://gitlab.freedesktop.org/emersion/drm_info

And:

comment "drm-info needs a toolchain w/ threads"
	depends on !BR2_TOOLCHAIN_HAS_THREADS

> diff --git a/package/drm_info/drm_info.mk b/package/drm_info/drm_info.mk
> new file mode 100644
> index 0000000000..dd2698247b
> --- /dev/null
> +++ b/package/drm_info/drm_info.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# drm_info

drm-info

> +#
> +################################################################################

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
