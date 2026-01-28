Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60B0D3F09D
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A59C40B09;
	Wed, 28 Jan 2026 17:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cH68HYnuzanu; Wed, 28 Jan 2026 17:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58E2140A49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769621069;
	bh=8oU/G8IAtGlSOjkONrU3DCpd+CDAsrl2X8nO00Cx+JM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dGpFucdeBUs14RPGRcqNURbu43VjnSE9r9ACrSrEvrZpbfpasm1W9ywcNt77ym3C1
	 IArl5DtCiXiFFevynp4umKb0pcO4o22MdhbW7mtgXJ+suHLmmpxf3fXH9j6EelSxaa
	 xxXgv7tsBtIo2e8AQztEi4xMdxg3daW9ng0GN/zKyBC023eSC0SvasdqZXGjoXs4CD
	 7UnUStlBBm4RdK8oF6i/xXQsY10z3QvTwiwiL15cl4QZo+lrHOClo+JYdVWc0aYhUg
	 Kiu0k74GJvldKKCa9v1JZXWNADB1yo2j02gfGU5UjK+9lHZAB3zfM1eBrhEukRzhgp
	 MHLYVBmM4rDOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58E2140A49;
	Wed, 28 Jan 2026 17:24:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C70C3118
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC1ED60781
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6GJawKqu5br for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:24:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A64860614
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A64860614
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A64860614
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7BF6BB97AC78; Wed, 28 Jan 2026 18:24:20 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 28 Jan 2026 18:24:19 +0100
Message-ID: <20260128172419.342805-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106200115.1985522-6-bernd@kuhls.net>
References: <20260106200115.1985522-6-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1769621060; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=uwik75oavlnCTTi5BKeXO/N1yNgGwv/l/7n69HTc5OA=;
 b=AnAzsZcGzdrSQgZ13Ko6HmlEAP7ajXkEmpvReKRgYiERUd9HaHzkXp9BPg7G8X6NsUgEqC
 gAOs4IRjuRLke4XJ/fIg29d+es1diqetmKyk4qLa02aFIgrZ6FCtQSFBCy77MxlkcWn7+u
 ihXqyMrkSH8B8nQPdTuIQ+CLoBpX+TjYdBKJJmQZNqYFs9DVGkPI0L5pQI3sda3ROB0j8k
 aNh8BKgNZTtVsn2su19i+9roJgH02oYcOtJmyEG62KHOJalvIstcalZas+n5eLsUUu7fNI
 379xPAjSZkOc4cl0je/Dh0d77o+fByFSxQSaSSl5dD+dHF0jzAYVl7lCBgUcJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=AnAzsZcG
Subject: Re: [Buildroot] [PATCH v2 5/9] package/cvs: drop package
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
> The CVS project is no longer maintained upstream. It no longer builds
> with GCC 14.x, has been failing to build for months in our
> autobuilders with nobody caring about it.
> 
> We managed to fix the GCC 14.x build issue, then there are GCC 15.x,
> some of them fixed by Debian patches, but some not. Overall, this is
> too much effort, while upstream is completely dead.
> 
> So let's get rid of cvs entirely.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/59f6e77106ac98535688ff5b9392b0b3ad3041ae/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  Config.in.legacy      |  7 ++++++
>  package/Config.in     |  1 -
>  package/cvs/Config.in | 24 ------------------
>  package/cvs/cvs.hash  |  8 ------
>  package/cvs/cvs.mk    | 58 -------------------------------------------
>  5 files changed, 7 insertions(+), 91 deletions(-)
>  delete mode 100644 package/cvs/Config.in
>  delete mode 100644 package/cvs/cvs.hash
>  delete mode 100644 package/cvs/cvs.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 062a9ebd5a..28919e8594 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2026.02"
>  
> +config BR2_PACKAGE_CVS
> +	bool "cvs has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The cvs project was no longer maintained upstream, broken
> +	  with GCC 14.x, so it was removed.
> +
>  config BR2_PACKAGE_CRIU
>  	bool "criu has been removed"
>  	help
> diff --git a/package/Config.in b/package/Config.in
> index 628a1f0aa6..bbbc04226f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -173,7 +173,6 @@ menu "Development tools"
>  	source "package/cppunit/Config.in"
>  	source "package/cukinia/Config.in"
>  	source "package/cunit/Config.in"
> -	source "package/cvs/Config.in"
>  	source "package/cxxtest/Config.in"
>  	source "package/diffutils/Config.in"
>  	source "package/dos2unix/Config.in"
> diff --git a/package/cvs/Config.in b/package/cvs/Config.in
> deleted file mode 100644
> index e8f0606ecc..0000000000
> --- a/package/cvs/Config.in
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -config BR2_PACKAGE_CVS
> -	bool "cvs"
> -	depends on BR2_USE_WCHAR
> -	# needs fork()
> -	depends on BR2_USE_MMU
> -	select BR2_PACKAGE_NCURSES
> -	help
> -	  Concurrent Versions System - source code revision control
> -	  tools.
> -
> -	  http://www.nongnu.org/cvs/
> -
> -if BR2_PACKAGE_CVS
> -
> -config BR2_PACKAGE_CVS_SERVER
> -	bool "server support"
> -	help
> -	  Enable cvs server code
> -
> -endif
> -
> -comment "cvs needs a toolchain w/ wchar"
> -	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR
> diff --git a/package/cvs/cvs.hash b/package/cvs/cvs.hash
> deleted file mode 100644
> index 7b03a552d0..0000000000
> --- a/package/cvs/cvs.hash
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cvs/cvs_1.12.13-12%2Bsqueeze1.dsc
> -sha256  b5961c2476b996e5758fa5e22b60af085adca41164cac0d8f68a1d3b49d4e4f1  cvs_1.12.13.orig.tar.gz
> -sha256  d52a9232d9cf36302a150d782fc7e5b6f92f8115505ae8a7dc6acfc83e809d2f  cvs_1.12.13-12+squeeze1.diff.gz
> -
> -# Hash for license files, locally computed
> -sha256  569c5b876327d899cf444b2277fe910128a38ca71d90755fe4125dd44f8ece02  COPYING
> -sha256  da0e282103fb508894e78db519aab255e36971ce0bc87de585e3b05014b83b1e  COPYING.LIB
> -sha256  ee9a2fbdb626c0ac57fd8e569f357eb2e6d6c80cc6f41efa8bd126d5ea589d72  lib/glob-libc.h
> diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
> deleted file mode 100644
> index cf9127fc3a..0000000000
> --- a/package/cvs/cvs.mk
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -################################################################################
> -#
> -# cvs
> -#
> -################################################################################
> -
> -CVS_VERSION = 1.12.13
> -CVS_SOURCE = cvs_$(CVS_VERSION).orig.tar.gz
> -CVS_PATCH = cvs_$(CVS_VERSION)-12+squeeze1.diff.gz
> -CVS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cvs
> -CVS_LICENSE = GPL-1.0+, LGPL-2.0+, LGPL-2.1+ (glob)
> -CVS_LICENSE_FILES = COPYING COPYING.LIB lib/glob-libc.h
> -CVS_CPE_ID_VENDOR = gnu
> -CVS_SELINUX_MODULES = apache cvs
> -CVS_DEPENDENCIES = ncurses
> -
> -CVS_CONF_ENV = \
> -	ac_cv_func_working_mktime=yes \
> -	cvs_cv_func_printf_ptr=yes
> -
> -CVS_CONF_OPTS = \
> -	--disable-old-info-format-support \
> -	--with-editor=/bin/vi
> -ifeq ($(BR2_PACKAGE_CVS_SERVER),y)
> -CVS_CONF_OPTS += --enable-server
> -else
> -CVS_CONF_OPTS += --disable-server
> -endif
> -ifeq ($(BR2_PACKAGE_ZLIB),y)
> -CVS_CONF_OPTS += --with-external-zlib
> -endif
> -
> -define CVS_BZIP_UNPACK
> -	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | $(TAR) -C $(BUILD_DIR) $(TAR_OPTIONS) -
> -	rm -f $(@D)/cvs-$(CVS_VERSION).tar.bz2
> -endef
> -
> -CVS_POST_PATCH_HOOKS += CVS_BZIP_UNPACK
> -
> -ifneq ($(CVS_PATCH),)
> -define CVS_DEBIAN_PATCHES
> -	if [ -d $(@D)/debian/patches ]; then \
> -		(cd $(@D)/debian/patches && for i in *; \
> -		 do $(SED) 's,^\+\+\+ .*cvs-$(CVS_VERSION)/,+++ cvs-$(CVS_VERSION)/,' $$i; \
> -		 done; \
> -		); \
> -		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*; \
> -	fi
> -endef
> -endif
> -
> -CVS_POST_PATCH_HOOKS += CVS_DEBIAN_PATCHES
> -
> -define CVS_INSTALL_TARGET_CMDS
> -	$(INSTALL) -D $(@D)/src/cvs $(TARGET_DIR)/usr/bin/cvs
> -endef
> -
> -$(eval $(autotools-package))
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
