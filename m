Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CC9E7DEE3
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 096A760B60;
	Mon,  2 Feb 2026 14:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bK83Oj047GOi; Mon,  2 Feb 2026 14:24:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BE8460722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770042251;
	bh=RP+aWLucdT0gkpZkoqzAsFKZU/jIKAYH/0+8/H+rNVo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Kgri5JBBchquqBRJAQ0gkhekIExHlqsNb7VvtKc6+A05LzoQKrE5szOXVBoRPyqey
	 /rHY0wB0zkaXfmjtnX9b5bczADUaO6R9iM5B33qe6C/hcCiX0oT8aJgqmIuu9407qS
	 xNT86ZLC5ZzRVakDY/o4FtrUEksFkRQCZxqR4G3dlLbbKAnVbY2333QdihFQhQPQTh
	 dafAIpsrFm58hLrO3LOZ8WcwKPdoAAQrZ/QWKYeie0cHjY7OKuG12tyiHpA7Y3/Jcq
	 YSChmucQQVBcNCx+LtWHlUtIi7dfw/y8KjdcGiy2TMkWfpUQ9dCNZoiw7B2ek1CKlv
	 ks+CsxNhqJGxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BE8460722;
	Mon,  2 Feb 2026 14:24:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D67B23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B61481E5C
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ari4id7-u2QN for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:24:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.90.104.144;
 helo=esa1.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1197781EA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1197781EA9
Received: from esa1.hc555-34.eu.iphmx.com (esa1.hc555-34.eu.iphmx.com
 [23.90.104.144])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1197781EA9
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:24:04 +0000 (UTC)
X-CSE-ConnectionGUID: PcSNz/pGSXqwTCAUWzxd/w==
X-CSE-MsgGUID: KqhRjCBySwWL9HGDHkN3WQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
 by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 16:24:02 +0200
X-CSE-ConnectionGUID: xOQ5dWrbSl2ruoP6BMm1Bw==
X-CSE-MsgGUID: C3W+h/7hRSaDwPuPnMgxtQ==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.6])
 by ces04_data.me-crop.lan with SMTP; 02 Feb 2026 16:26:10 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Mon, 02 Feb 2026 16:24:01 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Mon,  2 Feb 2026 16:23:52 +0200
Message-ID: <20260202142359.2577937-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1770042245; x=1801578245;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n9kR+AoMS7ksGvJma2eQI9ZKW/hLQE+vgXpuceT0TAg=;
 b=tFPer4cPiYkGcLA4SI7EFhQRJS/252ehY5M+DLPCUeQzE10SwaFiqt4o
 8UvsvmdmcIPs6FiO7qzNr/bXsmXL/3D78+jWB21lks5Q1rYdfUb+Ht/it
 qZRP0sFVV68ldhVQ818iplZjU1b0RUHf2inkBl7MD2zZVISvZtZpulg3P
 27lq6YnVMrljYtoXA7rSTHwHyrxjVbABJ3p4Zohm+IUe32rS3OTW1iXv+
 8JplRiKXfrrMnzQ8lQxo5PXR5jt3Ftne1FB2XXfO6ntPCCA/7KUbJk+ja
 eJIHZoiD88e0V2d6RwXvT868V2yTw5QfrjtDePOcLeGsDGADQ0zirw4xG
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 1/3] package/binutils-bpf: new host package
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: multipart/mixed; boundary="===============2481170720350905577=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2481170720350905577==
Content-Type: text/plain; charset=ascii
Content-Transfer-Encoding: 8bit

This adds the support for host binutils for BPF target, allowing to build
BPF objects.

Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 package/Config.in.host                        |   1 +
 .../binutils-bpf/2.43.1/0001-sh-conf.patch    |  50 ++
 .../0002-poison-system-directories.patch      | 307 +++++++
 .../2.43.1/0003-objdump-memleak.patch         |  31 +
 ...gnu23-compatibility-wrt-static_asser.patch |  90 ++
 ...ngs-when-building-gprofng-with-Clang.patch | 801 ++++++++++++++++++
 ...gnu23-compatibility-wrt-unprototyped.patch | 619 ++++++++++++++
 ...007-gprofng-fix-build-with-std-gnu23.patch | 199 +++++
 package/binutils-bpf/2.44/0001-sh-conf.patch  |  50 ++
 .../2.44/0002-poison-system-directories.patch | 310 +++++++
 .../2.44/0003-objdump-memleak.patch           |  31 +
 .../binutils-bpf/2.45.1/0001-sh-conf.patch    |  50 ++
 .../0002-poison-system-directories.patch      | 310 +++++++
 package/binutils-bpf/Config.in.host           |  27 +
 package/binutils-bpf/binutils-bpf.hash        |   8 +
 package/binutils-bpf/binutils-bpf.mk          |  77 ++
 16 files changed, 2961 insertions(+)
 create mode 100644 package/binutils-bpf/2.43.1/0001-sh-conf.patch
 create mode 100644 package/binutils-bpf/2.43.1/0002-poison-system-directories.patch
 create mode 100644 package/binutils-bpf/2.43.1/0003-objdump-memleak.patch
 create mode 100644 package/binutils-bpf/2.43.1/0004-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch
 create mode 100644 package/binutils-bpf/2.43.1/0005-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch
 create mode 100644 package/binutils-bpf/2.43.1/0006-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch
 create mode 100644 package/binutils-bpf/2.43.1/0007-gprofng-fix-build-with-std-gnu23.patch
 create mode 100644 package/binutils-bpf/2.44/0001-sh-conf.patch
 create mode 100644 package/binutils-bpf/2.44/0002-poison-system-directories.patch
 create mode 100644 package/binutils-bpf/2.44/0003-objdump-memleak.patch
 create mode 100644 package/binutils-bpf/2.45.1/0001-sh-conf.patch
 create mode 100644 package/binutils-bpf/2.45.1/0002-poison-system-directories.patch
 create mode 100644 package/binutils-bpf/Config.in.host
 create mode 100644 package/binutils-bpf/binutils-bpf.hash
 create mode 100644 package/binutils-bpf/binutils-bpf.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 2160a0f558..55c52078a9 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -10,6 +10,7 @@ menu "Host utilities"
 	source "package/arm-gnu-toolchain/Config.in.host"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
+	source "package/binutils-bpf/Config.in.host"
 	source "package/bmap-tools/Config.in.host"
 	source "package/bmap-writer/Config.in.host"
 	source "package/bootgen/Config.in.host"
diff --git a/package/binutils-bpf/2.43.1/0001-sh-conf.patch b/package/binutils-bpf/2.43.1/0001-sh-conf.patch
new file mode 100644
index 0000000000..c381017850
--- /dev/null
+++ b/package/binutils-bpf/2.43.1/0001-sh-conf.patch
@@ -0,0 +1,50 @@
+From d71fb5a9999ee7c8963342caa0d5cbb16872ab07 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:38:13 +0100
+Subject: [PATCH] sh-conf
+
+Likewise, binutils has no idea about any of these new targets either, so we
+fix that up too.. now we're able to actually build a real toolchain for
+sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more
+inept targets than that one, really. Go look, I promise).
+
+Upstream: N/A [Buildroot specific]
+
+[Romain: rebase on top of 2.32]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Thomas: rebase on top of 2.29, in which sh64 support was removed.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 670684d83d1..967c6708a0c 100755
+--- a/configure
++++ b/configure
+@@ -4042,7 +4042,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/configure.ac b/configure.ac
+index 88b4800e298..2c8d08ff6ec 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1269,7 +1269,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+-- 
+2.43.0
+
diff --git a/package/binutils-bpf/2.43.1/0002-poison-system-directories.patch b/package/binutils-bpf/2.43.1/0002-poison-system-directories.patch
new file mode 100644
index 0000000000..8da0ec31df
--- /dev/null
+++ b/package/binutils-bpf/2.43.1/0002-poison-system-directories.patch
@@ -0,0 +1,307 @@
+From 00f6b0a7d31085831429834b2bc8f511b8fab6ce Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:45:38 +0100
+Subject: [PATCH] poison-system-directories
+
+Patch adapted to binutils 2.23.2 and extended to use
+BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
+
+[Waldemar: rebase on top of 2.43]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Waldemar: rebase on top of 2.39]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: rebase on top of 2.33.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Gustavo: adapt to binutils 2.25]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+Upstream-Status: Inappropriate [distribution: codesourcery]
+Upstream: N/A [Buildroot specific]
+
+Patch originally created by Mark Hatle, forward-ported to
+binutils 2.21 by Scott Garman.
+
+purpose:  warn for uses of system directories when cross linking
+
+Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
+
+2008-07-02  Joseph Myers  <joseph@codesourcery.com>
+
+    ld/
+    * ld.h (args_type): Add error_poison_system_directories.
+    * ld.texinfo (--error-poison-system-directories): Document.
+    * ldfile.c (ldfile_add_library_path): Check
+    command_line.error_poison_system_directories.
+    * ldmain.c (main): Initialize
+    command_line.error_poison_system_directories.
+    * lexsup.c (enum option_values): Add
+    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES.
+    (ld_options): Add --error-poison-system-directories.
+    (parse_args): Handle new option.
+
+2007-06-13  Joseph Myers  <joseph@codesourcery.com>
+
+    ld/
+    * config.in: Regenerate.
+    * ld.h (args_type): Add poison_system_directories.
+    * ld.texinfo (--no-poison-system-directories): Document.
+    * ldfile.c (ldfile_add_library_path): Check
+    command_line.poison_system_directories.
+    * ldmain.c (main): Initialize
+    command_line.poison_system_directories.
+    * lexsup.c (enum option_values): Add
+    OPTION_NO_POISON_SYSTEM_DIRECTORIES.
+    (ld_options): Add --no-poison-system-directories.
+    (parse_args): Handle new option.
+
+2007-04-20  Joseph Myers  <joseph@codesourcery.com>
+
+    Merge from Sourcery G++ binutils 2.17:
+
+    2007-03-20  Joseph Myers  <joseph@codesourcery.com>
+    Based on patch by Mark Hatle <mark.hatle@windriver.com>.
+    ld/
+    * configure.ac (--enable-poison-system-directories): New option.
+    * configure, config.in: Regenerate.
+    * ldfile.c (ldfile_add_library_path): If
+    ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
+    /usr/lib, /usr/local/lib or /usr/X11R6/lib.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+ ld/config.in    |  3 +++
+ ld/configure    | 14 ++++++++++++++
+ ld/configure.ac | 10 ++++++++++
+ ld/ld.h         |  8 ++++++++
+ ld/ld.texi      | 12 ++++++++++++
+ ld/ldfile.c     | 17 +++++++++++++++++
+ ld/ldlex.h      |  2 ++
+ ld/ldmain.c     |  2 ++
+ ld/lexsup.c     | 21 +++++++++++++++++++++
+ 9 files changed, 89 insertions(+)
+
+diff --git a/ld/config.in b/ld/config.in
+index f7c9da3d02a..e4fdbf6db5b 100644
+--- a/ld/config.in
++++ b/ld/config.in
+@@ -74,6 +74,9 @@
+    language is requested. */
+ #undef ENABLE_NLS
+ 
++/* Define to warn for use of native system library directories */
++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
++
+ /* Additional extension a shared object might have. */
+ #undef EXTRA_SHLIB_EXTENSION
+ 
+diff --git a/ld/configure b/ld/configure
+index 44d79c2445d..e28cea11977 100755
+--- a/ld/configure
++++ b/ld/configure
+@@ -844,6 +844,7 @@ with_lib_path
+ enable_targets
+ enable_64_bit_bfd
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1535,6 +1536,8 @@ Optional Features:
+   --enable-checking       enable run-time checks
+   --enable-targets        alternative target configurations
+   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15587,7 +15590,18 @@ else
+ fi
+ 
+ 
++# Check whether --enable-poison-system-directories was given.
++if test "${enable_poison_system_directories+set}" = set; then :
++  enableval=$enable_poison_system_directories;
++else
++  enable_poison_system_directories=no
++fi
++
++if test "x${enable_poison_system_directories}" = "xyes"; then
+ 
++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
++
++fi
+ 
+ # Check whether --enable-got was given.
+ if test "${enable_got+set}" = set; then :
+diff --git a/ld/configure.ac b/ld/configure.ac
+index bdf51a062fa..3d370ff92ce 100644
+--- a/ld/configure.ac
++++ b/ld/configure.ac
+@@ -102,6 +102,16 @@ AC_SUBST(use_sysroot)
+ AC_SUBST(TARGET_SYSTEM_ROOT)
+ AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
+ 
++AC_ARG_ENABLE([poison-system-directories],
++         AS_HELP_STRING([--enable-poison-system-directories],
++                [warn for use of native system library directories]),,
++         [enable_poison_system_directories=no])
++if test "x${enable_poison_system_directories}" = "xyes"; then
++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
++       [1],
++       [Define to warn for use of native system library directories])
++fi
++
+ dnl Use --enable-gold to decide if this linker should be the default.
+ dnl "install_as_default" is set to false if gold is the default linker.
+ dnl "installed_linker" is the installed BFD linker name.
+diff --git a/ld/ld.h b/ld/ld.h
+index 0dee944cf2a..83bd82d2a2e 100644
+--- a/ld/ld.h
++++ b/ld/ld.h
+@@ -166,6 +166,14 @@ typedef struct
+      in the linker script.  */
+   bool force_group_allocation;
+ 
++  /* If TRUE (the default) warn for uses of system directories when
++     cross linking.  */
++  bool poison_system_directories;
++
++  /* If TRUE (default FALSE) give an error for uses of system
++     directories when cross linking instead of a warning.  */
++  bool error_poison_system_directories;
++
+   /* Big or little endian as set on command line.  */
+   enum endian_enum endian;
+ 
+diff --git a/ld/ld.texi b/ld/ld.texi
+index 89e3913317a..b80cf05617f 100644
+--- a/ld/ld.texi
++++ b/ld/ld.texi
+@@ -3234,6 +3234,18 @@ string identifying the original linked file does not change.
+ Passing @code{none} for @var{style} disables the setting from any
+ @code{--build-id} options earlier on the command line.
+ 
++@kindex --no-poison-system-directories
++@item --no-poison-system-directories
++Do not warn for @option{-L} options using system directories such as
++@file{/usr/lib} when cross linking.  This option is intended for use
++in chroot environments when such directories contain the correct
++libraries for the target system rather than the host.
++
++@kindex --error-poison-system-directories
++@item --error-poison-system-directories
++Give an error instead of a warning for @option{-L} options using
++system directories when cross linking.
++
+ @kindex --package-metadata=@var{JSON}
+ @item --package-metadata=@var{JSON}
+ Request the creation of a @code{.note.package} ELF note section.  The
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index 87be885d31a..9bc7adca4bc 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -327,6 +327,22 @@ ldfile_add_library_path (const char *name, enum search_dir_source source)
+   else
+     new_dirs->name = xstrdup (name);
+ 
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++  if (command_line.poison_system_directories
++  && ((!strncmp (name, "/lib", 4))
++      || (!strncmp (name, "/usr/lib", 8))
++      || (!strncmp (name, "/usr/local/lib", 14))
++      || (!strncmp (name, "/usr/X11R6/lib", 14))))
++   {
++     if (command_line.error_poison_system_directories)
++       einfo (_("%X%P: error: library search path \"%s\" is unsafe for "
++            "cross-compilation\n"), name);
++     else
++       einfo (_("%P: warning: library search path \"%s\" is unsafe for "
++            "cross-compilation\n"), name);
++   }
++#endif
++
+   /* Accumulate script and command line sourced
+      search paths at the end of the current list.  */
+ #if BFD_SUPPORTS_PLUGINS
+diff --git a/ld/ldlex.h b/ld/ldlex.h
+index defe3fcbbb9..0ff12614926 100644
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -170,6 +170,8 @@ enum option_values
+   OPTION_CTF_VARIABLES,
+   OPTION_NO_CTF_VARIABLES,
+   OPTION_CTF_SHARE_TYPES,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+   OPTION_ERROR_EXECSTACK,
+   OPTION_NO_ERROR_EXECSTACK,
+   OPTION_WARN_EXECSTACK_OBJECTS,
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index 037099b9d37..204feedc6e3 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -347,6 +347,8 @@ main (int argc, char **argv)
+   command_line.warn_mismatch = true;
+   command_line.warn_search_mismatch = true;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = true;
++  command_line.error_poison_system_directories = false;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index 4aa0124ce2f..c4d76943821 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -648,6 +648,14 @@ static const struct ld_option ld_options[] =
+ 		   "                                <method> is: share-unconflicted (default),\n"
+ 		   "                                             share-duplicated"),
+     TWO_DASHES },
++  { {"no-poison-system-directories", no_argument, NULL,
++    OPTION_NO_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Do not warn for -L options using system directories"),
++    TWO_DASHES },
++  { {"error-poison-system-directories", no_argument, NULL,
++    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Give an error for -L options using system directories"),
++    TWO_DASHES },
+ };
+ 
+ #define OPTION_COUNT ARRAY_SIZE (ld_options)
+@@ -660,6 +668,7 @@ parse_args (unsigned argc, char **argv)
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1785,6 +1794,14 @@ parse_args (unsigned argc, char **argv)
+ 	  }
+ 	  break;
+ 
++	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
++	  command_line.poison_system_directories = false;
++	  break;
++
++	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
++	  command_line.error_poison_system_directories = true;
++	  break;
++
+ 	case OPTION_PUSH_STATE:
+ 	  input_flags.pushed = xmemdup (&input_flags,
+ 					sizeof (input_flags),
+@@ -1938,6 +1955,10 @@ parse_args (unsigned argc, char **argv)
+       command_line.soname = NULL;
+     }
+ 
++  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
++  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
++    command_line.error_poison_system_directories = true;
++
+   while (ingroup)
+     {
+       einfo (_("%P: missing --end-group; added as last command line option\n"));
diff --git a/package/binutils-bpf/2.43.1/0003-objdump-memleak.patch b/package/binutils-bpf/2.43.1/0003-objdump-memleak.patch
new file mode 100644
index 0000000000..1b1632093d
--- /dev/null
+++ b/package/binutils-bpf/2.43.1/0003-objdump-memleak.patch
@@ -0,0 +1,31 @@
+From ba6ad3a18cb26b79e0e3b84c39f707535bbc344d Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 19 Feb 2025 07:58:54 +1030
+Subject: [PATCH] PR32716, objdump -i memory leak
+
+PR binutils/32716
+* bucomm.c (display_info): Free arg.info.
+
+Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d
+
+CVE: CVE-2025-3198
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ binutils/bucomm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/binutils/bucomm.c b/binutils/bucomm.c
+index ccf54099154..d4554737db1 100644
+--- a/binutils/bucomm.c
++++ b/binutils/bucomm.c
+@@ -435,6 +435,7 @@ display_info (void)
+   if (!arg.error)
+     display_target_tables (&arg);
+ 
++  free (arg.info);
+   return arg.error;
+ }
+ 
+-- 
+2.43.5
+
diff --git a/package/binutils-bpf/2.43.1/0004-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch b/package/binutils-bpf/2.43.1/0004-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch
new file mode 100644
index 0000000000..f9b870afa2
--- /dev/null
+++ b/package/binutils-bpf/2.43.1/0004-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch
@@ -0,0 +1,90 @@
+From 8ebe62f3f0d27806b1bf69f301f5e188b4acd2b4 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 16 Nov 2024 05:03:52 +0000
+Subject: [PATCH] opcodes: fix -std=gnu23 compatibility wrt static_assert
+
+static_assert is declared in C23 so we can't reuse that identifier:
+* Define our own static_assert conditionally;
+
+* Rename "static assert" hacks to _N as we do already in some places
+  to avoid a conflict.
+
+ChangeLog:
+	PR ld/32372
+
+        * i386-gen.c (static_assert): Define conditionally.
+        * mips-formats.h (MAPPED_INT): Rename identifier.
+        (MAPPED_REG): Rename identifier.
+        (OPTIONAL_MAPPED_REG): Rename identifier.
+        * s390-opc.c (static_assert): Define conditionally.
+
+Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=8ebe62f3f0d27806b1bf69f301f5e188b4acd2b4
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+---
+ opcodes/i386-gen.c     | 2 ++
+ opcodes/mips-formats.h | 6 +++---
+ opcodes/s390-opc.c     | 2 ++
+ 3 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/opcodes/i386-gen.c b/opcodes/i386-gen.c
+index 053b66675c5..7ee8a30310c 100644
+--- a/opcodes/i386-gen.c
++++ b/opcodes/i386-gen.c
+@@ -30,7 +30,9 @@
+ 
+ /* Build-time checks are preferrable over runtime ones.  Use this construct
+    in preference where possible.  */
++#ifndef static_assert
+ #define static_assert(e) ((void)sizeof (struct { int _:1 - 2 * !(e); }))
++#endif
+ 
+ static const char *program_name = NULL;
+ static int debug = 0;
+diff --git a/opcodes/mips-formats.h b/opcodes/mips-formats.h
+index 90df7100803..c4dec6352bf 100644
+--- a/opcodes/mips-formats.h
++++ b/opcodes/mips-formats.h
+@@ -49,7 +49,7 @@
+ #define MAPPED_INT(SIZE, LSB, MAP, PRINT_HEX) \
+   { \
+     typedef char ATTRIBUTE_UNUSED \
+-      static_assert[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
++      static_assert_3[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
+     static const struct mips_mapped_int_operand op = { \
+       { OP_MAPPED_INT, SIZE, LSB }, MAP, PRINT_HEX \
+     }; \
+@@ -83,7 +83,7 @@
+ #define MAPPED_REG(SIZE, LSB, BANK, MAP) \
+   { \
+     typedef char ATTRIBUTE_UNUSED \
+-      static_assert[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
++      static_assert_4[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
+     static const struct mips_reg_operand op = { \
+       { OP_REG, SIZE, LSB }, OP_REG_##BANK, MAP \
+     }; \
+@@ -93,7 +93,7 @@
+ #define OPTIONAL_MAPPED_REG(SIZE, LSB, BANK, MAP) \
+   { \
+     typedef char ATTRIBUTE_UNUSED \
+-      static_assert[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
++      static_assert_5[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
+     static const struct mips_reg_operand op = { \
+       { OP_OPTIONAL_REG, SIZE, LSB }, OP_REG_##BANK, MAP \
+     }; \
+diff --git a/opcodes/s390-opc.c b/opcodes/s390-opc.c
+index 9d9f0973e55..49efd714157 100644
+--- a/opcodes/s390-opc.c
++++ b/opcodes/s390-opc.c
+@@ -36,7 +36,9 @@
+ 
+ /* Build-time checks are preferrable over runtime ones.  Use this construct
+    in preference where possible.  */
++#ifndef static_assert
+ #define static_assert(e) ((void)sizeof (struct { int _:1 - 2 * !(e); }))
++#endif
+ 
+ #define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
+ 
+-- 
+2.34.1
+
diff --git a/package/binutils-bpf/2.43.1/0005-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch b/package/binutils-bpf/2.43.1/0005-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch
new file mode 100644
index 0000000000..1f28137190
--- /dev/null
+++ b/package/binutils-bpf/2.43.1/0005-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch
@@ -0,0 +1,801 @@
+From 3e8c6e03675963d65a2f98eb006336c5cd375ec3 Mon Sep 17 00:00:00 2001
+From: Vladimir Mezentsev <vladimir.mezentsev@oracle.com>
+Date: Tue, 3 Sep 2024 21:30:31 -0700
+Subject: [PATCH] Fix 32097 Warnings when building gprofng with Clang
+
+gprofng/ChangeLog
+2024-09-03  Vladimir Mezentsev  <vladimir.mezentsev@oracle.com>.
+
+	PR gprofng/32097
+	* common/hwcdrv.c: Fix -Wempty-body warnings.
+	* common/hwcentry.h: Fix -Wdeprecated-non-prototype warnings.
+	* common/hwctable.c: Fix -Wdeprecated-non-prototype warnings.
+	* libcollector/collector.c: Likewise.
+	* libcollector/collector.h: Likewise.
+	* libcollector/collectorAPI.c: Likewise.
+	* libcollector/dispatcher.c: Likewise.
+	* libcollector/iotrace.c: Likewise.
+	* libcollector/libcol_util.c: Fix -Wunused-but-set-variable warnings.
+	* libcollector/libcol_util.h: Remove unused declarations.
+	* libcollector/linetrace.c: Fix -Wdeprecated-non-prototype warnings.
+	* src/BaseMetricTreeNode.h: Fix -Wunused-private-field warnings.
+	* src/Dbe.cc: Fix -Wself-assign warnings.
+	* src/DbeSession.cc: Fix -Wunused-but-set-variable warnings.
+	* src/Disasm.cc: Fix -Wunused-const-variable warnings.
+	* src/Experiment.cc: Fix -Wunused-private-field warnings.
+	* src/HashMap.h: Fix -Wself-assign warnings.
+	* src/IOActivity.h: Fix -Wunused-private-field warnings.
+	* src/collctrl.cc: Fix -Wself-assign, -Wparentheses-equality warnings.
+	* src/collctrl.h: Fix -Wunused-private-field warnings.
+	* src/collector_module.h: Fix -Wdeprecated-non-prototype warnings.
+	* src/gp-display-src.cc: Fix -Wunused-private-field warnings.
+	* src/gp-print.h: Fix -Wheader-guard warnings.
+	* src/hwc_intel_icelake.h: Fix -Winitializer-overrides warnings.
+	* src/util.cc: Fix -Wunused-but-set-variable warnings.
+
+Upstream: b79c457ca01df82dbe1facb708e45def4584c903
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ gprofng/common/hwcdrv.c             |  3 ++-
+ gprofng/common/hwcentry.h           |  7 +----
+ gprofng/common/hwctable.c           | 13 +---------
+ gprofng/libcollector/collector.c    | 15 ++++-------
+ gprofng/libcollector/collector.h    |  2 +-
+ gprofng/libcollector/collectorAPI.c | 15 ++++++-----
+ gprofng/libcollector/dispatcher.c   | 19 ++++++++------
+ gprofng/libcollector/iotrace.c      | 12 ++++-----
+ gprofng/libcollector/libcol_util.c  |  2 --
+ gprofng/libcollector/libcol_util.h  |  6 -----
+ gprofng/libcollector/linetrace.c    | 40 +++++++++++++++++------------
+ gprofng/src/BaseMetricTreeNode.h    |  1 -
+ gprofng/src/Dbe.cc                  | 12 ++++-----
+ gprofng/src/DbeSession.cc           |  3 ---
+ gprofng/src/Disasm.cc               |  1 -
+ gprofng/src/Experiment.cc           |  2 --
+ gprofng/src/HashMap.h               |  3 +--
+ gprofng/src/IOActivity.h            |  1 -
+ gprofng/src/collctrl.cc             | 14 +++++-----
+ gprofng/src/collctrl.h              |  1 -
+ gprofng/src/collector_module.h      | 20 +++++++--------
+ gprofng/src/gp-display-src.cc       |  8 ------
+ gprofng/src/gp-print.h              |  2 +-
+ gprofng/src/hwc_intel_icelake.h     |  6 +++--
+ gprofng/src/util.cc                 | 10 +++-----
+ 25 files changed, 88 insertions(+), 130 deletions(-)
+
+diff --git a/gprofng/common/hwcdrv.c b/gprofng/common/hwcdrv.c
+index aaf3acdf9cd..51492a8d35c 100644
+--- a/gprofng/common/hwcdrv.c
++++ b/gprofng/common/hwcdrv.c
+@@ -574,6 +574,7 @@ read_sample (counter_state_t *ctr_state, int msgsz, uint64_t *rvalue,
+ static void
+ dump_perf_event_attr (struct perf_event_attr *at)
+ {
++#if defined(DEBUG)
+   TprintfT (DBG_LT2, "dump_perf_event_attr:  size=%d  type=%d  sample_period=%lld\n"
+ 	    "  config=0x%llx  config1=0x%llx  config2=0x%llx  wakeup_events=%lld __reserved_1=%lld\n",
+ 	    (int) at->size, (int) at->type, (unsigned long long) at->sample_period,
+@@ -589,13 +590,13 @@ dump_perf_event_attr (struct perf_event_attr *at)
+   DUMP_F (exclude_kernel);
+   DUMP_F (exclude_hv);
+   DUMP_F (exclude_idle);
+-  //    DUMP_F(xmmap);
+   DUMP_F (comm);
+   DUMP_F (freq);
+   DUMP_F (inherit_stat);
+   DUMP_F (enable_on_exec);
+   DUMP_F (task);
+   DUMP_F (watermark);
++#endif
+ }
+ 
+ static void
+diff --git a/gprofng/common/hwcentry.h b/gprofng/common/hwcentry.h
+index b2ab8b9b22c..0b923fc3576 100644
+--- a/gprofng/common/hwcentry.h
++++ b/gprofng/common/hwcentry.h
+@@ -200,17 +200,12 @@ extern "C"
+   extern char *hwc_get_docref (char *buf, size_t buflen);
+   /* Return a CPU HWC document reference, or NULL. */
+ 
+-  // TBR
+-  extern char *hwc_get_default_cntrs ();
+-  /* Return a default HW counter string; may be NULL, or zero-length */
+-  /* NULL means none is defined in the table; or zero-length means string defined could not be loaded */
+-
+   extern char *hwc_get_default_cntrs2 (int forKernel, int style);
+   /* like hwc_get_default_cntrs() for style==1 */
+   /* but allows other styles of formatting as well */
+   /* deprecate and eventually remove hwc_get_default_cntrs() */
+ 
+-  extern char *hwc_get_orig_default_cntrs ();
++  extern char *hwc_get_orig_default_cntrs (int forKernel);
+   /* Get the default HW counter string as set in the table */
+   /* NULL means none is defined in the table */
+ 
+diff --git a/gprofng/common/hwctable.c b/gprofng/common/hwctable.c
+index 0baf63b1805..338a1ea86f4 100644
+--- a/gprofng/common/hwctable.c
++++ b/gprofng/common/hwctable.c
+@@ -1783,7 +1783,7 @@ check_tables ()
+ }
+ #endif
+ 
+-static int try_a_counter ();
++static int try_a_counter (int forKernel);
+ static void hwc_process_raw_ctrs (int forKernel, Hwcentry ***pstd_out,
+ 				  Hwcentry ***praw_out, Hwcentry ***phidden_out,
+ 				  Hwcentry**static_tables,
+@@ -2824,17 +2824,6 @@ hwc_get_docref (char *buf, size_t buflen)
+   return buf;
+ }
+ 
+-//TBR:
+-
+-extern char*
+-hwc_get_default_cntrs ()
+-{
+-  setup_cpcx ();
+-  if (cpcx_default_hwcs[0] != NULL)
+-    return strdup (cpcx_default_hwcs[0]); // TBR deprecate this
+-  return NULL;
+-}
+-
+ extern char*
+ hwc_get_default_cntrs2 (int forKernel, int style)
+ {
+diff --git a/gprofng/libcollector/collector.c b/gprofng/libcollector/collector.c
+index 3a8f27a719d..2ff95e58fde 100644
+--- a/gprofng/libcollector/collector.c
++++ b/gprofng/libcollector/collector.c
+@@ -210,15 +210,10 @@ get_collector_interface ()
+ static void
+ collector_module_init (CollectorInterface *col_intf)
+ {
+-  int nmodules = 0;
+-
+   ModuleInitFunc next_init = (ModuleInitFunc) dlsym (RTLD_DEFAULT, "__collector_module_init");
+   if (next_init != NULL)
+-    {
+-      nmodules++;
+-      next_init (col_intf);
+-    }
+-  TprintfT (DBG_LT1, "collector_module_init: %d modules\n", nmodules);
++    next_init (col_intf);
++  TprintfT (DBG_LT1, "collector_module_init: %d modules\n", next_init ? 1 : 0);
+ }
+ 
+ /*   Routines concerned with general experiment start and stop */
+@@ -1783,7 +1778,7 @@ __collector_pause ()
+ }
+ 
+ void
+-__collector_pause_m (char *reason)
++__collector_pause_m (const char *reason)
+ {
+   hrtime_t now;
+   char xreason[MAXPATHLEN];
+@@ -2449,8 +2444,8 @@ __collector_dlog (int tflag, int level, char *format, ...)
+ 
+ static void (*__real__exit) (int status) = NULL; /* libc only: _exit */
+ static void (*__real__Exit) (int status) = NULL; /* libc only: _Exit */
+-void _exit () __attribute__ ((weak, alias ("__collector_exit")));
+-void _Exit () __attribute__ ((weak, alias ("__collector_Exit")));
++void _exit (int status) __attribute__ ((weak, alias ("__collector_exit")));
++void _Exit (int status) __attribute__ ((weak, alias ("__collector_Exit")));
+ 
+ void
+ __collector_exit (int status)
+diff --git a/gprofng/libcollector/collector.h b/gprofng/libcollector/collector.h
+index 07a03bdd17a..eda68a0e4f5 100644
+--- a/gprofng/libcollector/collector.h
++++ b/gprofng/libcollector/collector.h
+@@ -123,7 +123,7 @@ extern void __collector_terminate_expt ();
+ extern void __collector_terminate_hook ();
+ extern void __collector_sample (char *name);
+ extern void __collector_pause ();
+-extern void __collector_pause_m ();
++extern void __collector_pause_m (const char *reason);
+ extern void __collector_resume ();
+ extern int collector_sigemt_sigaction (const struct sigaction*,
+ 				       struct sigaction*);
+diff --git a/gprofng/libcollector/collectorAPI.c b/gprofng/libcollector/collectorAPI.c
+index 5fa6403ad49..449bbbaab65 100644
+--- a/gprofng/libcollector/collectorAPI.c
++++ b/gprofng/libcollector/collectorAPI.c
+@@ -26,16 +26,17 @@
+ #include "collectorAPI.h"
+ #include "gp-experiment.h"
+ 
+-static void *__real_collector_sample = NULL;
+-static void *__real_collector_pause = NULL;
+-static void *__real_collector_resume = NULL;
+-static void *__real_collector_terminate_expt = NULL;
+-static void *__real_collector_func_load = NULL;
+-static void *__real_collector_func_unload = NULL;
++static void (*__real_collector_sample)(const char *) = NULL;
++static void (*__real_collector_pause)() = NULL;
++static void (*__real_collector_resume)() = NULL;
++static void (*__real_collector_terminate_expt)() = NULL;
++static void (*__real_collector_func_load)(const char *, const char *,
++		const char *, void *, int, int, Lineno *) = NULL;
++static void (*__real_collector_func_unload)(void *) = NULL;
+ 
+ #define INIT_API        if (init_API == 0) collectorAPI_initAPI()
+ #define NULL_PTR(x)     (__real_##x == NULL)
+-#define CALL_REAL(x)    (*(void(*)())__real_##x)
++#define CALL_REAL(x)    (__real_##x)
+ #define CALL_IF_REAL(x) INIT_API; if (!NULL_PTR(x)) CALL_REAL(x)
+ 
+ static int init_API = 0;
+diff --git a/gprofng/libcollector/dispatcher.c b/gprofng/libcollector/dispatcher.c
+index 8b8ad77b5ee..f7cd46e7e6b 100644
+--- a/gprofng/libcollector/dispatcher.c
++++ b/gprofng/libcollector/dispatcher.c
+@@ -908,8 +908,9 @@ sigset (int sig, sighandler_t handler)
+ 
+ // map interposed symbol versions
+ static int
+-gprofng_timer_create (int (real_func) (), clockid_t clockid,
+-                      struct sigevent *sevp, timer_t *timerid)
++gprofng_timer_create (int (real_func) (clockid_t, struct sigevent *, timer_t *),
++		      clockid_t clockid,
++		      struct sigevent *sevp, timer_t *timerid)
+ {
+   // collector reserves SIGPROF
+   if (sevp == NULL || sevp->sigev_notify != SIGEV_SIGNAL ||
+@@ -1044,7 +1045,7 @@ __collector_thr_sigsetmask (int how, const sigset_t* iset, sigset_t* oset)
+ // map interposed symbol versions
+ 
+ static int
+-gprofng_pthread_sigmask (int (real_func) (),
++gprofng_pthread_sigmask (int (real_func) (int, const sigset_t *, sigset_t*),
+                          int how, const sigset_t *iset, sigset_t* oset)
+ {
+   sigset_t lsigset;
+@@ -1139,9 +1140,10 @@ collector_root (void *cargs)
+ // map interposed symbol versions
+ 
+ static int
+-gprofng_pthread_create (int (real_func) (), pthread_t *thread,
+-                        const pthread_attr_t *attr,
+-                        void *(*func)(void*), void *arg)
++gprofng_pthread_create (int (real_func) (pthread_t *, const pthread_attr_t *,
++					 void *(*)(void *), void *),
++			pthread_t *thread, const pthread_attr_t *attr,
++			void *(*func)(void*), void *arg)
+ {
+   TprintfT (DBG_LTT, "gprofng_pthread_create @%p\n", real_func);
+   if (dispatch_mode != DISPATCH_ON)
+@@ -1276,6 +1278,7 @@ __collector_ext_clone_pthread (int (*fn)(void *), void *child_stack, int flags,
+ }
+ 
+ // weak symbols:
+-int sigprocmask () __attribute__ ((weak, alias ("__collector_sigprocmask")));
+-int thr_sigsetmask () __attribute__ ((weak, alias ("__collector_thr_sigsetmask")));
++int sigprocmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_sigprocmask")));
++int thr_sigsetmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_thr_sigsetmask")));
+ int setitimer () __attribute__ ((weak, alias ("_setitimer")));
++
+diff --git a/gprofng/libcollector/iotrace.c b/gprofng/libcollector/iotrace.c
+index 18060864796..3deb441d9c7 100644
+--- a/gprofng/libcollector/iotrace.c
++++ b/gprofng/libcollector/iotrace.c
+@@ -1350,7 +1350,7 @@ mkstemp (char *template)
+   unsigned pktSize;
+   if (NULL_PTR (mkstemp))
+     init_io_intf ();
+-  if (CHCK_REENTRANCE (guard) || template == NULL)
++  if (CHCK_REENTRANCE (guard))
+     return CALL_REAL (mkstemp)(template);
+   PUSH_REENTRANCE (guard);
+   hrtime_t reqt = gethrtime ();
+@@ -1405,7 +1405,7 @@ mkstemps (char *template, int slen)
+   unsigned pktSize;
+   if (NULL_PTR (mkstemps))
+     init_io_intf ();
+-  if (CHCK_REENTRANCE (guard) || template == NULL)
++  if (CHCK_REENTRANCE (guard))
+     return CALL_REAL (mkstemps)(template, slen);
+   PUSH_REENTRANCE (guard);
+   hrtime_t reqt = gethrtime ();
+@@ -1485,7 +1485,7 @@ close (int fildes)
+ 
+ /*------------------------------------------------------------- fopen */
+ static FILE*
+-gprofng_fopen (FILE*(real_fopen) (), const char *filename, const char *mode)
++gprofng_fopen (FILE*(real_fopen) (const char *, const char *), const char *filename, const char *mode)
+ {
+   int *guard;
+   FILE *fp = NULL;
+@@ -1559,7 +1559,7 @@ DCL_FOPEN (fopen)
+ 
+ /*------------------------------------------------------------- fclose */
+ static int
+-gprofng_fclose (int(real_fclose) (), FILE *stream)
++gprofng_fclose (int(real_fclose) (FILE *), FILE *stream)
+ {
+   int *guard;
+   int stat;
+@@ -1645,7 +1645,7 @@ fflush (FILE *stream)
+ 
+ /*------------------------------------------------------------- fdopen */
+ static FILE*
+-gprofng_fdopen (FILE*(real_fdopen) (), int fildes, const char *mode)
++gprofng_fdopen (FILE*(real_fdopen) (int, const char *), int fildes, const char *mode)
+ {
+   int *guard;
+   FILE *fp = NULL;
+@@ -2957,7 +2957,7 @@ DCL_FGETPOS (fgetpos)
+ 
+ /*------------------------------------------------------------- fgetpos64 */
+ static int
+-gprofng_fgetpos64 (int(real_fgetpos64) (), FILE *stream, fpos64_t *pos)
++gprofng_fgetpos64 (int(real_fgetpos64) (FILE *, fpos64_t *), FILE *stream, fpos64_t *pos)
+ {
+   int *guard;
+   int ret;
+diff --git a/gprofng/libcollector/libcol_util.c b/gprofng/libcollector/libcol_util.c
+index 1e58cf491a1..baac15db5c4 100644
+--- a/gprofng/libcollector/libcol_util.c
++++ b/gprofng/libcollector/libcol_util.c
+@@ -1013,7 +1013,6 @@ __collector_open (const char *path, int oflag, ...)
+   mode_t mode = 0;
+ 
+   hrtime_t t_timeout = __collector_gethrtime () + 5 * ((hrtime_t) NANOSEC);
+-  int nretries = 0;
+   long long delay = 100; /* start at some small, arbitrary value */
+ 
+   /* get optional mode argument if it's expected/required */
+@@ -1058,7 +1057,6 @@ __collector_open (const char *path, int oflag, ...)
+       delay *= 2;
+       if (delay > 100000000)
+ 	delay = 100000000; /* cap at some large, arbitrary value */
+-      nretries++;
+     }
+   return fd;
+ }
+diff --git a/gprofng/libcollector/libcol_util.h b/gprofng/libcollector/libcol_util.h
+index c8ec83ff0d9..aa30db72bcc 100644
+--- a/gprofng/libcollector/libcol_util.h
++++ b/gprofng/libcollector/libcol_util.h
+@@ -81,12 +81,6 @@ extern int __collector_mutex_trylock (collector_mutex_t *mp);
+ #define __collector_mutex_init(xx) \
+   do { collector_mutex_t tmp=COLLECTOR_MUTEX_INITIALIZER; *(xx)=tmp; } while(0)
+ 
+-void __collector_sample (char *name);
+-void __collector_terminate_expt ();
+-void __collector_pause ();
+-void __collector_pause_m ();
+-void __collector_resume ();
+-
+ struct DT_lineno;
+ 
+ typedef enum
+diff --git a/gprofng/libcollector/linetrace.c b/gprofng/libcollector/linetrace.c
+index 67b2d7e9030..66844bc1337 100644
+--- a/gprofng/libcollector/linetrace.c
++++ b/gprofng/libcollector/linetrace.c
+@@ -1207,7 +1207,7 @@ __collector_vfork (void)
+ }
+ 
+ /*------------------------------------------------------------- execve */
+-int execve () __attribute__ ((weak, alias ("__collector_execve")));
++int execve (const char *, char *const [], char *const []) __attribute__ ((weak, alias ("__collector_execve")));
+ 
+ int
+ __collector_execve (const char* path, char *const argv[], char *const envp[])
+@@ -1237,7 +1237,7 @@ __collector_execve (const char* path, char *const argv[], char *const envp[])
+   return ret;
+ }
+ 
+-int execvp () __attribute__ ((weak, alias ("__collector_execvp")));
++int execvp (const char *, char *const []) __attribute__ ((weak, alias ("__collector_execvp")));
+ 
+ int
+ __collector_execvp (const char* file, char *const argv[])
+@@ -1269,7 +1269,7 @@ __collector_execvp (const char* file, char *const argv[])
+   return ret;
+ }
+ 
+-int execv () __attribute__ ((weak, alias ("__collector_execv")));
++int execv (const char *, char *const []) __attribute__ ((weak, alias ("__collector_execv")));
+ 
+ int
+ __collector_execv (const char* path, char *const argv[])
+@@ -1408,7 +1408,10 @@ __collector_execl (const char* path, const char *arg0, ...)
+ /*-------------------------------------------------------- posix_spawn */
+ // map interposed symbol versions
+ static int
+-gprofng_posix_spawn (int(real_posix_spawn) (),
++gprofng_posix_spawn (int(real_posix_spawn) (pid_t *, const char *,
++				const posix_spawn_file_actions_t *,
++				const posix_spawnattr_t *,
++				char *const [], char *const []),
+ 		     pid_t *pidp, const char *path,
+ 		     const posix_spawn_file_actions_t *file_actions,
+ 		     const posix_spawnattr_t *attrp,
+@@ -1466,7 +1469,10 @@ DCL_POSIX_SPAWN (posix_spawn)
+ 
+ /*-------------------------------------------------------- posix_spawnp */
+ static int
+-gprofng_posix_spawnp (int (real_posix_spawnp) (),
++gprofng_posix_spawnp (int (real_posix_spawnp) (pid_t *, const char *,
++				const posix_spawn_file_actions_t *,
++				const posix_spawnattr_t *,
++				char *const [], char *const []),
+                       pid_t *pidp, const char *path,
+                       const posix_spawn_file_actions_t *file_actions,
+                       const posix_spawnattr_t *attrp,
+@@ -1754,8 +1760,8 @@ __collector_clone (int (*fn)(void *), void *child_stack, int flags, void *arg,
+ }
+ 
+ /*-------------------------------------------------------------------- setuid */
+-int setuid () __attribute__ ((weak, alias ("__collector_setuid")));
+-int _setuid () __attribute__ ((weak, alias ("__collector_setuid")));
++int setuid (uid_t) __attribute__ ((weak, alias ("__collector_setuid")));
++int _setuid (uid_t) __attribute__ ((weak, alias ("__collector_setuid")));
+ 
+ int
+ __collector_setuid (uid_t ruid)
+@@ -1770,8 +1776,8 @@ __collector_setuid (uid_t ruid)
+ }
+ 
+ /*------------------------------------------------------------------- seteuid */
+-int seteuid () __attribute__ ((weak, alias ("__collector_seteuid")));
+-int _seteuid () __attribute__ ((weak, alias ("__collector_seteuid")));
++int seteuid (uid_t) __attribute__ ((weak, alias ("__collector_seteuid")));
++int _seteuid (uid_t) __attribute__ ((weak, alias ("__collector_seteuid")));
+ 
+ int
+ __collector_seteuid (uid_t euid)
+@@ -1786,8 +1792,8 @@ __collector_seteuid (uid_t euid)
+ }
+ 
+ /*------------------------------------------------------------------ setreuid */
+-int setreuid () __attribute__ ((weak, alias ("__collector_setreuid")));
+-int _setreuid () __attribute__ ((weak, alias ("__collector_setreuid")));
++int setreuid (uid_t, uid_t) __attribute__ ((weak, alias ("__collector_setreuid")));
++int _setreuid (uid_t, uid_t) __attribute__ ((weak, alias ("__collector_setreuid")));
+ 
+ int
+ __collector_setreuid (uid_t ruid, uid_t euid)
+@@ -1802,8 +1808,8 @@ __collector_setreuid (uid_t ruid, uid_t euid)
+ }
+ 
+ /*-------------------------------------------------------------------- setgid */
+-int setgid () __attribute__ ((weak, alias ("__collector_setgid")));
+-int _setgid () __attribute__ ((weak, alias ("__collector_setgid")));
++int setgid (gid_t) __attribute__ ((weak, alias ("__collector_setgid")));
++int _setgid (gid_t) __attribute__ ((weak, alias ("__collector_setgid")));
+ 
+ int
+ __collector_setgid (gid_t rgid)
+@@ -1818,8 +1824,8 @@ __collector_setgid (gid_t rgid)
+ }
+ 
+ /*------------------------------------------------------------------- setegid */
+-int setegid () __attribute__ ((weak, alias ("__collector_setegid")));
+-int _setegid () __attribute__ ((weak, alias ("__collector_setegid")));
++int setegid (gid_t) __attribute__ ((weak, alias ("__collector_setegid")));
++int _setegid (gid_t) __attribute__ ((weak, alias ("__collector_setegid")));
+ 
+ int
+ __collector_setegid (gid_t egid)
+@@ -1834,8 +1840,8 @@ __collector_setegid (gid_t egid)
+ }
+ 
+ /*------------------------------------------------------------------ setregid */
+-int setregid () __attribute__ ((weak, alias ("__collector_setregid")));
+-int _setregid () __attribute__ ((weak, alias ("__collector_setregid")));
++int setregid (gid_t, gid_t) __attribute__ ((weak, alias ("__collector_setregid")));
++int _setregid (gid_t, gid_t) __attribute__ ((weak, alias ("__collector_setregid")));
+ 
+ int
+ __collector_setregid (gid_t rgid, gid_t egid)
+diff --git a/gprofng/src/BaseMetricTreeNode.h b/gprofng/src/BaseMetricTreeNode.h
+index d73d244e27e..7698f9c6eaf 100644
+--- a/gprofng/src/BaseMetricTreeNode.h
++++ b/gprofng/src/BaseMetricTreeNode.h
+@@ -85,7 +85,6 @@ private:
+ 
+   BaseMetricTreeNode *root;     // root of tree
+   BaseMetricTreeNode *parent;   // my parent
+-  bool aggregation;             // value is based on children's values
+   char *name;           // bm->get_cmd() for metrics, unique string otherwise
+   char *uname;                  // user-visible text
+   char *unit;                   // see UNIT_* defines
+diff --git a/gprofng/src/Dbe.cc b/gprofng/src/Dbe.cc
+index 95daa727186..09b7f94eaa8 100644
+--- a/gprofng/src/Dbe.cc
++++ b/gprofng/src/Dbe.cc
+@@ -9591,14 +9591,12 @@ dbeGetTLDataRepVals (VMode view_mode, hrtime_t start_ts, hrtime_t delta,
+ 	}
+       if (sampleVals != NULL)
+ 	{
+-	  Sample* sample = (Sample*) packets->getObjValue (PROP_SMPLOBJ, packetIdx);
+-	  if (!sample || !sample->get_usage ())
+-	    sample = sample;
+-	  else
++	  Sample *sample = (Sample*) packets->getObjValue (PROP_SMPLOBJ, packetIdx);
++	  if (sample != NULL)
+ 	    {
+-	      PrUsage* prusage = sample->get_usage ();
+-	      Vector<long long> *mstateVals = prusage->getMstateValues ();
+-	      sampleVals->store (eventIdx, mstateVals);
++	      PrUsage *prusage = sample->get_usage ();
++	      if (prusage != NULL)
++		sampleVals->store (eventIdx, prusage->getMstateValues ());
+ 	    }
+ 	}
+     }
+diff --git a/gprofng/src/DbeSession.cc b/gprofng/src/DbeSession.cc
+index a6808d8d8f6..3649357bc79 100644
+--- a/gprofng/src/DbeSession.cc
++++ b/gprofng/src/DbeSession.cc
+@@ -1164,8 +1164,6 @@ DbeSession::open_experiment (Experiment *exp, char *path)
+   closedir (exp_dir);
+   exp_names->sort (dir_name_cmp);
+   Experiment **t_exp_list = new Experiment *[exp_names->size ()];
+-  int nsubexps = 0;
+-
+   for (int j = 0, jsz = exp_names->size (); j < jsz; j++)
+     {
+       t_exp_list[j] = NULL;
+@@ -1222,7 +1220,6 @@ DbeSession::open_experiment (Experiment *exp, char *path)
+ 	dexp->open (dpath);
+       append (dexp);
+       t_exp_list[j] = dexp;
+-      nsubexps++;
+       dexp->set_clock (exp->clock);
+ 
+       // DbeView add_experiment() is split into two parts
+diff --git a/gprofng/src/Disasm.cc b/gprofng/src/Disasm.cc
+index e41bf679292..19f2174d536 100644
+--- a/gprofng/src/Disasm.cc
++++ b/gprofng/src/Disasm.cc
+@@ -49,7 +49,6 @@ struct DisContext
+ };
+ 
+ static const int MAX_DISASM_STR     = 2048;
+-static const int MAX_INSTR_SIZE     = 8;
+ 
+ Disasm::Disasm (char *fname)
+ {
+diff --git a/gprofng/src/Experiment.cc b/gprofng/src/Experiment.cc
+index a1f78fc0cde..627a755c88c 100644
+--- a/gprofng/src/Experiment.cc
++++ b/gprofng/src/Experiment.cc
+@@ -1937,8 +1937,6 @@ private:
+   }
+ 
+   Experiment *exp;
+-  char *hostname;
+-  hrtime_t time, tstamp;
+ };
+ 
+ void
+diff --git a/gprofng/src/HashMap.h b/gprofng/src/HashMap.h
+index 918c0dc95f9..c5fdd345ba8 100644
+--- a/gprofng/src/HashMap.h
++++ b/gprofng/src/HashMap.h
+@@ -78,9 +78,8 @@ copy_key (uint64_t a)
+ }
+ 
+ template<> inline void
+-delete_key (uint64_t a)
++delete_key (uint64_t)
+ {
+-  a = a;
+ }
+ 
+ template<> inline int
+diff --git a/gprofng/src/IOActivity.h b/gprofng/src/IOActivity.h
+index cf462cf8d55..f3a22ada6b1 100644
+--- a/gprofng/src/IOActivity.h
++++ b/gprofng/src/IOActivity.h
+@@ -78,7 +78,6 @@ private:
+   Hist_data *hist_data_file_all;
+   Hist_data *hist_data_vfd_all;
+   Hist_data *hist_data_callstack_all;
+-  Hist_data *hist_data_callstack;
+ 
+   DbeView *dbev;
+ };
+diff --git a/gprofng/src/collctrl.cc b/gprofng/src/collctrl.cc
+index 029c0387f19..c0234130f00 100644
+--- a/gprofng/src/collctrl.cc
++++ b/gprofng/src/collctrl.cc
+@@ -880,9 +880,7 @@ Coll_Ctrl::set_clkprof (const char *string, char** warn)
+       double dval = strtod (string, &endchar);
+       if (*endchar == 'm' || *endchar == 0) /* user specified milliseconds */
+ 	dval = dval * 1000.;
+-      else if (*endchar == 'u') /* user specified microseconds */
+-	dval = dval;
+-      else
++      else if (*endchar != 'u')
+ 	return dbe_sprintf (GTXT ("Unrecognized clock-profiling interval `%s'\n"), string);
+       nclkprof_timer = (int) (dval + 0.5);
+     }
+@@ -2791,7 +2789,7 @@ Coll_Ctrl::get (char * control)
+     }
+   if (!strncmp (control, ipc_str_javaprof, len))
+     {
+-      if ((java_mode == 0))
++      if (java_mode == 0)
+ 	return strdup (ipc_str_off);
+       return strdup (ipc_str_on);
+     }
+@@ -2807,7 +2805,7 @@ Coll_Ctrl::get (char * control)
+     }
+   if (!strncmp (control, ipc_str_sample_sig, len))
+     {
+-      if ((sample_sig == 0))
++      if (sample_sig == 0)
+ 	return strdup (ipc_str_off);
+       char *str_signal = find_signal_name (sample_sig);
+       if (str_signal != NULL)
+@@ -2841,15 +2839,15 @@ Coll_Ctrl::get (char * control)
+     }
+   if (!strncmp (control, ipc_str_iotrace, len))
+     {
+-      if ((iotrace_enabled == 0))
++      if (iotrace_enabled == 0)
+ 	return strdup (ipc_str_off);
+       return strdup (ipc_str_on);
+     }
+   if (!strncmp (control, ipc_str_count, len))
+     {
+-      if ((count_enabled == 0))
++      if (count_enabled == 0)
+ 	return strdup (ipc_str_off);
+-      if ((count_enabled < 0))
++      if (count_enabled < 0)
+ 	return strdup ("on\nstatic");
+       return strdup (ipc_str_on);
+     }
+diff --git a/gprofng/src/collctrl.h b/gprofng/src/collctrl.h
+index a41647440ac..e2a8e450890 100644
+--- a/gprofng/src/collctrl.h
++++ b/gprofng/src/collctrl.h
+@@ -272,7 +272,6 @@ private:
+   char *node_name;      /* name of machine on which experiment is run */
+   long ncpus;           /* number of online CPUs */
+   int cpu_clk_freq;     /* chip clock (MHz.), as reported from processor_info */
+-  int cpc_cpuver;       /* chip version, as reported from libcpc */
+   long sys_resolution;  /* system clock resolution */
+   int sample_period;    /* period for sampling, seconds */
+   int sample_default;    /* if period for sampling set by default */
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index bb48eadb9f8..ebcdbca561f 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -40,12 +40,12 @@ struct tm;
+  * If you add any, please put it in the right place */
+ typedef struct CollectorUtilFuncs
+ {
+-  int (*access)();
++  int (*access)(const char *, int);
+   int (*atoi)(const char *nptr);
+   void *(*calloc)(size_t nelem, size_t elsize);
+   int (*clearenv)(void);
+   int (*close)(int);
+-  int (*closedir)();
++  int (*closedir)(DIR *);
+   int (*execv)(const char *path, char *const argv[]);
+   void (*exit)(int status);
+   int (*fclose)(FILE *stream);
+@@ -66,20 +66,20 @@ typedef struct CollectorUtilFuncs
+   off_t (*lseek)(int fd, off_t offset, int whence);
+   void *(*malloc)(size_t size);
+   void *(*memset)(void *s1, int c, size_t n);
+-  int (*mkdir)();
++  int (*mkdir)(const char *, mode_t);
+   time_t (*mktime)(struct tm *timeptr);
+   void *(*mmap)(void *, size_t, int, int, int, off_t);
+-  void *(*mmap64_)();
+-  int (*munmap)();
++  void *(*mmap64_)(void *, size_t, int, int, int, off_t);
++  int (*munmap)(void *, size_t);
+   int (*open)(const char *, int, ...);
+   int (*open_bare)(const char *, int, ...);
+-  DIR *(*opendir)();
++  DIR *(*opendir)(const char *);
+   int (*pclose)(FILE *stream);
+   FILE *(*popen)(const char *command, const char *mode);
+   int (*putenv)(char *string);
+-  ssize_t (*pwrite)();
+-  ssize_t (*pwrite64_)();
+-  ssize_t (*read)();
++  ssize_t (*pwrite)(int, const void *, size_t, off_t);
++  ssize_t (*pwrite64_)(int, const void *, size_t, off_t);
++  ssize_t (*read)(int, void *, size_t);
+   int (*setenv)(const char *name, const char *value, int overwrite);
+   int (*sigfillset)(sigset_t *set);
+   int (*sigprocmask)(int how, const sigset_t *set, sigset_t *oldset);
+@@ -112,7 +112,7 @@ typedef struct CollectorUtilFuncs
+   int (*unsetenv)(const char *name);
+   int (*vsnprintf)(char *str, size_t size, const char *format, va_list ap);
+   pid_t (*waitpid)(pid_t pid, int *stat_loc, int options);
+-  ssize_t (*write)();
++  ssize_t (*write)(int, void *, size_t);
+   double (*atof)();
+   void *n_a;
+ } CollectorUtilFuncs;
+diff --git a/gprofng/src/gp-display-src.cc b/gprofng/src/gp-display-src.cc
+index 200e6080d2e..24af375edf1 100644
+--- a/gprofng/src/gp-display-src.cc
++++ b/gprofng/src/gp-display-src.cc
+@@ -75,14 +75,6 @@ private:
+   bool v_opt;
+   int multiple;
+   char *str_compcom;
+-  bool hex_visible;
+-  int src_visible;
+-  int vis_src;
+-  int vis_dis;
+-  int threshold_src;
+-  int threshold_dis;
+-  int threshold;
+-  int vis_bits;
+ };
+ 
+ static int
+diff --git a/gprofng/src/gp-print.h b/gprofng/src/gp-print.h
+index 1b748ea60a3..1a8ad3b6c13 100644
+--- a/gprofng/src/gp-print.h
++++ b/gprofng/src/gp-print.h
+@@ -19,7 +19,7 @@
+    MA 02110-1301, USA.  */
+ 
+ #ifndef _GP_PRINT_H
+-#define _ER_PRINT_H
++#define _GP_PRINT_H
+ 
+ #include "Command.h"
+ #include "DbeApplication.h"
+diff --git a/gprofng/src/hwc_intel_icelake.h b/gprofng/src/hwc_intel_icelake.h
+index 46f4ac5005f..4fe2e26f63b 100644
+--- a/gprofng/src/hwc_intel_icelake.h
++++ b/gprofng/src/hwc_intel_icelake.h
+@@ -24,8 +24,10 @@
+ #define SH(val, n) (((unsigned long long) (val)) << n)
+ #define I(nm, event, umask, edge, cmask, inv, \
+ 	  offcore_rsp, ldlat, frontend, period, mtr) \
+-	  INIT_HWC(nm, mtr, SH(event, 0) | SH(umask, 8) | SH(edge, 18) \
+-		     | SH(cmask, 24) | SH(inv, 23), PERF_TYPE_RAW), \
++	  .use_perf_event_type = 1, .type = PERF_TYPE_RAW, \
++	  .name = (nm), .metric = (mtr), .reg_num = REGNO_ANY, \
++	  .config = SH(event, 0) | SH(umask, 8) | SH(edge, 18) | SH(cmask, 24) \
++		  | SH(inv, 23), \
+ 	  .config1 = SH(offcore_rsp, 0) | SH(ldlat, 0) | SH(frontend, 0), \
+ 	  .val = period
+ 
+diff --git a/gprofng/src/util.cc b/gprofng/src/util.cc
+index 201f7088b66..228140b61ae 100644
+--- a/gprofng/src/util.cc
++++ b/gprofng/src/util.cc
+@@ -741,17 +741,13 @@ get_relative_link (const char *path_from, const char *path_to)
+   s2 = canonical_path (s2);
+   long l = dbe_sstrlen (s1);
+   // try to find common directories
+-  int common_slashes = 0;
+   int last_common_slash = -1;
+   for (int i = 0; i < l; i++)
+     {
+-      if (s1[i] != s2[i]) break;
+-      if (s1[i] == 0) break;
++      if (s1[i] != s2[i] || s1[i] == 0)
++	break;
+       if (s1[i] == '/')
+-	{
+-	  common_slashes++;
+-	  last_common_slash = i;
+-	}
++	last_common_slash = i;
+     }
+   // find slashes in remaining path_to
+   int slashes = 0;
+-- 
+2.50.1
+
diff --git a/package/binutils-bpf/2.43.1/0006-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch b/package/binutils-bpf/2.43.1/0006-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch
new file mode 100644
index 0000000000..7c6ed290f9
--- /dev/null
+++ b/package/binutils-bpf/2.43.1/0006-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch
@@ -0,0 +1,619 @@
+From a5be89126b9bee78224be842e3086ce99dc045e6 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 16 Nov 2024 05:13:48 +0000
+Subject: [PATCH] gprofng: fix -std=gnu23 compatibility wrt unprototyped
+ functions
+
+C23 removes support for unprototyped functions. Fix function pointer types
+accordingly.
+
+This does not fix all instances, there's a few left as I commented on in
+PR32374 (e.g. setitimer which I have a local workaround for but it involves
+a glibc implementation detail; the Linaro precommit CI tester pointed that
+out too, so dropped that).
+
+ChangeLog:
+	PR gprofng/32374
+
+	* libcollector/collector.c (collector_sample): Fix prototype.
+	* libcollector/envmgmt.c (putenv): Ditto.
+	(_putenv): Ditto.
+	(__collector_putenv): Ditto.
+	(setenv): Ditto.
+	(_setenv): Ditto.
+	(__collector_setenv): Ditto.
+	(unsetenv): Ditto.
+	(_unsetenv): Ditto.
+	(__collector_unsetenv): Ditto.
+	* libcollector/jprofile.c (open_experiment): Ditto.
+	(__collector_jprofile_enable_synctrace): Ditto.
+	(jprof_find_asyncgetcalltrace): Ditto.
+	* libcollector/libcol_util.c (__collector_util_init): Ditto.
+	(ARCH): Ditto.
+	* libcollector/mmaptrace.c (collector_func_load): Ditto.
+	(collector_func_unload): Ditto.
+	* libcollector/unwind.c (__collector_ext_unwind_init): Ditto.
+	* src/collector_module.h: Ditto.
+
+Upstream: a2f774427e078f3da2c06bdea25f77a61979a695
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ gprofng/libcollector/collector.c   |  2 +-
+ gprofng/libcollector/dispatcher.c  |  1 -
+ gprofng/libcollector/envmgmt.c     | 24 ++++-----
+ gprofng/libcollector/jprofile.c    | 10 ++--
+ gprofng/libcollector/libcol_util.c | 84 +++++++++++++++---------------
+ gprofng/libcollector/mmaptrace.c   |  4 +-
+ gprofng/libcollector/unwind.c      |  2 +-
+ gprofng/src/collector_module.h     |  2 +-
+ 8 files changed, 64 insertions(+), 65 deletions(-)
+
+diff --git a/gprofng/libcollector/collector.c b/gprofng/libcollector/collector.c
+index 2ff95e58fde..3cab346e7dc 100644
+--- a/gprofng/libcollector/collector.c
++++ b/gprofng/libcollector/collector.c
+@@ -1578,7 +1578,7 @@ __collector_resume_experiment ()
+ }
+ 
+ /* Code to support Samples and Pause/Resume */
+-void collector_sample () __attribute__ ((weak, alias ("__collector_sample")));
++void collector_sample (char *name) __attribute__ ((weak, alias ("__collector_sample")));
+ void
+ __collector_sample (char *name)
+ {
+diff --git a/gprofng/libcollector/dispatcher.c b/gprofng/libcollector/dispatcher.c
+index f7cd46e7e6b..4eda18ec324 100644
+--- a/gprofng/libcollector/dispatcher.c
++++ b/gprofng/libcollector/dispatcher.c
+@@ -1281,4 +1281,3 @@ __collector_ext_clone_pthread (int (*fn)(void *), void *child_stack, int flags,
+ int sigprocmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_sigprocmask")));
+ int thr_sigsetmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_thr_sigsetmask")));
+ int setitimer () __attribute__ ((weak, alias ("_setitimer")));
+-
+diff --git a/gprofng/libcollector/envmgmt.c b/gprofng/libcollector/envmgmt.c
+index a399c0d0cb4..f2bf2c41bfb 100644
+--- a/gprofng/libcollector/envmgmt.c
++++ b/gprofng/libcollector/envmgmt.c
+@@ -685,8 +685,8 @@ __collector_env_update (char *envp[])
+ 
+ 
+ /*------------------------------------------------------------- putenv */
+-int putenv () __attribute__ ((weak, alias ("__collector_putenv")));
+-int _putenv () __attribute__ ((weak, alias ("__collector_putenv")));
++int putenv (char*) __attribute__ ((weak, alias ("__collector_putenv")));
++int _putenv (char*) __attribute__ ((weak, alias ("__collector_putenv")));
+ 
+ int
+ __collector_putenv (char * string)
+@@ -694,9 +694,9 @@ __collector_putenv (char * string)
+   if (CALL_UTIL (putenv) == __collector_putenv ||
+       CALL_UTIL (putenv) == NULL)
+     { // __collector_libc_funcs_init failed
+-      CALL_UTIL (putenv) = (int(*)())dlsym (RTLD_NEXT, "putenv");
++      CALL_UTIL (putenv) = (int(*)(char*))dlsym (RTLD_NEXT, "putenv");
+       if (CALL_UTIL (putenv) == NULL || CALL_UTIL (putenv) == __collector_putenv)
+-	  CALL_UTIL (putenv) = (int(*)())dlsym (RTLD_DEFAULT, "putenv");
++	  CALL_UTIL (putenv) = (int(*)(char*))dlsym (RTLD_DEFAULT, "putenv");
+       if (CALL_UTIL (putenv) == NULL || CALL_UTIL (putenv) == __collector_putenv)
+ 	{
+ 	  TprintfT (DBG_LT2, "__collector_putenv(): ERROR: no pointer found.\n");
+@@ -712,8 +712,8 @@ __collector_putenv (char * string)
+ }
+ 
+ /*------------------------------------------------------------- setenv */
+-int setenv () __attribute__ ((weak, alias ("__collector_setenv")));
+-int _setenv () __attribute__ ((weak, alias ("__collector_setenv")));
++int setenv (const char*, const char*, int) __attribute__ ((weak, alias ("__collector_setenv")));
++int _setenv (const char*, const char*, int) __attribute__ ((weak, alias ("__collector_setenv")));
+ 
+ int
+ __collector_setenv (const char *name, const char *value, int overwrite)
+@@ -721,9 +721,9 @@ __collector_setenv (const char *name, const char *value, int overwrite)
+   if (CALL_UTIL (setenv) == __collector_setenv ||
+       CALL_UTIL (setenv) == NULL)
+     { // __collector_libc_funcs_init failed
+-      CALL_UTIL (setenv) = (int(*)())dlsym (RTLD_NEXT, "setenv");
++      CALL_UTIL (setenv) = (int(*)(const char*, const char*, int))dlsym (RTLD_NEXT, "setenv");
+       if (CALL_UTIL (setenv) == NULL || CALL_UTIL (setenv) == __collector_setenv)
+-	CALL_UTIL (setenv) = (int(*)())dlsym (RTLD_DEFAULT, "setenv");
++	CALL_UTIL (setenv) = (int(*)(const char*, const char*, int))dlsym (RTLD_DEFAULT, "setenv");
+       if (CALL_UTIL (setenv) == NULL || CALL_UTIL (setenv) == __collector_setenv)
+ 	{
+ 	  TprintfT (DBG_LT2, "__collector_setenv(): ERROR: no pointer found.\n");
+@@ -758,8 +758,8 @@ __collector_setenv (const char *name, const char *value, int overwrite)
+ }
+ 
+ /*------------------------------------------------------------- unsetenv */
+-int unsetenv () __attribute__ ((weak, alias ("__collector_unsetenv")));
+-int _unsetenv () __attribute__ ((weak, alias ("__collector_unsetenv")));
++int unsetenv (const char*) __attribute__ ((weak, alias ("__collector_unsetenv")));
++int _unsetenv (const char*) __attribute__ ((weak, alias ("__collector_unsetenv")));
+ 
+ int
+ __collector_unsetenv (const char *name)
+@@ -767,9 +767,9 @@ __collector_unsetenv (const char *name)
+   if (CALL_UTIL (unsetenv) == __collector_unsetenv ||
+       CALL_UTIL (unsetenv) == NULL)
+     { // __collector_libc_funcs_init failed
+-      CALL_UTIL (unsetenv) = (int(*)())dlsym (RTLD_NEXT, "unsetenv");
++      CALL_UTIL (unsetenv) = (int(*)(const char*))dlsym (RTLD_NEXT, "unsetenv");
+       if (CALL_UTIL (unsetenv) == NULL || CALL_UTIL (unsetenv) == __collector_unsetenv)
+-	CALL_UTIL (unsetenv) = (int(*)())dlsym (RTLD_DEFAULT, "unsetenv");
++	CALL_UTIL (unsetenv) = (int(*)(const char*))dlsym (RTLD_DEFAULT, "unsetenv");
+       if (CALL_UTIL (unsetenv) == NULL || CALL_UTIL (unsetenv) == __collector_unsetenv)
+ 	{
+ 	  TprintfT (DBG_LT2, "__collector_unsetenv(): ERROR: no pointer found.\n");
+diff --git a/gprofng/libcollector/jprofile.c b/gprofng/libcollector/jprofile.c
+index cd498bed0a3..d8f2d049a84 100644
+--- a/gprofng/libcollector/jprofile.c
++++ b/gprofng/libcollector/jprofile.c
+@@ -99,8 +99,8 @@ static void rwrite (int fd, const void *buf, size_t nbyte);
+ static void addToDynamicArchive (const char* name, const unsigned char* class_data, int class_data_len);
+ static void (*AsyncGetCallTrace)(JVMPI_CallTrace*, jint, ucontext_t*) = NULL;
+ static void (*collector_heap_record)(int, int, void*) = NULL;
+-static void (*collector_jsync_begin)() = NULL;
+-static void (*collector_jsync_end)(hrtime_t, void *) = NULL;
++static void (*collector_jsync_begin)(void) = NULL;
++static void (*collector_jsync_end)(hrtime_t, void*) = NULL;
+ 
+ #define gethrtime collector_interface->getHiResTime
+ 
+@@ -224,7 +224,7 @@ open_experiment (const char *exp)
+       else if (__collector_strStartWith (args, "s:") == 0)
+ 	{
+ 	  java_sync_mode = 1;
+-	  collector_jsync_begin = (void(*)(hrtime_t, void *))dlsym (RTLD_DEFAULT, "__collector_jsync_begin");
++	  collector_jsync_begin = (void(*)(void))dlsym (RTLD_DEFAULT, "__collector_jsync_begin");
+ 	  collector_jsync_end = (void(*)(hrtime_t, void *))dlsym (RTLD_DEFAULT, "__collector_jsync_end");
+ 	}
+ #endif
+@@ -249,7 +249,7 @@ __collector_jprofile_enable_synctrace ()
+       return;
+     }
+   java_sync_mode = 1;
+-  collector_jsync_begin = (void(*)(hrtime_t, void *))dlsym (RTLD_DEFAULT, "__collector_jsync_begin");
++  collector_jsync_begin = (void(*)(void))dlsym (RTLD_DEFAULT, "__collector_jsync_begin");
+   collector_jsync_end = (void(*)(hrtime_t, void *))dlsym (RTLD_DEFAULT, "__collector_jsync_end");
+   TprintfT (DBG_LT1, "jprofile: turning on Java synctrace, and requesting events\n");
+ }
+@@ -1123,7 +1123,7 @@ jprof_find_asyncgetcalltrace ()
+ {
+   void *jvmhandle;
+   if (__collector_VM_ReadByteInstruction == NULL)
+-    __collector_VM_ReadByteInstruction = (int(*)()) dlsym (RTLD_DEFAULT, "Async_VM_ReadByteInstruction");
++    __collector_VM_ReadByteInstruction = (int(*)(unsigned char*)) dlsym (RTLD_DEFAULT, "Async_VM_ReadByteInstruction");
+ 
+   /* look for stack unwind function using default path */
+   AsyncGetCallTrace = (void (*)(JVMPI_CallTrace*, jint, ucontext_t*))
+diff --git a/gprofng/libcollector/libcol_util.c b/gprofng/libcollector/libcol_util.c
+index baac15db5c4..a73488e3f60 100644
+--- a/gprofng/libcollector/libcol_util.c
++++ b/gprofng/libcollector/libcol_util.c
+@@ -1114,7 +1114,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "munmap");
+   if (ptr)
+-    __collector_util_funcs.munmap = (int(*)())ptr;
++    __collector_util_funcs.munmap = (int(*)(void *, size_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT munmap: %s\n", dlerror ());
+@@ -1123,7 +1123,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "close");
+   if (ptr)
+-    __collector_util_funcs.close = (int(*)())ptr;
++    __collector_util_funcs.close = (int(*)(int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT close: %s\n", dlerror ());
+@@ -1158,7 +1158,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "close");
+   if (ptr)
+-    __collector_util_funcs.close = (int(*)())ptr;
++    __collector_util_funcs.close = (int(*)(int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT close: %s\n", dlerror ());
+@@ -1167,7 +1167,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "read");
+   if (ptr)
+-    __collector_util_funcs.read = (ssize_t (*)())ptr;
++    __collector_util_funcs.read = (ssize_t (*)(int, void*, size_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT read: %s\n", dlerror ());
+@@ -1176,7 +1176,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "write");
+   if (ptr)
+-    __collector_util_funcs.write = (ssize_t (*)())ptr;
++    __collector_util_funcs.write = (ssize_t (*)(int, void*, size_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT write: %s\n", dlerror ());
+@@ -1186,14 +1186,14 @@ __collector_util_init ()
+ #if ARCH(Intel) && WSIZE(32)
+   ptr = dlvsym (libc, "pwrite", "GLIBC_2.2"); // it is in /lib/libpthread.so.0
+   if (ptr)
+-    __collector_util_funcs.pwrite = (ssize_t (*)())ptr;
++    __collector_util_funcs.pwrite = (ssize_t (*)(int, void*, size_t, off_t))ptr;
+   else
+     {
+       Tprintf (DBG_LT0, "libcol_util: WARNING: dlvsym for %s@%s failed. Using dlsym() instead.", "pwrite", "GLIBC_2.2");
+ #endif /* ARCH(Intel) && WSIZE(32) */
+       ptr = dlsym (libc, "pwrite");
+       if (ptr)
+-	__collector_util_funcs.pwrite = (ssize_t (*)())ptr;
++	__collector_util_funcs.pwrite = (ssize_t (*)(int, const void*, size_t, off_t))ptr;
+       else
+ 	{
+ 	  CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT pwrite: %s\n", dlerror ());
+@@ -1213,7 +1213,7 @@ __collector_util_init ()
+ #endif /* ARCH(Intel) && WSIZE(32) */
+       ptr = dlsym (libc, "pwrite64");
+       if (ptr)
+-	__collector_util_funcs.pwrite64_ = (ssize_t (*)())ptr;
++	__collector_util_funcs.pwrite64_ = (ssize_t (*)(int, const void*, size_t, off_t))ptr;
+       else
+ 	__collector_util_funcs.pwrite64_ = __collector_util_funcs.pwrite;
+ #if ARCH(Intel) && WSIZE(32)
+@@ -1222,7 +1222,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "lseek");
+   if (ptr)
+-    __collector_util_funcs.lseek = (off_t (*)())ptr;
++    __collector_util_funcs.lseek = (off_t (*)(int, off_t, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT lseek: %s\n", dlerror ());
+@@ -1231,7 +1231,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "access");
+   if (ptr)
+-    __collector_util_funcs.access = (int(*)())ptr;
++    __collector_util_funcs.access = (int(*)(const char*, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT access: %s\n", dlerror ());
+@@ -1240,7 +1240,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "mkdir");
+   if (ptr)
+-    __collector_util_funcs.mkdir = (int(*)())ptr;
++    __collector_util_funcs.mkdir = (int(*)(const char*, mode_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT mkdir: %s\n", dlerror ());
+@@ -1249,7 +1249,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "opendir");
+   if (ptr)
+-    __collector_util_funcs.opendir = (DIR * (*)())ptr;
++    __collector_util_funcs.opendir = (DIR * (*)(const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT opendir: %s\n", dlerror ());
+@@ -1258,7 +1258,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "closedir");
+   if (ptr)
+-    __collector_util_funcs.closedir = (int(*)())ptr;
++    __collector_util_funcs.closedir = (int(*)(DIR*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT closedir: %s\n", dlerror ());
+@@ -1267,7 +1267,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "execv");
+   if (ptr)
+-    __collector_util_funcs.execv = (int(*)())ptr;
++    __collector_util_funcs.execv = (int(*)(const char*, char* const*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT execv: %s\n", dlerror ());
+@@ -1276,7 +1276,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "exit");
+   if (ptr)
+-    __collector_util_funcs.exit = (void(*)())ptr;
++    __collector_util_funcs.exit = (void(*)(int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT exit: %s\n", dlerror ());
+@@ -1285,7 +1285,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "vfork");
+   if (ptr)
+-    __collector_util_funcs.vfork = (pid_t (*)())ptr;
++    __collector_util_funcs.vfork = (pid_t (*)(void))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT vfork: %s\n", dlerror ());
+@@ -1294,7 +1294,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "waitpid");
+   if (ptr)
+-    __collector_util_funcs.waitpid = (pid_t (*)())ptr;
++    __collector_util_funcs.waitpid = (pid_t (*)(pid_t, int*, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT waitpid: %s\n", dlerror ());
+@@ -1313,7 +1313,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "getcontext");
+   if (ptr)
+-    __collector_util_funcs.getcontext = (int(*)())ptr;
++    __collector_util_funcs.getcontext = (int(*)(ucontext_t*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT getcontext: %s\n", dlerror ());
+@@ -1331,7 +1331,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "putenv");
+   if (ptr)
+-    __collector_util_funcs.putenv = (int(*)())ptr;
++    __collector_util_funcs.putenv = (int(*)(char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT putenv: %s\n", dlerror ());
+@@ -1340,7 +1340,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "getenv");
+   if (ptr)
+-    __collector_util_funcs.getenv = (char*(*)())ptr;
++    __collector_util_funcs.getenv = (char*(*)(const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT getenv: %s\n", dlerror ());
+@@ -1349,7 +1349,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "time");
+   if (ptr)
+-    __collector_util_funcs.time = (time_t (*)())ptr;
++    __collector_util_funcs.time = (time_t (*)(time_t*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT time: %s\n", dlerror ());
+@@ -1358,7 +1358,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "mktime");
+   if (ptr)
+-    __collector_util_funcs.mktime = (time_t (*)())ptr;
++    __collector_util_funcs.mktime = (time_t (*)(struct tm*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT mktime: %s\n", dlerror ());
+@@ -1372,7 +1372,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "gmtime_r");
+   if (ptr)
+-    __collector_util_funcs.gmtime_r = (struct tm * (*)())ptr;
++    __collector_util_funcs.gmtime_r = (struct tm * (*)(const time_t*, struct tm*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT gmtime_r: %s\n", dlerror ());
+@@ -1381,7 +1381,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strtol");
+   if (ptr)
+-    __collector_util_funcs.strtol = (long (*)())ptr;
++    __collector_util_funcs.strtol = (long (*)(const char*, char**, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strtol: %s\n", dlerror ());
+@@ -1390,7 +1390,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strtoll");
+   if (ptr)
+-    __collector_util_funcs.strtoll = (long long (*)())ptr;
++    __collector_util_funcs.strtoll = (long long (*)(const char*, char**, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strtoll: %s\n", dlerror ());
+@@ -1402,7 +1402,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "setenv");
+   if (ptr)
+-    __collector_util_funcs.setenv = (int(*)())ptr;
++    __collector_util_funcs.setenv = (int(*)(const char*, const char*, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT setenv: %s\n", dlerror ());
+@@ -1411,7 +1411,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "unsetenv");
+   if (ptr)
+-    __collector_util_funcs.unsetenv = (int(*)())ptr;
++    __collector_util_funcs.unsetenv = (int(*)(const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT unsetenv: %s\n", dlerror ());
+@@ -1507,7 +1507,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "pclose");
+   if (ptr)
+-    __collector_util_funcs.pclose = (int(*)())ptr;
++    __collector_util_funcs.pclose = (int(*)(FILE*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT pclose: %s\n", dlerror ());
+@@ -1516,7 +1516,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "fgets");
+   if (ptr)
+-    __collector_util_funcs.fgets = (char*(*)())ptr;
++    __collector_util_funcs.fgets = (char*(*)(char*, int, FILE*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT fgets: %s\n", dlerror ());
+@@ -1543,7 +1543,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "vsnprintf");
+   if (ptr)
+-    __collector_util_funcs.vsnprintf = (int(*)())ptr;
++    __collector_util_funcs.vsnprintf = (int(*)(char*, size_t, const char*, ...))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT vsnprintf: %s\n", dlerror ());
+@@ -1552,7 +1552,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "atoi");
+   if (ptr)
+-    __collector_util_funcs.atoi = (int(*)())ptr;
++    __collector_util_funcs.atoi = (int(*)(const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT atoi: %s\n", dlerror ());
+@@ -1561,7 +1561,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "calloc");
+   if (ptr)
+-    __collector_util_funcs.calloc = (void*(*)())ptr;
++    __collector_util_funcs.calloc = (void*(*)(size_t, size_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT calloc: %s\n", dlerror ());
+@@ -1571,7 +1571,7 @@ __collector_util_init ()
+   ptr = dlsym (libc, "free");
+   if (ptr)
+     {
+-      __collector_util_funcs.free = (void(*)())ptr;
++      __collector_util_funcs.free = (void(*)(void*))ptr;
+     }
+   else
+     {
+@@ -1581,7 +1581,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strdup");
+   if (ptr)
+-    __collector_util_funcs.libc_strdup = (char*(*)())ptr;
++    __collector_util_funcs.libc_strdup = (char*(*)(const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strdup: %s\n", dlerror ());
+@@ -1594,7 +1594,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strerror");
+   if (ptr)
+-    __collector_util_funcs.strerror = (char*(*)())ptr;
++    __collector_util_funcs.strerror = (char*(*)(int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strerror: %s\n", dlerror ());
+@@ -1602,7 +1602,7 @@ __collector_util_init ()
+     }
+   ptr = dlsym (libc, "strerror_r");
+   if (ptr)
+-    __collector_util_funcs.strerror_r = (int(*)())ptr;
++    __collector_util_funcs.strerror_r = (int(*)(int, char*, size_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strerror_r: %s\n", dlerror ());
+@@ -1610,7 +1610,7 @@ __collector_util_init ()
+     }
+   ptr = dlsym (libc, "strspn");
+   if (ptr)
+-    __collector_util_funcs.strspn = (size_t (*)())ptr;
++    __collector_util_funcs.strspn = (size_t (*)(const char*, const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strspn: %s\n", dlerror ());
+@@ -1619,7 +1619,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strtoul");
+   if (ptr)
+-    __collector_util_funcs.strtoul = (unsigned long int(*)())ptr;
++    __collector_util_funcs.strtoul = (unsigned long int(*)(const char*, char**, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strtoul: %s\n", dlerror ());
+@@ -1628,7 +1628,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strtoull");
+   if (ptr)
+-    __collector_util_funcs.strtoull = (unsigned long long int(*)())ptr;
++    __collector_util_funcs.strtoull = (unsigned long long int(*)(const char*, char**, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strtoull: %s\n", dlerror ());
+@@ -1673,7 +1673,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "sysconf");
+   if (ptr)
+-    __collector_util_funcs.sysconf = (long(*)())ptr;
++    __collector_util_funcs.sysconf = (long(*)(int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT sysconf: %s\n", dlerror ());
+@@ -1682,7 +1682,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "sigfillset");
+   if (ptr)
+-    __collector_util_funcs.sigfillset = (int(*)())ptr;
++    __collector_util_funcs.sigfillset = (int(*)(sigset_t*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT sigfillset: %s\n", dlerror ());
+@@ -1691,7 +1691,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "sigprocmask");
+   if (ptr)
+-    __collector_util_funcs.sigprocmask = (int(*)())ptr;
++    __collector_util_funcs.sigprocmask = (int(*)(int, const sigset_t*, sigset_t*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT sigprocmask: %s\n", dlerror ());
+diff --git a/gprofng/libcollector/mmaptrace.c b/gprofng/libcollector/mmaptrace.c
+index f07f4d76513..2a6857ab58e 100644
+--- a/gprofng/libcollector/mmaptrace.c
++++ b/gprofng/libcollector/mmaptrace.c
+@@ -1209,7 +1209,7 @@ process_vsyscall_page ()
+ /*
+  * collector API for dynamic functions
+  */
+-void collector_func_load () __attribute__ ((weak, alias ("__collector_func_load")));
++void collector_func_load (char*, char*, char*, void*, int, int, DT_lineno *) __attribute__ ((weak, alias ("__collector_func_load")));
+ void
+ __collector_func_load (char *name, char *alias, char *sourcename,
+ 		       void *vaddr, int size, int lntsize, DT_lineno *lntable)
+@@ -1218,7 +1218,7 @@ __collector_func_load (char *name, char *alias, char *sourcename,
+ 			     vaddr, size, lntsize, lntable);
+ }
+ 
+-void collector_func_unload () __attribute__ ((weak, alias ("__collector_func_unload")));
++void collector_func_unload (void *vaddr) __attribute__ ((weak, alias ("__collector_func_unload")));
+ void
+ __collector_func_unload (void *vaddr)
+ {
+diff --git a/gprofng/libcollector/unwind.c b/gprofng/libcollector/unwind.c
+index 55fa2e9e9e7..e08afa165d1 100644
+--- a/gprofng/libcollector/unwind.c
++++ b/gprofng/libcollector/unwind.c
+@@ -421,7 +421,7 @@ __collector_ext_unwind_init (int record)
+   omp_no_walk = 1;
+ 
+   if (__collector_VM_ReadByteInstruction == NULL)
+-    __collector_VM_ReadByteInstruction = (int(*)()) dlsym (RTLD_DEFAULT, "Async_VM_ReadByteInstruction");
++    __collector_VM_ReadByteInstruction = (int(*)(unsigned char*)) dlsym (RTLD_DEFAULT, "Async_VM_ReadByteInstruction");
+ 
+ #if ARCH(SPARC)
+ #if WSIZE(64)
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index ebcdbca561f..fd888cd58dd 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -110,7 +110,7 @@ typedef struct CollectorUtilFuncs
+   long (*sysinfo)(int command, char *buf, long count);
+   time_t (*time)(time_t *tloc);
+   int (*unsetenv)(const char *name);
+-  int (*vsnprintf)(char *str, size_t size, const char *format, va_list ap);
++  int (*vsnprintf)(char *str, size_t size, const char *format, ...);
+   pid_t (*waitpid)(pid_t pid, int *stat_loc, int options);
+   ssize_t (*write)(int, void *, size_t);
+   double (*atof)();
+-- 
+2.50.1
+
diff --git a/package/binutils-bpf/2.43.1/0007-gprofng-fix-build-with-std-gnu23.patch b/package/binutils-bpf/2.43.1/0007-gprofng-fix-build-with-std-gnu23.patch
new file mode 100644
index 0000000000..fe03b4b5cf
--- /dev/null
+++ b/package/binutils-bpf/2.43.1/0007-gprofng-fix-build-with-std-gnu23.patch
@@ -0,0 +1,199 @@
+From 9ca25799ea0e92855d19adc46634e6dd0675a0b7 Mon Sep 17 00:00:00 2001
+From: Vladimir Mezentsev <vladimir.mezentsev@oracle.com>
+Date: Thu, 21 Nov 2024 14:48:20 -0800
+Subject: [PATCH] gprofng: fix build with -std=gnu23
+
+Fix function pointer types accordingly.
+Remove unused function pointers.
+
+gprofng/ChangeLog
+2024-11-21  Vladimir Mezentsev  <vladimir.mezentsev@oracle.com>
+
+	PR gprofng/32374
+	PR gprofng/32373
+	* common/cpuid.c: Define ATTRIBUTE_UNUSED if necessary.
+	* libcollector/libcol_util.c (sysinfo): Remove unused pointer.
+	* src/collector_module.h: Likewise.
+	* libcollector/dispatcher.c (setitimer): Fix prototype.
+	* libcollector/linetrace.c (system, grantpt, ptsname): Likewise.
+	* testsuite/gprofng.display/mttest/mttest.c (dump_arrays): Likewise.
+	* testsuite/gprofng.display/synprog/endcases.c (xinline_code,
+	s_inline_code): Likewise.
+	* testsuite/gprofng.display/synprog/inc_inline.h (ext_inline_code):
+	Likewise.
+	* testsuite/gprofng.display/synprog/synprog.c (doabort): Rename nullptr.
+
+Upstream: 4e943705e3e8a5a9448d087502bcb390a694ad02
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ gprofng/common/cpuid.c                                 |  2 ++
+ gprofng/libcollector/dispatcher.c                      |  2 +-
+ gprofng/libcollector/libcol_util.c                     |  9 ---------
+ gprofng/libcollector/linetrace.c                       | 10 +++++-----
+ gprofng/src/collector_module.h                         |  1 -
+ gprofng/testsuite/gprofng.display/mttest/mttest.c      |  2 +-
+ gprofng/testsuite/gprofng.display/synprog/endcases.c   |  4 ++--
+ gprofng/testsuite/gprofng.display/synprog/inc_inline.h |  2 +-
+ gprofng/testsuite/gprofng.display/synprog/synprog.c    |  4 ++--
+ 9 files changed, 14 insertions(+), 22 deletions(-)
+
+diff --git a/gprofng/common/cpuid.c b/gprofng/common/cpuid.c
+index 891d5471335..b4caef54f57 100644
+--- a/gprofng/common/cpuid.c
++++ b/gprofng/common/cpuid.c
+@@ -21,7 +21,9 @@
+ #if defined(__i386__) || defined(__x86_64)
+ #include <cpuid.h>  /* GCC-provided */
+ #elif defined(__aarch64__)
++#if !defined(ATTRIBUTE_UNUSED)
+ #define ATTRIBUTE_UNUSED __attribute__((unused))
++#endif
+ 
+ static inline uint_t __attribute_const__
+ __get_cpuid (unsigned int op ATTRIBUTE_UNUSED, unsigned int *eax,
+diff --git a/gprofng/libcollector/dispatcher.c b/gprofng/libcollector/dispatcher.c
+index 4eda18ec324..6f0364cc52c 100644
+--- a/gprofng/libcollector/dispatcher.c
++++ b/gprofng/libcollector/dispatcher.c
+@@ -1280,4 +1280,4 @@ __collector_ext_clone_pthread (int (*fn)(void *), void *child_stack, int flags,
+ // weak symbols:
+ int sigprocmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_sigprocmask")));
+ int thr_sigsetmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_thr_sigsetmask")));
+-int setitimer () __attribute__ ((weak, alias ("_setitimer")));
++__typeof(setitimer) setitimer __attribute__ ((weak, alias ("_setitimer")));
+diff --git a/gprofng/libcollector/libcol_util.c b/gprofng/libcollector/libcol_util.c
+index a73488e3f60..77dc886be22 100644
+--- a/gprofng/libcollector/libcol_util.c
++++ b/gprofng/libcollector/libcol_util.c
+@@ -1427,15 +1427,6 @@ __collector_util_init ()
+       err = COL_ERROR_UTIL_INIT;
+     }
+ 
+-  ptr = dlsym (libc, "sysinfo");
+-  if (ptr)
+-    __collector_util_funcs.sysinfo = (long (*)())ptr;
+-  else
+-    {
+-      CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT sysinfo: %s\n", dlerror ());
+-      err = COL_ERROR_UTIL_INIT;
+-    }
+-
+   ptr = dlsym (libc, "clearenv");
+   if (ptr)
+     __collector_util_funcs.clearenv = (int(*)())ptr;
+diff --git a/gprofng/libcollector/linetrace.c b/gprofng/libcollector/linetrace.c
+index 66844bc1337..c81ae1a2272 100644
+--- a/gprofng/libcollector/linetrace.c
++++ b/gprofng/libcollector/linetrace.c
+@@ -1527,7 +1527,7 @@ DCL_FUNC_VER (DCL_POSIX_SPAWNP, posix_spawnp_2_2, posix_spawnp@GLIBC_2.2)
+ DCL_POSIX_SPAWNP (posix_spawnp)
+ 
+ /*------------------------------------------------------------- system */
+-int system () __attribute__ ((weak, alias ("__collector_system")));
++int system (const char *cmd) __attribute__ ((weak, alias ("__collector_system")));
+ 
+ int
+ __collector_system (const char *cmd)
+@@ -1582,10 +1582,10 @@ DCL_FUNC_VER (DCL_POPEN, popen_2_0, popen@GLIBC_2.0)
+ DCL_POPEN (popen)
+ 
+ /*------------------------------------------------------------- grantpt */
+-int grantpt () __attribute__ ((weak, alias ("__collector_grantpt")));
++int grantpt (int fildes) __attribute__ ((weak, alias ("__collector_grantpt")));
+ 
+ int
+-__collector_grantpt (const int fildes)
++__collector_grantpt (int fildes)
+ {
+   if (NULL_PTR (grantpt))
+     init_lineage_intf ();
+@@ -1607,10 +1607,10 @@ __collector_grantpt (const int fildes)
+ }
+ 
+ /*------------------------------------------------------------- ptsname */
+-char *ptsname () __attribute__ ((weak, alias ("__collector_ptsname")));
++char *ptsname (int fildes) __attribute__ ((weak, alias ("__collector_ptsname")));
+ 
+ char *
+-__collector_ptsname (const int fildes)
++__collector_ptsname (int fildes)
+ {
+   if (NULL_PTR (ptsname))
+     init_lineage_intf ();
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index fd888cd58dd..6640f12fa3c 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -107,7 +107,6 @@ typedef struct CollectorUtilFuncs
+   int (*symlink)(const char *s1, const char *s2);
+   int (*syscall)(int number, ...);
+   long (*sysconf)(int name);
+-  long (*sysinfo)(int command, char *buf, long count);
+   time_t (*time)(time_t *tloc);
+   int (*unsetenv)(const char *name);
+   int (*vsnprintf)(char *str, size_t size, const char *format, ...);
+diff --git a/gprofng/testsuite/gprofng.display/mttest/mttest.c b/gprofng/testsuite/gprofng.display/mttest/mttest.c
+index e0835c833e5..3db5b8d8e86 100644
+--- a/gprofng/testsuite/gprofng.display/mttest/mttest.c
++++ b/gprofng/testsuite/gprofng.display/mttest/mttest.c
+@@ -171,7 +171,7 @@ void computeJ (workStruct_t *x);
+ void computeK (workStruct_t *x);
+ void addone (workCtr_t *x);
+ void init_arrays (int strat);
+-void dump_arrays ();
++void dump_arrays (hrtime_t real, hrtime_t cpu, int case_index);
+ void *do_work (void *v);
+ void thread_work ();
+ void nothreads (Workblk *array, struct scripttab *k);
+diff --git a/gprofng/testsuite/gprofng.display/synprog/endcases.c b/gprofng/testsuite/gprofng.display/synprog/endcases.c
+index a6a1389658a..6f1c83b6859 100644
+--- a/gprofng/testsuite/gprofng.display/synprog/endcases.c
++++ b/gprofng/testsuite/gprofng.display/synprog/endcases.c
+@@ -40,8 +40,8 @@ static void s_inline_code (int);
+ void ext_inline_code (int);
+ 
+ #ifndef NO_INLINE
+-void xinline_code () __attribute__ ((always_inline));
+-void s_inline_code () __attribute__ ((always_inline));
++void xinline_code (int) __attribute__ ((always_inline));
++void s_inline_code (int) __attribute__ ((always_inline));
+ #endif
+ 
+ #include "inc_inline.h"
+diff --git a/gprofng/testsuite/gprofng.display/synprog/inc_inline.h b/gprofng/testsuite/gprofng.display/synprog/inc_inline.h
+index da42563c828..6600eacb66d 100644
+--- a/gprofng/testsuite/gprofng.display/synprog/inc_inline.h
++++ b/gprofng/testsuite/gprofng.display/synprog/inc_inline.h
+@@ -19,7 +19,7 @@
+    MA 02110-1301, USA.  */
+ 
+ #ifndef NO_INLINE
+-void ext_inline_code() __attribute__ ((always_inline));
++void ext_inline_code(int) __attribute__ ((always_inline));
+ #endif
+ 
+ void
+diff --git a/gprofng/testsuite/gprofng.display/synprog/synprog.c b/gprofng/testsuite/gprofng.display/synprog/synprog.c
+index cf1bc5b0909..05920dc7419 100644
+--- a/gprofng/testsuite/gprofng.display/synprog/synprog.c
++++ b/gprofng/testsuite/gprofng.display/synprog/synprog.c
+@@ -528,14 +528,14 @@ reapchildren ()
+ int
+ doabort (int k)
+ {
+-  char *nullptr = NULL;
++  char *p = NULL;
+   char c;
+ 
+   /* Log the event */
+   wlog ("start of doabort", NULL);
+ 
+   /* and dereference a NULL */
+-  c = *nullptr;
++  c = *p;
+ 
+   /* this should never be reached */
+   return (int) c;
+-- 
+2.50.1
+
diff --git a/package/binutils-bpf/2.44/0001-sh-conf.patch b/package/binutils-bpf/2.44/0001-sh-conf.patch
new file mode 100644
index 0000000000..e56f52b9d8
--- /dev/null
+++ b/package/binutils-bpf/2.44/0001-sh-conf.patch
@@ -0,0 +1,50 @@
+From d5f66b0da8d1e0ed091bff65f8a4db10a82a5420 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:38:13 +0100
+Subject: [PATCH] sh-conf
+
+Likewise, binutils has no idea about any of these new targets either, so we
+fix that up too.. now we're able to actually build a real toolchain for
+sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more
+inept targets than that one, really. Go look, I promise).
+
+Upstream: N/A [Buildroot specific]
+
+[Romain: rebase on top of 2.32]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Thomas: rebase on top of 2.29, in which sh64 support was removed.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index bbfb5979546..bcd95684ae1 100755
+--- a/configure
++++ b/configure
+@@ -4056,7 +4056,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/configure.ac b/configure.ac
+index f9694cdf901..d6a3623ba50 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1278,7 +1278,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+-- 
+2.48.1
+
diff --git a/package/binutils-bpf/2.44/0002-poison-system-directories.patch b/package/binutils-bpf/2.44/0002-poison-system-directories.patch
new file mode 100644
index 0000000000..b8d6d15525
--- /dev/null
+++ b/package/binutils-bpf/2.44/0002-poison-system-directories.patch
@@ -0,0 +1,310 @@
+From 947a56b4ba73ec3fbf9c1fcff46d65754ba12e27 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:45:38 +0100
+Subject: [PATCH] poison-system-directories
+
+Patch adapted to binutils 2.23.2 and extended to use
+BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
+
+[Waldemar: rebase on top of 2.43]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Waldemar: rebase on top of 2.39]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: rebase on top of 2.33.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Gustavo: adapt to binutils 2.25]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+Upstream-Status: Inappropriate [distribution: codesourcery]
+Upstream: N/A [Buildroot specific]
+
+Patch originally created by Mark Hatle, forward-ported to
+binutils 2.21 by Scott Garman.
+
+purpose:  warn for uses of system directories when cross linking
+
+Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
+
+2008-07-02  Joseph Myers  <joseph@codesourcery.com>
+
+    ld/
+    * ld.h (args_type): Add error_poison_system_directories.
+    * ld.texinfo (--error-poison-system-directories): Document.
+    * ldfile.c (ldfile_add_library_path): Check
+    command_line.error_poison_system_directories.
+    * ldmain.c (main): Initialize
+    command_line.error_poison_system_directories.
+    * lexsup.c (enum option_values): Add
+    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES.
+    (ld_options): Add --error-poison-system-directories.
+    (parse_args): Handle new option.
+
+2007-06-13  Joseph Myers  <joseph@codesourcery.com>
+
+    ld/
+    * config.in: Regenerate.
+    * ld.h (args_type): Add poison_system_directories.
+    * ld.texinfo (--no-poison-system-directories): Document.
+    * ldfile.c (ldfile_add_library_path): Check
+    command_line.poison_system_directories.
+    * ldmain.c (main): Initialize
+    command_line.poison_system_directories.
+    * lexsup.c (enum option_values): Add
+    OPTION_NO_POISON_SYSTEM_DIRECTORIES.
+    (ld_options): Add --no-poison-system-directories.
+    (parse_args): Handle new option.
+
+2007-04-20  Joseph Myers  <joseph@codesourcery.com>
+
+    Merge from Sourcery G++ binutils 2.17:
+
+    2007-03-20  Joseph Myers  <joseph@codesourcery.com>
+    Based on patch by Mark Hatle <mark.hatle@windriver.com>.
+    ld/
+    * configure.ac (--enable-poison-system-directories): New option.
+    * configure, config.in: Regenerate.
+    * ldfile.c (ldfile_add_library_path): If
+    ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
+    /usr/lib, /usr/local/lib or /usr/X11R6/lib.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+ ld/config.in    |  3 +++
+ ld/configure    | 14 ++++++++++++++
+ ld/configure.ac | 10 ++++++++++
+ ld/ld.h         |  8 ++++++++
+ ld/ld.texi      | 12 ++++++++++++
+ ld/ldfile.c     | 16 ++++++++++++++++
+ ld/ldlex.h      |  2 ++
+ ld/ldmain.c     |  2 ++
+ ld/lexsup.c     | 21 +++++++++++++++++++++
+ 9 files changed, 88 insertions(+)
+
+diff --git a/ld/config.in b/ld/config.in
+index 2d7b6406d2b..37cd12d20fa 100644
+--- a/ld/config.in
++++ b/ld/config.in
+@@ -78,6 +78,9 @@
+    language is requested. */
+ #undef ENABLE_NLS
+ 
++/* Define to warn for use of native system library directories */
++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
++
+ /* Additional extension a shared object might have. */
+ #undef EXTRA_SHLIB_EXTENSION
+ 
+diff --git a/ld/configure b/ld/configure
+index d3995b73c06..2317f06682e 100755
+--- a/ld/configure
++++ b/ld/configure
+@@ -844,6 +844,7 @@ with_lib_path
+ enable_targets
+ enable_64_bit_bfd
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1537,6 +1538,8 @@ Optional Features:
+   --enable-checking       enable run-time checks
+   --enable-targets        alternative target configurations
+   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15592,7 +15595,18 @@ else
+ fi
+ 
+ 
++# Check whether --enable-poison-system-directories was given.
++if test "${enable_poison_system_directories+set}" = set; then :
++  enableval=$enable_poison_system_directories;
++else
++  enable_poison_system_directories=no
++fi
++
++if test "x${enable_poison_system_directories}" = "xyes"; then
+ 
++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
++
++fi
+ 
+ # Check whether --enable-got was given.
+ if test "${enable_got+set}" = set; then :
+diff --git a/ld/configure.ac b/ld/configure.ac
+index 228f2ee4089..50a4b0f4db1 100644
+--- a/ld/configure.ac
++++ b/ld/configure.ac
+@@ -102,6 +102,16 @@ AC_SUBST(use_sysroot)
+ AC_SUBST(TARGET_SYSTEM_ROOT)
+ AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
+ 
++AC_ARG_ENABLE([poison-system-directories],
++         AS_HELP_STRING([--enable-poison-system-directories],
++                [warn for use of native system library directories]),,
++         [enable_poison_system_directories=no])
++if test "x${enable_poison_system_directories}" = "xyes"; then
++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
++       [1],
++       [Define to warn for use of native system library directories])
++fi
++
+ dnl Use --enable-gold to decide if this linker should be the default.
+ dnl "install_as_default" is set to false if gold is the default linker.
+ dnl "installed_linker" is the installed BFD linker name.
+diff --git a/ld/ld.h b/ld/ld.h
+index 254f0a097bb..daf777c65c8 100644
+--- a/ld/ld.h
++++ b/ld/ld.h
+@@ -166,6 +166,14 @@ typedef struct
+      in the linker script.  */
+   bool force_group_allocation;
+ 
++  /* If TRUE (the default) warn for uses of system directories when
++     cross linking.  */
++  bool poison_system_directories;
++
++  /* If TRUE (default FALSE) give an error for uses of system
++     directories when cross linking instead of a warning.  */
++  bool error_poison_system_directories;
++
+   /* Big or little endian as set on command line.  */
+   enum endian_enum endian;
+ 
+diff --git a/ld/ld.texi b/ld/ld.texi
+index f6384ad82dd..9d972ec9725 100644
+--- a/ld/ld.texi
++++ b/ld/ld.texi
+@@ -3263,6 +3263,18 @@ bit string identifying the original linked file does not change.
+ Passing @code{none} for @var{style} disables the setting from any
+ @code{--build-id} options earlier on the command line.
+ 
++@kindex --no-poison-system-directories
++@item --no-poison-system-directories
++Do not warn for @option{-L} options using system directories such as
++@file{/usr/lib} when cross linking.  This option is intended for use
++in chroot environments when such directories contain the correct
++libraries for the target system rather than the host.
++
++@kindex --error-poison-system-directories
++@item --error-poison-system-directories
++Give an error instead of a warning for @option{-L} options using
++system directories when cross linking.
++
+ @kindex --package-metadata=@var{JSON}
+ @item --package-metadata=@var{JSON}
+ Request the creation of a @code{.note.package} ELF note section.  The
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index 12551504ae6..c6bfb98e522 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -328,6 +328,22 @@ ldfile_add_library_path (const char *name, bool cmdline)
+     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
+   else
+     new_dirs->name = xstrdup (name);
++
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++  if (command_line.poison_system_directories
++  && ((!strncmp (name, "/lib", 4))
++      || (!strncmp (name, "/usr/lib", 8))
++      || (!strncmp (name, "/usr/local/lib", 14))
++      || (!strncmp (name, "/usr/X11R6/lib", 14))))
++   {
++     if (command_line.error_poison_system_directories)
++       einfo (_("%X%P: error: library search path \"%s\" is unsafe for "
++            "cross-compilation\n"), name);
++     else
++       einfo (_("%P: warning: library search path \"%s\" is unsafe for "
++            "cross-compilation\n"), name);
++   }
++#endif
+ }
+ 
+ static void
+diff --git a/ld/ldlex.h b/ld/ldlex.h
+index b8b7d6b6829..c4b91482452 100644
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -171,6 +171,8 @@ enum option_values
+   OPTION_CTF_VARIABLES,
+   OPTION_NO_CTF_VARIABLES,
+   OPTION_CTF_SHARE_TYPES,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+   OPTION_ERROR_EXECSTACK,
+   OPTION_NO_ERROR_EXECSTACK,
+   OPTION_WARN_EXECSTACK_OBJECTS,
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index f1c5f7035c5..69dd2d89357 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -351,6 +351,8 @@ main (int argc, char **argv)
+   command_line.warn_mismatch = true;
+   command_line.warn_search_mismatch = true;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = true;
++  command_line.error_poison_system_directories = false;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index 5399aa45b72..a04346bee58 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -650,6 +650,14 @@ static const struct ld_option ld_options[] =
+ 		   "                                <method> is: share-unconflicted (default),\n"
+ 		   "                                             share-duplicated"),
+     TWO_DASHES },
++  { {"no-poison-system-directories", no_argument, NULL,
++    OPTION_NO_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Do not warn for -L options using system directories"),
++    TWO_DASHES },
++  { {"error-poison-system-directories", no_argument, NULL,
++    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Give an error for -L options using system directories"),
++    TWO_DASHES },
+ };
+ 
+ #define OPTION_COUNT ARRAY_SIZE (ld_options)
+@@ -662,6 +670,7 @@ parse_args (unsigned argc, char **argv)
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1789,6 +1798,14 @@ parse_args (unsigned argc, char **argv)
+ 	  }
+ 	  break;
+ 
++	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
++	  command_line.poison_system_directories = false;
++	  break;
++
++	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
++	  command_line.error_poison_system_directories = true;
++	  break;
++
+ 	case OPTION_PUSH_STATE:
+ 	  input_flags.pushed = xmemdup (&input_flags,
+ 					sizeof (input_flags),
+@@ -1933,6 +1950,10 @@ parse_args (unsigned argc, char **argv)
+       command_line.soname = NULL;
+     }
+ 
++  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
++  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
++    command_line.error_poison_system_directories = true;
++
+   while (ingroup)
+     {
+       einfo (_("%P: missing --end-group; added as last command line option\n"));
+-- 
+2.48.1
+
diff --git a/package/binutils-bpf/2.44/0003-objdump-memleak.patch b/package/binutils-bpf/2.44/0003-objdump-memleak.patch
new file mode 100644
index 0000000000..1b1632093d
--- /dev/null
+++ b/package/binutils-bpf/2.44/0003-objdump-memleak.patch
@@ -0,0 +1,31 @@
+From ba6ad3a18cb26b79e0e3b84c39f707535bbc344d Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 19 Feb 2025 07:58:54 +1030
+Subject: [PATCH] PR32716, objdump -i memory leak
+
+PR binutils/32716
+* bucomm.c (display_info): Free arg.info.
+
+Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d
+
+CVE: CVE-2025-3198
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ binutils/bucomm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/binutils/bucomm.c b/binutils/bucomm.c
+index ccf54099154..d4554737db1 100644
+--- a/binutils/bucomm.c
++++ b/binutils/bucomm.c
+@@ -435,6 +435,7 @@ display_info (void)
+   if (!arg.error)
+     display_target_tables (&arg);
+ 
++  free (arg.info);
+   return arg.error;
+ }
+ 
+-- 
+2.43.5
+
diff --git a/package/binutils-bpf/2.45.1/0001-sh-conf.patch b/package/binutils-bpf/2.45.1/0001-sh-conf.patch
new file mode 100644
index 0000000000..66104ca580
--- /dev/null
+++ b/package/binutils-bpf/2.45.1/0001-sh-conf.patch
@@ -0,0 +1,50 @@
+From 0bf75276c392cac7794e78e1572abcd793d99e4e Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:38:13 +0100
+Subject: [PATCH] sh-conf
+
+Likewise, binutils has no idea about any of these new targets either, so we
+fix that up too.. now we're able to actually build a real toolchain for
+sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more
+inept targets than that one, really. Go look, I promise).
+
+Upstream: N/A [Buildroot specific]
+
+[Romain: rebase on top of 2.32]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Thomas: rebase on top of 2.29, in which sh64 support was removed.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index bbfb5979546..bcd95684ae1 100755
+--- a/configure
++++ b/configure
+@@ -4056,7 +4056,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/configure.ac b/configure.ac
+index f9694cdf901..d6a3623ba50 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1278,7 +1278,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+-- 
+2.51.1
+
diff --git a/package/binutils-bpf/2.45.1/0002-poison-system-directories.patch b/package/binutils-bpf/2.45.1/0002-poison-system-directories.patch
new file mode 100644
index 0000000000..fc60b5874f
--- /dev/null
+++ b/package/binutils-bpf/2.45.1/0002-poison-system-directories.patch
@@ -0,0 +1,310 @@
+From 92f4bd0e1713577e30491e99a0226088eaeae740 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:45:38 +0100
+Subject: [PATCH] poison-system-directories
+
+Patch adapted to binutils 2.23.2 and extended to use
+BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
+
+[Waldemar: rebase on top of 2.43]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Waldemar: rebase on top of 2.39]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: rebase on top of 2.33.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Gustavo: adapt to binutils 2.25]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+Upstream-Status: Inappropriate [distribution: codesourcery]
+Upstream: N/A [Buildroot specific]
+
+Patch originally created by Mark Hatle, forward-ported to
+binutils 2.21 by Scott Garman.
+
+purpose:  warn for uses of system directories when cross linking
+
+Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
+
+2008-07-02  Joseph Myers  <joseph@codesourcery.com>
+
+    ld/
+    * ld.h (args_type): Add error_poison_system_directories.
+    * ld.texinfo (--error-poison-system-directories): Document.
+    * ldfile.c (ldfile_add_library_path): Check
+    command_line.error_poison_system_directories.
+    * ldmain.c (main): Initialize
+    command_line.error_poison_system_directories.
+    * lexsup.c (enum option_values): Add
+    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES.
+    (ld_options): Add --error-poison-system-directories.
+    (parse_args): Handle new option.
+
+2007-06-13  Joseph Myers  <joseph@codesourcery.com>
+
+    ld/
+    * config.in: Regenerate.
+    * ld.h (args_type): Add poison_system_directories.
+    * ld.texinfo (--no-poison-system-directories): Document.
+    * ldfile.c (ldfile_add_library_path): Check
+    command_line.poison_system_directories.
+    * ldmain.c (main): Initialize
+    command_line.poison_system_directories.
+    * lexsup.c (enum option_values): Add
+    OPTION_NO_POISON_SYSTEM_DIRECTORIES.
+    (ld_options): Add --no-poison-system-directories.
+    (parse_args): Handle new option.
+
+2007-04-20  Joseph Myers  <joseph@codesourcery.com>
+
+    Merge from Sourcery G++ binutils 2.17:
+
+    2007-03-20  Joseph Myers  <joseph@codesourcery.com>
+    Based on patch by Mark Hatle <mark.hatle@windriver.com>.
+    ld/
+    * configure.ac (--enable-poison-system-directories): New option.
+    * configure, config.in: Regenerate.
+    * ldfile.c (ldfile_add_library_path): If
+    ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
+    /usr/lib, /usr/local/lib or /usr/X11R6/lib.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+ ld/config.in    |  3 +++
+ ld/configure    | 14 ++++++++++++++
+ ld/configure.ac | 10 ++++++++++
+ ld/ld.h         |  8 ++++++++
+ ld/ld.texi      | 12 ++++++++++++
+ ld/ldfile.c     | 16 ++++++++++++++++
+ ld/ldlex.h      |  2 ++
+ ld/ldmain.c     |  2 ++
+ ld/lexsup.c     | 21 +++++++++++++++++++++
+ 9 files changed, 88 insertions(+)
+
+diff --git a/ld/config.in b/ld/config.in
+index 790efd336be..2b237bcda5e 100644
+--- a/ld/config.in
++++ b/ld/config.in
+@@ -86,6 +86,9 @@
+    language is requested. */
+ #undef ENABLE_NLS
+ 
++/* Define to warn for use of native system library directories */
++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
++
+ /* Additional extension a shared object might have. */
+ #undef EXTRA_SHLIB_EXTENSION
+ 
+diff --git a/ld/configure b/ld/configure
+index cd410bd64d1..7e9913949d4 100755
+--- a/ld/configure
++++ b/ld/configure
+@@ -841,6 +841,7 @@ enable_checking
+ with_lib_path
+ enable_targets
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1535,6 +1536,8 @@ Optional Features:
+   --disable-largefile     omit support for large files
+   --enable-checking       enable run-time checks
+   --enable-targets        alternative target configurations
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15393,7 +15396,18 @@ else
+ fi
+ 
+ 
++# Check whether --enable-poison-system-directories was given.
++if test "${enable_poison_system_directories+set}" = set; then :
++  enableval=$enable_poison_system_directories;
++else
++  enable_poison_system_directories=no
++fi
++
++if test "x${enable_poison_system_directories}" = "xyes"; then
+ 
++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
++
++fi
+ 
+ # Check whether --enable-got was given.
+ if test "${enable_got+set}" = set; then :
+diff --git a/ld/configure.ac b/ld/configure.ac
+index f528ae42ef7..dcf1e17fae6 100644
+--- a/ld/configure.ac
++++ b/ld/configure.ac
+@@ -115,6 +115,16 @@ AC_SUBST(use_sysroot)
+ AC_SUBST(TARGET_SYSTEM_ROOT)
+ AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
+ 
++AC_ARG_ENABLE([poison-system-directories],
++         AS_HELP_STRING([--enable-poison-system-directories],
++                [warn for use of native system library directories]),,
++         [enable_poison_system_directories=no])
++if test "x${enable_poison_system_directories}" = "xyes"; then
++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
++       [1],
++       [Define to warn for use of native system library directories])
++fi
++
+ dnl Use --enable-gold to decide if this linker should be the default.
+ dnl "install_as_default" is set to false if gold is the default linker.
+ dnl "installed_linker" is the installed BFD linker name.
+diff --git a/ld/ld.h b/ld/ld.h
+index c8688153bd4..0b16caf347a 100644
+--- a/ld/ld.h
++++ b/ld/ld.h
+@@ -166,6 +166,14 @@ typedef struct
+      in the linker script.  */
+   bool force_group_allocation;
+ 
++  /* If TRUE (the default) warn for uses of system directories when
++     cross linking.  */
++  bool poison_system_directories;
++
++  /* If TRUE (default FALSE) give an error for uses of system
++     directories when cross linking instead of a warning.  */
++  bool error_poison_system_directories;
++
+   /* Big or little endian as set on command line.  */
+   enum endian_enum endian;
+ 
+diff --git a/ld/ld.texi b/ld/ld.texi
+index cf750d15259..1acaa26f107 100644
+--- a/ld/ld.texi
++++ b/ld/ld.texi
+@@ -3362,6 +3362,18 @@ bit string identifying the original linked file does not change.
+ Passing @code{none} for @var{style} disables the setting from any
+ @code{--build-id} options earlier on the command line.
+ 
++@kindex --no-poison-system-directories
++@item --no-poison-system-directories
++Do not warn for @option{-L} options using system directories such as
++@file{/usr/lib} when cross linking.  This option is intended for use
++in chroot environments when such directories contain the correct
++libraries for the target system rather than the host.
++
++@kindex --error-poison-system-directories
++@item --error-poison-system-directories
++Give an error instead of a warning for @option{-L} options using
++system directories when cross linking.
++
+ @kindex --package-metadata=@var{JSON}
+ @item --package-metadata=@var{JSON}
+ Request the creation of a @code{.note.package} ELF note section.  The
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index 75fd360d5e3..3526ea8146c 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -328,6 +328,22 @@ ldfile_add_library_path (const char *name, bool cmdline)
+     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
+   else
+     new_dirs->name = xstrdup (name);
++
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++  if (command_line.poison_system_directories
++  && ((!strncmp (name, "/lib", 4))
++      || (!strncmp (name, "/usr/lib", 8))
++      || (!strncmp (name, "/usr/local/lib", 14))
++      || (!strncmp (name, "/usr/X11R6/lib", 14))))
++   {
++     if (command_line.error_poison_system_directories)
++       einfo (_("%X%P: error: library search path \"%s\" is unsafe for "
++            "cross-compilation\n"), name);
++     else
++       einfo (_("%P: warning: library search path \"%s\" is unsafe for "
++            "cross-compilation\n"), name);
++   }
++#endif
+ }
+ 
+ static void
+diff --git a/ld/ldlex.h b/ld/ldlex.h
+index c8d61478c60..4b175dca108 100644
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -172,6 +172,8 @@ enum option_values
+   OPTION_CTF_VARIABLES,
+   OPTION_NO_CTF_VARIABLES,
+   OPTION_CTF_SHARE_TYPES,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+   OPTION_ERROR_EXECSTACK,
+   OPTION_NO_ERROR_EXECSTACK,
+   OPTION_WARN_EXECSTACK_OBJECTS,
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index 67c60c3f80d..c2365e4006c 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -671,6 +671,8 @@ main (int argc, char **argv)
+   command_line.warn_mismatch = true;
+   command_line.warn_search_mismatch = true;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = true;
++  command_line.error_poison_system_directories = false;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index bde20465835..422866f4ea9 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -652,6 +652,14 @@ static const struct ld_option ld_options[] =
+ 		   "                                <method> is: share-unconflicted (default),\n"
+ 		   "                                             share-duplicated"),
+     TWO_DASHES },
++  { {"no-poison-system-directories", no_argument, NULL,
++    OPTION_NO_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Do not warn for -L options using system directories"),
++    TWO_DASHES },
++  { {"error-poison-system-directories", no_argument, NULL,
++    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Give an error for -L options using system directories"),
++    TWO_DASHES },
+ };
+ 
+ #define OPTION_COUNT ARRAY_SIZE (ld_options)
+@@ -664,6 +672,7 @@ parse_args (unsigned argc, char **argv)
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1800,6 +1809,14 @@ parse_args (unsigned argc, char **argv)
+ 	  }
+ 	  break;
+ 
++	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
++	  command_line.poison_system_directories = false;
++	  break;
++
++	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
++	  command_line.error_poison_system_directories = true;
++	  break;
++
+ 	case OPTION_PUSH_STATE:
+ 	  input_flags.pushed = xmemdup (&input_flags,
+ 					sizeof (input_flags),
+@@ -1944,6 +1961,10 @@ parse_args (unsigned argc, char **argv)
+       command_line.soname = NULL;
+     }
+ 
++  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
++  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
++    command_line.error_poison_system_directories = true;
++
+   while (ingroup)
+     {
+       einfo (_("%P: missing --end-group; added as last command line option\n"));
+-- 
+2.51.1
+
diff --git a/package/binutils-bpf/Config.in.host b/package/binutils-bpf/Config.in.host
new file mode 100644
index 0000000000..93de13256e
--- /dev/null
+++ b/package/binutils-bpf/Config.in.host
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_HOST_BINUTILS_BPF
+	bool "host binutils-bpf"
+	help
+	  The GNU Binutils are a collection of binary tools:
+
+	  ld - the GNU linker.
+	  as - the GNU assembler.
+	  and others...
+
+	  http://www.gnu.org/software/binutils/
+
+config BR2_PACKAGE_HOST_BINUTILS_BPF_VERSION_2_42_X
+	bool
+config BR2_PACKAGE_HOST_BINUTILS_BPF_VERSION_2_43_X
+	bool
+config BR2_PACKAGE_HOST_BINUTILS_BPF_VERSION_2_44_X
+	bool
+config BR2_PACKAGE_HOST_BINUTILS_BPF_VERSION_2_45_X
+	bool
+	default y
+
+config BR2_PACKAGE_HOST_BINUTILS_BPF_VERSION
+	string
+	default "2.42"		if BR2_PACKAGE_HOST_BINUTILS_BPF_VERSION_2_42_X
+	default "2.43.1"	if BR2_PACKAGE_HOST_BINUTILS_BPF_VERSION_2_43_X
+	default "2.44"		if BR2_PACKAGE_HOST_BINUTILS_BPF_VERSION_2_44_X
+	default "2.45.1"	if BR2_PACKAGE_HOST_BINUTILS_BPF_VERSION_2_45_X
diff --git a/package/binutils-bpf/binutils-bpf.hash b/package/binutils-bpf/binutils-bpf.hash
new file mode 100644
index 0000000000..5d156d1bb8
--- /dev/null
+++ b/package/binutils-bpf/binutils-bpf.hash
@@ -0,0 +1,8 @@
+# From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
+sha512  20977ad17729141a2c26d358628f44a0944b84dcfefdec2ba029c2d02f40dfc41cc91c0631044560d2bd6f9a51e1f15846b4b311befbe14f1239f14ff7d57824  binutils-2.43.1.tar.xz
+sha512  b85d3bbc0e334cf67a96219d3c7c65fbf3e832b2c98a7417bf131f3645a0307057ec81cd2b29ff2563cec53e3d42f73e2c60cc5708e80d4a730efdcc6ae14ad7  binutils-2.44.tar.xz
+sha512  ea030419eba387579ab717be7e3223fc99e93b586860b06003c12489f93441640d4082736f76aa5e98233db4f46e232f536a45e471486de1f5b64e1b827c167e  binutils-2.45.1.tar.xz
+
+# locally computed
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/binutils-bpf/binutils-bpf.mk b/package/binutils-bpf/binutils-bpf.mk
new file mode 100644
index 0000000000..81dc419e38
--- /dev/null
+++ b/package/binutils-bpf/binutils-bpf.mk
@@ -0,0 +1,77 @@
+################################################################################
+#
+# binutils-bpf
+#
+################################################################################
+
+HOST_BINUTILS_BPF_VERSION = $(call qstrip,$(BR2_PACKAGE_HOST_BINUTILS_BPF_VERSION))
+HOST_BINUTILS_BPF_SITE = $(BR2_GNU_MIRROR)/binutils
+HOST_BINUTILS_BPF_SOURCE = binutils-$(HOST_BINUTILS_BPF_VERSION).tar.xz
+HOST_BINUTILS_BPF_INSTALL_STAGING = YES
+HOST_BINUTILS_BPF_DEPENDENCIES = zlib
+HOST_BINUTILS_BPF_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
+HOST_BINUTILS_BPF_LICENSE_FILES = COPYING3 COPYING.LIB
+HOST_BINUTILS_BPF_CPE_ID_VENDOR = gnu
+
+# 0003-objdump-memleak.patch
+HOST_BINUTILS_BPF_IGNORE_CVES += CVE-2025-3198
+
+HOST_BINUTILS_BPF_TARGET_NAME = bpf-buildroot-none
+
+# When binutils sources are fetched from the binutils-gdb repository,
+# they also contain the gdb sources, but gdb shouldn't be built, so we
+# disable it.
+
+# "host" binutils should actually be "cross"
+# We just keep the convention of "host utility" for now
+HOST_BINUTILS_BPF_CONF_OPTS = \
+	--prefix="$(HOST_DIR)" \
+	--sysconfdir="$(HOST_DIR)/etc" \
+	--localstatedir="$(HOST_DIR)/var" \
+	--target=$(HOST_BINUTILS_BPF_TARGET_NAME) \
+	--disable-doc \
+	--disable-docs \
+	--disable-documentation \
+	--disable-debug \
+	--disable-gprofng \
+	--disable-gtk-doc \
+	--disable-gtk-doc-html \
+	--disable-multilib \
+	--disable-nls \
+	--disable-shared \
+	--disable-werror \
+	--enable-plugins \
+	--enable-lto \
+	--enable-static \
+	--with-xmlto=no \
+	--with-fop=no \
+	--without-debuginfod \
+	--disable-sim \
+	--disable-gdb
+
+HOST_BINUTILS_BPF_BUILDDIR = build-bpf
+
+define HOST_BINUTILS_BPF_CONFIGURE_SYMLINK
+	mkdir -p $(@D)/$(HOST_BINUTILS_BPF_BUILDDIR)
+	ln -sf ../configure $(@D)/$(HOST_BINUTILS_BPF_BUILDDIR)/configure
+endef
+HOST_BINUTILS_BPF_PRE_CONFIGURE_HOOKS += HOST_BINUTILS_BPF_CONFIGURE_SYMLINK
+
+define HOST_BINUTILS_BPF_CONFIGURE_CMDS
+	(cd $(@D)/$(HOST_BINUTILS_BPF_BUILDDIR) && rm -rf config.cache; \
+		./configure \
+		$(QUIET) $(HOST_BINUTILS_BPF_CONF_OPTS) \
+	)
+endef
+
+define HOST_BINUTILS_BPF_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_BINUTILS_MAKE_OPTS) \
+		--directory $(@D)/$(HOST_BINUTILS_BPF_BUILDDIR)
+endef
+
+define HOST_BINUTILS_BPF_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_BINUTILS_INSTALL_OPTS) \
+		--directory $(@D)/$(HOST_BINUTILS_BPF_BUILDDIR) install
+endef
+
+$(eval $(host-autotools-package))
-- 
2.43.0


--===============2481170720350905577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2481170720350905577==--
