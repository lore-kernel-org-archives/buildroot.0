Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE213CF9C71
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 19:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46FD840C93;
	Mon, 23 Sep 2024 19:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsvRZ50E8ZDP; Mon, 23 Sep 2024 19:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7573040CD3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7573040CD3;
	Mon, 23 Sep 2024 19:10:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 687531BF3C3
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6294240CD3
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jWAIq0eVRYRE for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 19:10:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4BB7240C93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BB7240C93
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BB7240C93
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 19:10:52 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42cafda818aso46018415e9.2
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 12:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727118650; x=1727723450;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8tTqlf2ZcTJRVJux6EyRrbTfo+6WhA+uVaEf5BkJH+w=;
 b=LDCPqEXiGSyJvi+jV7hR4hGzW8QFmHLaBXHTx0tzUDySHGiASjVSngr6+VVQIhtNQ0
 Fpy8dbLExddKT931QbtwajsM4a6d2WfJ4yh1v2rS9HJNhdersxJLP0jpN3FgOmNXMgYV
 fo1HuWUJBKFzr8/7SFKHPoaenIqh1rZhGbPy/EM3kezmFPdlbHnJPYBvbsjHjC0qM828
 1jR10MfAX04UqSS6h6paKJQToqt7kTpM6dSUD4EcYfbYRWfHwPuNUGJmCmc+ZgCyJMJ4
 9/rK5RG/NxZxC3U24Ql2/XJ1dcTuAZaUY5CA8O54btWoZiQsfxtU/PlWcYbMqRowxqCk
 xANQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT6FqWD5NqBskYQmaWh7PJtTaGSpcoID0WM9FQ4AdhoUHg5NI1mWFnBvY2+eDz1syPkFBalTyySZY=@buildroot.org
X-Gm-Message-State: AOJu0YxLGIzaV95j+dPKWPBtfABUmbVsW5GxEfvLVbT9mkJPr3Ppbrxd
 fInCRzw2xOl3pk43yP5gHikpdyC1a/X29jEsGGfQ2IlH/fCSr4DW0TlkVPaEbIY=
X-Google-Smtp-Source: AGHT+IGPS5TPjzK4O+jnMCMi8wVD+/wMUxKF9ktpz6lonISd5qZTCd57Tj9VhbTxasBA1LnExZ2nPA==
X-Received: by 2002:a5d:6347:0:b0:374:c911:7749 with SMTP id
 ffacd0b85a97d-37a43197c13mr6437572f8f.49.1727118650265; 
 Mon, 23 Sep 2024 12:10:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e73e8364sm25086778f8f.43.2024.09.23.12.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 12:10:49 -0700 (PDT)
Message-ID: <4e1a9b3a-5e0f-4dd4-a6b4-da4a1459648d@mind.be>
Date: Mon, 23 Sep 2024 21:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Jardin <vjardin@free.fr>, buildroot@buildroot.org
References: <ZudgGuhHgwI1VLio@landeda> <20240923172005.39928-1-vjardin@free.fr>
 <20240923172005.39928-2-vjardin@free.fr>
Content-Language: en-GB
In-Reply-To: <20240923172005.39928-2-vjardin@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1727118650; x=1727723450; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8tTqlf2ZcTJRVJux6EyRrbTfo+6WhA+uVaEf5BkJH+w=;
 b=WOXG5Snq1KwwKl7to3t4qFTak97XbYTPm8Z9ANSS8L7bjFSsXdyfeoih/X8egWZgFW
 maWW5i7xfT1whUD4jtjZqlKWKNLpErxZUsoKuqbzAvxqogdX/wlbVOXUNFbAH/XTIXCe
 a8X3L0At/Mos9ZKUP+P8yPcvbXEMwCEp8+UG1rOiv/uvqQXVY9NkHOgUwcKdviNWWYih
 if1+lCf1BaO45ZCvhdEz/1O6QP/Epe/T3EGNJ8uaK4LX15Ka8lunX4klymnaqdpC1FFv
 gR8ZbAbt8aFzHhK2WYhERIhDiqO6n3YEjRtFDxMJ7TVKBbZLQkksZzcdVIAgzMuKxQk6
 rA9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WOXG5Snq
Subject: Re: [Buildroot] [PATCH v7 1/1] package/dpdk: add 24.07
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Julien Olivain <ju.o@free.fr>, Yann Morin <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Vincent,

On 23/09/2024 19:20, Vincent Jardin wrote:
> This commit adds the integration of the Data Plane Development Kit (DPDK).

[snip]
> diff --git a/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch b/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
> new file mode 100644
> index 0000000000..c1bfb86448
> --- /dev/null
> +++ b/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
> @@ -0,0 +1,35 @@
> +From 121e5d019f0bb6dec0ace2b361611edd10fc8ff8 Mon Sep 17 00:00:00 2001
> +From: Lee Chee Yang <chee.yang.lee@intel.com>
> +Date: Wed, 6 Dec 2023 16:58:10 +0800
> +Subject: [PATCH] config/meson: get cpu_instruction_set from meson option
> +
> +Workaround error:
> +| ../git/config/meson.build:178:8: ERROR: Problem encountered: Compiler
> +does not support "x86_64" arch flag.
> +
> +Upstream-Status: Inappropriate [ yocto specific to set cpu_instruction_set ]
> +
> +Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> +Links: https://git.yoctoproject.org/meta-dpdk/plain/recipes-extended/dpdk/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
> +Upstream: Not applicable, see Yocto's status, above
> +Signed-off-by: Vincent Jardin <vjardin@free.fr>
> +---
> + config/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/config/meson.build b/config/meson.build
> +index a9ccd56deb..f310c7adf6 100644
> +--- a/config/meson.build
> ++++ b/config/meson.build
> +@@ -105,7 +105,7 @@ platform = get_option('platform')
> +
> + # set the cpu_instruction_set and cflags for it
> + if meson.is_cross_build()

  Is this patch actually needed? I thought that the fact that we supply a 
cross_compilation.conf file was enough to tell meson that we're cross-compiling.

> +-    cpu_instruction_set = host_machine.cpu()

  Oh, hang on, isn't this an upstream bug? If we're cross-compiling we shouldn't 
be using host_machine, right?

  Regards,
  Arnout

[snip]
> diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
> new file mode 100644
> index 0000000000..ebb875216b
> --- /dev/null
> +++ b/package/dpdk/Config.in
> @@ -0,0 +1,55 @@
> +config BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> +	bool
> +	# DPDK can be used for the following little endian architecture
> +	default y if BR2_aarch64
> +	# DPDK requires SSE4.2 for x86_64 since v17.08
> +	default y if BR2_x86_64 && BR2_X86_CPU_HAS_SSE42
> +
> +config BR2_PACKAGE_DPDK
> +	bool "dpdk"
> +	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # DPDK design
> +	depends on BR2_USE_MMU # pthread() memory mappings
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC

  Just above it depends on glibc, so this select seems redundant?

> +	select BR2_PACKAGE_HOST_PYTHON3 # Ensure a Python3 installation on the host

  Comment is redundant. It would be useful to say # host-python-pyelftools


> +	help
> +	  DPDK (Data Plane Development Kit) is a set of libraries
> +	  and drivers for fast packet processing.
> +
> +	  http://dpdk.org/
> +
> +	  Optional but recommended kernel configurations:
> +	    - CONFIG_VFIO_IOMMU_TYPE1
> +	    - CONFIG_VFIO_VIRQFD
> +	    - CONFIG_VFIO
> +	    - CONFIG_VFIO_NOIOMMU
> +	    - CONFIG_VFIO_PCI
> +	    - CONFIG_VFIO_PCI_MMAP
> +	    - CONFIG_HUGETLBFS
> +	    - CONFIG_HUGETLB_PAGE
> +	    - CONFIG_PROC_PAGE_MONITOR
> +
> +	  For x86 only, the following can also be useful:
> +	    - CONFIG_HPET
> +	    - CONFIG_HPET_MMAP
> +
> +if BR2_PACKAGE_DPDK
> +
> +config BR2_PACKAGE_DPDK_EXAMPLES
> +	bool "Install examples"
> +
> +config BR2_PACKAGE_DPDK_TESTS
> +	bool "Install tests"
> +
> +endif
> +
> +comment "DPDK needs a toolchain w/ dynamic library, threads, wchar, kernel headers >= 4.19"
> +	depends on BR2_USE_MMU # pthread() memory mappings
> +	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_USES_GLIBC || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
> diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
> new file mode 100644
> index 0000000000..4e98d9dc25
> --- /dev/null
> +++ b/package/dpdk/dpdk.hash
> @@ -0,0 +1,10 @@
> +# Locally computed
> +sha256  9944f7e5f268e7ac9b4193e2cd54ef6d98f6e1d7dddc967c77ae4f6616d6fbbd  dpdk-24.07.tar.xz
> +sha256  1531b66affc3bae796d755e12850795e56e25ccedd685bf7d2644d8ddfadbad8  license/bsd-2-clause.txt
> +sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  license/bsd-3-clause.txt
> +sha256  e19808bccd90c238fac06da2fc3683e094c64f7ba647e9d86f03a98cf5f2ce05  license/exceptions.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  license/gpl-2.0.txt
> +sha256  be8f198f2e1c9b30226e293255bbe6933ee6607a580ee5874185aa023bcc3c39  license/isc.txt
> +sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  license/lgpl-2.1.txt
> +sha256  6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  license/mit.txt
> +sha256  cae178052c96959741acb7f00634a09a8294e6cafb5ad53e158d63e3510875ab  license/README
> diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
> new file mode 100644
> index 0000000000..bfc49e3ce7
> --- /dev/null
> +++ b/package/dpdk/dpdk.mk
> @@ -0,0 +1,99 @@
> +################################################################################
> +#
> +# dpdk
> +#
> +################################################################################
> +
> +DPDK_VERSION = 24.07
> +DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
> +DPDK_SITE = https://fast.dpdk.org/rel
> +DPDK_LICENSE = \
> +	BSD-2-Clause, \
> +	BSD-3-Clause, \
> +	BSD=-3-Clause OR GPL-2.0, \
> +	BSD=-3-Clause OR LGPL-2.1, \
> +	ISC, \
> +	MIT

  According to the commit message, the BSD-2-Clause, ISC, and MIT licenses are 
only in code that is not actually used. Up to now, we've always dropped such 
licenses in Buildroot's _LICENSE tag (and also from the hash file).

> +
> +# Only the Windows target has the 2 following licenses:
> +# - license/bsd-2-clause.txt
> +# - license/isc.txt
> +# which is related to a Windows getopt.[ch] compatibility layer.
> +# Since Buildroot is not used for Windows target, it is not listed
> +# here.
> +#
> +# All the userland files of DPDK have dual licences BSD or GPL/LGPL
> +# Since the Linux kernel modules had been removed from the DPDK, there
> +# is no GPL only code into the DPDK anymore.
> +# The usage of DPDK with Buildroot is for userland only, it means
> +# that for the dual licenced files, BSD clause is used but not the
> +# following ones:

  That is not true (unless there's a specific text that says that GPL only 
applies to the kernel module build). It's normally up to the consumer to decide 
if they choose the BSD or GPL license. If this is not the case, the OR specifier 
in _LICENSE is incorrect.

> +# - license/gpl-2.0.txt
> +# - license/lgpl-2.1.txt
> +# See the DPDK's license/README for more details.
> +#
> +# The legacy and historical license of the DPDK is BSD-3-clause.
> +DPDK_LICENSE_FILES = \
> +	license/README \
> +	license/bsd-3-clause.txt \
> +	license/exceptions.txt \
> +	license/mit.txt

  The hash file contains additional license files - please only contain in the 
hash file what we also have in _LICENSE_FILES.

  And since we have BSD=-3-Clause OR GPL-2.0, we should have the GPL license 
file as well.


  Regards,
  Arnout


> +
> +DPDK_DEPENDENCIES = \
> +	host-pkgconf \
> +	host-python-pyelftools
> +
> +ifeq ($(BR2_PACKAGE_DPDK_EXAMPLES),y)
> +DPDK_CONF_OPTS += -Dexamples=all
> +else
> +DPDK_CONF_OPTS += -Dexamples=
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
> +DPDK_CONF_OPTS += -Dtests=true
> +else
> +DPDK_CONF_OPTS += -Dtests=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBBSD),y)
> +DPDK_DEPENDENCIES += libbsd
> +endif
> +
> +ifeq ($(BR2_PACKAGE_JANSSON),y)
> +DPDK_DEPENDENCIES += jansson
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBPCAP),y)
> +DPDK_DEPENDENCIES += libpcap
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +DPDK_DEPENDENCIES += zlib
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +DPDK_DEPENDENCIES += libexecinfo
> +endif
> +
> +ifeq ($(BR2_PACKAGE_NUMACTL),y)
> +DPDK_DEPENDENCIES += numactl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
> +DPDK_DEPENDENCIES += libarchive
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBBPF),y)
> +DPDK_DEPENDENCIES += libbpf
> +endif
> +
> +ifeq ($(BR2_PACKAGE_RDMA_CORE),y)
> +DPDK_DEPENDENCIES += rdma-core
> +endif
> +
> +# DPDK's meson shall need to be clean'd, hack here along the enclosed patch
> +DPDK_CONF_OPTS += -Dcpu_instruction_set=$(BR2_GCC_TARGET_ARCH)
> +# Keep the following, even if not mandatory, until the removal of the patch
> +DPDK_MESON_EXTRA_PROPERTIES += platform='generic'
> +
> +$(eval $(meson-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
