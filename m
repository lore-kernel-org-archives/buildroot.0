Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B987C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 17:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A38B84021F;
	Mon,  1 Jul 2024 17:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5MFLzFpEAmEA; Mon,  1 Jul 2024 17:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 644E640227
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 644E640227;
	Mon,  1 Jul 2024 17:03:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 594371BF34F
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FED7814B5
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGW_jQiOhmIB for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 17:03:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9422A814A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9422A814A9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9422A814A9
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 17:03:41 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 76E5AB00572;
 Mon,  1 Jul 2024 19:03:35 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 19:03:30 +0200
Message-ID: <20240701170330.19709-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719853418;
 bh=udS0qhEHfS6nZKqGhtoPkeXyOhDi45y7JnqrW6dyz8A=;
 h=From:To:Cc:Subject:Date:From;
 b=K7Uns9MrQCL2DuBuQIehwFvfm4Nw2dzdUYWbGLe64gKZLaJsxH7bPiHceaCKoUONE
 4M9mAD89O85IYq2bmNPeZSuqccT6VzGYpBChYoN8nX48RGE9+HL269UPBp2YtC0KVY
 +5Ztl0V3R+JvQwhnkuaj9mY6uAz3q/AzKHSFrUORKTWrRubUVoipgt5WDz84KQ2Pf+
 NI/FG10CO4NDBvUUT6sWdT2xh8wPWuNK9MxRv9PR76+4baOgEFoab8trfW498f8GXd
 CDk2l6dIbQ5yL5bOS7+egqUCM4IE1D1JwLLv9Blxm6dhsDwy7+oT9ZH5i8Pk8w6AA2
 XfOXEjieFTTog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=K7Uns9Mr
Subject: [Buildroot] [PATCH 1/1] package/rt-tests: fix patch fuzz
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, rt-tests fails to build with output:

    Applying 0001-Fix-a-build-issue-with-uClibc-ng.patch using patch:
    patching file src/cyclictest/cyclictest.c
    Hunk #1 FAILED at 58.
    1 out of 1 hunk FAILED -- saving rejects to file src/cyclictest/cyclictest.c.rej

This commit refreshes the package patches on the current package version.

The patch 0002 had an "Upstream:" tag in brackets. The tag was not
detected as such by check-package. This commit removes those brackets
and also removes the ".checkpackageignore" entry.

Fixes:
http://autobuild.buildroot.org/results/3e0a3b8d8c42d8e82ecf47b80bca875de739af5b

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 .../0001-Fix-a-build-issue-with-uClibc-ng.patch    | 12 +++++++-----
 ...op-explicit-undefine-PYLIB-for-compatibil.patch | 14 ++++++++------
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c73e0433b12..a122f74bb8c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1325,7 +1325,6 @@ package/rpi-userland/0005-dtmerge-add-missing-include-for-va_list.patch lib_patc
 package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch lib_patch.Upstream
 package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch lib_patch.Upstream
 package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch lib_patch.Upstream
-package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch lib_patch.Upstream
 package/rtmpdump/0001-include-limits.h.patch lib_patch.Upstream
 package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch lib_patch.Upstream
 package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch lib_patch.Upstream
diff --git a/package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch b/package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch
index 785d93c9be0..ae89761ecde 100644
--- a/package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch
+++ b/package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch
@@ -1,4 +1,4 @@
-From 21e0c16a85c2e028a963703511d750d1751bc254 Mon Sep 17 00:00:00 2001
+From a621d8ee2a27ba44845f5232a3b2bf9b581623b1 Mon Sep 17 00:00:00 2001
 From: Alexey Brodkin <abrodkin@synopsys.com>
 Date: Wed, 13 Jul 2016 23:46:38 +0200
 Subject: [PATCH] Fix a build issue with uClibc-ng
@@ -11,16 +11,18 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
     rebase on v1.0
     remove uClibc legacy support, uClibc-ng provide utmpx.h]
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Julien: rebased patch on version 2.7]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  src/cyclictest/cyclictest.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/cyclictest/cyclictest.c b/src/cyclictest/cyclictest.c
-index 00e5f3d..92fa3dd 100644
+index c5c3389..5ae1dd9 100644
 --- a/src/cyclictest/cyclictest.c
 +++ b/src/cyclictest/cyclictest.c
-@@ -58,7 +58,7 @@
- #define gettid() syscall(__NR_gettid)
+@@ -51,7 +51,7 @@
+ 
  #define sigev_notify_thread_id _sigev_un._tid
  
 -#ifdef __UCLIBC__
@@ -29,5 +31,5 @@ index 00e5f3d..92fa3dd 100644
  	((~(clockid_t) (pid) << 3) | (clockid_t) (clock))
  #define CPUCLOCK_SCHED          2
 -- 
-2.5.5
+2.45.2
 
diff --git a/package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch b/package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch
index f71ba09a791..9212b8eee07 100644
--- a/package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch
+++ b/package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch
@@ -1,4 +1,4 @@
-From 84fea5d784e010f84c860b34e55ea2c855c17b3b Mon Sep 17 00:00:00 2001
+From 063972eece2fb8157f0feb98a4608c2984c7c5ff Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Wed, 12 May 2021 09:18:33 +0200
 Subject: [PATCH] Makefile: drop explicit undefine PYLIB for compatibility with
@@ -22,18 +22,20 @@ Fixes:
 http://autobuild.buildroot.net/results/cf7c4f360f5464c700788cc8299fd086544c80e8/build-end.log
 
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Upstream: https://marc.info/?l=linux-rt-users&m=162080462211139&w=2]
+Upstream: https://marc.info/?l=linux-rt-users&m=162080462211139&w=2
+[Julien: rebased patch on version 2.7]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  Makefile | 5 -----
  1 file changed, 5 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index b17ac09..ec85ac8 100644
+index e2f8579..62c906f 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -36,11 +36,6 @@ LDFLAGS ?=
+@@ -37,11 +37,6 @@ LDFLAGS ?=
  
- PYLIB  ?= $(shell python3 -c 'import distutils.sysconfig;  print (distutils.sysconfig.get_python_lib())')
+ PYLIB ?= $(shell python3 -m get_pylib)
  
 -# Check for errors, such as python3 not available
 -ifeq (${PYLIB},)
@@ -44,5 +46,5 @@ index b17ac09..ec85ac8 100644
  	   src/pi_tests/pi_stress.8 \
  	   src/ptsematest/ptsematest.8 \
 -- 
-2.20.1
+2.45.2
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
