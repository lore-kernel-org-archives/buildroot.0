Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA8ED5B16E
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 22:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2603040781;
	Sun, 14 Dec 2025 22:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQyFCorNanxP; Sun, 14 Dec 2025 22:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C39640785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765751826;
	bh=dgt+W3+v0MIjo73cj8t7L8LHOoqmDWDM6ayzVGvJ4dA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r2h145ksIRTLkfiBEgq3G0nA4pjBSzl/OwJaMsauMdwaNGCuiLGRYSMdA7ovSHhDq
	 9XXVjQ2bFFc2BzolBmf6tkeSkGGZyIfXXYURax94AEqmD8qCX3ASgzeMsRjk/uSJre
	 zGNQ3Dnna8AjFTZ3Jut4SzJWYkYTpBa9fJIvuTyX0F6lq4l6Ix9ifCaugTeNBafgy9
	 NMprOgBt7/N86rG9ELTZYl9jlYdN5F4yQKoVP+chUG1+XWwKo5Or5fvpjxycJXs2CI
	 9cUpzMP3bK3by2vz0R9i7OxXruFLUhWBPzwJoLBnAYnc4+LEZCRRbJLJazgh9FkdN0
	 b8QMhVO6gKZSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C39640785;
	Sun, 14 Dec 2025 22:37:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB6312C1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 22:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C881F60BE1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 22:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9BTyuhrIhrT for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 22:36:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0D9A608B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0D9A608B6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0D9A608B6
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 22:36:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-477b91680f8so28945605e9.0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 14:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765751817; x=1766356617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ikS8+8MxI06bpQ2If5iPnf8zvHAeqCSWlhCxO1EO6Ms=;
 b=QEzUC6js+KWtLzX7x56CRwhg4Mb3XxDs+YSRg2fcI2rW/YC62dtXiNr8goEbozGnla
 XQ3VmfNu1VMRbLo7RcFGCCn3wk98EYk/DykvJ5C5rjddcpCDnawMCQqMVh15IMawzTMZ
 GF8EbIxB6NOfOTYXMnGfHlxG6uG7uYDkkcz+NmDt2SbdRqSw6fyekjz+qjdUJeUtMC/o
 tdjTHCFolygWtJUnIn3SBcj7rMG9vWqZ+rgD0koEDC3SRdZsAZA+eKreIPL6UCTpdUVT
 MLPfHx6u68AFl/8xAdZaaLUjSoscyjFXQ1oxNRlv2MTbB1HHR/TcAcE6UlXs+dHt7obf
 EF6Q==
X-Gm-Message-State: AOJu0YyhmFzAselxdKPjN0qT3B6nAcCQMfd6gUMNHtYeARv9tr3kietq
 9g1OYoyS4ufhDPIa664zN5bt1UejIyOhrMiYQTqZoa2ZIr77pzwF+nsKSgvjlPGp
X-Gm-Gg: AY/fxX47x/zO84WpC7J1NEhCm351f9iqWZG5H4Ydl1dHzFcvqZVAv17VbIwhtGmO9YI
 m8vlU49s6uRBoJHMKvv3NSHu1LOuRn4Ce3NxK3VfpuOXmPVu8w8lCm5zhZeVB4dez6vfUC2Q3bt
 aQBmOhQHiIPjGiv/Gk0riIEkcMgy8SG2LSf7zQDEiKBnEFMEnc+YafBAuWLS11r6HfoUGIkZmNz
 kmvXyhwj+D10mTrcYH/m4uLi/C3J9863YmDkrEAIVxKP+cpZHemRxHr8J/d22afQm5j098wp7MA
 oR3M8TKYRmgkXtJbj2kLOyg9v7cbkMEgnbUX4QXzx3w5G1FMwRw7cnV8pGPZ8kLwSVZaIeoAd7d
 SCr9jUO3jKxYyJUJKXXyf97OxoiptA+3fzudzGFFgRaoS+qOCizZ9kBR1/I1d4QrNHQuwC6z1tu
 xZTE7lPkGfscvtwq8F19zqtTIx6tEuCjZ4VZIxwX61QLNZW5g=
X-Google-Smtp-Source: AGHT+IHMWAsMBzrkgG86H5Hj3ThFAgdRamyGTUOZ7VAMwucvH0G0N+dYl9bwTXd0ZAHw6cNhbP/QJw==
X-Received: by 2002:a05:600c:444b:b0:477:9b4a:a82 with SMTP id
 5b1f17b1804b1-47a8f91561cmr86661995e9.35.1765751816437; 
 Sun, 14 Dec 2025 14:36:56 -0800 (PST)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a09fbesm25544084f8f.0.2025.12.14.14.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 14:36:56 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 14 Dec 2025 23:36:50 +0100
Message-ID: <20251214223650.223987-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765751817; x=1766356617; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ikS8+8MxI06bpQ2If5iPnf8zvHAeqCSWlhCxO1EO6Ms=;
 b=QWN0OPSzNSzu7w4Mr7l6+nN+XxkX/cGo1WdzOyhwP4FkxU5n2LqQ2bEcW3WLbxNywE
 tNHWn3XfZB2YXIdrY64KUwBVs7H+Jh8kDLtfjCz8/lMqNbwBDHsLnO3VjMHXd0d1s94v
 PDdHdpEVEahW6ta1wCeNnikhoaRxvGHaW80+BMe1k712SjZTV1P1GFd9C8eEsPk0fcXf
 0Uy692nnJwDcDAQdztDMxLx8EIiOQ6h5IRHGYDtJPGHRqK3/mHw0Pb2fk0S2KpOXCR+o
 Xx+aHeDLuK893WwcW0j+9Zg8ilXfJ0ywe1ZnmEvRyKepFaYiVuUVo06dE2JlTsNLWYAf
 7BSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QWN0OPSz
Subject: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: bump version to
 20250930
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

Changelog:
https://github.com/linux-test-project/ltp/releases/tag/20250930

Remove patches backported from this release.

Remove LTP_TESTSUITE_AUTORECONF (patch, which required it was backported
from this release).

Require kernel headers for uclibc >= 4.5 for uclibc due F_GETOWN_EX from <fcntl.h>.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* sha256 checksums are now from upstream
* Remove LTP_TESTSUITE_AUTORECONF = YES
* Require kernel headers for uclibc >= 4.5 for uclibc due F_GETOWN_EX from <fcntl.h>.

I hope I set BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 correctly.
br-arm-full-static fails due too old uclibc.  F_GETOWN_EX got into
uclibc in v1.0.45 but br-arm-full-static uses toolchain from 2020 [1]
which is based on uclibc-ng v1.0.36. I would prefer not to
bother upstream with backporting fixes for so old toolchain.

config has BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y and
./host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/linux/version.h
has: #define LINUX_VERSION_CODE 263421
which means 4.4.253.

Link to v1:
https://patchwork.ozlabs.org/project/buildroot/patch/20251012182724.361612-1-petr.vorel@gmail.com/
https://lore.kernel.org/buildroot/20251012182724.361612-1-petr.vorel@gmail.com/

Tested:
                             arm-aarch64 [ 1/35]: OK
                   bootlin-aarch64-glibc [ 2/35]: OK
               bootlin-arcle-hs38-uclibc [ 3/35]: OK
                    bootlin-armv5-uclibc [ 4/35]: OK
                     bootlin-armv7-glibc [ 5/35]: OK
                   bootlin-armv7m-uclibc [ 6/35]: SKIPPED
                      bootlin-armv7-musl [ 7/35]: SKIPPED
             bootlin-microblazeel-uclibc [ 8/35]: OK

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: SKIPPED
                      br-arm-full-static [5/6]: SKIPPED
                             arm-aarch64 [6/6]: OK
6 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

                             arm-aarch64 [ 1/35]: OK
                   bootlin-aarch64-glibc [ 2/35]: OK
               bootlin-arcle-hs38-uclibc [ 3/35]: OK
                    bootlin-armv5-uclibc [ 4/35]: OK
                     bootlin-armv7-glibc [ 5/35]: OK
                   bootlin-armv7m-uclibc [ 6/35]: SKIPPED
                      bootlin-armv7-musl [ 7/35]: SKIPPED
             bootlin-microblazeel-uclibc [ 8/35]: OK
                   bootlin-mipsel-uclibc [ 9/35]: OK
                bootlin-mipsel32r6-glibc [10/35]: OK
                bootlin-m68k-5208-uclibc [11/35]: SKIPPED
               bootlin-m68k-68040-uclibc [12/35]: OK
                 bootlin-openrisc-uclibc [13/35]: OK
           bootlin-powerpc-e500mc-uclibc [14/35]: OK
        bootlin-powerpc64le-power8-glibc [15/35]: OK
                   bootlin-riscv32-glibc [16/35]: OK
                   bootlin-riscv64-glibc [17/35]: OK
                    bootlin-riscv64-musl [18/35]: SKIPPED
                      bootlin-sh4-uclibc [19/35]: OK
                    bootlin-sparc-uclibc [20/35]: SKIPPED

 ...ure-Fix-build-on-kernel-6.14-headers.patch |  51 ---
 ...002-statmount02-Remove-linux-btrfs.h.patch |  52 ---
 .../0003-tlibio-Detect-aio.h-support.patch    | 342 ------------------
 package/ltp-testsuite/Config.in               |   1 +
 package/ltp-testsuite/ltp-testsuite.hash      |   4 +-
 package/ltp-testsuite/ltp-testsuite.mk        |   5 +-
 6 files changed, 4 insertions(+), 451 deletions(-)
 delete mode 100644 package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch
 delete mode 100644 package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch
 delete mode 100644 package/ltp-testsuite/0003-tlibio-Detect-aio.h-support.patch

diff --git a/package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch b/package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch
deleted file mode 100644
index 6638ee2ccd..0000000000
--- a/package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 3ef4bac1dd253628dfdb8a823b51ae0d24fa0616 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Mon, 2 Jun 2025 19:08:30 +0200
-Subject: [PATCH] configure: Fix build on kernel 6.14 headers
-
-We decided in a2300dc0f5 to remove <linux/mount.h> in lapi/mount.h and
-use only <sys/mount.h>. But later in 5c5411ea8e we add autotools checks
-in configure.ac which use <linux/mount.h> for detection, but kept using
-lapi/mount.h. This worked until now, because no toolchain used new
-header enough. Recent Alpine update broke that.
-
-This fixes CI build on Alpine v3.22 (the default Alpine version in
-GitHub action), which uses 6.14.2 kernel headers, which already define
-struct mnt_id_req (configure.ac detect it but lapi/mount.h was not using
-a correct header):
-
-    listmount.h: In function 'listmount':
-    listmount.h:18:16: error: variable 'req' has initializer but incomplete type
-       18 |         struct mnt_id_req req = {
-	  |                ^~~~~~~~~~
-
-Link: https://lore.kernel.org/ltp/20250602170831.404641-1-pvorel@suse.cz/
-Fixes: 5c5411ea8e ("Add listmount/statmount fallback declarations")
-Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
-Acked-by: Jan Stancek <jstancek@redhat.com>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Upstream: https://github.com/linux-test-project/ltp/commit/3ef4bac1dd253628dfdb8a823b51ae0d24fa0616
----
- configure.ac | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9ff098b273..69c5be7362 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -254,8 +254,10 @@ AC_CHECK_TYPES([struct mount_attr],,,[
- 
- AC_CHECK_TYPES([struct cachestat_range],,,[#include <sys/mman.h>])
- AC_CHECK_TYPES([struct cachestat],,,[#include <sys/mman.h>])
--AC_CHECK_TYPES([struct mnt_id_req],,,[#include <linux/mount.h>])
--AC_CHECK_TYPES([struct statmount],,,[#include <linux/mount.h>])
-+
-+# Defined in <linux/mount.h>, but include/lapi/mount.h includes <sys/mount.h> */
-+AC_CHECK_TYPES([struct mnt_id_req],,,[#include <sys/mount.h>])
-+AC_CHECK_TYPES([struct statmount],,,[#include <sys/mount.h>])
- 
- # Tools knobs
- 
--- 
-2.50.0
-
diff --git a/package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch b/package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch
deleted file mode 100644
index c82c422000..0000000000
--- a/package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From fe8c0dac5ab4aa49c4f977d14f8a8d24cefa6435 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Wed, 4 Jun 2025 16:13:18 +0200
-Subject: [PATCH] statmount02: Remove <linux/btrfs.h>
-
-statmount02.c does not need <linux/btrfs.h> because it's skipped.
-
-Avoid using it fixes the problem due the old problem of indirect include
-<linux/mount.h> by <linux/fs.h> on Alpine v3.22 (the default Alpine
-version in GitHub action), which uses 6.14.2 kernel headers:
-
-    In file included from /usr/include/linux/fs.h:19,
-                     from /usr/include/linux/btrfs.h:29,
-                     from statmount02.c:23:
-    /usr/include/linux/mount.h:155:8: error: redefinition of 'struct statmount'
-      155 | struct statmount {
-          |        ^~~~~~~~~
-    In file included from statmount.h:12,
-                     from statmount02.c:20:
-    ../../../../include/lapi/mount.h:58:8: note: originally defined here
-       58 | struct statmount {
-          |        ^~~~~~~~~
-    /usr/include/linux/mount.h:193:8: error: redefinition of 'struct mnt_id_req'
-      193 | struct mnt_id_req {
-          |        ^~~~~~~~~~
-    ../../../../include/lapi/mount.h:49:8: note: originally defined here
-       49 | struct mnt_id_req {
-          |        ^~~~~~~~~~
-
-Fixes: 5f9942dffe ("Add statmount02 test")
-Suggested-by: Jan Stancek <jstancek@redhat.com>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Upstream: https://github.com/linux-test-project/ltp/commit/fe8c0dac5ab4aa49c4f977d14f8a8d24cefa6435
----
- testcases/kernel/syscalls/statmount/statmount02.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/statmount/statmount02.c b/testcases/kernel/syscalls/statmount/statmount02.c
-index 504c558a11..07f877e040 100644
---- a/testcases/kernel/syscalls/statmount/statmount02.c
-+++ b/testcases/kernel/syscalls/statmount/statmount02.c
-@@ -20,7 +20,6 @@
- #include "statmount.h"
- #include "lapi/stat.h"
- #include "lapi/sched.h"
--#include <linux/btrfs.h>
- 
- #define MNTPOINT "mntpoint"
- 
--- 
-2.50.0
-
diff --git a/package/ltp-testsuite/0003-tlibio-Detect-aio.h-support.patch b/package/ltp-testsuite/0003-tlibio-Detect-aio.h-support.patch
deleted file mode 100644
index 442e2fd96b..0000000000
--- a/package/ltp-testsuite/0003-tlibio-Detect-aio.h-support.patch
+++ /dev/null
@@ -1,342 +0,0 @@
-From 91e6272febf95e19a8300695dfc2089569adf9d8 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Sun, 27 Jul 2025 22:54:54 +0200
-Subject: [PATCH] tlibio: Detect <aio.h> support
-
-Some libc (i.e. uclibc-ng or uclibc) does not implement <aio.h>.
-Requiring it for the core LTP library breaks build of these libc.
-Restore unintentional removal in fed3e3ee63.
-
-Changes:
-* Fix for all libc without <aio.h> support: previous check
-  'defined(__linux__) && !defined(__UCLIBC__)' was uclibc-ng specific
-  (and check for __linux__ was not needed anyway). All of these used
-  prior fed3e3ee63 is replaced just by HAVE_AIO_H.
-* Comment out also if block first and last 'line if (...) {' and '}' if
-  the block would be empty anyway.
-* Further join preprocessor checks as code prior fed3e3ee63 contained
-  code compiled for old unixes (e.g. sgi), which fed3e3ee63 removed.
-* Remove nested preprocessors checks in code which is already checked
-  (i.e. lio_wait4asyncio()).
-* Fix wrong #endif comments.
-* Add further cleanup of old unixes.
-
-I also wonder if #else part of struct lio_info_type Lio_info1[]
-should be really defined for code without <aio.h>.
-
-Fixes: fed3e3ee63 ("lib/tlibio: Get rid of support for old UNIXes")
-Fixes: https://autobuild.buildroot.org/results/f3e/f3e03b9a1a69988d6497f36c9d64a37a66e9ad20/
-Fixes: https://autobuild.buildroot.org/results/856/856365f467efc449faee1951250e63d8d4442bbc/
-Fixes: https://autobuild.buildroot.org/results/2ac/2ac08cecd6a505f1bac1a673efc280b3a8dcb23a/
-Fixes: https://autobuild.buildroot.org/results/59b/59b3ad33667b7e87c81e49dd434d5f494e189e0d/
-Fixes: https://autobuild.buildroot.org/results/b1a/b1a36f9971c97300670d8d772ace11e5fedceaaa/
-Reviewed-by: Li Wang <liwang@redhat.com>
-Acked-by: Cyril Hrubis <chrubis@suse.cz>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-Upstream: https://github.com/linux-test-project/ltp/commit/91e6272febf95e19a8300695dfc2089569adf9d8
----
- configure.ac |  1 +
- lib/tlibio.c | 52 +++++++++++++++++++++++++++++++++++++++++++---------
- 2 files changed, 44 insertions(+), 9 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8ec37639c1..12025be51c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -48,6 +48,7 @@ AC_CHECK_DECLS([PR_CAPBSET_DROP, PR_CAPBSET_READ],,,[#include <sys/prctl.h>])
- AC_CHECK_DECLS([SEM_STAT_ANY],,,[#include <sys/sem.h>])
- 
- AC_CHECK_HEADERS_ONCE([ \
-+    aio.h \
-     asm/ldt.h \
-     asm/prctl.h \
-     cpuid.h \
-diff --git a/lib/tlibio.c b/lib/tlibio.c
-index b877393df2..70e0c6f7d2 100644
---- a/lib/tlibio.c
-+++ b/lib/tlibio.c
-@@ -88,7 +88,9 @@
- #include <stdint.h>
- #include <sys/uio.h>		/* readv(2)/writev(2) */
- #include <string.h>
--#include <aio.h>
-+#ifdef HAVE_AIO_H
-+# include <aio.h>
-+#endif
- #include <stdlib.h>		/* atoi, abs */
- 
- #include "tlibio.h"		/* defines LIO* macros */
-@@ -108,7 +110,7 @@ struct lio_info_type Lio_info1[] = {
- 	{"b", LIO_IO_ASYNC | LIO_WAIT_SIGPAUSE, "async i/o using pause"},
- 	{"a", LIO_IO_ASYNC | LIO_WAIT_RECALL,
- 	 "async i/o using recall/aio_suspend"},
--#if defined(sgi) || (defined(__linux__) && !defined(__UCLIBC__))
-+#ifdef HAVE_AIO_H
- 	{"r",
- 	 LIO_RANDOM | LIO_IO_TYPES | LIO_WAIT_TYPES,
- 	 "random sync i/o types and wait methods"},
-@@ -159,7 +161,7 @@ char Lio_SysCall[PATH_MAX];	/* string containing last i/o system call */
- 
- static volatile int Received_signal = 0;	/* number of signals received */
- static volatile int Rec_signal;
--#if defined(sgi) || (defined(__linux__) && !defined(__UCLIBC__))
-+#ifdef HAVE_AIO_H
- static volatile int Received_callback = 0;	/* number of callbacks received */
- static volatile int Rec_callback;
- #endif
-@@ -399,7 +401,7 @@ static void lio_async_signal_handler(int sig)
- 	return;
- }
- 
--#if defined(sgi) || (defined(__linux__) && !defined(__UCLIBC__))
-+#ifdef HAVE_AIO_H
- /***********************************************************************
-  * This is an internal callback handler.
-  * If the handler is called, it will increment the Received_callback
-@@ -417,7 +419,7 @@ static void lio_async_callback_handler(union sigval sigval)
- 
- 	return;
- }
--#endif /* sgi */
-+#endif
- 
- /***********************************************************************
-  * lio_random_methods
-@@ -515,9 +517,11 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 	int omethod = method;
- 	int listio_cmd;		/* Holds the listio/lio_listio cmd */
- 	struct iovec iov;	/* iovec for writev(2) */
-+#ifdef HAVE_AIO_H
- 	struct aiocb aiocbp;	/* POSIX aio control block */
- 	struct aiocb *aiolist[1];	/* list of aio control blocks for lio_listio */
- 	off64_t poffset;	/* pwrite(2) offset */
-+#endif
- 
- 	/*
- 	 * If LIO_RANDOM bit specified, get new method randomly.
-@@ -536,12 +540,15 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 		*errmsg = Errormsg;
- 
- 	Rec_signal = Received_signal;	/* get the current number of signals received */
-+#ifdef HAVE_AIO_H
- 	Rec_callback = Received_callback;	/* get the current number of callbacks received */
-+#endif
- 
- 	memset(&iov, 0x00, sizeof(struct iovec));
- 	iov.iov_base = buffer;
- 	iov.iov_len = size;
- 
-+#ifdef HAVE_AIO_H
- 	memset(&aiocbp, 0x00, sizeof(struct aiocb));
- 
- 	aiocbp.aio_fildes = fd;
-@@ -589,6 +596,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 
- 	poffset = (off64_t) ret;
- 	aiocbp.aio_offset = ret;
-+#endif
- 
- 	/*
- 	 * If the LIO_USE_SIGNAL bit is not set, only use the signal
-@@ -597,9 +605,9 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 	 * the signal.
- 	 */
- 	if (sig && !(method & LIO_USE_SIGNAL) && !(method & LIO_WAIT_SIGTYPES)) {
--
- 		sig = 0;	/* ignore signal parameter */
- 	}
-+#ifdef HAVE_AIO_H
- 	if (sig && (method & LIO_WAIT_CBTYPES))
- 		sig = 0;	/* ignore signal parameter */
- 
-@@ -626,6 +634,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 		aiocbp.aio_sigevent.sigev_notify_attributes =
- 		    (void *)(uintptr_t) size;
- 	}
-+#endif
- 
- 	/*
- 	 * Determine the system call that will be called and produce
-@@ -684,6 +693,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 	}
- 
- 	else if (method & LIO_IO_ASYNC) {
-+#ifdef HAVE_AIO_H
- 		sprintf(Lio_SysCall,
- 			"aio_write(fildes=%d, buf, nbytes=%d, signo=%d)", fd,
- 			size, sig);
-@@ -705,9 +715,11 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 				sigrelse(sig);
- 			return -errno;
- 		}
-+#endif
- 	}
- 	/* LIO_IO_ASYNC */
- 	else if (method & LIO_IO_SLISTIO) {
-+#ifdef HAVE_AIO_H
- 		aiocbp.aio_lio_opcode = LIO_WRITE;
- 		listio_cmd = LIO_WAIT;
- 		io_type = "lio_listio(3) sync write";
-@@ -739,9 +751,11 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 
- 		ret = lio_check_asyncio(io_type, size, &aiocbp, method);
- 		return ret;
-+#endif
- 	}
- 	/* LIO_IO_SLISTIO */
- 	else if (method & LIO_IO_ALISTIO) {
-+#ifdef HAVE_AIO_H
- 		aiocbp.aio_lio_opcode = LIO_WRITE;
- 		listio_cmd = LIO_NOWAIT;
- 		io_type = "lio_listio(3) async write";
-@@ -766,6 +780,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 				sigrelse(sig);
- 			return -errno;
- 		}
-+#endif
- 	}
- 	/* LIO_IO_ALISTIO */
- 	else if (method & LIO_IO_SYNCV) {
-@@ -796,6 +811,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 
- 		return ret;
- 	}			/* LIO_IO_SYNCV */
-+#ifdef HAVE_AIO_H
- 	else if (method & LIO_IO_SYNCP) {
- 		io_type = "pwrite(2)";
- 
-@@ -827,6 +843,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 
- 		return ret;
- 	}			/* LIO_IO_SYNCP */
-+#endif
- 	else {
- 		printf("DEBUG %s/%d: No I/O method chosen\n", __FILE__,
- 		       __LINE__);
-@@ -836,7 +853,9 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 	/*
- 	 * wait for async io to complete.
- 	 */
-+#ifdef HAVE_AIO_H
- 	ret = lio_wait4asyncio(method, fd, &aiocbp);
-+#endif
- 
- 	/*
- 	 * If there was an error waiting for async i/o to complete,
-@@ -862,7 +881,9 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 	 * have been updated but the actual i/o size if returned.
- 	 */
- 
-+#ifdef HAVE_AIO_H
- 	ret = lio_check_asyncio(io_type, size, &aiocbp, method);
-+#endif
- 
- 	return ret;
- }				/* end of lio_write_buffer */
-@@ -924,9 +945,11 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 	int listio_cmd;		/* Holds the listio/lio_listio cmd */
- 	int omethod = method;
- 	struct iovec iov;	/* iovec for readv(2) */
-+#ifdef HAVE_AIO_H
- 	struct aiocb aiocbp;	/* POSIX aio control block */
- 	struct aiocb *aiolist[1];	/* list of aio control blocks for lio_listio */
- 	off64_t poffset;	/* pread(2) offset */
-+#endif
- 
- 	/*
- 	 * If LIO_RANDOM bit specified, get new method randomly.
-@@ -945,12 +968,15 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 		*errmsg = Errormsg;
- 
- 	Rec_signal = Received_signal;	/* get the current number of signals received */
-+#ifdef HAVE_AIO_H
- 	Rec_callback = Received_callback;	/* get the current number of callbacks received */
-+#endif
- 
- 	memset(&iov, 0x00, sizeof(struct iovec));
- 	iov.iov_base = buffer;
- 	iov.iov_len = size;
- 
-+#ifdef HAVE_AIO_H
- 	memset(&aiocbp, 0x00, sizeof(struct aiocb));
- 
- 	aiocbp.aio_fildes = fd;
-@@ -998,6 +1024,7 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 	}
- 	poffset = (off64_t) ret;
- 	aiocbp.aio_offset = ret;
-+#endif
- 
- 	/*
- 	 * If the LIO_USE_SIGNAL bit is not set, only use the signal
-@@ -1010,6 +1037,7 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 		sig = 0;	/* ignore signal parameter */
- 	}
- 
-+#ifdef HAVE_AIO_H
- 	if (sig && (method & LIO_WAIT_CBTYPES))
- 		sig = 0;	/* ignore signal parameter */
- 
-@@ -1020,7 +1048,6 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 	 * old signal handler will not be restored.
- 	 *** restoring the signal handler could be added ***
- 	 */
--
- 	if (sig && (method & LIO_WAIT_SIGTYPES)) {
- 		aiocbp.aio_sigevent.sigev_notify = SIGEV_SIGNAL;
- 		aiocbp.aio_sigevent.sigev_signo = sig;
-@@ -1035,6 +1062,7 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 		aiocbp.aio_sigevent.sigev_notify_attributes =
- 		    (void *)(uintptr_t) size;
- 	}
-+#endif
- 
- 	/*
- 	 * Determine the system call that will be called and produce
-@@ -1093,6 +1121,7 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 			wait4sync_io(fd, 1);
- 		}
- 
-+#ifdef HAVE_AIO_H
- 	} else if (method & LIO_IO_ASYNC) {
- 		sprintf(Lio_SysCall,
- 			"aio_read(fildes=%d, buf, nbytes=%d, signo=%d)", fd,
-@@ -1236,7 +1265,8 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 			     __FILE__, __LINE__, ret);
- 
- 		return ret;
--	}			/* LIO_IO_SYNCP */
-+#endif
-+	}
- 
- 	else {
- 		printf("DEBUG %s/%d: No I/O method chosen\n", __FILE__,
-@@ -1248,7 +1278,9 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 	 * wait for async io to complete.
- 	 * Note: Sync io should have returned prior to getting here.
- 	 */
-+#ifdef HAVE_AIO_H
- 	ret = lio_wait4asyncio(method, fd, &aiocbp);
-+#endif
- 
- 	/*
- 	 * If there was an error waiting for async i/o to complete,
-@@ -1274,12 +1306,14 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 	 * have been updated but the actual i/o size if returned.
- 	 */
- 
-+#ifdef HAVE_AIO_H
- 	ret = lio_check_asyncio(io_type, size, &aiocbp, method);
-+#endif
- 
- 	return ret;
- }				/* end of lio_read_buffer */
- 
--#if !defined(__sun) && !defined(__hpux) && !defined(_AIX)
-+#ifdef HAVE_AIO_H
- /***********************************************************************
-  * This function will check that async io was successful.
-  * It can also be used to check sync listio since it uses the
--- 
-2.50.0
-
diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index eafac0743c..81dc9dffee 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 8ffde75e37..b96e1f46fa 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20250530/ltp-full-20250530.tar.xz.sha256
-sha256  27586ba78eac1e40cd422add2842f1ad70f09fea55da3bd6a25e10feb786d4f2  ltp-full-20250530.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20250930/ltp-full-20250930.tar.xz.sha256
+sha256  048fa4d69ddbe8a94aa15da9bdc85713ab07a0abbc3de2b8bdd9757644aef1e4  ltp-full-20250930.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 8be3b21b38..e4e3ff8717 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20250530
+LTP_TESTSUITE_VERSION = 20250930
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 
-# 0001-configure-Fix-build-on-kernel-6.14-headers.patch
-LTP_TESTSUITE_AUTORECONF = YES
-
 LTP_TESTSUITE_CONF_OPTS += --disable-metadata
 
 ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX),y)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
