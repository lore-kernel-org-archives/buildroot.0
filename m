Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3F9C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 15:48:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63CB360E73
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 15:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63CB360E73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17DDA40150;
	Wed,  3 Nov 2021 15:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eG99DtqFHuE6; Wed,  3 Nov 2021 15:48:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24F5B40142;
	Wed,  3 Nov 2021 15:48:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96E521BF2A5
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 15:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 853B540142
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 15:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZKk2ocfio6pq for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 15:47:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24A8640003
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 15:47:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 2367460006;
 Wed,  3 Nov 2021 15:47:57 +0000 (UTC)
Date: Wed, 3 Nov 2021 16:47:56 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20211103164756.5ebdc1ec@windsurf>
In-Reply-To: <20211103073656.1689919-4-herve.codina@bootlin.com>
References: <20211103073656.1689919-1-herve.codina@bootlin.com>
 <20211103073656.1689919-4-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5] package/libfutils: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed,  3 Nov 2021 08:36:54 +0100
Herve Codina <herve.codina@bootlin.com> wrote:
"
> diff --git a/package/libfutils/Config.in b/package/libfutils/Config.in
> new file mode 100644
> index 0000000000..0329dd065c
> --- /dev/null
> +++ b/package/libfutils/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_LIBFUTILS
> +	bool "libfutils"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> +	depends on BR2_INSTALL_LIBSTDCPP # ulog
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # ulog
> +	select BR2_PACKAGE_ULOG
> +	help
> +	  This library contains some common useful functions (list,
> +	  hash, time)
> +
> +	  https://github.com/Parrot-Developers/libfutils
> +
> +comment "libfutils needs a toolchain w/ C++, threads"

You need:

	depends on BR2_TOOLCHAIN_HAS_ATOMIC

> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libfutils/libfutils.hash b/package/libfutils/libfutils.hash
> new file mode 100644
> index 0000000000..1fdcd84b13
> --- /dev/null
> +++ b/package/libfutils/libfutils.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256  b38d40c46b83e448d8c1716ddfb04b7ecd384f5cd2cb773db5c26c0589accdb3  libfutils-c326ce0cc2a7354381265a7664bb215be587fac6.tar.gz
> +sha256  eca11a1c62fae8d64a1247d93271375baecff8396141d7ff8d89671ee7e3ed0d  COPYING
> diff --git a/package/libfutils/libfutils.mk b/package/libfutils/libfutils.mk
> new file mode 100644
> index 0000000000..2048247db6
> --- /dev/null
> +++ b/package/libfutils/libfutils.mk
> @@ -0,0 +1,50 @@
> +################################################################################
> +#
> +# libfutils
> +#
> +################################################################################
> +
> +LIBFUTILS_VERSION = c326ce0cc2a7354381265a7664bb215be587fac6
> +LIBFUTILS_SITE = $(call github,Parrot-Developers,libfutils,$(LIBFUTILS_VERSION))
> +LIBFUTILS_LICENSE = BSD-3-Clause
> +LIBFUTILS_LICENSE_FILES = COPYING
> +LIBFUTILS_DEPENDENCIES = ulog host-alchemy
> +LIBFUTILS_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +LIBFUTILS_CONF_ENV += TARGET_GLOBAL_LDLIBS='-latomic'
> +endif
> +
> +define LIBFUTILS_BUILD_CMDS
> +	$(ALCHEMY_TARGET_CONFIGURE_ENV) \
> +	$(call ALCHEMY_TARGET_CONFIGURE_SDKS, ulog) \
> +	$(LIBFUTILS_CONF_ENV) \
> +	$(ALCHEMY_MAKE) libfutils

Indentation of continuation lines.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
