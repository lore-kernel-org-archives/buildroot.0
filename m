Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD51FD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D712606AA;
	Thu, 26 Feb 2026 20:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxkCFSocnkoZ; Thu, 26 Feb 2026 20:13:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EAC160706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772136819;
	bh=ULXSANj5Ds/Hnug1bO9Y+nz0EfY4Rjd1DEVlhzQbIPQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EtvYwmrR5qywwYslXDbyxWNTmv6ZZE3V8OvgJsIE7AcZENhxzvY6mvJXJvuYgajbb
	 +ZyDaR6/5qq1ZiZ+fKrmTvK2ThGsKg8Q6XOeT67y71EtCt9r5/C0Jg/2B2QXbrMtxI
	 MgKTtFAW9gvondZ1zxyfbTRrzEqUz/DEns0J2fCbwCho5Y4uGDsfDHQtRbaq2Z+1fE
	 tAva5dMMcPhB0hjGpePQP/cP4tkocJxpxP+zgmH49MH36/cynX47UHL2ZGDH4muEE6
	 7qRdVYXZUzA0aF7NufKChLGfBS406vE8p494/AlkjnX3Cilvndi4oYTsp1CzVWqL96
	 ZhC1RHxiq6UhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EAC160706;
	Thu, 26 Feb 2026 20:13:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15CCC23D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFBBD4022F
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3WJK1ohFinif for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:13:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EFF7540122
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFF7540122
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFF7540122
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:13:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 897F1A4C2E88
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:13:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43450)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vvhjq-000000003mq-1xFL
 for buildroot@buildroot.org; Thu, 26 Feb 2026 20:13:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:13:34 +0100
Message-ID: <20260226201334.905458-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772136814;
 bh=ogPUO9BjlIfEzDhEhE/4gIGyWo9KdoRyxhHNli/yUis=;
 h=From:To:Subject:Date:From;
 b=sqbno21o1+zirOeESmYBHxp7cSdM0gXiFqAUudqPhT0SeKSjXLba0Lag/n5Vsez78
 1PMyoOSS8tkKVtdQ/BYtOiZOS9o9l7R3FLFOhy3kv/Vl9Xm3aFw9gEPWGjlNQFP/+w
 aQ+h2vbpfegk3vOdLAByhF2PlJ22qXBPa35rq7XInY1GdXp2hXoVHRBVl+3wudxUg/
 JNkv4HM6+HgxuMojh4339J6219GgJhPESHz7hMkb5R4IQts/uqbp75OU8DElsZ+CGK
 BQmgeDAOkx0bCTMkr43hwT45p3E48CRC4oOF6zxu4w5XYxVt/4WwzgsuLfGjPPr0M5
 mW8OLx1Sj9C2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=sqbno21o
Subject: [Buildroot] [PATCH/next 1/1] package/libeastl: bump version to
 3.27.01
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

https://github.com/electronicarts/EASTL/releases

Updated license hash due to upstream commit
https://github.com/electronicarts/EASTL/commit/c18a037660ee213e9546edbbbddf31634af11a56

Added patch to raise make_minimum_required in subproject EABase that was
added by upstream commit
https://github.com/electronicarts/EASTL/commit/c530255b690c9d14feff249f5753824eef9ed818
using FetchContent_Declare which downloads the source during configure
so we do not have a chance to use _POST_EXTRACT_HOOKS to patch the
source code directly.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...tch-EABase-to-fix-build-with-cmake-4.patch | 30 +++++++++++++++++++
 package/libeastl/libeastl.hash                |  5 ++--
 package/libeastl/libeastl.mk                  |  2 +-
 3 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 package/libeastl/0001-cmake-patch-EABase-to-fix-build-with-cmake-4.patch

diff --git a/package/libeastl/0001-cmake-patch-EABase-to-fix-build-with-cmake-4.patch b/package/libeastl/0001-cmake-patch-EABase-to-fix-build-with-cmake-4.patch
new file mode 100644
index 0000000000..4544073be4
--- /dev/null
+++ b/package/libeastl/0001-cmake-patch-EABase-to-fix-build-with-cmake-4.patch
@@ -0,0 +1,30 @@
+From d2374930c45ecf117b08df0ffa5c1611867f6d92 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 22 Feb 2026 15:26:22 +0100
+Subject: [PATCH] cmake: patch EABase to fix build with cmake 4+
+
+FetchContent_Declare overwrites extracted source files during configure.
+
+Upstream: Not applicable (Buildroot specific)
+(sent PR for version bump: https://github.com/electronicarts/EABase/pull/18)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0124dc7..f76df69 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -75,6 +75,7 @@ FetchContent_Declare(
+   GIT_REPOSITORY https://github.com/electronicarts/EABase.git
+   GIT_TAG        0699a15efdfd20b6cecf02153bfa5663decb653c
+   GIT_SUBMODULES "" # This should be temporary until we update the cyclic submodule dependencies in EABase.
++  PATCH_COMMAND sed -i "s/make_minimum_required(VERSION 3.1)/make_minimum_required(VERSION 3.5)/" "${CMAKE_CURRENT_SOURCE_DIR}/_deps/eabase-src/CMakeLists.txt"
+ )
+ 
+ FetchContent_MakeAvailable(EABase)
+-- 
+2.47.3
+
diff --git a/package/libeastl/libeastl.hash b/package/libeastl/libeastl.hash
index c7ba6da09f..3424fd5951 100644
--- a/package/libeastl/libeastl.hash
+++ b/package/libeastl/libeastl.hash
@@ -1,2 +1,3 @@
-sha256  9b3484553812b3ec3bad0857f7f675499c81f7cf4ac87e5f3b2acbe72e3a878a  libeastl-45469730d641868ce05433fff2e199510c7d45c3.tar.gz
-sha256  82c0243a1a62b8af01dab3bce6ed2b0852604bd508b85a561ba7d32480e598e3  LICENSE
+# Locally computed
+sha256  fce43bf443f5569b00a8deae735394ea0b16f6c3f96867a17ded50775ffcdd12  libeastl-3.27.01.tar.gz
+sha256  cebc1fa5ade455a79f821180cf86bf5f9717dd1df5704b4c2a3bb0617ab35f2a  LICENSE
diff --git a/package/libeastl/libeastl.mk b/package/libeastl/libeastl.mk
index 0559dd856d..15feaf9847 100644
--- a/package/libeastl/libeastl.mk
+++ b/package/libeastl/libeastl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEASTL_VERSION = 45469730d641868ce05433fff2e199510c7d45c3
+LIBEASTL_VERSION = 3.27.01
 LIBEASTL_SITE = $(call github,electronicarts,EASTL,$(LIBEASTL_VERSION))
 LIBEASTL_LICENSE = BSD-3-Clause
 LIBEASTL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
