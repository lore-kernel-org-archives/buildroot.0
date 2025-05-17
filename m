Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E700C3ABDA
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 09:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28973405A6;
	Sat, 17 May 2025 09:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBTaddKNvi_E; Sat, 17 May 2025 09:39:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5849F405DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5849F405DB;
	Sat, 17 May 2025 09:39:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3A91E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98E6F60A55
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ing3LJZE3tRE for <buildroot@buildroot.org>;
 Sat, 17 May 2025 09:39:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39D766066C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39D766066C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39D766066C
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:39:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0433.dip0.t-ipconnect.de [91.58.4.51])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9D407A4C16C2;
 Sat, 17 May 2025 11:39:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34098)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGE0u-000000007lZ-1MD9;
 Sat, 17 May 2025 09:39:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sat, 17 May 2025 11:39:25 +0200
Message-Id: <20250517093925.359219-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747474768;
 bh=WNdq4MYGF38g0iKQx3FZvgMAcqetOgUFWYUQ2UfQdxY=;
 h=From:To:Cc:Subject:Date:From;
 b=hS4Z0EtK7RZdMuTcD6Okcu0ENOCSUFFTZk2nm5qQctmARGaD3iswOBUMhcWdu5RcI
 /n10Mnu9rNF7JOpTcbQM05w18IneHHdW2GTlkEqjLpsn/UQJmULlREP55EnUpO4k7Q
 u0t2OQXQ0fl8HQXFVh9SjQFyPIN0Uzf6lml9cE2lMzNQ4DZMYGq1U1x+1TMkBEbPBq
 MBl4/Alf/njkqvCzKM9Wy0fN7ZwSE7eLuYGsFfcWwnPPu6OzPI4u5dB6ulaiYB7lMr
 LVDvQbvrtg386kv1786c9rBaxP+QmvkS3ucNebvkpLlfkA0Kk/NF8nP6HsurgiD6eL
 qxxfxCVeGgUJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=hS4Z0EtK
Subject: [Buildroot] [PATCH v2 1/1] package/ncurses: bump to version
 6.5.20250510
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

From: Akhilesh Nema <nemaakhilesh@gmail.com>

Release notes:
https://github.com/ThomasDickey/ncurses-snapshots/blob/v6_5_20250510/NEWS

- Drop upstream patch - 0001-fix-XOPEN_SOURCE-detection.patch
- COPYING hash changed due to Copyright year update.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Bernd: bumped to 6.5.20250510
    This bump fixes the build of gdb-16.3 with gcc-15
    Build-tested using the defconfig from
    https://patchwork.ozlabs.org/project/buildroot/patch/20250120052252.3702-1-nemaakhilesh@gmail.com/#3447368

 .../0001-fix-XOPEN_SOURCE-detection.patch       | 17 -----------------
 package/ncurses/ncurses.hash                    |  4 ++--
 package/ncurses/ncurses.mk                      |  4 ++--
 3 files changed, 4 insertions(+), 21 deletions(-)
 delete mode 100644 package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch

diff --git a/package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch b/package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch
deleted file mode 100644
index 130ef524b4..0000000000
--- a/package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Fix detection of XOPEN_SOURCE
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: fixed in latest release, no git/svn/hg
-
-diff -Nur ncurses-snapshots-6_4_20230603.orig/configure ncurses-snapshots-6_4_20230603/configure
---- ncurses-snapshots-6_4_20230603.orig/configure	2023-06-04 00:07:40.000000000 +0200
-+++ ncurses-snapshots-6_4_20230603/configure	2024-08-14 20:38:03.426905460 +0200
-@@ -10411,7 +10411,7 @@
- 	cf_xopen_source="-D_SGI_SOURCE"
- 	cf_XOPEN_SOURCE=
- 	;;
--(linux*gnu|linux*gnuabi64|linux*gnuabin32|linux*gnueabi|linux*gnueabihf|linux*gnux32|uclinux*|gnu*|mint*|k*bsd*-gnu|cygwin|msys|mingw*)
-+(linux*gnu|linux*gnuabi64|linux*gnuabin32|linux*gnueabi|linux*gnueabihf|linux*gnux32|uclinux*|gnu*|mint*|k*bsd*-gnu|cygwin|msys|mingw*|linux*uclibc)
- 
- cf_gnu_xopen_source=$cf_XOPEN_SOURCE
- 
diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index b82a7b29e4..50b5f5c43c 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b0910671694c2c8377f579eea68477a15d67bd20ddd4b29328cfe15c62c7b3fd  ncurses-6.4-20230603.tar.gz
+sha256  98da8cec5e320a3f532660acd7f1deba0555e901ea91a62938c273f38e583468  ncurses-6.5-20250510.tar.gz
 # Locally computed
-sha256  0413b2f4ea863194c174673032f0fca84f1ea1ed4eed6476baea68c075a631ce  COPYING
+sha256  708999f95527e1ffa670c6fce288c6c600cb477dd04afcc1171422b3dd4ee226  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 00e1c0d424..0c8f7fc6df 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When there is no snapshost yet for a new version, set it to the empty string
-NCURSES_VERSION_MAJOR = 6.4
-NCURSES_SNAPSHOT_DATE = 20230603
+NCURSES_VERSION_MAJOR = 6.5
+NCURSES_SNAPSHOT_DATE = 20250510
 NCURSES_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),-$(NCURSES_SNAPSHOT_DATE))
 NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
 NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
