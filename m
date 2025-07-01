Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D757DC83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 15:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88BDF80E7B;
	Tue,  1 Jul 2025 15:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4c3b5gS5r0A5; Tue,  1 Jul 2025 15:26:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E58580EAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E58580EAC;
	Tue,  1 Jul 2025 15:26:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CE9B197
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EBA2417AA
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HgUFC-JcK6M for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 15:26:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b66; helo=mail-yb1-xb66.google.com;
 envelope-from=git@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F6BC4178F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F6BC4178F
Received: from mail-yb1-xb66.google.com (mail-yb1-xb66.google.com
 [IPv6:2607:f8b0:4864:20::b66])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F6BC4178F
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:26:32 +0000 (UTC)
Received: by mail-yb1-xb66.google.com with SMTP id
 3f1490d57ef6-e7569ccf04cso2694221276.0
 for <buildroot@buildroot.org>; Tue, 01 Jul 2025 08:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751383591; x=1751988391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8lPgiIHtwOV7xwQlEqbhpFW+PTprTjdsQSbj8Q5N/pk=;
 b=Zrtn+8JyBvuUU+KhzIXvZvVccNbQ4CnrDm0kulllxXx7ocv4OrtfszM5QcnvdTjwjT
 gHnBz1sicv/gFlCjDAvo3XvHNNJjokdMCQ3aD2FXoyUThjKcNVF3jO5LRcz4XdQnA88T
 jiv/qYoCrpCMc9Boc9X5B/ELOpYFEgdaD3KXVT8YhY2W/vvEi1++4sKUl1d5ki1GfuQJ
 kAGQu+elSqX4/4hIBGzBhk7b/lJ2VNArLy1R8zZOI6ZNvZFk+pfqwQFWvg6JKup4JQEE
 NJ68yyZSvsM5EC/ssUOEYqJzX/Us2LE0YAj2ZizQjQqK+ELEcPN3HZSE7W/lRSg9GTrf
 NzQA==
X-Gm-Message-State: AOJu0Yz+bPOTKpwHN+czpa64OScqa9K1iw9bDZXMjJ/+Vz/+PoJsrzcL
 l8Uld54gX4EBhHzYdqs5emPcjlYpihXaenGajuwNt5uyvnRXsR0BcV1oNF0/ig7ZsjtmUNyh5ZR
 efEereXDWnNQmCdxt7DLxf+J9i0y7NFqcl10nG1cEZPx+2SK3AA==
X-Gm-Gg: ASbGncu63miBQtVbos6usNhrgz3lIMiDwgYqFsNq8ZPjba1UPmkgGkg2EFdLLOSMZaM
 SiFAFZk3SckiFRTu816Q74NHc2ens6aDoPG1wHY2PfHkhqmoys655Q4k+xyYcBoAVD0r9Ip5xa5
 jB9DFGSaG9jabdVCuB6rWhqqB33J43gJ9n3P++C/ivZDMdp8XBVFoPMgG+oqySRk8SjatGAFGIL
 XpZW2qHxnGKAh5vJdTRXJV/gXPj9PC731BOKfwrklrWnbIFg/xQ9fJ0wN4wECqHx2SWdtt+tJdK
 UbcK6m+1EQagPMF0IGyTfYDcNkVs6ZIFAoZNnd3Q08o=
X-Google-Smtp-Source: AGHT+IEoE/OQOJZ/kfhMO8qu/x+T9GzWfFaEi67yj+zsVpPJ0fE53Hmi0LHopPi2w5mlJNsD8yI/H+wwAiF3
X-Received: by 2002:a05:690c:9418:10b0:707:dba5:2e44 with SMTP id
 00721157ae682-715171b48camr188679137b3.30.1751383591346; 
 Tue, 01 Jul 2025 08:26:31 -0700 (PDT)
Received: from localhost.localdomain ([184.144.89.37])
 by smtp-relay.gmail.com with ESMTPS id
 00721157ae682-71515a6b2absm3667697b3.0.2025.07.01.08.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 08:26:31 -0700 (PDT)
X-Relaying-Domain: jdknight.me
From: James Knight <git@jdknight.me>
To: buildroot@buildroot.org
Cc: James Knight <git@jdknight.me>
Date: Tue,  1 Jul 2025 11:26:09 -0400
Message-ID: <20250701152609.1890-1-git@jdknight.me>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1751383591; x=1751988391;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8lPgiIHtwOV7xwQlEqbhpFW+PTprTjdsQSbj8Q5N/pk=;
 b=BTeDTXhmIN25QNmw26T7uzYVK00y7INoDgs0cfjrwiuGotD69pkDj8AAo5nKNw4A/j
 MzglJPTUuALmcJCUJAsxwG6le0vBYPgC2FPGv01RSuRVjDJE2L1q7V89azI4ZrgvMdW+
 Z3lXya/XoRSgSTeDP7WkyktCLmfFSKDT+9f45hTN5DS3Qr1GiBfXj+L/3eF7ALZhuEfo
 wfM8gVmIRRL6g8vm24N6yjIIUUF5UOPodU2s+ZnwK+sBOFR55QZeYIOsmCpEum3qD2lr
 GxfoQaW1zjXB4fYC2pnfMCzg7hT1Br0DnhKh1W+PAc7ICRFrbKYbPQlD9k+p0V3Psb1j
 2VRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=BTeDTXhm
Subject: [Buildroot] [PATCH 1/1] package/rpm: bump to version 4.20.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The most recent release of RPM is v4.20.1 [1].

- As of 4.19, RPM uses the CMake build system; updating to support.
- The rpm2archive tool is now a required component to build.
- COPYING file was updated [2] to new address; no license change.
- The removed patch set is part of this upstream release.
- Adding a patch to deal with a CMake setup issue (fixed upstream).
- Adding a patch to support musl without brace expansion support.

[1]: https://rpm.org/wiki/Releases/4.20.1
[2]: https://github.com/rpm-software-management/rpm/commit/593d94ddc490a424eef31cbcf90d4ca659448354

Signed-off-by: James Knight <git@jdknight.me>
---
$ cat rpm.config
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_LUA=y
BR2_PACKAGE_LUA_5_4=y
BR2_PACKAGE_RPM=y
$ ./utils/test-pkg -c rpm.config -p rpm -a
                             arm-aarch64 [ 1/40]: OK
                   bootlin-aarch64-glibc [ 2/40]: OK
               bootlin-arcle-hs38-uclibc [ 3/40]: OK
                    bootlin-armv5-uclibc [ 4/40]: OK
                     bootlin-armv7-glibc [ 5/40]: OK
                      bootlin-armv7-musl [ 6/40]: OK
                   bootlin-armv7m-uclibc [ 7/40]: SKIPPED
                bootlin-m68k-5208-uclibc [ 8/40]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/40]: OK
             bootlin-microblazeel-uclibc [10/40]: OK
                   bootlin-mipsel-uclibc [11/40]: OK
                bootlin-mipsel32r6-glibc [12/40]: OK
                 bootlin-openrisc-uclibc [13/40]: OK
           bootlin-powerpc-e500mc-uclibc [14/40]: OK
        bootlin-powerpc64le-power8-glibc [15/40]: OK
                   bootlin-riscv32-glibc [16/40]: OK
                   bootlin-riscv64-glibc [17/40]: OK
                    bootlin-riscv64-musl [18/40]: OK
                 bootlin-s390x-z13-glibc [19/40]: OK
                      bootlin-sh4-uclibc [20/40]: OK
                    bootlin-sparc-uclibc [21/40]: OK
                   bootlin-sparc64-glibc [22/40]: OK
                    bootlin-x86-64-glibc [23/40]: OK
                     bootlin-x86-64-musl [24/40]: OK
                   bootlin-x86-64-uclibc [25/40]: OK
                   bootlin-x86-i686-musl [26/40]: OK
                   bootlin-xtensa-uclibc [27/40]: OK
                            br-arm-basic [28/40]: SKIPPED
                    br-arm-full-nothread [29/40]: SKIPPED
                      br-arm-full-static [30/40]: SKIPPED
                   br-i386-pentium4-full [31/40]: OK
                      br-mips64-n64-full [32/40]: OK
                 br-mips64r6-el-hf-glibc [33/40]: OK
               br-powerpc-603e-basic-cpp [34/40]: SKIPPED
               br-powerpc64-power7-glibc [35/40]: OK
                       linaro-aarch64-be [36/40]: OK
                          linaro-aarch64 [37/40]: OK
                              linaro-arm [38/40]: OK
                           sourcery-mips [39/40]: OK
                         sourcery-mips64 [40/40]: OK
40 builds, 6 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 Config.in.legacy                              |   6 +
 .../0001-fix-var-declare-in-label-error.patch |  40 ------
 ...3.2-compatible-object-hash-slot-type.patch |  58 ---------
 ...ix-missing-basename-include-on-macOS.patch |  26 ----
 ...ix-check_c_compiler_flag-cmake-tests.patch |  28 ++++
 ...rted-brace-expansion-support-for-mus.patch |  38 ++++++
 package/rpm/Config.in                         |  23 +---
 package/rpm/rpm.hash                          |   6 +-
 package/rpm/rpm.mk                            | 121 +++++++++++-------
 9 files changed, 154 insertions(+), 192 deletions(-)
 delete mode 100644 package/rpm/0001-fix-var-declare-in-label-error.patch
 delete mode 100644 package/rpm/0002-Use-Python-3.2-compatible-object-hash-slot-type.patch
 delete mode 100644 package/rpm/0003-Fix-missing-basename-include-on-macOS.patch
 create mode 100644 package/rpm/001-Fix-check_c_compiler_flag-cmake-tests.patch
 create mode 100644 package/rpm/002-suppress-unsupported-brace-expansion-support-for-mus.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 23d7da13b4..0a2db9dd76 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_RPM_RPM2ARCHIVE
+	bool "rpm2archive option has been removed"
+	select BR2_LEGACY
+	help
+	  rpm2archive is no longer optional in upstream.
+
 config BR2_PACKAGE_LIBWEBSOCK
 	bool "libwebsock has been removed"
 	select BR2_LEGACY
diff --git a/package/rpm/0001-fix-var-declare-in-label-error.patch b/package/rpm/0001-fix-var-declare-in-label-error.patch
deleted file mode 100644
index 648040c663..0000000000
--- a/package/rpm/0001-fix-var-declare-in-label-error.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b960c0b43a080287a7c13533eeb2d9f288db1414 Mon Sep 17 00:00:00 2001
-From: Florian Festi <ffesti@redhat.com>
-Date: Thu, 16 Mar 2023 19:05:04 +0100
-Subject: [PATCH] Fix compiler error on clang
-
-Turns out variable declarations are not allowed after a label, even in
-C99. And while some compilers don't seem to care others do.
-
-Moving the declaration of mayopen to the start of the function to avoid
-this problem.
-
-Resolves: #2435
-
-Upstream: b960c0b43a080287a7c13533eeb2d9f288db1414
-Signed-off-by: James Knight <james.d.knight@live.com>
----
- lib/fsm.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/fsm.c b/lib/fsm.c
-index 5671ac642d..183293edb0 100644
---- a/lib/fsm.c
-+++ b/lib/fsm.c
-@@ -879,6 +879,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
-     int nodigest = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOFILEDIGEST) ? 1 : 0;
-     int nofcaps = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOCAPS) ? 1 : 0;
-     int firstlinkfile = -1;
-+    int mayopen = 0;
-     char *tid = NULL;
-     struct filedata_s *fdata = xcalloc(fc, sizeof(*fdata));
-     struct filedata_s *firstlink = NULL;
-@@ -1016,7 +1017,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
- 
- setmeta:
- 	    /* Special files require path-based ops */
--	    int mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
-+	    mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
- 	    if (!rc && fd == -1 && mayopen) {
- 		int flags = O_RDONLY;
- 		/* Only follow safe symlinks, and never on temporary files */
diff --git a/package/rpm/0002-Use-Python-3.2-compatible-object-hash-slot-type.patch b/package/rpm/0002-Use-Python-3.2-compatible-object-hash-slot-type.patch
deleted file mode 100644
index cf9865ea3f..0000000000
--- a/package/rpm/0002-Use-Python-3.2-compatible-object-hash-slot-type.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From a0a937a454b2f82eae7ed3b4436614e64ef63e2d Mon Sep 17 00:00:00 2001
-From: Panu Matilainen <pmatilai@redhat.com>
-Date: Mon, 13 Mar 2023 12:41:11 +0200
-Subject: [PATCH] Use Python >= 3.2 compatible object hash slot type
-
-Python 3.2 changed the object hash type to make them pointer-width on
-all platforms - an incompatible change but apparently 3.2 was early enough
-in the 3.x days for such changes: https://bugs.python.org/issue9778
-
-The hash vs pointer size mismatch has quietly been there all along but
-clang >= 16 started treating this as an error, causing failed builds.
-The fix is easy and obvious enough, but this requires us to bump the
-minimum Python version from 3.1 to 3.2. Which thankfully is old enough that
-we can do without having to care or introduce build-time compatibility
-workarounds.
-
-Suggested-by: Khem Raj <raj.khem@gmail.com>
-Upstream: 45103f84764b2a293b068eb0f59456f553ec45d8
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- INSTALL            | 4 ++--
- python/header-py.c | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/INSTALL b/INSTALL
-index 13d0d8a83..528c1e5c0 100644
---- a/INSTALL
-+++ b/INSTALL
-@@ -66,8 +66,8 @@ These are available from
-     http://www.bzip.org
-     http://tukaani.org/xz/
- 
--If you want to build the Python bindings to RPM library, it can be enabled
--with --enable-python option to configure. You'll need to have Python >= 3.1
-+Python bindings to RPM library are built by default, but it can be disabled
-+with -DENABLE_PYTHON=OFF. You'll need to have Python >= 3.2
- runtime and C API development environment installed.
- Python is available from:
-     http://www.python.org/
-diff --git a/python/header-py.c b/python/header-py.c
-index 0aed0c926..c15503f35 100644
---- a/python/header-py.c
-+++ b/python/header-py.c
-@@ -316,9 +316,9 @@ static PyObject * hdr_dsOfHeader(PyObject * s)
-                                  "(Oi)", s, RPMTAG_NEVR);
- }
- 
--static long hdr_hash(PyObject * h)
-+static Py_hash_t hdr_hash(PyObject * h)
- {
--    return (long) h;
-+    return (Py_hash_t) h;
- }
- 
- static PyObject * hdr_reduce(hdrObject *s)
--- 
-2.49.0
-
diff --git a/package/rpm/0003-Fix-missing-basename-include-on-macOS.patch b/package/rpm/0003-Fix-missing-basename-include-on-macOS.patch
deleted file mode 100644
index ec920612e2..0000000000
--- a/package/rpm/0003-Fix-missing-basename-include-on-macOS.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From f510770a214bd2e8144a39868c34cd568179599e Mon Sep 17 00:00:00 2001
-From: Calvin Buckley <calvin@cmpct.info>
-Date: Tue, 11 Jul 2023 19:22:41 -0300
-Subject: [PATCH] Fix missing basename include on macOS
-
-Upstream: b2e67642fd8cb64d8cb1cca9e759396c1c10807d
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- tools/rpmuncompress.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/rpmuncompress.c b/tools/rpmuncompress.c
-index bd4146d54..58ddf5683 100644
---- a/tools/rpmuncompress.c
-+++ b/tools/rpmuncompress.c
-@@ -1,6 +1,7 @@
- #include "system.h"
- 
- #include <popt.h>
-+#include <libgen.h>
- #include <errno.h>
- #include <stdio.h>
- #include <string.h>
--- 
-2.49.0
-
diff --git a/package/rpm/001-Fix-check_c_compiler_flag-cmake-tests.patch b/package/rpm/001-Fix-check_c_compiler_flag-cmake-tests.patch
new file mode 100644
index 0000000000..341c8005fd
--- /dev/null
+++ b/package/rpm/001-Fix-check_c_compiler_flag-cmake-tests.patch
@@ -0,0 +1,28 @@
+From e1d7046ba6662eac9e5e7638e484eb792afa36cc Mon Sep 17 00:00:00 2001
+From: Mike Gorse <mgorse@suse.com>
+Date: Sat, 22 Mar 2025 18:09:31 -0500
+Subject: [PATCH] Fix check_c_compiler_flag cmake tests
+
+Check_c_compiler_flag sets a cache variable, so CACHE needs to be passed
+in order to reset it for the next use.
+
+Upstream: https://github.com/rpm-software-management/rpm/commit/e1d7046ba6662eac9e5e7638e484eb792afa36cc
+See-also: https://github.com/rpm-software-management/rpm/commit/e14502834fe6a9c6c9a439401ac3d2c8fd979267
+Signed-off-by: James Knight <git@jdknight.me>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 53d962d9bc..8e6bf65701 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -432,7 +432,7 @@ foreach (flag -fno-strict-overflow -fno-delete-null-pointer-checks -fhardened)
+ 	if (found)
+ 		add_compile_options(${flag})
+ 	endif()
+-	unset(found)
++	unset(found CACHE)
+ endforeach()
+ 
+ # generated sources
diff --git a/package/rpm/002-suppress-unsupported-brace-expansion-support-for-mus.patch b/package/rpm/002-suppress-unsupported-brace-expansion-support-for-mus.patch
new file mode 100644
index 0000000000..2719cae795
--- /dev/null
+++ b/package/rpm/002-suppress-unsupported-brace-expansion-support-for-mus.patch
@@ -0,0 +1,38 @@
+From 5ce7becd933383ed9515310f86fc51553cca43b7 Mon Sep 17 00:00:00 2001
+From: James Knight <git@jdknight.me>
+Date: Tue, 1 Jul 2025 08:56:39 -0400
+Subject: [PATCH 1/1] suppress unsupported brace expansion support for musl
+
+rpm has refactored its glob-related implementation to rely on GNU
+glob(3), which means brace expansion no longer works for musl.
+Configuring this define allows musl environments to still be able to use
+rpm; however, without brace expansion support.
+
+Upstream: https://github.com/rpm-software-management/rpm/issues/2844
+Signed-off-by: James Knight <git@jdknight.me>
+---
+ rpmio/rpmglob.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/rpmio/rpmglob.c b/rpmio/rpmglob.c
+index eb439cad8..15a51ccb9 100644
+--- a/rpmio/rpmglob.c
++++ b/rpmio/rpmglob.c
+@@ -33,6 +33,14 @@
+ 
+ #include "debug.h"
+ 
++// rpm has refactored its glob-related implementation to rely on GNU glob(3)
++// which means brace expansion no longer works for musl. Configuring this
++// define allows musl environments to still be able to use rpm; however,
++// without brace expansion support.
++#ifndef GLOB_BRACE
++#define GLOB_BRACE 0
++#endif
++
+ /* Return 1 if pattern contains a magic char, see glob(7) for a list */
+ static int ismagic(const char *pattern)
+ {
+-- 
+2.49.0
+
diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 8730e15200..6d10995148 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,6 +1,6 @@
-comment "rpm needs a toolchain w/ dynamic library, threads and lua >= 5.3"
+comment "rpm needs a toolchain w/ dynamic library, threads, lua >= 5.3 and wchar"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_PACKAGE_LUA || BR2_PACKAGE_LUA_5_1
+		|| !BR2_PACKAGE_LUA || BR2_PACKAGE_LUA_5_1 || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	depends on BR2_USE_MMU
 
@@ -11,26 +11,13 @@ config BR2_PACKAGE_RPM
 	depends on BR2_PACKAGE_LUA && !BR2_PACKAGE_LUA_5_1
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_FILE
+	select BR2_PACKAGE_LIBARCHIVE
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_ZLIB
 	help
 	  The RPM Package Manager (RPM).
 
 	  http://www.rpm.org/
-
-if BR2_PACKAGE_RPM
-
-comment "rpm2archive support needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
-
-config BR2_PACKAGE_RPM_RPM2ARCHIVE
-	bool "rpm2archive command"
-	default y
-	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_LIBARCHIVE
-	help
-	  Enable rpm2archive
-
-endif
diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index fd03f062bc..0013a74b63 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,5 +1,5 @@
-# From https://rpm.org/wiki/Releases/4.18.1.html
-sha256  37f3b42c0966941e2ad3f10fde3639824a6591d07197ba8fd0869ca0779e1f56  rpm-4.18.1.tar.bz2
+# From https://rpm.org/wiki/Releases/4.20.1.html
+sha256  52647e12638364533ab671cbc8e485c96f9f08889d93fe0ed104a6632661124f  rpm-4.20.1.tar.bz2
 
 # Hash for license file
-sha256  171d94d9f1641316bff7f157a903237dc69cdb5fca405fed8c832c76ed8370f9  COPYING
+sha256  f4af48a570b4ac09fce37fbaaa80324565405bb07d257070f509bdaf9994b73b  COPYING
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index c66ce6992d..69ce5dbca9 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -4,122 +4,149 @@
 #
 ################################################################################
 
-RPM_VERSION_MAJOR = 4.18
+RPM_VERSION_MAJOR = 4.20
 RPM_VERSION = $(RPM_VERSION_MAJOR).1
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = \
 	host-pkgconf \
-	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
-	$(if $(BR2_PACKAGE_ELFUTILS),elfutils) \
 	file \
+	libarchive \
 	lua \
 	popt \
-	$(if $(BR2_PACKAGE_XZ),xz) \
-	zlib \
-	$(TARGET_NLS_DEPENDENCIES)
+	zlib
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
 RPM_CPE_ID_VENDOR = rpm
 RPM_SELINUX_MODULES = rpm
 
-# Don't set --{dis,en}-openmp as upstream wants to abort the build if
-# --enable-openmp is provided and OpenMP is < 4.5:
-# https://github.com/rpm-software-management/rpm/pull/1433
 RPM_CONF_OPTS = \
-	--disable-rpath \
-	--with-gnu-ld \
-	--without-fapolicyd \
-	--without-fsverity \
-	--without-imaevm
+	-DENABLE_ASAN=OFF \
+	-DENABLE_BDB_RO=OFF \
+	-DENABLE_CUTF8=ON \
+	-DENABLE_NDB=ON \
+	-DENABLE_OPENMP=OFF \
+	-DENABLE_TESTSUITE=OFF \
+	-DENABLE_UBSAN=OFF \
+	-DENABLE_WERROR=OFF \
+	-DWITH_DOXYGEN=OFF \
+	-DWITH_FAPOLICYD=OFF \
+	-DWITH_FSVERITY=OFF \
+	-DWITH_IMAEVM=OFF \
+	-DWITH_LIBDW=OFF \
+	-DWITH_SEQUOIA=OFF
+
+# check_function_exists fstatat linkcheck issues (sh4-buildroot-linux-uclibc)
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+RPM_CONF_OPTS += -DHAVE_FSTATAT=ON
+endif
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 RPM_DEPENDENCIES += acl
-RPM_CONF_OPTS += --with-acl
+RPM_CONF_OPTS += -DWITH_ACL=ON
 else
-RPM_CONF_OPTS += --without-acl
+RPM_CONF_OPTS += -DWITH_ACL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
 RPM_DEPENDENCIES += audit
-RPM_CONF_OPTS += --with-audit
+RPM_CONF_OPTS += -DWITH_AUDIT=ON
+else
+RPM_CONF_OPTS += -DWITH_AUDIT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+RPM_DEPENDENCIES += bzip2
+RPM_CONF_OPTS += -DWITH_BZIP2=ON
 else
-RPM_CONF_OPTS += --without-audit
+RPM_CONF_OPTS += -DWITH_BZIP2=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 RPM_DEPENDENCIES += dbus
-RPM_CONF_OPTS += --enable-plugins
+RPM_CONF_OPTS += -DENABLE_PLUGINS=ON
+RPM_CONF_OPTS += -DWITH_DBUS=ON
 else
-RPM_CONF_OPTS += --disable-plugins
+RPM_CONF_OPTS += -DENABLE_PLUGINS=OFF
+RPM_CONF_OPTS += -DWITH_DBUS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+RPM_DEPENDENCIES += elfutils
+RPM_CONF_OPTS += -DWITH_LIBELF=ON
+else
+RPM_CONF_OPTS += -DWITH_LIBELF=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 RPM_DEPENDENCIES += libcap
-RPM_CONF_OPTS += --with-cap
+RPM_CONF_OPTS += -DWITH_CAP=ON
 else
-RPM_CONF_OPTS += --without-cap
+RPM_CONF_OPTS += -DWITH_CAP=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 RPM_DEPENDENCIES += libgcrypt
-RPM_CONF_OPTS += --with-crypto=libgcrypt
+RPM_CONF_OPTS += -DWITH_OPENSSL=OFF
 else
 RPM_DEPENDENCIES += openssl
-RPM_CONF_OPTS += --with-crypto=openssl
+RPM_CONF_OPTS += -DWITH_OPENSSL=ON
 endif
 
-ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
-RPM_CONF_OPTS += --with-libintl-prefix=$(STAGING_DIR)/usr
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+RPM_DEPENDENCIES += libiconv
+RPM_CONF_OPTS += -DWITH_ICONV=ON
 else
-RPM_CONF_OPTS += --without-libintl-prefix
+RPM_CONF_OPTS += -DWITH_ICONV=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 RPM_DEPENDENCIES += libselinux
-RPM_CONF_OPTS += --with-selinux
+RPM_CONF_OPTS += -DWITH_SELINUX=ON
 else
-RPM_CONF_OPTS += --without-selinux
+RPM_CONF_OPTS += -DWITH_SELINUX=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 RPM_DEPENDENCIES += python3
-RPM_CONF_OPTS += --enable-python
+RPM_CONF_OPTS += -DENABLE_PYTHON=ON
 else
-RPM_CONF_OPTS += --disable-python
+RPM_CONF_OPTS += -DENABLE_PYTHON=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 RPM_DEPENDENCIES += readline
-RPM_CONF_OPTS += --with-readline
+RPM_CONF_OPTS += -DWITH_READLINE=ON
 else
-RPM_CONF_OPTS += --without-readline
+RPM_CONF_OPTS += -DWITH_READLINE=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 RPM_DEPENDENCIES += sqlite
-RPM_CONF_OPTS += --enable-sqlite
+RPM_CONF_OPTS += -DENABLE_SQLITE=ON
 else
-RPM_CONF_OPTS += --disable-sqlite
+RPM_CONF_OPTS += -DENABLE_SQLITE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+RPM_DEPENDENCIES += xz
+RPM_CONF_OPTS += -DWITH_LIBLZMA=ON
+else
+RPM_CONF_OPTS += -DWITH_LIBLZMA=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_ZSTD),y)
 RPM_DEPENDENCIES += zstd
-RPM_CONF_OPTS += --enable-zstd
+RPM_CONF_OPTS += -DWITH_ZSTD=ON
 else
-RPM_CONF_OPTS += --disable-zstd
+RPM_CONF_OPTS += -DWITH_ZSTD=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_RPM_RPM2ARCHIVE),y)
-RPM_DEPENDENCIES += libarchive
-RPM_CONF_OPTS += --with-archive
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+RPM_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
+RPM_CONF_OPTS += -DENABLE_NLS=ON
 else
-RPM_CONF_OPTS += --without-archive
+RPM_CONF_OPTS += -DENABLE_NLS=OFF
 endif
 
-# ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
-RPM_CONF_ENV = \
-	ac_cv_prog_cc_c99='-std=gnu99' \
-	LIBS=$(TARGET_NLS_LIBS)
-
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.49.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
