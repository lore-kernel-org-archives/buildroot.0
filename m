Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1C7C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 21:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B97AD608D4;
	Fri, 14 Feb 2025 21:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBcq-H_kDjQy; Fri, 14 Feb 2025 21:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ACEC608B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ACEC608B8;
	Fri, 14 Feb 2025 21:22:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DAE91F1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 21:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0042C409B3
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 21:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_gOHwXCh5cT for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 21:22:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB2DD40451
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB2DD40451
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB2DD40451
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 21:22:11 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 61B0BB0051E;
 Fri, 14 Feb 2025 22:22:07 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri, 14 Feb 2025 22:22:01 +0100
Message-ID: <20250214212201.139174-1-ju.o@free.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739568128;
 bh=GkeHla31ID+hOSMYMs1Ssesr2JxqiS3Umtb8jyaCHM4=;
 h=From:To:Cc:Subject:Date:From;
 b=ki0E9YM7UzDIsomDlQXoa4odCjtja7r1kPXj0Z+bis58nA36/cPvNHjHyHzHl4fW4
 h7aGATTZginj7pYtsar08xoucHfdbZifsyMyGSyJEmaxQYnlXcbV0Y9MkkZUevLyYZ
 dUN0T3RxqqJ1lbyeSib1nxcgQxHN2Ogrebkvfi7+Zy6gllX/eViskcLFDcIkH0F1Ud
 KRzyjK4GNb7XnosrRRThsdRjMPGKQtaDnZS9ZKuwJmlc6C4Wk5eLtQyHHSYq2x3n74
 dcnriY+vZBhkyZsTYld4L+YR1mJ0N7HlCWFFlrqN+lkiwOrwyqbMqljSpBRbJqilzQ
 XHYmkoauOrEew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ki0E9YM7
Subject: [Buildroot] [PATCH 1/1] package/fakeroot: add patch to fix parallel
 build
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

When building host-fakeroot on host with large number of CPUs,
compilation can randomly fail. Failures are observed on hosts
with 24 CPUs or more.

Build logs show errors such as:

    make -j$(nproc)
    ...
    awk -f ./wrapawk < ./wrapfunc.inp
    awk -f ./wrapawk < ./wrapfunc.inp
    ...
    In file included from libfakeroot.c:265:
    wraptmpf.h:607: error: unterminated #ifdef
      607 | #ifdef __APPLE__
          |
    wraptmpf.h:601: error: unterminated #ifdef
      601 | #ifdef HAVE_FTS_CHILDREN
          |
    wraptmpf.h:2: error: unterminated #ifndef
        2 | #ifndef WRAPTMPF_H
          |
    ...

This commit fixes the issue by adding a package patch.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451831
- https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451244
- https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451198
- and many more...

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Makefile.am-fix-parallel-build.patch | 97 +++++++++++++++++++
 package/fakeroot/fakeroot.mk                  |  2 +
 2 files changed, 99 insertions(+)
 create mode 100644 package/fakeroot/0001-Makefile.am-fix-parallel-build.patch

diff --git a/package/fakeroot/0001-Makefile.am-fix-parallel-build.patch b/package/fakeroot/0001-Makefile.am-fix-parallel-build.patch
new file mode 100644
index 0000000000..2f21f84349
--- /dev/null
+++ b/package/fakeroot/0001-Makefile.am-fix-parallel-build.patch
@@ -0,0 +1,97 @@
+From 29e9322e6a8238205780107e731a51b48845f9c7 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Mon, 10 Feb 2025 22:59:04 +0100
+Subject: [PATCH] Makefile.am: fix parallel build
+
+When building fakeroot on host with large number of CPUs, compilation
+can randomly fail. Failures were observed on hosts with 24 CPUs.
+
+Build logs show errors such as:
+
+    make -j$(nproc)
+    ...
+    awk -f ./wrapawk < ./wrapfunc.inp
+    awk -f ./wrapawk < ./wrapfunc.inp
+    ...
+    In file included from libfakeroot.c:265:
+    wraptmpf.h:607: error: unterminated #ifdef
+      607 | #ifdef __APPLE__
+          |
+    wraptmpf.h:601: error: unterminated #ifdef
+      601 | #ifdef HAVE_FTS_CHILDREN
+          |
+    wraptmpf.h:2: error: unterminated #ifndef
+        2 | #ifndef WRAPTMPF_H
+          |
+    ...
+
+The issue was observed in the builders of Buildroot Linux [1], which
+is using fakeroot. Examples of build failures are [2], [3], [4].
+
+It is important to note that in all failing cases, there is
+more that one parallel invocation of the "wrapawk" script [5].
+
+This script is meant to generate many output files (wrapped.h,
+wrapdef.h, wrapstruct.h, wraptmpf.h) from a single invocation.
+
+The Makefile.am file is using multiple targets in an attempt to
+reflect that generation of multiple outputs at once. See [6].
+
+This use of multiple targets in this rule is incorrect here. See
+the Make manual [7]. This construct, used in Makefile.am, incorrectly
+assumes all those targets are independant (so they can be executed in
+parallel). They are not. In the current failing case, parallel
+invocations will generates all their respective output files,
+overwriting each other. This could lead to incomplete generated
+files, resulting to the observed compilation failures.
+
+Note that GNU Make 4.3 introduced "Grouped Targets" for that purpose.
+See "Rules with Grouped Targets" section in [7]. But this would add a
+requirement on Make >= 4.3.
+
+For that reason, this commit fixes the issue by using a simpler
+construct, working with all Make versions: the first output file
+"wrapped.h" is kept as a target, and it is devlared as a
+dependency of the three other generated files. This change makes sure
+that only one invocation of "wrapawk" will happen at a time,
+disregarding the number of parallel jobs requiring those generated
+files. This has the effect of completely solving the parallel build
+for all GNU Make versions.
+
+[1] https://buildroot.org/
+[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451831
+[3] https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451244
+[4] https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451198
+[5] https://salsa.debian.org/clint/fakeroot/-/blob/master/wrapawk
+[6] https://salsa.debian.org/clint/fakeroot/-/blob/upstream/1.37/Makefile.am#L54
+[7] https://www.gnu.org/software/make/manual/html_node/Multiple-Targets.html
+
+Upstream: Proposed: https://salsa.debian.org/clint/fakeroot/-/merge_requests/33
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ Makefile.am | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 46f01eb..ff71a8d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -48,12 +48,13 @@ EXTRA_DIST=wrapawk wrapawk_macosx wrapfunc.inp           \
+ CLEAN_FILES=fakerootconfig.h
+ 
+ if MACOSX
+-wrapped.h wrapdef.h wrapstruct.h wraptmpf.h:wrapawk_macosx wrapfunc.inp
++wrapped.h: wrapawk_macosx wrapfunc.inp
+ 	awk -f $(srcdir)/wrapawk_macosx < $(srcdir)/wrapfunc.inp
+ else !MACOSX
+-wrapped.h wrapdef.h wrapstruct.h wraptmpf.h:wrapawk wrapfunc.inp
++wrapped.h: wrapawk wrapfunc.inp
+ 	awk -f $(srcdir)/wrapawk < $(srcdir)/wrapfunc.inp
+ endif !MACOSX
++wrapdef.h wrapstruct.h wraptmpf.h: wrapped.h
+ 
+ libfakeroot.lo:libfakeroot.c wrapdef.h wrapstruct.h wraptmpf.h
+ 
+-- 
+2.48.1
+
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index e18cdc5f07..f557161770 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -15,6 +15,8 @@ HOST_FAKEROOT_DEPENDENCIES = host-acl
 HOST_FAKEROOT_CONF_ENV = \
 	ac_cv_header_sys_capability_h=no \
 	ac_cv_func_capset=no
+# 0001-Makefile.am-fix-parallel-build.patch
+HOST_FAKEROOT_AUTORECONF = YES
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
 
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
