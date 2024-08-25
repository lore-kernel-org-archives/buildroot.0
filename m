Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8269C5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 21:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ECEF40477;
	Sun, 25 Aug 2024 21:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxGpwGaZckfl; Sun, 25 Aug 2024 21:00:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07BF140457
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07BF140457;
	Sun, 25 Aug 2024 21:00:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE13A1BF2B4
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 21:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD18980D73
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 21:00:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4unbmwn7zMhK for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 21:00:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01E9080D30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01E9080D30
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01E9080D30
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 21:00:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1E2995FFAF;
 Sun, 25 Aug 2024 23:00:49 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37916])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 Aug 2024 23:00:49 +0200
MIME-Version: 1.0
Date: Sun, 25 Aug 2024 23:00:49 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20240819221146.9678-4-vjardin@free.fr>
References: <20240817102923.18f56e24@windsurf>
 <20240819221146.9678-4-vjardin@free.fr>
User-Agent: Webmail Free/1.6.8
Message-ID: <16140bfec25b4f4dc569b9fb1b6c1162@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724619652;
 bh=7SPFaaZgBsl8haxmLna4FMqy8TT2LTdoDIGCVl6fcJM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u2Cen/qg0V1uLPWZ75QBO49pBjKpBqXINLvO5LlXWSN2G3LiNF6stIiGt1gSyJ9iw
 euRx+M6G6PMKYc++txyuKkxa/pVgnx10V7de26RSDl7XqUsqxJAzcMzHP+8+dLTZ8d
 m6tbbwrfJhPOu1suFAK++z1P3/AsHTiMX8+hBgJPLdX3Eb8EqFQIGr6D23mebT9Zkz
 AXHDVeWKh/fUX6y4T68h1TdUNyHI1a/UR2EWrQ48AB20bkkb+yFyiqwh9xXXRdGTS1
 OJkVXjHgSV9CMQ4BwY117/HkUF5I+VZiRxgT4L8Jh9smGyInUBwy+xNczWpmVncOsZ
 3cPnuPlSFgr1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u2Cen/qg
Subject: Re: [Buildroot] [PATCH v2 1/1] package/dpdk: add 24.03
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


   Hi Vincent,

Thank you for your patch. I am personally interested to see DPDK 
entering
in Buildroot! Please see my comments below.

On 20/08/2024 00:11, Vincent Jardin wrote:
> This commit adds the integration of the Data Plane Development Kit 
> (DPDK),
> a suite of libraries and drivers designed for high-performance packet
> processing from the user space. DPDK enables direct packet steering 
> from
> some network interfaces to the userland, bypassing the Linux kernel
> network stack. This is achieved through userland PCI drivers or by
> leveraging some userland memory mappings of the network devices.
> 
> Originally inspired by RDMA (Remote Direct Memory Access) concepts, 
> DPDK
> has been adapted to work with PCI devices that do not inherently 
> support
> RDMA. This adaptation allows for low-latency, high-throughput data
> processing by minimizing the overhead typically associated with
> kernel-space network drivers.
> 
> Importantly, this commit does not enforce the use of UIO or VFIO
> kernel frameworks, as DPDK's architecture supports userland memory
> mappings that do not require these technologies. By maintaining this
> flexibility, DPDK can operate with a broader range of hardware and
> software configurations, making it suitable for diverse Buildroot's
> deployment scenarios.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  DEVELOPERS                                    |  3 ++
>  package/Config.in                             |  1 +
>  ...-cpu_instruction_set-from-meson-opti.patch | 32 ++++++++++++++
>  package/dpdk/Config.in                        | 20 +++++++++
>  package/dpdk/dpdk.hash                        | 10 +++++
>  package/dpdk/dpdk.mk                          | 43 +++++++++++++++++++
>  6 files changed, 109 insertions(+)
>  create mode 100644 
> package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
>  create mode 100644 package/dpdk/Config.in
>  create mode 100644 package/dpdk/dpdk.hash
>  create mode 100644 package/dpdk/dpdk.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d7d0af3543..7b6f662e6e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3241,6 +3241,9 @@ F:	package/rtl8822cs/
>  N:	Victor Huesca <victor.huesca@bootlin.com>
>  F:	support/testing/tests/core/test_root_password.py
> 
> +N:	Vincent Jardin <vjardin@free.fr>
> +F:	package/dpdk/
> +
>  N:	Vincent Prince <vincent.prince.fr@gmail.com>
>  F:	package/nss-myhostname/
>  F:	package/utp_com/
> diff --git a/package/Config.in b/package/Config.in
> index f2c63ffb6e..5b21805e9f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1990,6 +1990,7 @@ menu "Networking"
>  	source "package/daq3/Config.in"
>  	source "package/davici/Config.in"
>  	source "package/dht/Config.in"
> +	source "package/dpdk/Config.in"
>  	source "package/enet/Config.in"
>  	source "package/filemq/Config.in"
>  	source "package/fmlib/Config.in"
> diff --git 
> a/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch 
> b/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
> new file mode 100644
> index 0000000000..92e3523cd8
> --- /dev/null
> +++ 
> b/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
> @@ -0,0 +1,32 @@
> +From 121e5d019f0bb6dec0ace2b361611edd10fc8ff8 Mon Sep 17 00:00:00 2001
> +From: Lee Chee Yang <chee.yang.lee@intel.com>
> +Date: Wed, 6 Dec 2023 16:58:10 +0800
> +Subject: [PATCH] config/meson: get cpu_instruction_set from meson 
> option
> +
> +Workaround error:
> +| ../git/config/meson.build:178:8: ERROR: Problem encountered: 
> Compiler
> +does not support "x86_64" arch flag.
> +
> +Upstream-Status: Inappropriate [ yocto specific to set 
> cpu_instruction_set ]

This "Upstream-Status:" tag seems to come from Yocto. Could you add
another "Upstream: fetched from https://..." tag including the URL
where you picked this patch? This will make tracking easier in future
package updates.

> +
> +Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
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
> +-    cpu_instruction_set = host_machine.cpu()
> ++    cpu_instruction_set = get_option('cpu_instruction_set')
> + else
> +     cpu_instruction_set = get_option('cpu_instruction_set')
> +     machine = get_option('machine')
> +--
> +2.37.3
> +
> diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
> new file mode 100644
> index 0000000000..25771aa0dd
> --- /dev/null
> +++ b/package/dpdk/Config.in
> @@ -0,0 +1,20 @@

I would have expected a definition of BR2_PACKAGE_DPDK_ARCH_SUPPORTS
here. I know DPDK has some requirements/restrictions on supported
architectures. For example, version 17.08 raised the minimal x86
requirement to have SSE4.2. See:
https://doc.dpdk.org/guides-17.08/rel_notes/release_17_08.html

So we should have something like:

config BR2_PACKAGE_DPDK_ARCH_SUPPORTS
         bool
         default y if BR2_RISCV_64
         default y if BR2_aarch64 || BR2_aarch64_be
         default y if BR2_powerpc64le
         # DPDK requires SSE4.2 for x86_64 since v17.08
         default y if BR2_x86_64 && BR2_X86_CPU_HAS_SSE42

there is possibly other supported architectures...

This can be tested by running the command:

     utils/test-pkg -a -p dpdk

> +config BR2_PACKAGE_DPDK
> +	bool "dpdk"
> +	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
> +	depends on !BR2_STATIC_LIBS # libbsd
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
> +	depends on BR2_USE_WCHAR # libbsd, libexecinfo

DPDK has some specific requirements, documented in:
https://github.com/DPDK/dpdk/blob/v24.07/doc/guides/linux_gsg/sys_reqs.rst

I believe some of those should be captured here.

I'm thinking about C11 atomics, and Kernel >= 4.19. We should have
dependencies like:

     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
     # dpdk requires kernel >= 4.14:
     # 
https://github.com/DPDK/dpdk/blob/v24.07/doc/guides/linux_gsg/sys_reqs.rst
     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14

> +	select BR2_PACKAGE_LIBBSD
> +	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_JANSSON
> +	select BR2_PACKAGE_LIBPCAP
> +	select BR2_PACKAGE_ZLIB

Those dependencies (libbsd, jansson, libpcap, zlib) seems to be
optional. In that case, they should not be selected here. See my
comments below in the .mk file.

> +	help
> +	  DPDK (Data Plane Development Kit) is a set of libraries
> +	  and drivers for fast packet processing.
> +
> +	  http://dpdk.org/

This URL redirects to https://www.dpdk.org/ which seems to be the
canonical package homepage address. Could you update it?

> +
> +comment "dpdk needs a toolchain w/ dynamic library, threads, wchar"
> +	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || 
> !BR2_USE_WCHAR
> diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
> new file mode 100644
> index 0000000000..371c59d229
> --- /dev/null
> +++ b/package/dpdk/dpdk.hash
> @@ -0,0 +1,10 @@
> +# Locally computed
> +sha256  
> 33ed973b3945af4f5923096ddca250b401dc80be3b5c6393b4e4fe43a1a6c2ad  
> dpdk-24.03.tar.xz
> +sha256  
> 1531b66affc3bae796d755e12850795e56e25ccedd685bf7d2644d8ddfadbad8  
> license/bsd-2-clause.txt
> +sha256  
> 9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  
> license/bsd-3-clause.txt
> +sha256  
> e19808bccd90c238fac06da2fc3683e094c64f7ba647e9d86f03a98cf5f2ce05  
> license/exceptions.txt
> +sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> license/gpl-2.0.txt
> +sha256  
> be8f198f2e1c9b30226e293255bbe6933ee6607a580ee5874185aa023bcc3c39  
> license/isc.txt
> +sha256  
> 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  
> license/lgpl-2.1.txt
> +sha256  
> 6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  
> license/mit.txt

The list of licenses might need updated, see my comment below in
the .mk file.

> +sha256  
> cae178052c96959741acb7f00634a09a8294e6cafb5ad53e158d63e3510875ab  
> license/README
> diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
> new file mode 100644
> index 0000000000..567e886f80
> --- /dev/null
> +++ b/package/dpdk/dpdk.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# dpdk
> +#
> +################################################################################
> +
> +DPDK_VERSION = 24.03

The is already a version 24.07 released few weeks ago. See:
https://github.com/DPDK/dpdk/releases/tag/v24.07
In case you send a updated version of this patch, could you
upgrade to this new version?

> +DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
> +DPDK_SITE = http://fast.dpdk.org/rel

This URL redirects to https. Could you update it to
https://fast.dpdk.org/rel ?

> +DPDK_LICENSE = \
> +	BSD-3-Clause, \
> +	BSD-2-Clause,\
> +	GPL-2.0, \
> +	ISC, \
> +	LGPL-2.1, \
> +	MIT

This is maybe too many licenses listed here. The DPDK core libraries
are now mostly BSD-3-Clause. The code base has some specific parts
under other licenses. Maybe we should identify which license apply to
which part. For example:

DPDK_LICENSE = \
     BSD-3-Clause (core libraries), \
     MIT (drivers/net/gve/base/*)

Also, the ISC and BSD-2-Clause is used in a Windows-only abstraction
layer. See:
https://github.com/DPDK/dpdk/blob/v24.07/lib/eal/windows/getopt.c

There is also some Freescale/NXP drivers (dpaa) which are dual
licensed under (BSD-3-Clause or GPL-2.0), that could be identified.

Maybe this is a question to Buildroot maintainers: should we list here
licenses of code which are known to be unused, such as this Windows
abstraction layer?

The DPDK components and licenses can be checked in its git repository,
with the command:

    git grep -F SPDX-License-Identifier:

Since DPDK has a somewhat "complex" licensing and history, an
explanation could be added in the commit log. For example:

     Notes about license:

     DPDK is now mainly under the BSD-3-Clause license.

     One network driver, the Google Virtual Ethernet (GVE) include files
     under the MIT license. See [2] and [3].

     DPDK used to include a Kernel NIC Interface (KNI) kernel module in
     GPL-2.0 license. This module was removed in commit [4]. This commit
     was first included in version v23.11.

     There is also few files in "lib/eal/windows" under other licenses
     (namely BSD-2-Clause, ISC and MIT) but are parts of the Environment
     Abstraction Library (EAL) for Microsoft Windows OS, not used when
     compiling for Linux in Buildroot.

     The list of dpdk license exceptions is maintained at [3].

     [1] https://www.dpdk.org/
     [2] https://github.com/DPDK/dpdk/blob/v24.07/doc/guides/nics/gve.rst
     [3] https://github.com/DPDK/dpdk/blob/v24.07/license/exceptions.txt
     [4] 
https://github.com/DPDK/dpdk/commit/f78c100bc87119c6a94130a6689d773afdaa9d98

> +
> +DPDK_LICENSE_FILES = \
> +	license/README \
> +	license/bsd-3-clause.txt \
> +	license/bsd-2-clause.txt \
> +	license/exceptions.txt \
> +	license/gpl-2.0.txt \
> +	license/isc.txt \
> +	license/lgpl-2.1.txt \
> +	license/mit.txt \

Then the license file list should include only the mentioned license
before. The README and exceptions.txt can be kept.

> +
> +DPDK_DEPENDENCIES = \
> +	host-pkgconf \
> +	host-python-pyelftools \
> +	libbsd \
> +	jansson \
> +	libpcap \
> +	zlib \

libbsd is an optional dependency, see:
https://github.com/DPDK/dpdk/blob/v24.07/config/meson.build#L266
other dependencies seems to be optional too. I believe only
host-python-pyelftools is really a mandatory dependency and all other
are optional.

Mandatory dependency can be listed with an assignment such as:

DPDK_DEPENDENCIES = \
	mandatory_dependency1 \
	mandatory_dependency2

While optional dependencies can be added with something like:

ifeq ($(BR2_PACKAGE_OPTIONAL_DEPENDENCY),y)
DPDK_CONF_OPTS += -DOPTIONAL_DEPENDENCY=true
DPDK_DEPENDENCIES += optional-dependency
else
DPDK_CONF_OPTS += -DOPTIONAL_DEPENDENCY=false
endif

See the meson example in:
https://nightly.buildroot.org/manual.html#_infrastructure_for_meson_based_packages

Looking at the Meson file, I think the optional Buildroot package
dependencies are:
dtc jansson libarchive libbpf libpcap numactl openssl rdma-core zlib

> +
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
> +DPDK_DEPENDENCIES += libexecinfo
> +endif
> +
> +DPDK_CONF_OPTS += -Dcpu_instruction_set=$(BR2_GCC_TARGET_ARCH)
> +#DPDK_CONF_OPTS += -Dplatform=generic

Is this comment intended?  If yes, please remove the line.

I don't know if it is related, but last time I had to use dpdk-24.03
in Buildroot, I had to define the platform in a Meson extra property
such as:

DPDK_MESON_EXTRA_PROPERTIES = platform='generic'

Could you check if this platform definition is needed?

> +

Finally, DPDK core has a strong requirement on Kernel having
CONFIG_HUGETLBFS enabled. See:
https://github.com/DPDK/dpdk/blob/v24.07/doc/guides/linux_gsg/sys_reqs.rst

So this package could define a Kernel config fixup, to make sure we'll
end up in a working system image:

define DPDK_LINUX_CONFIG_FIXUPS
        $(call KCONFIG_ENABLE_OPT,CONFIG_HUGETLBFS)
endef

> +$(eval $(meson-package))
> --
> 2.46.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
