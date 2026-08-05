Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E5EC55174
	for <buildroot@archiver.kernel.org>; Wed,  5 Aug 2026 16:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA98D605F7;
	Wed,  5 Aug 2026 16:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o39Dkr-08QdI; Wed,  5 Aug 2026 16:09:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCE7E607B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785946149;
	bh=3uZOIeLt16035c+MuxNtFpcDj1aFJ9rlhbJl0tEamW4=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Z/lny08vBvIPAj7CJTqQd+3vnaGRsT5fF7jgwVG52vi0Az2LWi5rGw93aZ105WK51
	 CmUeOdF54874PGZQqUNOPYaGhSizK04Am8UfxVy+rVpi3mikNDx5gMbEziuSmxYg7c
	 W9h9FH+9NuWXUn72rjr6/R3kFkjsU9am8XsZaTF4XgtfOy5Ww5JovRPpLQg2M7N4AP
	 pkGLdrRmZQ8nO87ldeeSo3fn+xlQldJ7sUmdvQGXx9q19yU5XWw8kTEDSPNIOW85yJ
	 PndFASzyzyDcEyAHKiAjokRIc3nwizSqGAqolq7CEsYj44h5zYkFxvpsl0WFXvdll8
	 LVi3/CShksQtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCE7E607B4;
	Wed,  5 Aug 2026 16:09:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A276E218
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 16:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9444180C4E
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 16:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxSJDGGqXVAl for <buildroot@buildroot.org>;
 Wed,  5 Aug 2026 16:09:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 667FF80C36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 667FF80C36
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 667FF80C36
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 16:09:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9772D1A1445
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 16:09:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6DAA3602AB
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 16:09:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4252211C34E77; 
 Wed,  5 Aug 2026 18:09:00 +0200 (CEST)
Date: Wed, 05 Aug 2026 18:08:47 +0200
MIME-Version: 1.0
Message-Id: <20260805-heaptrack-v2-1-64633668959e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBAAf4Xs2RoKFIgn/8NwKMtW1gclbW00h
 H+X4tXjJJOZBTw5Jg+nbAFHkT3baYPikAGOerqS4GFjKPKizptSipH0HJzGu8ChMrVpDRK2sPm
 zI8PvvXXpfuxf/Y0wpEAyRvbBus8+izJ5/7pRCilQqbaRCvsKy3NvbXjwdET7hG5d1y9z1vzqt
 gAAAA==
X-Change-ID: 20260731-heaptrack-cd4f6f8fcec8
To: buildroot@buildroot.org
Cc: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1785946141; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=SaDUkp5nZ/bQ8XjrZ5rcg52dnpvcbNPgUMNbaY4GW0E=;
 b=v22qhdj/S7g6ZUpSeZGAxMVK3NWJvxymqlGFTY2Zm1wZFn6VvklZr3mP7U9WUAi1QWwMbf
 ZYkq3g5dSWwnKROcadKqoJ1cUOdEaNBAj4qA80pOsVx41EVdoP9j6I6mReh5AHPcMh66Hx
 sN2fFDewoxN8BLJWgX1p+wcY4IxUzEhR5twS+F5CIe2t1sq8IlSFvO0DxUCnjNX2M/8KKP
 Av64+oAkrnlg449yIIIvkY5eMBB1tXNXpp3B0j+ek92EwObpUYb9zuav1owW0L/s1jsEzu
 KiPn4Ot43IQAI7+yACFvpd+HrWRgHCUWN1ArMMDwsjcHTdl3uVHFAxUrjvMpPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=v22qhdj/
Subject: [Buildroot] [PATCH v2] package/heaptrack: new package
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
Changes in v2:
- Various improvements suggested by Thomas
- Link to v1: https://patch.msgid.link/20260731-heaptrack-v1-1-c558715cb4c3@bootlin.com
---
Changes in v2:
- removed unnecessary depends on BR2_LINUX_KERNEL
- added missing recursive 'depends on'
- sort alphabetically the 'select' lines
- completed 'depends on' list for comment line
- Add "Locally calculated" for the hash
- Add hashes of license files
- Use single tab for indentation
- Add test case
- Link to v1: https://lore.kernel.org/all/20260731-heaptrack-v1-1-c558715cb4c3@bootlin.com/
---
 DEVELOPERS                                      |  2 ++
 package/Config.in                               |  1 +
 package/heaptrack/Config.in                     | 37 +++++++++++++++++++++++
 package/heaptrack/heaptrack.hash                | 10 +++++++
 package/heaptrack/heaptrack.mk                  | 26 ++++++++++++++++
 support/testing/tests/package/test_heaptrack.py | 40 +++++++++++++++++++++++++
 6 files changed, 116 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 56dd9f3943d1..bef37f884b27 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2189,6 +2189,7 @@ F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	package/agentpp/
 F:	package/exim/
+F:	package/heaptrack/
 F:	package/libpjsip/
 F:	package/linux-tools/linux-tool-usbtools.mk.in
 F:	package/qpid-proton/
@@ -2197,6 +2198,7 @@ F:	package/snmppp/
 F:	package/stm32flash/
 F:	package/unzip/
 F:	support/legal-info/
+F:	support/testing/tests/package/test_heaptrack.py
 
 N:	Lucas De Marchi <lucas.de.marchi@gmail.com>
 F:	package/fswebcam/
diff --git a/package/Config.in b/package/Config.in
index 2e845f98db43..f9b2ed615bf3 100644
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
index 000000000000..12e33ff2c219
--- /dev/null
+++ b/package/heaptrack/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_HEAPTRACK
+	bool "heaptrack"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libunwind, elfutils
+	depends on BR2_USE_WCHAR # boost, elfutils
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS # libunwind
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libunwind
+	depends on !BR2_STATIC_LIBS # libunwind, elfutils
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
+comment "heaptrack needs a toolchain w/ C++, threads, wchar, gcc >= 4.9, dynamic library"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| BR2_STATIC_LIBS
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
index 000000000000..f9b4639b3aed
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
+HEAPTRACK_DEPENDENCIES = host-pkgconf linux boost libunwind zlib elfutils
+HEAPTRACK_CONF_OPTS += -DHEAPTRACK_BUILD_GUI=OFF -DHEAPTRACK_BUILD_PRINT=ON
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+HEAPTRACK_DEPENDENCIES += zstd
+endif
+
+$(eval $(cmake-package))
diff --git a/support/testing/tests/package/test_heaptrack.py b/support/testing/tests/package/test_heaptrack.py
new file mode 100644
index 000000000000..de3d5441efa4
--- /dev/null
+++ b/support/testing/tests/package/test_heaptrack.py
@@ -0,0 +1,40 @@
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

---
base-commit: d54756753d5328474465d6d2102b151f94bc8e7e
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
