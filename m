Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD71C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F76061B7F;
	Sat, 12 Feb 2022 13:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tY54jMtqeWxV; Sat, 12 Feb 2022 13:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14DBC607B4;
	Sat, 12 Feb 2022 13:26:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0B1C1BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D55683E38
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xkf9XAxIDGM for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:26:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 995DD83E36
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:26:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 98B4D82AD1; Sat, 12 Feb 2022 13:18:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 14:19:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c7de551c5bbe2fb4f392c4303a4d3475270fca7
X-Git-Newrev: 3675131e6c654d7536a184db0184fde7a97040e0
X-Patchwork-Hint: ignore
Message-Id: <20220212131841.98B4D82AD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftool: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3675131e6c654d7536a184db0184fde7a97040e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move the target bpftool build out of linux-tools so that it is
up to date.

This also fixes build issues due to differences between kernel
versions. The latest version should be fully backwards compatible.

The host bpftool is needed for enabling features such as the systemd
bpf-framework (to be added in a future patch).

Use the git download method to get the libbpf submodule.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                             |  8 +++++
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/bpftool/Config.in                    | 18 +++++++++++
 package/bpftool/bpftool.hash                 |  5 ++++
 package/bpftool/bpftool.mk                   | 45 ++++++++++++++++++++++++++++
 package/linux-tools/Config.in                | 22 --------------
 package/linux-tools/linux-tool-bpftool.mk.in | 37 -----------------------
 8 files changed, 78 insertions(+), 59 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0794813a97..aefb0ba6ea 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_LINUX_TOOLS_BPFTOOL
+	bool "bpftool was moved"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BPFTOOL
+	help
+	  The linux-tools bpftool build has been moved out
+	  of the linux-tools package.
+
 config BR2_TARGET_UBOOT_NEEDS_PYTHON2
 	bool "host-python 2.7 support for U-Boot was removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 55fd9344ef..bcfcacb91d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1279,6 +1279,7 @@ F:	configs/pine64_sopine_defconfig
 
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/apcupsd/
+F:	package/bpftool/
 F:	package/exfatprogs/
 F:	package/gensio/
 F:	package/lua-std-debug/
diff --git a/package/Config.in b/package/Config.in
index 1a9f3e29d8..7aff9e7cb7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -86,6 +86,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/babeltrace2/Config.in"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
+	source "package/bpftool/Config.in"
 	source "package/cache-calibrator/Config.in"
 	source "package/clinfo/Config.in"
 	source "package/coremark/Config.in"
diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
new file mode 100644
index 0000000000..39475aa962
--- /dev/null
+++ b/package/bpftool/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_BPFTOOL
+	bool "bpftool"
+	depends on !BR2_nios2 # binutils
+	depends on BR2_USE_WCHAR # binutils, elfutils
+	depends on !BR2_STATIC_LIBS # elfutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	select BR2_PACKAGE_BINUTILS
+	select BR2_PACKAGE_ELFUTILS
+	help
+	  bpftool is a tool for for inspection and simple manipulation
+	  of eBPF programs and maps.
+
+comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
+	depends on !BR2_nios2
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/bpftool/bpftool.hash b/package/bpftool/bpftool.hash
new file mode 100644
index 0000000000..c7d4ae250e
--- /dev/null
+++ b/package/bpftool/bpftool.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  c868cb85bf44195ec6cd20649c3db4f7aff64a38d950a1c2911d981fb2d7042c  bpftool-a7f0e7f057283ae8af3de4578bcb8b7ee80b7144-br1.tar.gz
+sha256  7c588754d5e81e92e2a12e47cf78949d485c9c22b4850f12d21b3835c85947d1  LICENSE
+sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0
diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
new file mode 100644
index 0000000000..4276f91958
--- /dev/null
+++ b/package/bpftool/bpftool.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# bpftool
+#
+################################################################################
+
+BPFTOOL_VERSION = a7f0e7f057283ae8af3de4578bcb8b7ee80b7144
+BPFTOOL_SITE = https://github.com/libbpf/bpftool
+BPFTOOL_SITE_METHOD = git
+BPFTOOL_GIT_SUBMODULES = YES
+BPFTOOL_LICENSE = GPL-2.0, BSD-2-Clause
+BPFTOOL_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.GPL-2.0
+BPFTOOL_DEPENDENCIES = binutils elfutils
+HOST_BPFTOOL_DEPENDENCIES = host-elfutils host-pkgconf host-zlib
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+BPFTOOL_DEPENDENCIES += libcap
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+BPFTOOL_DEPENDENCIES += zlib
+endif
+
+define BPFTOOL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/src
+endef
+
+define HOST_BPFTOOL_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/src
+endef
+
+define BPFTOOL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/src install DESTDIR="$(TARGET_DIR)" prefix=/usr
+endef
+
+define HOST_BPFTOOL_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/src install DESTDIR="$(HOST_DIR)" prefix=/usr
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 28641dccdd..f459b41762 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -5,28 +5,6 @@ menu "Linux Kernel Tools"
 config BR2_PACKAGE_LINUX_TOOLS
 	bool
 
-config BR2_PACKAGE_LINUX_TOOLS_BPFTOOL
-	bool "bpftool"
-	depends on !BR2_nios2 # binutils
-	depends on BR2_USE_WCHAR # binutils, elfutils
-	depends on !BR2_STATIC_LIBS # elfutils
-	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
-	select BR2_PACKAGE_LINUX_TOOLS
-	select BR2_PACKAGE_BINUTILS
-	select BR2_PACKAGE_ELFUTILS
-	help
-	  bpftool is a tool for for inspection and simple manipulation
-	  of eBPF programs and maps.
-
-	  These tools are available only from kernel version 4.15.
-
-comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
-	depends on !BR2_nios2
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
-
 config BR2_PACKAGE_LINUX_TOOLS_CPUPOWER
 	bool "cpupower"
 	select BR2_PACKAGE_LINUX_TOOLS
diff --git a/package/linux-tools/linux-tool-bpftool.mk.in b/package/linux-tools/linux-tool-bpftool.mk.in
deleted file mode 100644
index 0c4d3693a3..0000000000
--- a/package/linux-tools/linux-tool-bpftool.mk.in
+++ /dev/null
@@ -1,37 +0,0 @@
-################################################################################
-#
-# bpftool
-#
-################################################################################
-
-LINUX_TOOLS += bpftool
-
-BPFTOOL_DEPENDENCIES = binutils elfutils
-
-ifeq ($(BR2_PACKAGE_LIBCAP),y)
-BPFTOOL_DEPENDENCIES += libcap
-endif
-
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-BPFTOOL_DEPENDENCIES += zlib
-endif
-
-BPFTOOL_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
-
-define BPFTOOL_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/bpf/bpftool/Makefile >/dev/null 2>&1 ; then \
-		echo "Your kernel version is too old and does not have install section in the bpf tools." ; \
-		echo "At least kernel 4.15 must be used." ; \
-		exit 1 ; \
-	fi
-
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/bpf/bpftool \
-		$(BPFTOOL_MAKE_OPTS)
-endef
-
-define BPFTOOL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/bpf/bpftool \
-		$(BPFTOOL_MAKE_OPTS) \
-		DESTDIR=$(TARGET_DIR) \
-		install
-endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
