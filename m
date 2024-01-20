Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B78C47DAF
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 01:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA46342E6E;
	Sat, 20 Jan 2024 01:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA46342E6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8q2AJr-csveY; Sat, 20 Jan 2024 01:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A44442E69;
	Sat, 20 Jan 2024 01:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A44442E69
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5B4E1BF298
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 01:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAB49401CA
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 01:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAB49401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IbBxu5B4zL6e for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 01:18:16 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC3AB4011F
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 01:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC3AB4011F
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 82503CE27CE;
 Sat, 20 Jan 2024 01:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64183C433C7;
 Sat, 20 Jan 2024 01:18:12 +0000 (UTC)
From: Mat Martineau <martineau@kernel.org>
To: buildroot@buildroot.org
Date: Fri, 19 Jan 2024 17:17:58 -0800
Message-ID: <20240120011759.2454452-2-martineau@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240120011759.2454452-1-martineau@kernel.org>
References: <20240120011759.2454452-1-martineau@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1705713492;
 bh=YrSo7NolRhwE9LvBEtMg5KTa7B1KolXupXwhoFR8xME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ouQZs6Xxk6qG/+bELWWuw8fS0TyGFn+Z+ikMEB456UFzXpRj0ZMFCDHTMbEqrPJ4h
 psP9Hxp6juKHrJk7VrXyxaxzoYNw96jtiZPmO3kwzztcCcvfJ/fRscsvQYTfLu3PpJ
 sAvbgakPoHKveWWvTebz6TfPzl/9QVKnn0+ux0wYm/D3mX477tk8IHSGb5sPqhrJm7
 JrDSAkn8D+++v4onY1AJnUol7TBznVJPWEV+kpyeOd3+G+TjoYh5cV8Bdbh7Lysq/0
 wL6MHcUiKpmWd56t2z7MTpY4CDDJp8LGCvQzN440QOcGsu6WibeoGblT6uHf0YW4yi
 sNxm+jSEkk8+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=ouQZs6Xx
Subject: [Buildroot] [PATCH v7 1/2] package/bcc: new package
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
Cc: jugurtha.belkalem@smile.fr, qyousef@layalina.io,
 Qais Yousef <qais.yousef@arm.com>, naveen.mamindlapalli@gmail.com,
 romain.naour@smile.fr, Mat Martineau <martineau@kernel.org>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>

bcc is a front-end tool for eBPF:
https://github.com/iovisor/bcc/blob/master/README.md
eBPF is the most powerful Linux tracer, and bcc allows writing eBPF
scripts in C and PYTHON3.

bcc can help to troubleshoot issues quickly on embedded systems (as long
as Linux kernel version >= 4.1).

bcc can also make it easy to create observabilty tools, SDN
configuration, ddos mitigation, intrusion detection and secure
containers. More information is available at: https://ebpf.io/

BCC can be tested on the target :
$ mount -t debugfs none /sys/kernel/debug
$ cd /usr/share/bcc/tools
$ ./execsnoop

v7 changes:
 - Ported to current buildroot
 - Updated to latest bcc (0.29.1)
 - Add zip host dependency
 - Use PY_SKIP_DEB_LAYOUT instead of applying patch
 - Don't install examples in target filesystem
 - Use upstream tarball with submodule included
 - Use busybox tar based on v6 feedback
 - Fix formatting issues
 - Propagate config dependencies
 - Remove patch to control luajit config, bcc handles automatically

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Qais Yousef <qais.yousef@arm.com>
Reviewed-by: Qais Yousef <qais.yousef@arm.com>
Cc: Qais Yousef <qyousef@layalina.io>
Signed-off-by: Mat Martineau <martineau@kernel.org>
---
 DEVELOPERS            |  2 ++
 package/Config.in     |  1 +
 package/bcc/Config.in | 44 +++++++++++++++++++++++++++++++++++++++++++
 package/bcc/bcc.hash  |  3 +++
 package/bcc/bcc.mk    | 43 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 93 insertions(+)
 create mode 100644 package/bcc/Config.in
 create mode 100644 package/bcc/bcc.hash
 create mode 100644 package/bcc/bcc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f5b04937b611..0af50f1f848d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1672,6 +1672,7 @@ N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
 
 N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+F:	package/bcc/
 F:	package/python-aiofiles/
 F:	package/python-crayons/
 F:	package/python-cycler/
@@ -2603,6 +2604,7 @@ F:	board/qemu/
 F:	configs/qemu_*
 F:	package/alure/
 F:	package/aubio/
+F:	package/bcc/
 F:	package/binutils/
 F:	package/bullet/
 F:	package/clinfo/
diff --git a/package/Config.in b/package/Config.in
index 5b8b15fa5400..662c935a1f1c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -87,6 +87,7 @@ endmenu
 
 menu "Debugging, profiling and benchmark"
 	source "package/babeltrace2/Config.in"
+	source "package/bcc/Config.in"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
 	source "package/bpftool/Config.in"
diff --git a/package/bcc/Config.in b/package/bcc/Config.in
new file mode 100644
index 000000000000..11af1e5878f3
--- /dev/null
+++ b/package/bcc/Config.in
@@ -0,0 +1,44 @@
+config BR2_PACKAGE_BCC
+	bool "bcc"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC # hardcode GNU tuple (x86_64-unknown-linux-gnu)
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # clang
+	depends on BR2_INSTALL_LIBSTDCPP # clang
+	depends on BR2_HOST_GCC_AT_LEAST_7 # clang
+	depends on BR2_USE_WCHAR # clang, python3
+	depends on BR2_USE_MMU # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # clang, python3
+	depends on !BR2_STATIC_LIBS # clang, python3
+	select BR2_PACKAGE_CLANG
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_FLEX # needs FlexLexer.h
+	select BR2_PACKAGE_LLVM
+	select BR2_PACKAGE_LLVM_BPF
+	select BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_HOST_ZIP
+	help
+	  BPF Compiler Collection (BCC)
+
+	  BCC is a toolkit for creating efficient kernel tracing and
+	  manipulation programs, and includes several useful tools and
+	  examples. It makes use of extended BPF (Berkeley Packet
+	  Filters), formally known as eBPF, a new feature that was
+	  first added to Linux 3.15. Much of what BCC uses requires
+	  Linux 4.1 and above.
+
+	  Note: Before using bcc, you need either need to :
+	  - For kernel_ver = [4.1, 5.2) : Copy kernel source code
+	  to target folder /lib/module/<kernel_ver>/build.
+	  - Or kernel_ver >= 5.2 : Compile kernel with CONFIG_IKHEADERS
+	  and use generated headers under /sys/kernel/kheaders.tar.xz
+	  to populate /lib/module/<kernel_ver>/build.
+
+	  That's because the clang frontend build eBPF code at runtime.
+
+	  https://github.com/iovisor/bcc
+	  http://www.ebpf.io
+
+comment "bcc needs a glibc toolchain, C++, gcc >= 4.8, host gcc >= 4.8"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/bcc/bcc.hash b/package/bcc/bcc.hash
new file mode 100644
index 000000000000..b37e125b1ac7
--- /dev/null
+++ b/package/bcc/bcc.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  321575fa94f3274040379dd2d4535217f45099f4240b58a4dfc171aa8c78402f  bcc-src-with-submodule.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE.txt
diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
new file mode 100644
index 000000000000..bf7408f4eeb8
--- /dev/null
+++ b/package/bcc/bcc.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# bcc
+#
+################################################################################
+
+BCC_VERSION = 0.29.1
+BCC_SITE = https://github.com/iovisor/bcc/releases/download/v$(BCC_VERSION)
+BCC_SOURCE = bcc-src-with-submodule.tar.gz
+BCC_LICENSE = Apache-2.0
+BCC_LICENSE_FILES = LICENSE.txt
+BCC_INSTALL_STAGING = YES
+BCC_DEPENDENCIES = host-bison host-flex host-zip clang elfutils flex llvm python3 host-python-setuptools
+
+# ENABLE_LLVM_SHARED=ON to use llvm.so.
+# Force REVISION otherwise bcc will use git describe to generate a version number.
+BCC_CONF_OPTS = \
+	-DENABLE_LLVM_SHARED:BOOL=ON \
+	-DREVISION:STRING=$(BCC_VERSION) \
+	-DENABLE_CLANG_JIT:BOOL=ON \
+	-DENABLE_MAN:BOOL=OFF \
+	-DENABLE_EXAMPLES:BOOL=OFF \
+	-DPY_SKIP_DEB_LAYOUT:BOOL=ON
+
+define BCC_LINUX_CONFIG_FIXUPS
+	# Enable kernel support for eBPF
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CLS_BPF)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_ACT_BPF)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_JIT)
+	# [for Linux kernel versions 4.1 through 4.6]
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HAVE_BPF_JIT)
+	# [for Linux kernel versions 4.7 and later]
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HAVE_EBPF_JIT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_EVENTS)
+	# [for Linux kernel versions 5.2 and later]
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IKHEADERS)
+	# bcc needs debugfs at runtime
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS)
+endef
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
