Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6351EC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 22:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EB436083A;
	Mon, 19 Aug 2024 22:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBUQ1KdLBTWT; Mon, 19 Aug 2024 22:14:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD4056083E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD4056083E;
	Mon, 19 Aug 2024 22:14:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7681BF3C8
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29F7C400B9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAieTwUMt0uB for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 22:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80D754026D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80D754026D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80D754026D
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 22:14:04 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:2d45:dc9e:cf4d:7a6e])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 57ADE5FE03;
 Tue, 20 Aug 2024 00:13:59 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 00:11:48 +0200
Message-ID: <20240819221146.9678-4-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817102923.18f56e24@windsurf>
References: <20240817102923.18f56e24@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724105642;
 bh=XgQ9kyZfe2c+szEvyCeQB7SXJ0VYSW0Ap8D4R4ND8IE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dh37N0LQzWQQQz07M7WzYVbPsVFMgkHE95GRBHcbAqgvJbrAP3o3VMEEfzW/rbkRv
 YLRzgPCqlqwqbOQWF4ErBT2XlV7AkAzqke7NhVesroAi2zlUyC/lvvNmwBsY/+6J5Q
 im2Z01k7HF+VuVbEifMaBkSbPZ6iN233KqZsHzY5PtsscejWk1Kqj//coCnvhkrh49
 M3stv7pXglW1vP30FfrVcXLQhUitW45coDENiBRFOmoGQvU7IK/KWFNbibaSCEjb75
 eO9ELzW59G/2gKOFqlVY6Lc/j2ARpNND87BCdQQgAoHJlPwwKIVTioRYu6ODQnwBGm
 s/UBZv5sfpQcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dh37N0LQ
Subject: [Buildroot] [PATCH v2 1/1] package/dpdk: add 24.03
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
Cc: Vincent Jardin <vjardin@free.fr>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds the integration of the Data Plane Development Kit (DPDK),
a suite of libraries and drivers designed for high-performance packet
processing from the user space. DPDK enables direct packet steering from
some network interfaces to the userland, bypassing the Linux kernel
network stack. This is achieved through userland PCI drivers or by
leveraging some userland memory mappings of the network devices.

Originally inspired by RDMA (Remote Direct Memory Access) concepts, DPDK
has been adapted to work with PCI devices that do not inherently support
RDMA. This adaptation allows for low-latency, high-throughput data
processing by minimizing the overhead typically associated with
kernel-space network drivers.

Importantly, this commit does not enforce the use of UIO or VFIO
kernel frameworks, as DPDK's architecture supports userland memory
mappings that do not require these technologies. By maintaining this
flexibility, DPDK can operate with a broader range of hardware and
software configurations, making it suitable for diverse Buildroot's
deployment scenarios.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 ...-cpu_instruction_set-from-meson-opti.patch | 32 ++++++++++++++
 package/dpdk/Config.in                        | 20 +++++++++
 package/dpdk/dpdk.hash                        | 10 +++++
 package/dpdk/dpdk.mk                          | 43 +++++++++++++++++++
 6 files changed, 109 insertions(+)
 create mode 100644 package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
 create mode 100644 package/dpdk/Config.in
 create mode 100644 package/dpdk/dpdk.hash
 create mode 100644 package/dpdk/dpdk.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af3543..7b6f662e6e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3241,6 +3241,9 @@ F:	package/rtl8822cs/
 N:	Victor Huesca <victor.huesca@bootlin.com>
 F:	support/testing/tests/core/test_root_password.py
 
+N:	Vincent Jardin <vjardin@free.fr>
+F:	package/dpdk/
+
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
 F:	package/utp_com/
diff --git a/package/Config.in b/package/Config.in
index f2c63ffb6e..5b21805e9f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1990,6 +1990,7 @@ menu "Networking"
 	source "package/daq3/Config.in"
 	source "package/davici/Config.in"
 	source "package/dht/Config.in"
+	source "package/dpdk/Config.in"
 	source "package/enet/Config.in"
 	source "package/filemq/Config.in"
 	source "package/fmlib/Config.in"
diff --git a/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch b/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
new file mode 100644
index 0000000000..92e3523cd8
--- /dev/null
+++ b/package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
@@ -0,0 +1,32 @@
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
diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
new file mode 100644
index 0000000000..25771aa0dd
--- /dev/null
+++ b/package/dpdk/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_DPDK
+	bool "dpdk"
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
+	depends on !BR2_STATIC_LIBS # libbsd
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
+	depends on BR2_USE_WCHAR # libbsd, libexecinfo
+	select BR2_PACKAGE_LIBBSD
+	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_ZLIB
+	help
+	  DPDK (Data Plane Development Kit) is a set of libraries
+	  and drivers for fast packet processing.
+
+	  http://dpdk.org/
+
+comment "dpdk needs a toolchain w/ dynamic library, threads, wchar"
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
new file mode 100644
index 0000000000..371c59d229
--- /dev/null
+++ b/package/dpdk/dpdk.hash
@@ -0,0 +1,10 @@
+# Locally computed
+sha256  33ed973b3945af4f5923096ddca250b401dc80be3b5c6393b4e4fe43a1a6c2ad  dpdk-24.03.tar.xz
+sha256  1531b66affc3bae796d755e12850795e56e25ccedd685bf7d2644d8ddfadbad8  license/bsd-2-clause.txt
+sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  license/bsd-3-clause.txt
+sha256  e19808bccd90c238fac06da2fc3683e094c64f7ba647e9d86f03a98cf5f2ce05  license/exceptions.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  license/gpl-2.0.txt
+sha256  be8f198f2e1c9b30226e293255bbe6933ee6607a580ee5874185aa023bcc3c39  license/isc.txt
+sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  license/lgpl-2.1.txt
+sha256  6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  license/mit.txt
+sha256  cae178052c96959741acb7f00634a09a8294e6cafb5ad53e158d63e3510875ab  license/README
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
new file mode 100644
index 0000000000..567e886f80
--- /dev/null
+++ b/package/dpdk/dpdk.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# dpdk
+#
+################################################################################
+
+DPDK_VERSION = 24.03
+DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
+DPDK_SITE = http://fast.dpdk.org/rel
+DPDK_LICENSE = \
+	BSD-3-Clause, \
+	BSD-2-Clause,\
+	GPL-2.0, \
+	ISC, \
+	LGPL-2.1, \
+	MIT
+
+DPDK_LICENSE_FILES = \
+	license/README \
+	license/bsd-3-clause.txt \
+	license/bsd-2-clause.txt \
+	license/exceptions.txt \
+	license/gpl-2.0.txt \
+	license/isc.txt \
+	license/lgpl-2.1.txt \
+	license/mit.txt \
+
+DPDK_DEPENDENCIES = \
+	host-pkgconf \
+	host-python-pyelftools \
+	libbsd \
+	jansson \
+	libpcap \
+	zlib \
+
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+DPDK_DEPENDENCIES += libexecinfo
+endif
+
+DPDK_CONF_OPTS += -Dcpu_instruction_set=$(BR2_GCC_TARGET_ARCH)
+#DPDK_CONF_OPTS += -Dplatform=generic
+
+$(eval $(meson-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
