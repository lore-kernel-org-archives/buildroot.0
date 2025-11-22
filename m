Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EE1CFD2EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 21:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 534AE40B04;
	Sat, 22 Nov 2025 21:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6Mamzre-FT9; Sat, 22 Nov 2025 21:12:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E4E240B08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E4E240B08;
	Sat, 22 Nov 2025 21:12:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F41F6350
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 21:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAEFF4005A
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 21:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0deRf_BtcZ2 for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 21:12:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1670B4004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1670B4004D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1670B4004D
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 21:12:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 32945A4C7565
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:12:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46008)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMuu7-000000008Bh-2baW
 for buildroot@buildroot.org; Sat, 22 Nov 2025 21:12:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 22:12:23 +0100
Message-ID: <20251122211223.1401842-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763845944;
 bh=M9G9JqKeyQQkV0lzM3ERdqKUR1/pIdvczmWh/W19xjw=;
 h=From:To:Subject:Date:From;
 b=h4OY0fY41m58RdGPsGpoFXySEtHhWfzZwja6innYo4iIbo/lgIIcblIArh7XTy1V+
 +F9OnYhJrvg4PpbqX7QzASG871Zd68/LI5Ez0ukCnhwObKT0J+XZ9c7tA6JQi33rxV
 pmcpPXSY368Tk2MRPj2z+vRIykJMbYRyXsOHy4xpjLKKf1cTFwyGIjA58DuRHk3aEA
 cBCIkTkrr0rZ5yExec0ftcyah3AQ8ihamr6pmvaj4oiZA4lFGftIEG4wDca7QFsG5J
 z4nygK0twKxjVTFhEtwfrhi7fjzRjREliUGME0SxyqXr/XP0uVFdd4HbAs+1UHSFex
 e4bVyLwR+erig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=h4OY0fY4
Subject: [Buildroot] [PATCH/next 1/1] package/libmbus: bump version to 0.9.0
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

Release notes:
https://github.com/rscada/libmbus/blob/master/release_notes.txt

Downloading the source tarball is broken since at least Oct 30th, 2024
as reported by the buildroot autobuilders:
https://autobuild.buildroot.net/?reason=libmbus-0.8.0&step=50&start=50

Switching to the github helper provides the correct source code but the
tarball downloaded has a different hash. A quick search did not provide
alternative download locations for the original tarball
libmbus-0.8.0.tar.gz.

To solve the broken build we do not only switch _SITE to github but also
bump the package to 0.9.0 and add autoreconf which needs two directories
being created in _POST_PATCH_HOOKS. One missing directory was already
reported upstream: https://github.com/rscada/libmbus/issues/179

Updated license hash due to upstream commit:
https://github.com/rscada/libmbus/commit/ab8919136d3cabb943b1cbdd4d6e2f7eea4b8f3f

Fixes:
https://autobuild.buildroot.net/results/91a/91a82dc73bf87cf1969cd6a2ddea1809ab9a1613/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Sent for -next because 296 commits were committed between 0.8.0 and
0.9.0: https://github.com/rscada/libmbus/compare/0.8.0...0.9.0

Build-tested using this defconfig:
BR2_PACKAGE_LIBMBUS=y

                             arm-aarch64 [ 1/35]: OK
                   bootlin-aarch64-glibc [ 2/35]: OK
               bootlin-arcle-hs38-uclibc [ 3/35]: OK
                    bootlin-armv5-uclibc [ 4/35]: OK
                     bootlin-armv7-glibc [ 5/35]: OK
                   bootlin-armv7m-uclibc [ 6/35]: OK
                      bootlin-armv7-musl [ 7/35]: OK
                bootlin-m68k-5208-uclibc [ 8/35]: OK
               bootlin-m68k-68040-uclibc [ 9/35]: OK
             bootlin-microblazeel-uclibc [10/35]: OK
                bootlin-mipsel32r6-glibc [11/35]: OK
                   bootlin-mipsel-uclibc [12/35]: OK
                 bootlin-openrisc-uclibc [13/35]: OK
        bootlin-powerpc64le-power8-glibc [14/35]: OK
           bootlin-powerpc-e500mc-uclibc [15/35]: OK
                   bootlin-riscv32-glibc [16/35]: OK
                   bootlin-riscv64-glibc [17/35]: OK
                    bootlin-riscv64-musl [18/35]: OK
                 bootlin-s390x-z13-glibc [19/35]: OK
                      bootlin-sh4-uclibc [20/35]: OK
                   bootlin-sparc64-glibc [21/35]: OK
                    bootlin-sparc-uclibc [22/35]: OK
                    bootlin-x86-64-glibc [23/35]: OK
                     bootlin-x86-64-musl [24/35]: OK
                   bootlin-x86-64-uclibc [25/35]: OK
                   bootlin-x86-i686-musl [26/35]: OK
                   bootlin-xtensa-uclibc [27/35]: OK
                            br-arm-basic [28/35]: OK
                    br-arm-full-nothread [29/35]: OK
                      br-arm-full-static [30/35]: OK
                   br-i386-pentium4-full [31/35]: OK
                      br-mips64-n64-full [32/35]: OK
                 br-mips64r6-el-hf-glibc [33/35]: OK
               br-powerpc-603e-basic-cpp [34/35]: OK
               br-powerpc64-power7-glibc [35/35]: OK

35 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 package/libmbus/libmbus.hash |  4 ++--
 package/libmbus/libmbus.mk   | 12 ++++++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/libmbus/libmbus.hash b/package/libmbus/libmbus.hash
index 493bab5820..212ae9ddef 100644
--- a/package/libmbus/libmbus.hash
+++ b/package/libmbus/libmbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9fca42592da0ba75df66c6f885a4dbfa916d23e65e3d1ce6e38d940d2a2719a4  libmbus-0.8.0.tar.gz
-sha256  ea171a4ae443eca7186f564db2c3cc8b84c1ac343f227f92cd52ec6a948f4a74  COPYING
+sha256  89fadb9074f5f719b2988cf30af1f8ced3e40f9f499b5b9047f8f33f876cce2d  libmbus-0.9.0.tar.gz
+sha256  034b36d855501ea9c5588f4753335d08757149a02faf1d61baa9a6d861be4e3a  COPYING
diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
index 61f797b5b9..65287b083d 100644
--- a/package/libmbus/libmbus.mk
+++ b/package/libmbus/libmbus.mk
@@ -4,10 +4,18 @@
 #
 ################################################################################
 
-LIBMBUS_VERSION = 0.8.0
-LIBMBUS_SITE = http://www.rscada.se/public-dist
+LIBMBUS_VERSION = 0.9.0
+LIBMBUS_SITE = $(call github,rscada,libmbus,$(LIBMBUS_VERSION))
 LIBMBUS_INSTALL_STAGING = YES
 LIBMBUS_LICENSE = BSD-3-Clause
 LIBMBUS_LICENSE_FILES = COPYING
+# github tarball does not include configure
+LIBMBUS_AUTORECONF = YES
+# Autoreconf is missing some directories
+define LIBMBUS_CREATE_DIRS
+	mkdir -p $(@D)/libltdl
+	mkdir -p $(@D)/m4
+endef
+LIBMBUS_POST_PATCH_HOOKS += LIBMBUS_CREATE_DIRS
 
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
