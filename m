Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EF2C4338F
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 21:25:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6233860EFF
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 21:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6233860EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E14482EDB;
	Thu, 29 Jul 2021 21:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BVZd4BFMmHsu; Thu, 29 Jul 2021 21:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7688F829A9;
	Thu, 29 Jul 2021 21:25:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EE5F1BF3E3
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 21:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BDE2829A9
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 21:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EOZuyijxxPpY for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 21:25:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFAE882862
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 21:25:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E0A18240002;
 Thu, 29 Jul 2021 21:25:24 +0000 (UTC)
Date: Thu, 29 Jul 2021 23:25:23 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Matt Weber <matthew.weber@rockwellcollins.com>
Message-ID: <20210729232523.01ee6848@windsurf>
In-Reply-To: <20210412164011.16681-1-matthew.weber@rockwellcollins.com>
References: <20210412164011.16681-1-matthew.weber@rockwellcollins.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v7 1/2] package/libtalloc: new package
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Matt,

On Mon, 12 Apr 2021 11:40:10 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> From: David GOUARIN <dgouarin@gmail.com>
> 
> talloc is a hierarchical, reference counted memory pool system with destructors.
> It is the core memory allocator used in Samba.
> 
> Signed-off-by: David GOUARIN <dgouarin@gmail.com>
> Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

I have finally applied this patch, with those changes. See below.

> diff --git a/package/libtalloc/Config.in b/package/libtalloc/Config.in
> new file mode 100644
> index 0000000000..bb671128fb
> --- /dev/null
> +++ b/package/libtalloc/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LIBTALLOC
> +	bool "libtalloc"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_STATIC_LIBS

Forgot Config.in comment. In fact, I forgot it myself as well, and
added it as a follow-up commit.

> diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
> new file mode 100644
> index 0000000000..598a8d8114
> --- /dev/null
> +++ b/package/libtalloc/libtalloc.mk
> @@ -0,0 +1,54 @@
> +################################################################################
> +#
> +# libtalloc
> +#
> +################################################################################
> +
> +LIBTALLOC_VERSION = 2.3.1
> +LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
> +LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
> +LIBTALLOC_LICENSE = GPL-3.0+

According to OpenEmbedded, the license really is LGPL-3.0+, GPL-3.0+.
There are some parts under GPL, some under LGPL, but it's clear what is
under which license.

Also, what bothers me a bit is how can freeradius be under the GPL-2.0
is it links against libtalloc that has bits under GPL-3.0+ ? Shouldn't
freeradius then automatically be under GPL-3.0+ as well ?

> +LIBTALLOC_LICENSE_FILES = talloc.h pytalloc.h
> +LIBTALLOC_INSTALL_STAGING = YES
> +
> +LIBTALLOC_CONF_OPTS += --cross-compile \
> +		--cross-answers=$(@D)/cache.txt \
> +		--hostcc=gcc \
> +		--with-libiconv=$(STAGING_DIR)/usr # (see below)
> +
> +# --with-libiconv=
> +# waf will search for libiconv by default in /usr/local. Because of a bug in some waf
> +# python script, /usr/local is then used in many subsequent and unrelated checks, which
> +# ultimately causes a failure when BR2_COMPILER_PARANOID_UNSAFE_PATH is set.
> +# However no need to set libiconv as a dependency of libtalloc since it's optional.

I've moved the comment above the CONF_OPTS definition, we usually have
comments before the code, not after.

> +
> +ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
> +LIBTALLOC_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
> +LIBTALLOC_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
> +LIBTALLOC_DEPENDENCIES += libtirpc host-pkgconf
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +LIBTALLOC_PYTHON = \
> +	PYTHON="$(HOST_DIR)/bin/python3" \
> +	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
> +LIBTALLOC_DEPENDENCIES += host-python3 python3
> +LIBTALLOC_CONF_ENV += \
> +	$(LIBTALLOC_PYTHON)

This LIBTALLOC_PYTHON variable was not really needed, you could just
add PYTHON and PYTHON_CONFIG directly in LIBTALLOC_CONF_ENV.

Applied with those changes!

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
