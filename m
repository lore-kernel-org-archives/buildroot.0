Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940D7D1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69F12401FC;
	Wed,  3 Dec 2025 22:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZThxRInA2G4; Wed,  3 Dec 2025 22:02:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 795B540390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799378;
	bh=XvBl1usLB5ktnUFpIwrxn4e7x2GLHnlV20vloX8o91o=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bQUmrUbgf8UrDq0SZDPurrksekl9eSIQ6CJsTI9qLqFnqPG37MSNM5IEkNytLr8I+
	 FNW2ru8hdAB5kkzPF5cLpubZ7+C/Y9ylP5k95Wq6Gyb1tOeJMCrjskFtD3GlGY729T
	 LgFGxbDggt9RN3pk/rMR96il/IDJsXTa0Hpc+irAxN3HwtTcbgLnQPeOFhfb8nUdvi
	 17jeDl37EvhEj6L9OAU677vroF6jf6VDPAFTvnzsuukNrukLFufj7bIg0OllzeCYh3
	 3hSAQNSoLH1h8mzS397ugPY6MmURk1atWVZSz+q2EO2YkTFrt0mmyAZQphBh9MzAVV
	 n3QmN5jnphEzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 795B540390;
	Wed,  3 Dec 2025 22:02:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48F5DE7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 300A840390
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02fKYPe6yUdD for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:02:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2312B401FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2312B401FC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2312B401FC
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:02:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DCF30A4C79CC;
 Wed,  3 Dec 2025 22:59:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqg-000000002OS-43GR;
 Wed, 03 Dec 2025 21:57:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:09 +0100
Message-ID: <20251203215723.2323032-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799144;
 bh=+ykwl7jkOEa5P5o61k5f43VSm6HgwHUGmddqM+QwryY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hBYqiQ/q3CLrd52ZSEHxxFj/kkdAcquvI949YcOgkFynJqhp0avTwMBIXABVaqdrU
 re3Jxqygtebyk2+of5KB7XYsRfpYp5mWrMAYW8ts504PVmAjluNlopDesNa9PayS5p
 fvFpkIzY+6udurIIZRAnC3CR1cbj5E0uPzcMZdeYGDevsiacQWlEo5sL4OM6PAXyQ6
 3Mq5KltLzfWnJSbOshsMfjyy2EU/fzEv0MXsX0Swiri5Xzhubbr7rL03uVuCV2Jy8N
 2s70JVLOLGjhT79bdtfa7PNze3l3eg1WVlgXYOgm/2uiqVTXpV5rJD9xEtLpWSfumx
 1iw3dMKNympiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hBYqiQ/q
Subject: [Buildroot] [PATCH/next 02/16] package/cutelyst: bump version to
 3.5.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ Ascani <rj.ascani@gmail.com>,
 Daniel Nicoletti <dantti12@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/cutelyst/cutelyst/releases/tag/v3.5.0
"Last release supporting Qt 5.12"

Bump package to the latest version compatible with Qt5, fixes build with
cmake 4.

Removed patch which is included in this release:
https://github.com/cutelyst/cutelyst/commit/da9792f33c553031e639a194117ba70167d62eae

Updated license hash due to relicense as BSD-3-Clause:
https://github.com/cutelyst/cutelyst/commit/47c28edbbc8d0788db329bf87bf975844bef9b36

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...s.txt-don-t-override-CMAKE_EXE_LINKE.patch | 31 -------------------
 package/cutelyst/cutelyst.hash                |  4 +--
 package/cutelyst/cutelyst.mk                  |  4 +--
 4 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 347969b425..495915745e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -290,7 +290,6 @@ package/curlftpfs/0001-fix-CURLOPT_INFILESIZE.patch lib_patch.Sob lib_patch.Upst
 package/curlftpfs/0002-free_ftpfs_file-memleak-fix.patch lib_patch.Sob lib_patch.Upstream
 package/curlftpfs/0003-nocache-memleak-fix.patch lib_patch.Sob lib_patch.Upstream
 package/curlftpfs/0004-fix-musl-build-off-t.patch lib_patch.Upstream
-package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch lib_patch.Upstream
 package/cwiid/0001-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch lib_patch.Upstream
 package/cwiid/0002-configure-make-wmgui-build-optional.patch lib_patch.Upstream
 package/dahdi-tools/0001-no-build-docs.patch lib_patch.Upstream
diff --git a/package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch b/package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch
deleted file mode 100644
index 45b1fcd146..0000000000
--- a/package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c347aeb43775109cbc2824b99cb10b1b3440c191 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 17 May 2021 21:27:11 +0200
-Subject: [PATCH] server/CMakeLists.txt: don't override CMAKE_EXE_LINKER_FLAGS
-
-Don't override CMAKE_EXE_LINKER_FLAGS as this could break the build if
-CMAKE_EXE_LINKER_FLAGS is already set by the user (for example to pass
--latomic)
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/cutelyst/cutelyst/pull/312]
----
- wsgi/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/server/CMakeLists.txt b/server/CMakeLists.txt
-index ec5689f7..1ed56859 100644
---- a/wsgi/CMakeLists.txt
-+++ b/wsgi/CMakeLists.txt
-@@ -95,7 +95,7 @@ install(TARGETS Cutelyst${PROJECT_VERSION_MAJOR}Qt${QT_VERSION_MAJOR}Server
-     cxx_generalized_initializers
- )
- if (JEMALLOC_FOUND)
--    set(CMAKE_EXE_LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS} " -Wl,--no-as-needed")
-+    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--no-as-needed")
-     target_link_libraries(cutelyst-wsgi2 PRIVATE ${JEMALLOC_LIBRARIES})
- endif()
- 
--- 
-2.30.2
-
diff --git a/package/cutelyst/cutelyst.hash b/package/cutelyst/cutelyst.hash
index d35fdcc890..5103f58138 100644
--- a/package/cutelyst/cutelyst.hash
+++ b/package/cutelyst/cutelyst.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  b0e3d658a60d68906f7255b78bad64af1aa07cb3b785fbf61629b7355f089baa  cutelyst-2.11.0.tar.gz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  351578d495213c438365f988a70bb8f8c14b1d7dcef79ce0f723dd584388aa77  cutelyst-3.5.0.tar.gz
+sha256  ca0c629be86a1691ec413a3f9137a1aa62663d5ec30c5867cf4b283f18eb0bd7  COPYING
diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
index 5313b003ad..9b9e3d4d8a 100644
--- a/package/cutelyst/cutelyst.mk
+++ b/package/cutelyst/cutelyst.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-CUTELYST_VERSION = 2.11.0
+CUTELYST_VERSION = 3.5.0
 CUTELYST_SITE = https://github.com/cutelyst/cutelyst/archive/v$(CUTELYST_VERSION)
 CUTELYST_INSTALL_STAGING = YES
 CUTELYST_SUPPORTS_IN_SOURCE_BUILD = NO
-CUTELYST_LICENSE = LGPL-2.1+
+CUTELYST_LICENSE = BSD-3-Clause
 CUTELYST_LICENSE_FILES = COPYING
 CUTELYST_DEPENDENCIES = qt5base
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
