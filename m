Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B7EC004C0
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 21:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55CE1402F0;
	Thu, 19 Oct 2023 21:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55CE1402F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5ECl284PUqZ; Thu, 19 Oct 2023 21:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 380F6402BC;
	Thu, 19 Oct 2023 21:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 380F6402BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E03461BF3E0
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 21:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4630820EB
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 21:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4630820EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V1PVhGcg4r-L for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 21:49:56 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3480981EE9
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 21:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3480981EE9
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 780CDA4C031A;
 Thu, 19 Oct 2023 23:49:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45642)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qtatt-0007EJ-0F;
 Thu, 19 Oct 2023 23:49:53 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 23:49:53 +0200
Message-Id: <20231019214953.4002609-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697752193;
 bh=zICqrrR6V8x3qEq2WYxrpYAn881tB/Au16pzu82Vy0E=;
 h=From:To:Cc:Subject:Date:From;
 b=LlaAyJ6sFfHg1uO4L+ne6FHcOwcYK1BNI6erVNgg8DHoDdzABZl6s3cHzNNQhTMJy
 GEcIHGv5GeA4Mk/9wI098LEBeidb3nvQaKIzE5iuOM2jKsUbKNXnorbnBzobpsWJRG
 1u9tX+Uj9PWNKb/x2+E3He4p10Rpj3DfC/HjdE4JCkV6V1qQXesgOvk6NQYeDJ87Ch
 rmRgBGGXp8amIVltW6+PkL17p2l6pzh/wrq1GRyVt2fq15dr412mcrDLAtyuZZbMiz
 XjO5Ip3JqD856S5v28x2G79c7sWAVK7gY2XPfsFbnjxVyKPxqQM1bJ7/u1sOQj9nhC
 iF1OOh6IgR+rQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=LlaAyJ6s
Subject: [Buildroot] [PATCH 1/1] package/elfutils: enable on musl
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Tobias Waldekranz <tobias@waldekranz.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit eb60820c0a9b3f938f32516f24df2eee9aac1e26 disabled
elfutils for musl toolchains in 2015. Current code builds fine with musl
so remove the exceptions.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/avrdude/Config.in    | 6 ++----
 package/bpftool/Config.in    | 4 +---
 package/elfutils/Config.in   | 9 +++------
 package/elfutils/elfutils.mk | 2 +-
 package/kexec-lite/Config.in | 6 ++----
 package/kmemd/Config.in      | 6 ++----
 package/libbpf/Config.in     | 6 ++----
 package/ltrace/Config.in     | 6 ++----
 package/mesa3d/Config.in     | 8 --------
 package/petitboot/Config.in  | 4 +---
 package/racehound/Config.in  | 6 ++----
 11 files changed, 18 insertions(+), 45 deletions(-)

diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index cbbd076667..06fee0ca7f 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_AVRDUDE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_LIBUSB
@@ -27,7 +26,6 @@ comment "SPI support needs a toolchain w/ linux headers >= 4.8"
 
 endif
 
-comment "avrdude needs a uClibc or glibc toolchain w/ threads, wchar, dynamic library, gcc >= 4.9"
+comment "avrdude needs a toolchain w/ threads, wchar, dynamic library, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
index d131ec566e..ef3a7a8a45 100644
--- a/package/bpftool/Config.in
+++ b/package/bpftool/Config.in
@@ -16,7 +16,6 @@ config BR2_PACKAGE_BPFTOOL
 	depends on BR2_USE_WCHAR # binutils, elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_ELFUTILS
@@ -24,11 +23,10 @@ config BR2_PACKAGE_BPFTOOL
 	  bpftool is a tool for for inspection and simple manipulation
 	  of eBPF programs and maps.
 
-comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.12"
+comment "bpftool needs a toolchain w/ wchar, dynamic library, threads, headers >= 4.12"
 	depends on BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_nios2
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 5f45de14ab..c355048c6d 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,17 +1,14 @@
-comment "elfutils needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
+comment "elfutils needs a toolchain w/ wchar, dynamic library, threads"
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+		|| !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_ELFUTILS
 	bool "elfutils"
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# Only glibc and uClibc implement the myriad of required GNUisms
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Libraries/utilities to handle ELF objects (drop in
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 0757851b72..ebe30f63fa 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -61,7 +61,7 @@ HOST_ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
 ELFUTILS_CONF_ENV += \
 	LDFLAGS="$(ELFUTILS_LDFLAGS)"
 
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 ELFUTILS_DEPENDENCIES += argp-standalone
 ELFUTILS_CONF_OPTS += --disable-symbol-versioning
 endif
diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
index abfa95ab36..5beaec6418 100644
--- a/package/kexec-lite/Config.in
+++ b/package/kexec-lite/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_KEXEC_LITE
 	depends on !BR2_STATIC_LIBS # dtc, elfutils
 	depends on BR2_USE_WCHAR # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_DTC
 	select BR2_PACKAGE_DTC_PROGRAMS
@@ -18,8 +17,7 @@ config BR2_PACKAGE_KEXEC_LITE
 
 	  https://github.com/antonblanchard/kexec-lite
 
-comment "kexec-lite needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
+comment "kexec-lite needs a toolchain w/ wchar, dynamic library, threads"
 	depends on BR2_powerpc || BR2_powerpc64
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/kmemd/Config.in b/package/kmemd/Config.in
index cd92757508..b3aebf1224 100644
--- a/package/kmemd/Config.in
+++ b/package/kmemd/Config.in
@@ -5,16 +5,14 @@ config BR2_PACKAGE_KMEMD
 	depends on !BR2_STATIC_LIBS # libbpf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libbpf
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # libbpf
 	select BR2_PACKAGE_LIBBPF
 	help
 	  Explore a live Linux kernel's memory using GDB
 
 	  https://github.com/wkz/kmemd
 
-comment "kmemd needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 5.14"
+comment "kmemd needs a toolchain w/ wchar, dynamic library, threads, headers >= 5.14"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
diff --git a/package/libbpf/Config.in b/package/libbpf/Config.in
index 1465366c9e..a78392cdc8 100644
--- a/package/libbpf/Config.in
+++ b/package/libbpf/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_LIBBPF
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_ZLIB
 	help
@@ -16,9 +15,8 @@ config BR2_PACKAGE_LIBBPF
 
 	  https://github.com/libbpf/libbpf
 
-comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.13"
+comment "libbpf needs a toolchain w/ wchar, dynamic library, threads, headers >= 4.13"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index ce5a85edcf..21d381db70 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -15,7 +15,6 @@ config BR2_PACKAGE_LTRACE
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	depends on BR2_PACKAGE_LTRACE_ARCH_SUPPORTS
 	select BR2_PACKAGE_ELFUTILS
 	help
@@ -26,8 +25,7 @@ config BR2_PACKAGE_LTRACE
 
 	  http://ltrace.org
 
-comment "ltrace needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
+comment "ltrace needs a toolchain w/ wchar, dynamic library, threads"
 	depends on BR2_PACKAGE_LTRACE_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 1e4a73a50f..ca7b9c8178 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -194,7 +194,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	depends on BR2_USE_MMU # libdrm
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_PACKAGE_MESA3D_LLVM
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LIBDRM_RADEON
@@ -204,13 +203,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	help
 	  Driver for ATI/AMD Radeon HD7000/HD8000/Rx200 GPUs.
 
-# Radeon SI needs libelf
-# musl is not currently compatible with elfutils
-comment "Radeon SI driver needs a uClibc or glibc toolchain"
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_MESA3D_LLVM
-	depends on !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
-
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	bool "Gallium vmware svga driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 0b4dc762bb..3d3c798c25 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_PETITBOOT
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils, lvm2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, lvm2
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_LVM2 # devmapper
@@ -22,10 +21,9 @@ config BR2_PACKAGE_PETITBOOT
 
 	  http://www.kernel.org/pub/linux/kernel/people/geoff/petitboot/petitboot.html
 
-comment "petitboot needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, udev /dev management"
+comment "petitboot needs a toolchain w/ wchar, dynamic library, threads, udev /dev management"
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		BR2_TOOLCHAIN_HAS_THREADS || \
-		!(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) || \
 		!BR2_PACKAGE_HAS_UDEV
diff --git a/package/racehound/Config.in b/package/racehound/Config.in
index d13f90adb4..5b8bdc77bc 100644
--- a/package/racehound/Config.in
+++ b/package/racehound/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_RACEHOUND
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	# only x86/x86_64 supported
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_ELFUTILS
@@ -30,8 +29,7 @@ comment "racehound needs an Linux kernel >= 3.14 to be built"
 	depends on !BR2_LINUX_KERNEL
 	depends on BR2_i386 || BR2_x86_64
 
-comment "racehound needs a uClibc or glibc toolchain w/ C++, wchar, dynamic library, threads"
+comment "racehound needs a toolchain w/ C++, wchar, dynamic library, threads"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+		|| !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
