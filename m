Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D0BC52D7D
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 08:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D775606A6;
	Sat, 17 Aug 2024 08:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMRM_PZEG1S9; Sat, 17 Aug 2024 08:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B0D560671
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B0D560671;
	Sat, 17 Aug 2024 08:29:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8954F1BF82C
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 08:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75FB140131
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 08:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zv969-d4vmxt for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 08:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 57D29400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57D29400C8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57D29400C8
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 08:29:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA021FF802;
 Sat, 17 Aug 2024 08:29:24 +0000 (UTC)
Date: Sat, 17 Aug 2024 10:29:23 +0200
To: Vincent Jardin <vjardin@free.fr>
Message-ID: <20240817102923.18f56e24@windsurf>
In-Reply-To: <20240815212658.48933-1-vjardin@free.fr>
References: <20240815212658.48933-1-vjardin@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723883365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6H9tvYPY/DIyKHGL+QKQuBZfwJHLlvZVzdGHmpvlVk=;
 b=GPHqjC0mIcHqYDWalUtBrQkJ2aH0C1jWiYM125+crm59bm8poIRwitN4oW7iv4HwFjEEix
 3TQcwszH1YIYs18kWstzbVUz7rWmtjIm5P1ChCYMlstMRXht5JayhZhQ8IqMCiMxLINmVJ
 FOTljCMEJMpjDaV3XktpVZhKYWzSft87sKB8qm9QDYXwhOOTBSgRdVU0l5hw19b6srPdwd
 dwGXw71TGxsGxvLQo3qlQnFTbgs3cV3NXVWN4T0uzLHm4h6fJwH8Qy85DAsZiqLiWMdYu/
 HSPa/b56CM9QpuZ3YfsjITKlOe/7WTMurrAObCPXWqnLE0WUC0r2Mq8fCqR5AQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GPHqjC0m
Subject: Re: [Buildroot] [PATCH 1/1] package/dpdk: add 24.03
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Vincent,

Thanks for your patch, nice to see a Buildroot patch from you! See some
comments below.

On Thu, 15 Aug 2024 23:26:58 +0200
Vincent Jardin <vjardin@free.fr> wrote:

> Importantly, this commit does not enforce the use of UIO or VFIO
> kernel frameworks, as DPDK's architecture supports userland memory
> mappings that do not require these technologies. By maintaining this
> flexibility, DPDK can operate with a broader range of hardware and
> software configurations, making it suitable for diverse Buildroot's
> deployment scenarios.

Do you intend to follow-up with additional patches supporting the other
use-cases?

> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  package/Config.in      |  1 +
>  package/dpdk/Config.in | 14 ++++++++++++++
>  package/dpdk/dpdk.hash |  1 +
>  package/dpdk/dpdk.mk   | 39 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 55 insertions(+)

For all new packages, we require an entry in the DEVELOPERS file to be
added.

> diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
> new file mode 100644
> index 0000000000..56dcb42a33
> --- /dev/null
> +++ b/package/dpdk/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_DPDK
> +	bool "dpdk"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glibc or uClibc toolchain required

The comment does not make sense: the only library that can be compiled
without thread support is uClibc. glibc and musl both always have
thread support.

> +	select BR2_PACKAGE_HOST_PYTHON_PYELFTOOLS

Not needed, we typically don't select host packages.

> +	select BR2_PACKAGE_LIBBSD

When you "select" an option, you need to replicate its "depends on", so
in this case, you need to add:

        depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
        depends on !BR2_STATIC_LIBS # libbsd
        depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
        depends on BR2_USE_WCHAR # libbsd

> +	select BR2_PACKAGE_LIBEXECINFO

Selecting libexecinfo only makes sense for non glibc toolchains, so
this should be:

	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC

also, you need to "depends on BR2_USE_WCHAR", or rather because you
already have it due to libbsd, you need to do:

	depends on BR2_USE_WCHAR # libbsd, libexecinfo

> +	select BR2_PACKAGE_JANSSON
> +	select BR2_PACKAGE_LIBPCAP
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  DPDK (Data Plane Development Kit) is a set of libraries
> +	  and drivers for fast packet processing.
> +
> +	  http://dpdk.org/

You need to add a Config.in comment about the dependencies:

comment "dpdk needs a toolchain w/ dynamic library, threads, wchar"
	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR

> diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
> new file mode 100644
> index 0000000000..fd8ab5a6aa
> --- /dev/null
> +++ b/package/dpdk/dpdk.hash
> @@ -0,0 +1 @@

Please indicate where the hash comes from, in a comment. Calculated
locally? Verified with some upstream provided hash? Crypto signature?
See other .hash files for example.

> +sha256  33ed973b3945af4f5923096ddca250b401dc80be3b5c6393b4e4fe43a1a6c2ad  dpdk-24.03.tar.xz

Also, please add the hashes of the license files.

> diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
> new file mode 100644
> index 0000000000..56adcf1d00
> --- /dev/null
> +++ b/package/dpdk/dpdk.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# DPDK

lower case

> +#
> +################################################################################
> +
> +# DPDK_VERSION = main
> +# DPDK_SITE = https://dpdk.org/git/dpdk
> +# DPDK_SITE_METHOD = git

Please drop those 3 lines.

> +DPDK_VERSION ?= 24.03

Please turn ?= into just =.

> +DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
> +DPDK_SITE = http://fast.dpdk.org/rel
> +DPDK_LICENSE = BSD-3-Clause
> +DPDK_LICENSE_FILES = license/bsd-3-clause.txt license/README license/bsd-2-clause.txt license/exceptions.txt license/gpl-2.0.txt license/isc.txt license/lgpl-2.1.txt license/mit.txt

How can the license be just BSD-3-Clause when there are license files
for BSD-2-Clause, GPL-2.0, ISC, LGPL-2.1, MIT, and some exceptions?

Also, since the LICENSE_FILES variable is long, please format it as
such:

DPDK_LICENSE_FILES = \
	license/bsd-3-clause.txt \
	... \
	... \

> +DPDK_DEPENDENCIES += host-pkgconf
> +DPDK_DEPENDENCIES += host-python-pyelftools
> +DPDK_DEPENDENCIES += libbsd
> +DPDK_DEPENDENCIES += libexecinfo
> +DPDK_DEPENDENCIES += jansson
> +DPDK_DEPENDENCIES += libpcap
> +DPDK_DEPENDENCIES += zlib

Just one assignment, and use = instead of += since these are
unconditional:

DPDK_DEPENDENCIES = \
	host-pkgconf \
	host-python-pyelftools \
	libbsd \
	...

Please add libexecinfo in the dependencies only if
BR2_TOOLCHAIN_USES_GLIBC is false:

ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
DPDK_DEPENDENCIES += libexecinfo
endif

> +#not yet DPDK_DEPENDENCIES += openssl
> +#not yet DPDK_DEPENDENCIES += libbpf

Please drop commented code.

> +
> +DPDK_MARCH = $(BR2_ARCH)

Are you sure all values of $(BR2_ARCH) are supported as
-Dcpu_instruction_set values? What is -Dcpu_instruction_set actually
doing?

> +DPDK_MTUNE = $(BR2_ARCH) # not used yet

Please drop if it's not used.

> +GCC_TARGET_CPU=$(BR2_GCC_TARGET_ARCH)

Please drop, GCC_TARGET_CPU does not belong to this package.

> +# see meson_options.txt from DPDK

Comment not needed.

> +#
> +DPDK_CONF_OPTS += -Ddeveloper_mode=enabled

What does it do? Are we sure we want it enabled unconditionally?

> +DPDK_CONF_OPTS += -Dcpu_instruction_set=$(DPDK_MARCH)
> +
> +# platform can be: native, all, cn9k, cn10k
> +DPDK_CONF_OPTS += -Dplatform=generic

Well, the comment says that platform can be "native", "all", "cn9k",
"cn10k"... and you're setting it to "generic". Doesn't really make
sense.

Also, isn't libpcap only needed for the "generic" platform? Can one
select only one platform, or a list of platforms?

If one can only select one platform, then maybe we need to have a
choice..endchoice in Config.in:

choice
	prompt "Platform"
	default BR2_PACKAGE_DPDK_PLATFORM_GENERIC

config BR2_PACKAGE_DPDK_PLATFORM_GENERIC
	bool "generic"
	select BR2_PACKAGE_LIBPCAP

endchoice

which of course can be extended later with additional platforms.

Could you rework your patch according to those suggestions? Thanks a
lot!

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
