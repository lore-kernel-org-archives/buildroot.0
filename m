Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9205DD68BC1
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 22:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56E016111F;
	Wed, 17 Dec 2025 22:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrA-amtY4EL8; Wed, 17 Dec 2025 22:05:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEEB860BA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766009133;
	bh=KX/Zp3EaWmeK0UcHaAQcYflNCUioUu6Uz1lfSxaJYgA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MOi2pffhv8ZLY5TUH109mtsdOfgdB6k5CbkEw9XOANujYFZfPOlG4l6VBB21vuxM+
	 xV9kx4sA2EhkuSiexDgPL2qgCy5W4KrHv9bQTDzYlhZwqYhI2Wl/wA/IAqhyUjsnyf
	 PtEsEAWvUWOY1Irk6YnXPglTxqJBNRXYkb1D4AnQifJDqVMYADE8exVXaMsvdaDH5L
	 ixKFYktBBhrpbQvdUHV+OzV+YA/PGfCrPm69guCQmzZ1OtzLjaorNmQQAJIba8y/VL
	 jxloNZBO1bpooubH23CihY+q3ZfqH6Z7Vv2i8ezGbKJiTPQjRAwcB8rD71et47rLh+
	 ev2CwYl5DGxzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEEB860BA7;
	Wed, 17 Dec 2025 22:05:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18AA8375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1575B83C93
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbodQS8byH62 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 22:05:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 39B7C83C92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39B7C83C92
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39B7C83C92
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:05:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C64B3A4C43A3;
 Wed, 17 Dec 2025 23:05:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42376)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVzeA-000000000hE-0Sz6;
 Wed, 17 Dec 2025 22:05:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Wed, 17 Dec 2025 23:05:24 +0100
Message-ID: <20251217220525.3815471-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766009126;
 bh=LxBE6j9FjT6QScNdQRlWuV8esZvUh+QMw0suCfOIsXU=;
 h=From:To:Cc:Subject:Date:From;
 b=JtBURqzhF5mr7ucmVD9E/A4kpJ58Uer500+QYobEbCbyIDxrh8yRPLySsT2bezO0w
 hkXWOzUe+/4eqYqfgXmAVQz+B8QF+ylLWRn1mISDswM2MVqtOQyS1DLGsPPYatQfRi
 MMj0hsTxHXT91QLCy/ShYNWQf+kgibLb4WBl6eFpWgVzAOnH2xeQyhVabLdwFh10x+
 mnKIQ1ezd1Jf+rT8XtEUYSunaRqX89522+ZXJO77EuNW4dTibuClQ34+KbdgHgrUdC
 rl8oRe3V1Q3JQ2kKqPkyDH5K1PDDBfPvN9aS78uvqyK3okFbtF0thIJAbT0Hv1ZlTi
 74Vhsr07ruOiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=JtBURqzh
Subject: [Buildroot] [PATCH v3 1/2] package/libid3tag: bump version to 0.16.3
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

Switched to maintained fork also used by Debian:
https://codeberg.org/tenacityteam/libid3tag/commit/7dce7b492406becd08c2691bf949e086b127fb58
https://tracker.debian.org/news/1573712/accepted-libid3tag-0163-1-source-into-unstable/

Removed Debian patchset which is included in this release and contains
fixes for CVEs mentioned in LIBID3TAG_IGNORE_CVES:

- 10_utf16.dpatch
  https://codeberg.org/tenacityteam/libid3tag/commit/2a0f4df1544e3e124622e2e87a117395d40a1d57

- 11_unknown_encoding.patch
  https://codeberg.org/tenacityteam/libid3tag/commit/68777efc16d05aa5bb25fa50ff796c2e23e42054

Switched build system to CMake:
https://codeberg.org/tenacityteam/libid3tag/commit/cb746b9f216d3016825715df473bfa8807e007f5
due to autoconf removal:
https://codeberg.org/tenacityteam/libid3tag/commit/2ceebdf3b82f149125b679b0002348426f51dc43
and added upstream commit to fix build with CMake 4.x.

Removed id3tag.pc which is now provided by the build system.

Also removed the host-gperf dependency which was needed by autoreconf,
see buildroot commit 7ecd0e4edf9f42795ef70097a8f205b2aaa67a6d for
details.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Andreas Ziegler <br025@umbiko.net>
Tested-by : Andreas Ziegler <br025@umbiko.net>
---
v2: added upstream commit to fix build with CMake 4.x
v3: removed id3tag.pc (Andreas Ziegler)

 .../0001-Allow-build-with-CMake-4.0.0.patch   | 26 +++++++++++++++++
 package/libid3tag/Config.in                   |  2 +-
 package/libid3tag/id3tag.pc                   | 12 --------
 package/libid3tag/libid3tag.hash              |  7 ++---
 package/libid3tag/libid3tag.mk                | 29 ++++---------------
 5 files changed, 34 insertions(+), 42 deletions(-)
 create mode 100644 package/libid3tag/0001-Allow-build-with-CMake-4.0.0.patch
 delete mode 100644 package/libid3tag/id3tag.pc

diff --git a/package/libid3tag/0001-Allow-build-with-CMake-4.0.0.patch b/package/libid3tag/0001-Allow-build-with-CMake-4.0.0.patch
new file mode 100644
index 0000000000..cd14130252
--- /dev/null
+++ b/package/libid3tag/0001-Allow-build-with-CMake-4.0.0.patch
@@ -0,0 +1,26 @@
+From eee94b22508a066f7b9bc1ae05d2d85982e73959 Mon Sep 17 00:00:00 2001
+From: heitbaum <heitbaum@noreply.codeberg.org>
+Date: Thu, 1 May 2025 05:34:30 +0000
+Subject: [PATCH] Allow build with CMake 4.0.0
+
+CMake 4.0.0 deprecates CMake syntax < 3.10. Update to using a minimum of 3.10.
+
+ref: https://cmake.org/cmake/help/latest/command/cmake_minimum_required.html
+
+Upstream: https://codeberg.org/tenacityteam/libid3tag/commit/eee94b22508a066f7b9bc1ae05d2d85982e73959
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d181300..083b5f1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1.0)
++cmake_minimum_required(VERSION 3.10)
+ project(id3tag VERSION 0.16.3)
+ 
+ option(BUILD_SHARED_LIBS "Build dynamic library" ON)
diff --git a/package/libid3tag/Config.in b/package/libid3tag/Config.in
index 869b9f7f6c..b07ac891e1 100644
--- a/package/libid3tag/Config.in
+++ b/package/libid3tag/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBID3TAG
 	help
 	  ID3 tag reading library from the MAD project.
 
-	  http://www.underbit.com/products/mad/
+	  https://codeberg.org/tenacityteam/libid3tag
diff --git a/package/libid3tag/id3tag.pc b/package/libid3tag/id3tag.pc
deleted file mode 100644
index 63d09eee8b..0000000000
--- a/package/libid3tag/id3tag.pc
+++ /dev/null
@@ -1,12 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${exec_prefix}/lib
-includedir=${prefix}/include
-
-Name: id3tag
-Description: ID3 tag reading library
-Version: 0.15.1b
-Requires:
-Libs: -L${libdir} -lid3tag
-Libs.private: -lz
-Cflags: -I${includedir}
diff --git a/package/libid3tag/libid3tag.hash b/package/libid3tag/libid3tag.hash
index 9aa1d00270..5b800f3e73 100644
--- a/package/libid3tag/libid3tag.hash
+++ b/package/libid3tag/libid3tag.hash
@@ -1,7 +1,4 @@
-# From http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libi/libid3tag/libid3tag_0.15.1b-14.dsc
-sha256  63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151  libid3tag_0.15.1b.orig.tar.gz
-sha256  f174cafe02bef25a9ad8cb7f9ce80119147297a7036f50878e85ac0d7ae09c62  libid3tag_0.15.1b-14.debian.tar.xz
-
-# Hash for license files:
+# Locally computed
+sha256  0561009778513a95d91dac33cee8418d6622f710450a7cb56a74636d53b588cb  0.16.3.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  7f12ad28dc075763e91b91bfa60fad04062380011ddad8f6bac21dd7b1f44367  COPYRIGHT
diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index 5d7b219bb1..6cee42eeb9 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -4,31 +4,12 @@
 #
 ################################################################################
 
-LIBID3TAG_VERSION = 0.15.1b
-LIBID3TAG_PATCH = libid3tag_$(LIBID3TAG_VERSION)-14.debian.tar.xz
-LIBID3TAG_SOURCE = libid3tag_$(LIBID3TAG_VERSION).orig.tar.gz
-LIBID3TAG_SITE = \
-	http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libi/libid3tag
+LIBID3TAG_VERSION = 0.16.3
+LIBID3TAG_SOURCE = $(LIBID3TAG_VERSION).tar.gz
+LIBID3TAG_SITE = https://codeberg.org/tenacityteam/libid3tag/archive
 LIBID3TAG_LICENSE = GPL-2.0+
 LIBID3TAG_LICENSE_FILES = COPYING COPYRIGHT
 LIBID3TAG_INSTALL_STAGING = YES
-LIBID3TAG_DEPENDENCIES = host-gperf zlib
+LIBID3TAG_DEPENDENCIES = zlib
 
-# debian/patches/10_utf16.dpatch
-LIBID3TAG_IGNORE_CVES += CVE-2004-2779 CVE-2017-11551
-
-# debian/patches/11_unknown_encoding.dpatch
-LIBID3TAG_IGNORE_CVES += CVE-2017-11550
-
-# Force autoreconf to be able to use a more recent libtool script, that
-# is able to properly behave in the face of a missing C++ compiler.
-LIBID3TAG_AUTORECONF = YES
-
-define LIBID3TAG_INSTALL_STAGING_PC
-	$(INSTALL) -D package/libid3tag/id3tag.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/id3tag.pc
-endef
-
-LIBID3TAG_POST_INSTALL_STAGING_HOOKS += LIBID3TAG_INSTALL_STAGING_PC
-
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
