Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5277A107BCD7
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 18:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 097C2406CA;
	Fri, 13 Mar 2026 18:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LCmQ26pwu6Ew; Fri, 13 Mar 2026 18:32:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFE60406C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773426759;
	bh=/7WKAgBvX+qugCWqmuFz73yY7GklzjqhLNPOMlvDIPU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sc0JYu+N99sHHec5OETdHEGsnr2FV5Hh8jDt+SLNgFKdwh7wUBrXCjn+IHC3i8jpm
	 Aq38q+5VrcBMT8r1e4rYbWYI4ACoZhfs0r1eXK524H87e8XQ/gYKs6Vits2F8nEn8p
	 htKJgpN77vE/N703tvQoFec4udLT0STLXk6zqEv6sYyl0dI/FK0u9cxqaF68Zhrwkk
	 JBJ61k3+GRne31acgICG/WIER0A2WjaiFjkV7A8c8BnPAKe7K70ASTWGCUlBsCQi/t
	 Qwxbn+rDFMouFgf9BWUH5eV/BRfRGN+I9v3NDQup8Dx1X8mG6bjlnrMAjVU6ivvsme
	 8QYwCx5LUekrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFE60406C2;
	Fri, 13 Mar 2026 18:32:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 107611AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 18:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA537406BB
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 18:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgBK9cwrfkEt for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 18:32:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 772C94069B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 772C94069B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 772C94069B
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 18:32:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C61C1A4C0EA5;
 Fri, 13 Mar 2026 19:32:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54468)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w17JH-000000001Q4-0750;
 Fri, 13 Mar 2026 18:32:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Fri, 13 Mar 2026 19:32:30 +0100
Message-ID: <20260313183230.211435-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773426751;
 bh=nw9xmtvC6PLrnyIyYfKDXCjNsLjgpNuJ6E4AmtGFRjc=;
 h=From:To:Cc:Subject:Date:From;
 b=lrtsiaHiQ6JyJJ+BT86tUmLWasLR2JuXq2Wp6GdTiZumer1u543I+cAfPXmWs18IM
 qXogcSHJY3PLVQmNqnktTXwtzh5LzcWS9tHLEqWoLXrJL4b8dVONhYhJeuY4HbkxdK
 cV7XQQDGSXD71+nIVe5x3ZTzfpyE0gZowgU7GyPdgI2yy+sqQF6flHGbcAnbWckKFU
 CkXU3ST5/2agoWxEN4w+vKIARpF2kFxfzdnuVehkVki1lmqJSMB6bvCT2O0IBKMICY
 jFm29cNLTRklqsaC51RftnXDtOAGXXGJus5rFmWUYTl0oiWoOCzdZN6dWbS2AWvhRQ
 nDKWPjM4BNdMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=lrtsiaHi
Subject: [Buildroot] [PATCH 1/1] package/lensfun: bump version
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

Last release dates back to Jul 2023 with >3000 commits since then:
https://github.com/lensfun/lensfun/issues/2634

Removed patch which is included in this version.

Renamed CMake option PYTHON to INSTALL_PYTHON_MODULE:
Upstream renamed PYTHON to PYTHONINTERP_FOUND with commit
https://github.com/lensfun/lensfun/commit/824b9d36c13f97b415a94d271e35c815ea576b21
and later guarded the python code with a new CMake option
INSTALL_PYTHON_MODULE which we now use.

Build-tested using this defconfig:

BR2_PACKAGE_LENSFUN=y
BR2_PACKAGE_LENSFUN_TOOLS=y

                             arm-aarch64 [ 1/32]: OK
                   bootlin-aarch64-glibc [ 2/32]: OK
               bootlin-aarch64-glibc-old [ 3/32]: OK
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                   bootlin-armv7m-uclibc [ 7/32]: SKIPPED
                      bootlin-armv7-musl [ 8/32]: OK
                bootlin-m68k-5208-uclibc [ 9/32]: SKIPPED
               bootlin-m68k-68040-uclibc [10/32]: OK
             bootlin-microblazeel-uclibc [11/32]: OK
                  bootlin-mips64el-glibc [12/32]: OK
                bootlin-mipsel32r6-glibc [13/32]: OK
                   bootlin-mipsel-uclibc [14/32]: OK
                 bootlin-openrisc-uclibc [15/32]: OK
        bootlin-powerpc64le-power8-glibc [16/32]: OK
           bootlin-powerpc-e500mc-uclibc [17/32]: OK
                   bootlin-riscv32-glibc [18/32]: OK
                   bootlin-riscv64-glibc [19/32]: OK
                    bootlin-riscv64-musl [20/32]: OK
                 bootlin-s390x-z13-glibc [21/32]: OK
                      bootlin-sh4-uclibc [22/32]: OK
                   bootlin-sparc64-glibc [23/32]: OK
                    bootlin-sparc-uclibc [24/32]: OK
                    bootlin-x86-64-glibc [25/32]: OK
                     bootlin-x86-64-musl [26/32]: OK
                   bootlin-x86-64-uclibc [27/32]: OK
                   bootlin-x86-i686-musl [28/32]: OK
                   bootlin-xtensa-uclibc [29/32]: OK
                            br-arm-basic [30/32]: SKIPPED
                    br-arm-full-nothread [31/32]: SKIPPED
                      br-arm-full-static [32/32]: OK

32 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lensfun/0001-cmake4.patch | 29 -----------------------------
 package/lensfun/lensfun.hash      |  2 +-
 package/lensfun/lensfun.mk        |  8 +++++---
 3 files changed, 6 insertions(+), 33 deletions(-)
 delete mode 100644 package/lensfun/0001-cmake4.patch

diff --git a/package/lensfun/0001-cmake4.patch b/package/lensfun/0001-cmake4.patch
deleted file mode 100644
index d7973f4cb7..0000000000
--- a/package/lensfun/0001-cmake4.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 011de2e85813ff496a85404b30891352555de077 Mon Sep 17 00:00:00 2001
-From: Jonas <git@jonas-ott.de>
-Date: Fri, 17 Feb 2023 18:26:01 +0100
-Subject: [PATCH] cmake: use FindPython3 (#1983)
-
-@jonas-ott Thank you for contributing!
-
-Upstream: https://github.com/lensfun/lensfun/commit/011de2e85813ff496a85404b30891352555de077
-
-[Bernd: partial backport to version 0.3.4]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt       |  4 ++--
- apps/CMakeLists.txt  | 55 +++++++++++++++++++++-----------------------
- tests/CMakeLists.txt |  4 ++--
- 3 files changed, 30 insertions(+), 33 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5ccb9976d..7bb7a6878 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,5 @@
--# require at least cmake 2.8.12
--CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12 FATAL_ERROR )
-+# require at least cmake 3.12
-+CMAKE_MINIMUM_REQUIRED(VERSION 3.12 FATAL_ERROR)
- 
- # path for helper modules
- set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH}" "${CMAKE_SOURCE_DIR}/cmake/modules")
diff --git a/package/lensfun/lensfun.hash b/package/lensfun/lensfun.hash
index 5cb4fe37cd..f73ea46e17 100644
--- a/package/lensfun/lensfun.hash
+++ b/package/lensfun/lensfun.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  dafb39c08ef24a0e2abd00d05d7341b1bf1f0c38bfcd5a4c69cf5f0ecb6db112  lensfun-0.3.4.tar.gz
+sha256  656fb82a0501616b4024854fc716f004cf07d28443ee09fcf436afb6722da561  lensfun-268821c02495c0ffff8332417f0d59bdbefa545d.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  docs/gpl-3.0.txt
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  docs/lgpl-3.0.txt
diff --git a/package/lensfun/lensfun.mk b/package/lensfun/lensfun.mk
index 59f008ce6d..d9b4faa8d5 100644
--- a/package/lensfun/lensfun.mk
+++ b/package/lensfun/lensfun.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LENSFUN_VERSION = 0.3.4
-LENSFUN_SITE = $(call github,lensfun,lensfun,v$(LENSFUN_VERSION))
+LENSFUN_VERSION = 268821c02495c0ffff8332417f0d59bdbefa545d
+LENSFUN_SITE = $(call github,lensfun,lensfun,$(LENSFUN_VERSION))
 LENSFUN_LICENSE = LGPL-3.0+ (libraries), GPL-3.0+ (programs)
 LENSFUN_LICENSE_FILES = docs/gpl-3.0.txt docs/lgpl-3.0.txt
 LENSFUN_INSTALL_STAGING = YES
@@ -42,6 +42,8 @@ endif
 
 # Don't install helper scripts (which require python3 and gksudo).
 # Don't run setup.py on the host.
-LENSFUN_CONF_OPTS += -DINSTALL_HELPER_SCRIPTS=OFF -DPYTHON=OFF
+LENSFUN_CONF_OPTS += \
+	-DINSTALL_HELPER_SCRIPTS=OFF \
+	-DINSTALL_PYTHON_MODULE=OFF
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
