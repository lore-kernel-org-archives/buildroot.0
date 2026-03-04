Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5F4EFCE3B
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 19:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 680FB80EB6;
	Wed,  4 Mar 2026 19:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4u_wWwi1Udc; Wed,  4 Mar 2026 19:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CCEB80ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772651542;
	bh=r61YdJtQLPOkNlsOWMGFGePfKug6712gsSd4mVhI6es=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YCON/1AheRREDZZaLGzpNR5CiudU5CwN0duAhHgWWlNoSrNfPZtEZNDDxm62Or5KJ
	 mAVUgkOH6FjzUJc4xg9t7yDr0kG8810RkPG0s0RSB9tvix03zBtdmC0KAv2GGvhium
	 xu2OcadFH/uUYm04DpnRDSHSAdRGdlOliJ/+Jmm+YbSenSMWHVCKoqsa+YUvovg1PQ
	 QBrhzoT9o9L6ri/pXjZ+PxRwbAxNcii1zwaw2HargP+S8JuvHsUQygj15bLMCzMSbK
	 g/DHOpU7IjMxLZIh0cMAxPFjNAHmYGGksY3hm/x+IXcRnc/FR9iXRV8rH+VTAkW12t
	 syxOAEg+S6jYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CCEB80ECE;
	Wed,  4 Mar 2026 19:12:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D23F925B
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7E0880ECE
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AlEllv777DX for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 19:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB0C780EB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB0C780EB6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB0C780EB6
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:12:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b996.dip0.t-ipconnect.de [84.161.185.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BD298A4C338E
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 20:12:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42110)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxrdp-000000006Ow-2c3X
 for buildroot@buildroot.org; Wed, 04 Mar 2026 19:12:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 20:12:17 +0100
Message-ID: <20260304191217.3487635-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772651537;
 bh=EV0fqR8A4SfP1SCs0iTMxRYbzfeSV9RpZyWHMLgU/x0=;
 h=From:To:Subject:Date:From;
 b=f8RuS3sHAfYJG7O7vDy3QxDmGG8usM9GZDcU94FYnjBlNXC8NAa/V3dvauExHXiZp
 nH2Nmc+RREAQp4W4i1/e58nH82oOSAWXanVca/kXkvwmD6KGEFf4xfmGrapUrwxw/l
 +rRHmK8+BhXfoczvAgDKuxXSn4FNgSpsdbOK6Mb3v6ktloef2gYC3oSlhntX+Mpi/k
 tTHWxXD/ufNqU7R8LNtLBYtVIAyvrOGolbBnaYRFdzwGHZNdY+BB02HwiQcqDB02sH
 FbEK/KL5tsRwZ5hQIWX2knRMd5n/dKa5pj6wXRpWXSrP3BHuZta3dsLyWc9l2RIIlk
 5w6RQUUFGmQgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=f8RuS3sH
Subject: [Buildroot] [PATCH 1/1] package/libid3tag: bump version to 0.16.4
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

https://codeberg.org/tenacityteam/libid3tag/releases/tag/0.16.4
"We now provide our own source packages instead of using Codeberg's
 pre-generated sources, guaranteeing that the hash won't change."

Removed patches which are included in this bump.

Used tarball and its hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Allow-build-with-CMake-4.0.0.patch   | 26 ---------------
 package/libid3tag/0002-CMake-Disable-c.patch  | 33 -------------------
 package/libid3tag/libid3tag.hash              |  4 ++-
 package/libid3tag/libid3tag.mk                |  6 ++--
 4 files changed, 6 insertions(+), 63 deletions(-)
 delete mode 100644 package/libid3tag/0001-Allow-build-with-CMake-4.0.0.patch
 delete mode 100644 package/libid3tag/0002-CMake-Disable-c.patch

diff --git a/package/libid3tag/0001-Allow-build-with-CMake-4.0.0.patch b/package/libid3tag/0001-Allow-build-with-CMake-4.0.0.patch
deleted file mode 100644
index cd14130252..0000000000
--- a/package/libid3tag/0001-Allow-build-with-CMake-4.0.0.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From eee94b22508a066f7b9bc1ae05d2d85982e73959 Mon Sep 17 00:00:00 2001
-From: heitbaum <heitbaum@noreply.codeberg.org>
-Date: Thu, 1 May 2025 05:34:30 +0000
-Subject: [PATCH] Allow build with CMake 4.0.0
-
-CMake 4.0.0 deprecates CMake syntax < 3.10. Update to using a minimum of 3.10.
-
-ref: https://cmake.org/cmake/help/latest/command/cmake_minimum_required.html
-
-Upstream: https://codeberg.org/tenacityteam/libid3tag/commit/eee94b22508a066f7b9bc1ae05d2d85982e73959
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d181300..083b5f1 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.1.0)
-+cmake_minimum_required(VERSION 3.10)
- project(id3tag VERSION 0.16.3)
- 
- option(BUILD_SHARED_LIBS "Build dynamic library" ON)
diff --git a/package/libid3tag/0002-CMake-Disable-c.patch b/package/libid3tag/0002-CMake-Disable-c.patch
deleted file mode 100644
index 151084b3b2..0000000000
--- a/package/libid3tag/0002-CMake-Disable-c.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b3b045a762ee35fab0e13d1837b9b407da47e59e Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Mon, 29 Dec 2025 13:31:43 +0100
-Subject: [PATCH] CMake: Disable c++
-
-https://cmake.org/cmake/help/latest/command/project.html
-"By default C and CXX are enabled if no language options are given."
-
-libid3tag only contains C code. This fix allows the build with
-toolchains containing no c++ compiler like some buildroot toolchains:
-https://autobuild.buildroot.net/results/02d/02db8c1a1b461fa3b5b5932e5b48c77be50b68af/build-end.log
-
-Upstream: https://codeberg.org/tenacityteam/libid3tag/pulls/26
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f71b245..0c2f13e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,5 @@
- cmake_minimum_required(VERSION 3.10)
--project(id3tag VERSION 0.16.3)
-+project(id3tag VERSION 0.16.3 LANGUAGES C)
- 
- option(BUILD_SHARED_LIBS "Build dynamic library" ON)
- 
--- 
-2.47.3
-
diff --git a/package/libid3tag/libid3tag.hash b/package/libid3tag/libid3tag.hash
index 5b800f3e73..b9acbf0d1e 100644
--- a/package/libid3tag/libid3tag.hash
+++ b/package/libid3tag/libid3tag.hash
@@ -1,4 +1,6 @@
+# From https://codeberg.org/tenacityteam/libid3tag/releases/tag/0.16.4
+sha256  8b6bc96016f6ab3a52b753349ed442e15181de9db1df01884f829e3d4f3d1e78  id3tag-0.16.4-source.tar.gz
+sha512  14f51b0c01ce931f563029976fa76f4a30e6fac7d5ad2ef9beff53bd6d1d0f7a3f9a9266a06dcf9018f306d5d3eb8467ced8d6f3aa5160a637873eb02e330c87  id3tag-0.16.4-source.tar.gz
 # Locally computed
-sha256  0561009778513a95d91dac33cee8418d6622f710450a7cb56a74636d53b588cb  0.16.3.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  7f12ad28dc075763e91b91bfa60fad04062380011ddad8f6bac21dd7b1f44367  COPYRIGHT
diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index 6cee42eeb9..e310f50b7d 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBID3TAG_VERSION = 0.16.3
-LIBID3TAG_SOURCE = $(LIBID3TAG_VERSION).tar.gz
-LIBID3TAG_SITE = https://codeberg.org/tenacityteam/libid3tag/archive
+LIBID3TAG_VERSION = 0.16.4
+LIBID3TAG_SOURCE = id3tag-$(LIBID3TAG_VERSION)-source.tar.gz
+LIBID3TAG_SITE = https://codeberg.org/tenacityteam/libid3tag/releases/download/$(LIBID3TAG_VERSION)
 LIBID3TAG_LICENSE = GPL-2.0+
 LIBID3TAG_LICENSE_FILES = COPYING COPYRIGHT
 LIBID3TAG_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
