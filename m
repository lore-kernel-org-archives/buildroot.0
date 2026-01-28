Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6891D3F09D
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B163B40ADC;
	Wed, 28 Jan 2026 17:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOdH8lw03bMp; Wed, 28 Jan 2026 17:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5620640A3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769621070;
	bh=wzl8lQcAU3v6y9Dkwkzp3JDkV1XTnObZi/wn9x2+Dk4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IvZZWxJKqiDjzb1rJzy3MfX7VASjW3Ttz2JUkQrZ+Tp8n+ItOnK1oLcrHu/z7i1rH
	 3BYwevhNkjJiBkta5N29//A9EpexlxfUC4uc9x4Tg4xasKtKbQWc0HtpeZ4j8dcV+5
	 fjO+L/3YOSya2mgSg+dBRD997UxL8k+aFSkRPVODr6AKGAZq4ybg1B6e0MNiC11BjM
	 XOwI/gYH6VBDFavFfSalKmZ74Q4PMa1pUe9ZIhdQK8Ie1L0AvsCs5oeaJMfuI81Y2l
	 JzZPq4CmA2rXHG6fyfnIYNILbj25Oe0SvcHs2BlOBUnHURqstCzG8YRe+yt+CRIfxi
	 wMudt0SXoPKtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5620640A3B;
	Wed, 28 Jan 2026 17:24:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69AD5118
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AC6380C42
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWiVJI3YNh0C for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:24:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0ABAB80C33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ABAB80C33
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0ABAB80C33
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 04264B97AC12; Wed, 28 Jan 2026 18:24:21 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 28 Jan 2026 18:24:21 +0100
Message-ID: <20260128172421.342858-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106200115.1985522-7-bernd@kuhls.net>
References: <20260106200115.1985522-7-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1769621062; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=3Qg/Y2wBTOAn9VXUpfSy5XTUgP/wuBEVSMHVYpt/3Pk=;
 b=TdDGiPJu2Yrfurgjx4SpDp9MXcdpCktU0NXJfzVuwqaZHqDQZKjx4mPLrpC/sQx56pZFrU
 55UcRw1gXvJtyw22BsYU/fZG6zCpscoJDYxCg2J1qbNogadJ8Jry2eS6iMDmycKBKsQP+3
 pkFpS2cBDMjFd5iJzqv/CqRNJsoFH/hs2pZvtwelmgejG8th2GcuWrT6GO3zYTs44w4/NT
 nPG4weUYwbDYMsSO+tS9VFr8bbFbM678n3qu0NTrVnwPTTy3G+PD8H040gy4EtAJjS9RdO
 +RdYAmwD69YaF6DHcUmF2Dc5IeIKrNIadNf7Kl0DqMpRsAhJFrrH8/aCcYpJKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=TdDGiPJu
Subject: Re: [Buildroot] [PATCH v2 6/9] package/dbus-triggerd: remove package
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
> Analysis of https://rg42.org/gitweb/?p=dbustriggerd.git:
> last commit: 2014
> 
> Musl libc 1.2.5 removed the definition of the basename() function from
> string.h and only provides it in libgen.h as the POSIX standard
> defines it.
> 
> Instead of fixing an unmaintainted package we remove it from buildroot,
> no other package depends on it.
> 
> Fixes:
> https://autobuild.buildroot.net/results/811/81170fe89e1f5b70c63657684de43175e621f762/
> 
> dbus-triggerd.c:150:27: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
>   150 |     argv[argc++] = strdup(basename(handler_cmd));
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  Config.in.legacy                         |  7 +++++++
>  package/Config.in                        |  1 -
>  package/dbus-triggerd/Config.in          | 15 ---------------
>  package/dbus-triggerd/dbus-triggerd.hash |  3 ---
>  package/dbus-triggerd/dbus-triggerd.mk   | 21 ---------------------
>  5 files changed, 7 insertions(+), 40 deletions(-)
>  delete mode 100644 package/dbus-triggerd/Config.in
>  delete mode 100644 package/dbus-triggerd/dbus-triggerd.hash
>  delete mode 100644 package/dbus-triggerd/dbus-triggerd.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 28919e8594..e97fd0ebb2 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2026.02"
>  
> +config BR2_PACKAGE_DBUS_TRIGGERD
> +	bool "dbus-triggerd removed"
> +	select BR2_LEGACY
> +	help
> +	  dbus-triggerd was no longer maintained upstream, so it has
> +	  been dropped.
> +
>  config BR2_PACKAGE_CVS
>  	bool "cvs has been removed"
>  	select BR2_LEGACY
> diff --git a/package/Config.in b/package/Config.in
> index bbbc04226f..52ca6d19d3 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -485,7 +485,6 @@ endmenu
>  	source "package/dbus-cxx/Config.in"
>  	source "package/dbus-glib/Config.in"
>  	source "package/dbus-python/Config.in"
> -	source "package/dbus-triggerd/Config.in"
>  	source "package/dfu-programmer/Config.in"
>  	source "package/dfu-util/Config.in"
>  	source "package/dmidecode/Config.in"
> diff --git a/package/dbus-triggerd/Config.in b/package/dbus-triggerd/Config.in
> deleted file mode 100644
> index 331c414704..0000000000
> --- a/package/dbus-triggerd/Config.in
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -config BR2_PACKAGE_DBUS_TRIGGERD
> -	bool "dbus-triggerd"
> -	depends on BR2_USE_MMU # fork(), dbus
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
> -	depends on BR2_PACKAGE_DBUS
> -	help
> -	  dbus-triggerd is a tool to trigger shell-commands upon
> -	  receiving a given dbus-signal.
> -
> -	  http://gareus.org/oss/dbustriggerd/start
> -
> -comment "dbus-triggerd needs a toolchain w/ threads"
> -	depends on BR2_USE_MMU
> -	depends on BR2_PACKAGE_DBUS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/dbus-triggerd/dbus-triggerd.hash b/package/dbus-triggerd/dbus-triggerd.hash
> deleted file mode 100644
> index c5127133fb..0000000000
> --- a/package/dbus-triggerd/dbus-triggerd.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally computed
> -sha256  73dbd92e89eee223928b5cbf414affb5913f70c1ca7e3f8ab733a4696436dae3  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09-git4.tar.gz
> -sha256  30d135650639af9019633690fc1aecbfc150aeeef9446347d4286a58338d10b0  dbus-triggerd.c
> diff --git a/package/dbus-triggerd/dbus-triggerd.mk b/package/dbus-triggerd/dbus-triggerd.mk
> deleted file mode 100644
> index 7d73a6c98f..0000000000
> --- a/package/dbus-triggerd/dbus-triggerd.mk
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -################################################################################
> -#
> -# dbus-triggerd
> -#
> -################################################################################
> -
> -DBUS_TRIGGERD_VERSION = ba3dbec805cb707c94c54de21666bf18b79bcc09
> -DBUS_TRIGGERD_SITE = git://rg42.org/dbustriggerd.git
> -DBUS_TRIGGERD_LICENSE = GPL-2.0+
> -DBUS_TRIGGERD_LICENSE_FILES = dbus-triggerd.c
> -DBUS_TRIGGERD_DEPENDENCIES = host-pkgconf dbus
> -
> -define DBUS_TRIGGERD_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
> -endef
> -
> -define DBUS_TRIGGERD_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
> -endef
> -
> -$(eval $(generic-package))
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
