Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1D8C5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 12:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BC3B40666;
	Mon, 24 Aug 2026 12:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvY9VgQCmPfE; Mon, 24 Aug 2026 12:55:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787576156;
	bh=ETsNTMkhlhH5otil6J/IlvYqm0StSecm6WJwC47sjbs=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=CD02hjvv2NZaRQLCOrBns7cgMjH6O/GesRavZ+upKCsQI3rakAw0ZFXXWm++2kHgE
	 aleltMJ9lBiUteT3t9oDortRrSJ4TUBLnLIz1Prh4LQ/Ry8USYQwXKJBeWF0WxrLBE
	 6MDQgfnqU1Fgnqh8I+ol/EhmDyag24xZCd/IlR7reQeqipNcqVzxrD6vcqDyJAizer
	 rBtkKWXrHKlzgBwEGShJxT7VF0pszP8oc8EJRpqZbEwfUtZVixLmvjXJ2nw7P7wEmM
	 g4XzdanZV/CheNax5u4fS48b/4LY+dP0pKWmAJCP4qOj5Uwt3+8bqLM4GchbJRj4Y/
	 FkLDmlv+ywxqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E16340659;
	Mon, 24 Aug 2026 12:55:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 566B4386
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 12:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4804080CC5
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 12:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0qPw-6EdZCk for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 12:55:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC9D580CB2
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 12:55:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6DF1E4E413A5;
 Mon, 24 Aug 2026 12:55:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3BFAE5FFC1;
 Mon, 24 Aug 2026 12:55:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0FCCF11C79421; 
 Mon, 24 Aug 2026 14:55:47 +0200 (CEST)
Date: Mon, 24 Aug 2026 14:55:21 +0200
MIME-Version: 1.0
Message-Id: <20260824-heaptrack-v5-1-a8ac25daa1d9@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTW7CMBQE4KsgrzHyfwyr3qNi4bw8N24hRnaIW
 qHcHScsSJQuR5pv5kEypoCZnHYPknAIOcSuBL3fEWhd94U0NCUTwYRhleS0RXfrk4MfCo3yxls
 PCJaU/i2hD7/z1uf5lfO9/kbop4Gp0Ybcx/Q3nw186v23O3DKKWhtK66hViA/6hj7S+gOEK9kW
 h7E21qml1YUa5SR0hh71EfcWrmwfPUri60qwS1zBo1WW6sWVqysKpZxL6RwNTTQrO04jk/3e+p
 PagEAAA==
X-Change-ID: 20260731-heaptrack-cd4f6f8fcec8
To: buildroot@buildroot.org
Cc: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Julien Olivain <ju.o@free.fr>, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v5] package/heaptrack: new package
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add heaptrack, a memory allocation tracer toolkit.

This implementation builds all the command line components, not the
heaptrack_gui graphical visualization program.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v5:
- Require gcc >= 8 (std::filesystem)
- Test-build with 'test-pkg -a' both with and without BR2_PACKAGE_ZSTD
- Link to v4: https://patch.msgid.link/20260821-heaptrack-v4-1-01f232abcdcd@bootlin.com

Changes in v4:
- Disable for uclibc (dlmopen)
- Sort _DEPENDENCIES
- Use '=' instead of '+=' on first assignment
- Add more complex test cases
- Runtime tested on:
   - qemu_arm_vexpress, Bootlin armv7-eabihf glibc stable 2025.08-1 toolchain
   - qemu_aarch64_virt, Bootlin aarch64 musl bleeding-edge 2025.08-1 toolchain
     - Note: heaptrack_print for 'ls -la /' OOMs with the default qemu cmdline;
       adding '-m 512' it worked (the qemu default is 128 MB of RAM)
- Link to v3: https://patch.msgid.link/20260811-heaptrack-v3-1-772180a6e654@bootlin.com

Changes in v3:
- Removed 'linux' from _DEPENDENCIES
- Link to v2: https://patch.msgid.link/20260805-heaptrack-v2-1-64633668959e@bootlin.com

Changes in v2:
- removed unnecessary depends on BR2_LINUX_KERNEL
- added missing recursive 'depends on'
- sort alphabetically the 'select' lines
- completed 'depends on' list for comment line
- Add "Locally calculated" for the hash
- Add hashes of license files
- Use single tab for indentation
- Add test case
- Update DEVELOPERS file
- Link to v1: https://patch.msgid.link/20260731-heaptrack-v1-1-c558715cb4c3@bootlin.com
---
 DEVELOPERS                                      |  2 ++
 package/Config.in                               |  1 +
 package/heaptrack/Config.in                     | 39 +++++++++++++++++++++++
 package/heaptrack/heaptrack.hash                | 10 ++++++
 package/heaptrack/heaptrack.mk                  | 26 +++++++++++++++
 support/testing/tests/package/test_heaptrack.py | 42 +++++++++++++++++++++++++
 6 files changed, 120 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 98c9ee55d31b..3a288afb1a00 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2192,6 +2192,7 @@ F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	package/agentpp/
 F:	package/exim/
+F:	package/heaptrack/
 F:	package/libpjsip/
 F:	package/linux-tools/linux-tool-usbtools.mk.in
 F:	package/qpid-proton/
@@ -2200,6 +2201,7 @@ F:	package/snmppp/
 F:	package/stm32flash/
 F:	package/unzip/
 F:	support/legal-info/
+F:	support/testing/tests/package/test_heaptrack.py
 
 N:	Lucas De Marchi <lucas.de.marchi@gmail.com>
 F:	package/fswebcam/
diff --git a/package/Config.in b/package/Config.in
index 6058800682b4..307f7ce86a3e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -106,6 +106,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/fwts/Config.in"
 	source "package/gdb/Config.in"
 	source "package/google-breakpad/Config.in"
+	source "package/heaptrack/Config.in"
 	source "package/hyperfine/Config.in"
 	source "package/iozone/Config.in"
 	source "package/k3conf/Config.in"
diff --git a/package/heaptrack/Config.in b/package/heaptrack/Config.in
new file mode 100644
index 000000000000..a7ef6f097073
--- /dev/null
+++ b/package/heaptrack/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_HEAPTRACK
+	bool "heaptrack"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libunwind, elfutils
+	depends on BR2_USE_WCHAR # boost, elfutils
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS # libunwind
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
+	depends on !BR2_STATIC_LIBS # libunwind, elfutils
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no dlmopen() support
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_IOSTREAMS
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	# For heaptrack_print
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_LIBUNWIND
+	select BR2_PACKAGE_ZLIB
+	help
+	  Heaptrack traces all memory allocations and annotates these
+	  events with stack traces. Dedicated analysis tools then allow
+	  you to interpret the heap memory profile to find hotspots,
+	  memory leaks, allocation hotspots and temporary allocations.
+
+	  Zstandard offers better (de)compression performance compared
+	  with gzip/zlib, making heaptrack faster and datafiles smaller,
+	  so enabling BR2_PACKAGE_ZSTD is recommended.
+
+	  https://apps.kde.org/heaptrack/
+
+comment "heaptrack needs a glibc or musl toolchain w/ C++, threads, wchar, gcc >= 8, dynamic library"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8 \
+		|| BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/heaptrack/heaptrack.hash b/package/heaptrack/heaptrack.hash
new file mode 100644
index 000000000000..6ad9619f23b9
--- /dev/null
+++ b/package/heaptrack/heaptrack.hash
@@ -0,0 +1,10 @@
+# Locally calculated
+sha256  e69de2209ab0e16c8e26c1b60feeb852b3a88e46a4f16588c08254e1bd81a183  heaptrack-3e6cce3d210a6672fe6f92de0bed567c49b7a9c5-git4.tar.gz
+
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-only.txt
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
+sha256  6aee5c3d7c55f3d8ff45b1245b8427efaf0a59e9c52d7139c79bff7056e9a611  LICENSES/LGPL-2.1-or-later.txt
+sha256  84c6ef3ea9e3254a54d0acf5d3e0c61ae011b8fef7dd6940591cf060e6380a8f  LICENSES/BSL-1.0.txt
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
+sha256  074e6e32c86a4c0ef8b3ed25b721ca23aca83df277cd88106ef7177c354615ff  LICENSES/Apache-2.0.txt
+sha256  42639b2e5507163d35069be166e37a784f48a5f17e3577c16eb48fab215247cd  LICENSES/BSD-3-Clause.txt
diff --git a/package/heaptrack/heaptrack.mk b/package/heaptrack/heaptrack.mk
new file mode 100644
index 000000000000..6ae49ba1a88f
--- /dev/null
+++ b/package/heaptrack/heaptrack.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# heaptrack
+#
+################################################################################
+
+HEAPTRACK_SITE_METHOD = git
+HEAPTRACK_SITE = https://invent.kde.org/sdk/heaptrack.git
+HEAPTRACK_VERSION = 3e6cce3d210a6672fe6f92de0bed567c49b7a9c5
+HEAPTRACK_LICENSE = LGPL-2.1-or-later, GPL-2.0-or-later (heaptrack_interpret)
+HEAPTRACK_LICENSE_FILES = \
+	LICENSES/LGPL-2.1-only.txt \
+	LICENSES/GPL-2.0-or-later.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/BSL-1.0.txt \
+	LICENSES/MIT.txt \
+	LICENSES/Apache-2.0.txt \
+	LICENSES/BSD-3-Clause.txt
+HEAPTRACK_DEPENDENCIES = host-pkgconf boost elfutils libunwind zlib
+HEAPTRACK_CONF_OPTS = -DHEAPTRACK_BUILD_GUI=OFF -DHEAPTRACK_BUILD_PRINT=ON
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+HEAPTRACK_DEPENDENCIES += zstd
+endif
+
+$(eval $(cmake-package))
diff --git a/support/testing/tests/package/test_heaptrack.py b/support/testing/tests/package/test_heaptrack.py
new file mode 100644
index 000000000000..be353f89185b
--- /dev/null
+++ b/support/testing/tests/package/test_heaptrack.py
@@ -0,0 +1,42 @@
+import os
+
+import infra.basetest
+
+
+class TestHeaptrack(infra.basetest.BRTest):
+    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
+    # not include BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+    # needed by heaptrack.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.42"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_HEAPTRACK=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_ROOTFS_CPIO=y
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "256M",
+                                    "-initrd", cpio_file])
+
+        self.emulator.login()
+
+        self.assertRunOk("/usr/bin/heaptrack --version")
+        self.assertRunOk("/usr/bin/heaptrack /bin/busybox")
+        self.assertRunOk("/usr/bin/heaptrack -o /tmp/ls.heaptrack ls -al /")
+        self.assertRunOk("/usr/bin/heaptrack_print --file /tmp/ls.heaptrack.gz")

---
base-commit: 7aba8c3f90da93d138493fe4eb24953731b1e7a2
change-id: 20260731-heaptrack-cd4f6f8fcec8

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
