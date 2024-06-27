Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A86C3064D
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 21:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1717416FF;
	Thu, 27 Jun 2024 21:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wh3KQXsmdKqB; Thu, 27 Jun 2024 21:25:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F17C7416C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F17C7416C7;
	Thu, 27 Jun 2024 21:25:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30D201BF3CA
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 21:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D051416C7
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 21:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lSPb_vUK6_M for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 21:25:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6DFEC416C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DFEC416C2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DFEC416C2
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 21:25:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb6a.dip0.t-ipconnect.de [84.161.187.106])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8A162A4C0CA1;
 Thu, 27 Jun 2024 23:25:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58778)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sMwcm-000000003hL-0qNN;
 Thu, 27 Jun 2024 21:25:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 23:25:47 +0200
Message-Id: <20240627212547.2194843-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719523548;
 bh=mBPN2feC+rr3h77xyzyC64sB2FoeuHN3KMnouk/vEMU=;
 h=From:To:Cc:Subject:Date:From;
 b=Id8xuTv59oLsTRKACbrVDA9mjLReH0WfJ+JuBTe2BaBFTxDgO8ytk8JPDvoBfR5mc
 YzivwTYenv5cgQLHxvzom/WluUPWFTAS0sgs5nEwsxW/KBJewrTu8iNZt62wRfMKHD
 ZEG0yUI1P8vlfPY+YenhaxygkE8GkeRriTSte8nEelzC/32cw26Rmvdh6pnMDJQmU8
 tBfoJyPCqcpQMbbEnQ6SKxZsjz72lbVevAd+GPNyqrlJlWOVxFUi5XAXGTn+X1i8hI
 zfPvHZaN6pQwvah8G1SHX+xQzKCuQtGlAN3uZasZ8T6mhkVpLU+sW0KMjKpfdhB02h
 2Xst5Ol9lLjAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=Id8xuTv5
Subject: [Buildroot] [PATCH 1/1] package/exim: update patches to be applied
 with fuzz 0
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, exim fails to build with output:

    Applying 0004-exim_lock-fix-lstat-related-build-errors.patch using patch:
    patching file src/exim_lock.c
    Hunk #1 FAILED at 13.
    Hunk #2 succeeded at 27 (offset 1 line).
    1 out of 2 hunks FAILED -- saving rejects to file src/exim_lock.c.rej

This commit rebases the package patches on the current package version
when needed.

Fixes:
http://autobuild.buildroot.net/results/ff27d5ebd7f24ac8cb236b83c67c2c75255e51c6/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/exim/0001-Build-buildconfig-for-the-host.patch    | 4 +++-
 ...0002-Don-t-make-backup-copies-of-installed-files.patch | 4 +++-
 ...0003-Skip-version-check-and-symlink-installation.patch | 8 ++++----
 .../0004-exim_lock-fix-lstat-related-build-errors.patch   | 8 +++++---
 package/exim/0005-sieve-fix-build-errors.patch            | 4 +++-
 5 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/package/exim/0001-Build-buildconfig-for-the-host.patch b/package/exim/0001-Build-buildconfig-for-the-host.patch
index 87eb527974..e9da80765a 100644
--- a/package/exim/0001-Build-buildconfig-for-the-host.patch
+++ b/package/exim/0001-Build-buildconfig-for-the-host.patch
@@ -2,6 +2,8 @@ buildconfig is meant to be executed on the host, so it has to be compiled
 using $(HOSTCC), not $(CC).
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+[Bernd: rebased for version 4.97.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  OS/Makefile-Base |    4 ++--
  1 files changed, 2 insertions(+), 2 deletions(-)
@@ -10,7 +12,7 @@ diff --git a/OS/Makefile-Base b/OS/Makefile-Base
 index 29a6ad3..420ba60 100644
 --- a/OS/Makefile-Base
 +++ b/OS/Makefile-Base
-@@ -114,8 +114,8 @@ allexim: config.h $(EXIM_MONITOR) exicyclog exinext exiwhat \
+@@ -258,8 +258,8 @@ allexim: config.h $(EXIM_MONITOR) exicyclog exinext exiwhat \
  
  # Targets for special-purpose configuration header builders
  buildconfig: buildconfig.c
diff --git a/package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch b/package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch
index 0cdaa744bc..3c115f8d02 100644
--- a/package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch
+++ b/package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch
@@ -5,6 +5,8 @@ This leads to useless duplicated files on the target, so disable this
 piece of code.
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+[Bernd: rebased for version 4.97.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  scripts/exim_install |   18 +++++++++---------
  1 files changed, 9 insertions(+), 9 deletions(-)
@@ -13,7 +15,7 @@ diff --git a/scripts/exim_install b/scripts/exim_install
 index 616ab3c..e68e7d5 100755
 --- a/scripts/exim_install
 +++ b/scripts/exim_install
-@@ -344,15 +344,15 @@ while [ $# -gt 0 ]; do
+@@ -348,15 +348,15 @@ while [ $# -gt 0 ]; do
  
    else
      if ../scripts/newer ${name} ${BIN_DIRECTORY}/${name}; then
diff --git a/package/exim/0003-Skip-version-check-and-symlink-installation.patch b/package/exim/0003-Skip-version-check-and-symlink-installation.patch
index a342d6ed34..55166f108b 100644
--- a/package/exim/0003-Skip-version-check-and-symlink-installation.patch
+++ b/package/exim/0003-Skip-version-check-and-symlink-installation.patch
@@ -9,8 +9,8 @@ Inspired by:
 http://patch-tracker.debian.org/patch/series/view/exim4/4.76-2/35_install.dpatch
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-(rebased against exim 4.89)
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for version 4.89 & 4.97.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  scripts/exim_install |    7 +++++--
  1 files changed, 5 insertions(+), 2 deletions(-)
@@ -19,7 +19,7 @@ diff --git a/scripts/exim_install b/scripts/exim_install
 index e68e7d5..487a4e1 100755
 --- a/scripts/exim_install
 +++ b/scripts/exim_install
-@@ -58,6 +58,8 @@
+@@ -61,6 +61,8 @@
    shift
  done
  
@@ -28,7 +28,7 @@ index e68e7d5..487a4e1 100755
  # Get the values of BIN_DIRECTORY, CONFIGURE_FILE, INFO_DIRECTORY, NO_SYMLINK,
  # SYSTEM_ALIASES_FILE, and EXE from the global Makefile (in the build
  # directory). EXE is empty except in the Cygwin environment. In each case, keep
-@@ -217,9 +219,7 @@
+@@ -220,9 +223,7 @@
    # The exim binary is handled specially
  
    if [ $name = exim${EXE} ]; then
diff --git a/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch b/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch
index a0a279fc43..616ada5026 100644
--- a/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch
+++ b/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch
@@ -22,6 +22,8 @@ Fixes:
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 Upstream-status: https://bugs.exim.org/show_bug.cgi?id=2523
+[Bernd: rebased for version 4.97.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  src/exim_lock.c | 3 +++
  1 file changed, 3 insertions(+)
@@ -30,8 +32,8 @@ diff --git a/src/exim_lock.c b/src/exim_lock.c
 index 068216816054..cb140aff6436 100644
 --- a/src/exim_lock.c
 +++ b/src/exim_lock.c
-@@ -13,6 +13,8 @@ Argument: the name of the lock file
- Copyright (c) The Exim Maintainers 2016
+@@ -14,6 +14,8 @@ Copyright (c) The Exim Maintainers 2016 - 2021
+ SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 +#define _XOPEN_SOURCE
@@ -39,7 +41,7 @@ index 068216816054..cb140aff6436 100644
  #include "os.h"
 
  #include <stdio.h>
-@@ -26,6 +28,7 @@ Copyright (c) The Exim Maintainers 2016
+@@ -27,6 +29,7 @@ Copyright (c) The Exim Maintainers 2016
  #include <unistd.h>
  #include <utime.h>
  #include <sys/utsname.h>
diff --git a/package/exim/0005-sieve-fix-build-errors.patch b/package/exim/0005-sieve-fix-build-errors.patch
index f4b95d50bc..20323c17cd 100644
--- a/package/exim/0005-sieve-fix-build-errors.patch
+++ b/package/exim/0005-sieve-fix-build-errors.patch
@@ -21,6 +21,8 @@ buildsystem.
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 Upstream-status: https://bugs.exim.org/show_bug.cgi?id=2523
+[Bernd: rebased for version 4.97.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  src/sieve.c | 2 ++
  1 file changed, 2 insertions(+)
@@ -29,7 +31,7 @@ diff --git a/src/sieve.c b/src/sieve.c
 index 5e8d1e6f4776..9632f2d43810 100644
 --- a/src/sieve.c
 +++ b/src/sieve.c
-@@ -12,6 +12,8 @@
+@@ -14,6 +14,8 @@
 
  /* Sieve mail filter. */
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
