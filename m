Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23913C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C774F40A60;
	Fri,  4 Sep 2026 16:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-phroZCwJof; Fri,  4 Sep 2026 16:22:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A123F40A61
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538934;
	b=IhQ/7eh1SRc24SfjKBDK/YZimK9S+hAkAGcG8/uy2L5JxVvNEF5Uhl3n0CHh/n8POuR+
	 D1NcWm//tVOf0vDcdHQ8jF0R42gy5oHK0ZfvbwEO3T3a8W84Mh6jNnK6sYNy1WkYJbfpI
	 4vdH/jX5sacPsylojpgKF5dCdHj1KPcei9K/JJNR1dVMvPcRH6QFSewTSBCfUL+vPUCET
	 550sNVievFU+TzvOUsLFQwG7gCZp8IBB1uLl+d7fSNTDf2vReBeKWS7s5smT/81gdcdKm
	 /BxAFjZwX9JsEBcCjXE3Fuxb+5Pvla5aL3BEOrQxpav7HAJ5Yg+cFz1JpgtPNnkIY5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538934;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WuwVvCDCaZa3eAdYAm3NImeA7CZUp8yTzrbQXnx+nsk=;
	b=d6HMdTecGF3okFW6vCLL8HSJOQTAqnoxzBgAA8GYbulc+a/Z8c8GgoAb/IbRofVcBc+K
	 //QH7Z/ZjprLqmYGZFq7sr9TT1Uf7U4nP9dDPRqUme+qtQ5G0AlWNqUJlIyU30QEJ22lN
	 ahziSj6PLBsVXyqjGm+D2gNjH9vzOmdQp1QGSkX4UVZktXbcuAeX58/eAMoAEzBMlczgs
	 vvT1FB1cJWG/OyLMjrH/aYzqkGZ8M3upG8KzC3Y7AQxYeLFI7HVXkwYSXci/TQ0w94kZ7
	 t66YsK2MKD6o3Bb6EL9W44wAajf51HFX2TM4r7vi6vJmTesF/9201InBm+H5uLhgO8w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538934;
	bh=WuwVvCDCaZa3eAdYAm3NImeA7CZUp8yTzrbQXnx+nsk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZxtPNZd0LjskNoiqeUH+1TAc3PzePVQXof84iERoBJ9k4IejgLfuU+VEo9tpCO5i3
	 A0MlRv+78icBXMtkmc9e2EicxCbAjraNDGw+I+4/9eM6GglBziv77g7xtlMGyZkidN
	 WTmleZcfk89E/yeWNYsunpCHHUBNKfLBF8XgVIlUyF/72Hr5/ns6sza7sm7I1BCkhW
	 CPuuN8eQ1gRPOI2wkoHW04pLSmTUsiFpUAgtOS5cB13EJs4KvmiAV+N6nYzY/oKlzr
	 1neoj+M/0Q5QQGvISTrLiRSmS4dR/vwqiREgvVuYHRazm/ZBb375NSf7ED236PxHMx
	 QAmLwz5bIe8Wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A123F40A61;
	Fri,  4 Sep 2026 16:22:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E8BFF14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E958440B03
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5tNDdUv5Lvo for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0E30E40A60
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=Zv0zoEzQNS+cAbPoWlTMfBuSDnZIUvrnbxb/plIAaG+sHupFnOAjVTKw6fXGXLGAhDLE
 bZANiWWE8MseO5EXX3CNIXi2q8k76QV18IXY7aCKJtTDdSfCsiTI2SvCbTxi3135tFt4K
 RRXw5BFLJBAUivHit2O2FIXdVelP+X71tS7WSluL752Ft1cZMN2hJlXmQEIL4Ux5PK1mR
 KjbYSl6OgtTa1sgDiYrgS1M+3ah88EeH7SkaBKd7pU1ozfnqJbA7o+2rrqOMuMHMwT4cu
 Tj6xwMpqxXWcJBVd55qmAhELdivPYFuRGILOoytPr/H/oRC+tFcAy2hZnP8x/XZHRHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4GIRTGjAA2ax4Q8eJyZA5F41iIk7VKXxAcUPpcvq43I=;
 b=TfTxr1k3AYDQMIHb1Vo/z70KYHJnLp7ZDaw34o1v9vWhYZyA0YTRYDctoJwd4xTndo0f
 8iCu4cpVYQjnHsspmz9Gr3apQcXow+x5nnMQbJecWOFAJgrxmT3x+ntsJEh+ufnNllZ1l
 72Q+nMfgv+NOzZ+4PA/eBi8Vu4AnVk3KJkQmTbJRVZRnrsngVuwNgxv9pHkQmD3IhTUIg
 +9rRelfMCzx4aqlfxglTEiYXJ8vzvDrLhC1Qb1ZsqZ/Egqfq4c5EB4jRZjP+HRoRjcMfY
 wPMiybO12gdQzY3xgBNs8OflW97zHjh6O8W0AUAKrj4lhTAKXcRvfQEyBe7kywa5TiA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E30E40A60
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E17F94CE0; Fri,  4 Sep 2026 16:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Aug 2026 21:52:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0c0208e1bc7ee83eb5a058b6c20b5e2ec6e3c1e
X-Git-Newrev: 3d6c68d625cf80cc9a9cf4ce1058248fcfc413a7
X-Patchwork-Hint: ignore
Message-Id: <20260904162106.7E17F94CE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/heaptrack: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3d6c68d625cf80cc9a9cf4ce1058248fcfc413a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add heaptrack, a memory allocation tracer toolkit.

This implementation builds all the command line components, not the
heaptrack_gui graphical visualization program.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                      |  2 ++
 package/Config.in                               |  1 +
 package/heaptrack/Config.in                     | 39 +++++++++++++++++++++++
 package/heaptrack/heaptrack.hash                | 10 ++++++
 package/heaptrack/heaptrack.mk                  | 26 +++++++++++++++
 support/testing/tests/package/test_heaptrack.py | 42 +++++++++++++++++++++++++
 6 files changed, 120 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 98c9ee55d3..3a288afb1a 100644
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
index 6058800682..307f7ce86a 100644
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
index 0000000000..a7ef6f0970
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
index 0000000000..6ad9619f23
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
index 0000000000..6ae49ba1a8
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
index 0000000000..be353f8918
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
