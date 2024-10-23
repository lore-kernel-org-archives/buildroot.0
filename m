Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED130CFA45F
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DA0160847;
	Wed, 23 Oct 2024 19:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qI_8cPNIZf9; Wed, 23 Oct 2024 19:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D789D6084E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D789D6084E;
	Wed, 23 Oct 2024 19:24:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C430A27ED
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2FB2810B1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKRmGVxOLJon for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2014810AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2014810AF
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:24:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B70A98637F; Wed, 23 Oct 2024 19:24:05 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 21:23:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1854a64937bda7567cb935e9b112803f3b7382a5
X-Git-Newrev: d17d1b6bde95d46376c4fe93e8ca1a1f9da6c179
X-Patchwork-Hint: ignore
Message-Id: <20241023192405.B70A98637F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dpdk: add 24.07
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d17d1b6bde95d46376c4fe93e8ca1a1f9da6c179
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds the integration of the Data Plane Development Kit (DPDK).

This commit does not enforce the use of UIO or VFIO kernel frameworks,
as DPDK's architecture supports userland memory mappings that do not require
these technologies. By maintaining this flexibility, DPDK can operate with
a broader range of hardware and software configurations.

Only the little endian targets are properly supported by DPDK. Big endian
was supported, mostly on Power8, but it has not been used for a while and
IBM is not strongly pushing any tests. Should big endian be supported
again, DPDK community will be welcoming any  contributions.

Notes about license:

DPDK was released with the BSD-3-Clause license.

One network driver, the Google Virtual Ethernet (GVE) include files
under the MIT license. See [1] and [2].

There used to be GPL-2.0-only licensed kernel modules, but they got
removed in previous versions [K] [KNI], so Buildroot won't be used to compile
the GPL-2.0-only code.

There are also 2 files in "lib/eal/windows" under other licenses
(namely BSD-2-Clause, ISC and MIT) but they are parts of the Environment
Abstraction Library (EAL) for Microsoft Windows OS, it means they are
not used when compiling for the Linux targets of Buildroot.

The list of DPDK license exceptions is maintained at [2].

Add configuration options to enable DPDK examples and tests.

[1] https://git.dpdk.org/dpdk/tree/doc/guides/nics/gve.rst?h=v24.07
[2] https://git.dpdk.org/dpdk/tree/license/exceptions.txt?h=v24.07
[KNI] https://git.dpdk.org/dpdk/commit/?id=f78c100bc87119c6a94130a6689d773afdaa9d98
[UIO] https://git.dpdk.org/dpdk/commit/?id=56bb5841fd0608989101d933f091852a3126b4fe
[K] https://git.dpdk.org/dpdk-kmods/commit/?id=d16f3b44987be181b6effee139558a084eaf9f8c

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Suggested-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Yann Morin <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle <arnout@mind.de>
Tested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  3 +
 package/Config.in                                  |  1 +
 ...n-get-cpu_instruction_set-from-meson-opti.patch | 35 ++++++++
 package/dpdk/0010-Fix-aarch64-build.patch          | 43 ++++++++++
 package/dpdk/Config.in                             | 54 ++++++++++++
 package/dpdk/dpdk.hash                             |  6 ++
 package/dpdk/dpdk.mk                               | 95 ++++++++++++++++++++++
 7 files changed, 237 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c649d3d6f2..136b82ce14 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3268,6 +3268,9 @@ F:	package/rtl8822cs/
 N:	Victor Huesca <victor.huesca@bootlin.com>
 F:	support/testing/tests/core/test_root_password.py
 
+N:	Vincent Jardin <vjardin@free.fr>
+F:	package/dpdk/
+
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
 F:	package/utp_com/
diff --git a/package/Config.in b/package/Config.in
index e1ceb81dc0..6c4f9640c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2002,6 +2002,7 @@ menu "Networking"
 	source "package/daq3/Config.in"
 	source "package/davici/Config.in"
 	source "package/dht/Config.in"
+	source "package/dpdk/Config.in"
 	source "package/enet/Config.in"
 	source "package/filemq/Config.in"
 	source "package/fmlib/Config.in"
diff --git a/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch b/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
new file mode 100644
index 0000000000..c1bfb86448
--- /dev/null
+++ b/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
@@ -0,0 +1,35 @@
+From 121e5d019f0bb6dec0ace2b361611edd10fc8ff8 Mon Sep 17 00:00:00 2001
+From: Lee Chee Yang <chee.yang.lee@intel.com>
+Date: Wed, 6 Dec 2023 16:58:10 +0800
+Subject: [PATCH] config/meson: get cpu_instruction_set from meson option
+
+Workaround error:
+| ../git/config/meson.build:178:8: ERROR: Problem encountered: Compiler
+does not support "x86_64" arch flag.
+
+Upstream-Status: Inappropriate [ yocto specific to set cpu_instruction_set ]
+
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+Links: https://git.yoctoproject.org/meta-dpdk/plain/recipes-extended/dpdk/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
+Upstream: Not applicable, see Yocto's status, above
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+---
+ config/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/meson.build b/config/meson.build
+index a9ccd56deb..f310c7adf6 100644
+--- a/config/meson.build
++++ b/config/meson.build
+@@ -105,7 +105,7 @@ platform = get_option('platform')
+ 
+ # set the cpu_instruction_set and cflags for it
+ if meson.is_cross_build()
+-    cpu_instruction_set = host_machine.cpu()
++    cpu_instruction_set = get_option('cpu_instruction_set')
+ else
+     cpu_instruction_set = get_option('cpu_instruction_set')
+     machine = get_option('machine')
+-- 
+2.37.3
+
diff --git a/package/dpdk/0010-Fix-aarch64-build.patch b/package/dpdk/0010-Fix-aarch64-build.patch
new file mode 100644
index 0000000000..55c31c3647
--- /dev/null
+++ b/package/dpdk/0010-Fix-aarch64-build.patch
@@ -0,0 +1,43 @@
+From c5ea091a74bbfa5fb095d2c6fe15be3a7b15cacb Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sun, 8 Sep 2024 13:20:14 +0200
+Subject: [PATCH] Fix aarch64 build
+
+The condition on which DPDK meson skip the -march detection for Aarch64
+seems incorrect or incomplete. This patch changes the condition in order
+to better match the comment (that the options are decided in
+config/arm/meson.build). It actually test for the architecture name.
+
+While this patch might need some discussion with DPDK maintainers to
+cover all situations, it can still be useful here in Buildroot, as it
+fixes the Aarch64 cross compilation.
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: to be proposed https://patches.dpdk.org/project/dpdk/list/
+Links: cherry-picked from https://github.com/jolivain/dpdk/commit/c5ea091a74bbfa5fb095d2c6fe15be3a7b15cacb
+---
+ config/meson.build | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/config/meson.build b/config/meson.build
+index 8c8b019c25..ea48e55ce3 100644
+--- a/config/meson.build
++++ b/config/meson.build
+@@ -176,10 +176,10 @@ if not is_ms_compiler
+     else
+         machine_args += '-march=' + cpu_instruction_set
+         # arm manages generic/auto config in config/arm/meson.build
+-        if cpu_instruction_set != 'generic' and cpu_instruction_set != 'auto'
+-            compiler_arch_support = cc.has_argument('-march=' + cpu_instruction_set)
+-        else
++        if host_machine.cpu_family().startswith('aarch')
+             compiler_arch_support = true
++        else
++            compiler_arch_support = cc.has_argument('-march=' + cpu_instruction_set)
+         endif
+     endif
+     if not compiler_arch_support
+--
+2.46.0
+
diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
new file mode 100644
index 0000000000..328129ea65
--- /dev/null
+++ b/package/dpdk/Config.in
@@ -0,0 +1,54 @@
+config BR2_PACKAGE_DPDK_ARCH_SUPPORTS
+	bool
+	# DPDK can be used for the following little endian architecture
+	default y if BR2_aarch64
+	# DPDK requires SSE4.2 for x86_64 since v17.08
+	default y if BR2_x86_64 && BR2_X86_CPU_HAS_SSE42
+
+config BR2_PACKAGE_DPDK
+	bool "dpdk"
+	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # DPDK design
+	depends on BR2_USE_MMU # pthread() memory mappings
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_HOST_PYTHON3 # host-python-pyelftools
+	help
+	  DPDK (Data Plane Development Kit) is a set of libraries
+	  and drivers for fast packet processing.
+
+	  http://dpdk.org/
+
+	  Optional but recommended kernel configurations:
+	    - CONFIG_VFIO_IOMMU_TYPE1
+	    - CONFIG_VFIO_VIRQFD
+	    - CONFIG_VFIO
+	    - CONFIG_VFIO_NOIOMMU
+	    - CONFIG_VFIO_PCI
+	    - CONFIG_VFIO_PCI_MMAP
+	    - CONFIG_HUGETLBFS
+	    - CONFIG_HUGETLB_PAGE
+	    - CONFIG_PROC_PAGE_MONITOR
+
+	  For x86 only, the following can also be useful:
+	    - CONFIG_HPET
+	    - CONFIG_HPET_MMAP
+
+if BR2_PACKAGE_DPDK
+
+config BR2_PACKAGE_DPDK_EXAMPLES
+	bool "Install examples"
+
+config BR2_PACKAGE_DPDK_TESTS
+	bool "Install tests"
+
+endif
+
+comment "DPDK needs a toolchain w/ dynamic library, threads, wchar, kernel headers >= 4.19"
+	depends on BR2_USE_MMU # pthread() memory mappings
+	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
new file mode 100644
index 0000000000..27c06476e7
--- /dev/null
+++ b/package/dpdk/dpdk.hash
@@ -0,0 +1,6 @@
+# Locally computed
+sha256  9944f7e5f268e7ac9b4193e2cd54ef6d98f6e1d7dddc967c77ae4f6616d6fbbd  dpdk-24.07.tar.xz
+sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  license/bsd-3-clause.txt
+sha256  e19808bccd90c238fac06da2fc3683e094c64f7ba647e9d86f03a98cf5f2ce05  license/exceptions.txt
+sha256  6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  license/mit.txt
+sha256  cae178052c96959741acb7f00634a09a8294e6cafb5ad53e158d63e3510875ab  license/README
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
new file mode 100644
index 0000000000..b685e12408
--- /dev/null
+++ b/package/dpdk/dpdk.mk
@@ -0,0 +1,95 @@
+################################################################################
+#
+# dpdk
+#
+################################################################################
+
+DPDK_VERSION = 24.07
+DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
+DPDK_SITE = https://fast.dpdk.org/rel
+DPDK_LICENSE = \
+	BSD-3-Clause, \
+	MIT
+
+# Only the Windows target has the 2 following licenses:
+# - license/bsd-2-clause.txt
+# - license/isc.txt
+# which is related to a Windows getopt.[ch] compatibility layer.
+# Since Buildroot is not used for Windows target, it is not listed
+# here.
+#
+# All the userland files of DPDK have dual licences BSD or GPL/LGPL
+# Since the Linux kernel modules had been removed from the DPDK, there
+# is no GPL only code into the DPDK anymore.
+# The usage of DPDK with Buildroot is for userland only, it means
+# that for the dual licenced files, BSD clause is used but not the
+# following ones:
+# - license/gpl-2.0.txt
+# - license/lgpl-2.1.txt
+# See the DPDK's license/README for more details.
+#
+# The legacy and historical license of the DPDK is BSD-3-clause.
+DPDK_LICENSE_FILES = \
+	license/README \
+	license/bsd-3-clause.txt \
+	license/exceptions.txt \
+	license/mit.txt
+
+DPDK_DEPENDENCIES = \
+	host-pkgconf \
+	host-python-pyelftools
+
+ifeq ($(BR2_PACKAGE_DPDK_EXAMPLES),y)
+DPDK_CONF_OPTS += -Dexamples=all
+else
+DPDK_CONF_OPTS += -Dexamples=
+endif
+
+ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
+DPDK_CONF_OPTS += -Dtests=true
+else
+DPDK_CONF_OPTS += -Dtests=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBBSD),y)
+DPDK_DEPENDENCIES += libbsd
+endif
+
+ifeq ($(BR2_PACKAGE_JANSSON),y)
+DPDK_DEPENDENCIES += jansson
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+DPDK_DEPENDENCIES += libpcap
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+DPDK_DEPENDENCIES += zlib
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+DPDK_DEPENDENCIES += libexecinfo
+endif
+
+ifeq ($(BR2_PACKAGE_NUMACTL),y)
+DPDK_DEPENDENCIES += numactl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
+DPDK_DEPENDENCIES += libarchive
+endif
+
+ifeq ($(BR2_PACKAGE_LIBBPF),y)
+DPDK_DEPENDENCIES += libbpf
+endif
+
+ifeq ($(BR2_PACKAGE_RDMA_CORE),y)
+DPDK_DEPENDENCIES += rdma-core
+endif
+
+# DPDK's meson shall need to be clean'd, hack here along the enclosed patch
+DPDK_CONF_OPTS += -Dcpu_instruction_set=$(BR2_GCC_TARGET_ARCH)
+# Keep the following, even if not mandatory, until the removal of the patch
+DPDK_MESON_EXTRA_PROPERTIES += platform='generic'
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
