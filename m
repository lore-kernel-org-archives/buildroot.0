Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A88C4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 21:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B624612E6;
	Thu, 11 Apr 2024 21:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEsz_G5HOK71; Thu, 11 Apr 2024 21:00:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A24561310
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A24561310;
	Thu, 11 Apr 2024 21:00:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EFE31BF330
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AC4782274
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0wsWqTaOkOj for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 21:00:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8916C82269
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8916C82269
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8916C82269
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 21:00:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1baba.dip0.t-ipconnect.de [84.161.186.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B5609A4C3146
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 23:00:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60624)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rv1XI-0000000018g-3h9s
 for buildroot@buildroot.org; Thu, 11 Apr 2024 21:00:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 23:00:45 +0200
Message-Id: <20240411210045.2127843-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712869245;
 bh=Z7SRsZS5kIXLa7YQXuz9PJyTkmulxKNUFGTEVg1Yrig=;
 h=From:To:Subject:Date:From;
 b=LkWP2WrNIouwdeN+QOuhx/IYY8INxAkR4cqSzORW2I3oR0pERI7E9T+s5y9CB0qh5
 Juh9VX2arV8fQ+2lkNFLsv5NOi2Un8xaXrJ0dyMyYCCzjFSeqknl9MQERRqA0UDnS+
 sxIepnqQAjdckXIS2DCZnrL1Glhw6xMg3kx7wSqCewMluWgEBgfQPexLazD9w5TNlj
 Gl03IzX6WP86zWlFUe8+5Ogl8G+on3slIq3UPp7CN6MUSWW/mh4zhnJWSWMyH8bOkm
 9WyzLoWDHIYZ0gY/4R7P20dtwcquIF1SzqVM5Zrxvp580H+rcQAw5Q8TVoNDJR2RL7
 QF7Q854Ap1ung==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=LkWP2WrN
Subject: [Buildroot] [PATCH] package/libdeflate: bump version to 1.20
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
ttps://github.com/ebiggers/libdeflate/blob/master/NEWS.md

Build-tested using this defconfig

BR2_PACKAGE_LIBDEFLATE=y

                             arm-aarch64 [ 1/42]: OK
                   bootlin-aarch64-glibc [ 2/42]: OK
               bootlin-arcle-hs38-uclibc [ 3/42]: OK
                    bootlin-armv5-uclibc [ 4/42]: OK
                     bootlin-armv7-glibc [ 5/42]: OK
                   bootlin-armv7m-uclibc [ 6/42]: OK
                      bootlin-armv7-musl [ 7/42]: OK
                bootlin-m68k-5208-uclibc [ 8/42]: OK
               bootlin-m68k-68040-uclibc [ 9/42]: OK
             bootlin-microblazeel-uclibc [10/42]: OK
                bootlin-mipsel32r6-glibc [11/42]: OK
                   bootlin-mipsel-uclibc [12/42]: OK
                     bootlin-nios2-glibc [13/42]: OK
                 bootlin-openrisc-uclibc [14/42]: OK
        bootlin-powerpc64le-power8-glibc [15/42]: OK
           bootlin-powerpc-e500mc-uclibc [16/42]: OK
                   bootlin-riscv32-glibc [17/42]: OK
                   bootlin-riscv64-glibc [18/42]: OK
                    bootlin-riscv64-musl [19/42]: OK
                 bootlin-s390x-z13-glibc [20/42]: OK
                      bootlin-sh4-uclibc [21/42]: OK
                   bootlin-sparc64-glibc [22/42]: OK
                    bootlin-sparc-uclibc [23/42]: OK
                    bootlin-x86-64-glibc [24/42]: OK
                     bootlin-x86-64-musl [25/42]: OK
                   bootlin-x86-64-uclibc [26/42]: OK
                   bootlin-xtensa-uclibc [27/42]: OK
                            br-arm-basic [28/42]: OK
                    br-arm-full-nothread [29/42]: OK
                      br-arm-full-static [30/42]: OK
                   br-i386-pentium4-full [31/42]: OK
                br-i386-pentium-mmx-musl [32/42]: OK
                      br-mips64-n64-full [33/42]: OK
                 br-mips64r6-el-hf-glibc [34/42]: OK
               br-powerpc-603e-basic-cpp [35/42]: OK
               br-powerpc64-power7-glibc [36/42]: OK
                       linaro-aarch64-be [37/42]: OK
                          linaro-aarch64 [38/42]: OK
                              linaro-arm [39/42]: OK
                         sourcery-mips64 [40/42]: OK
                           sourcery-mips [41/42]: OK
                          sourcery-nios2 [42/42]: OK
42 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdeflate/libdeflate.hash | 2 +-
 package/libdeflate/libdeflate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libdeflate/libdeflate.hash b/package/libdeflate/libdeflate.hash
index 8609f5ab02..46afa96635 100644
--- a/package/libdeflate/libdeflate.hash
+++ b/package/libdeflate/libdeflate.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  27bf62d71cd64728ff43a9feb92f2ac2f2bf748986d856133cc1e51992428c25  libdeflate-1.19.tar.gz
+sha256  ed1454166ced78913ff3809870a4005b7170a6fd30767dc478a09b96847b9c2a  libdeflate-1.20.tar.gz
 sha256  5d246dd2537307b80fed9ba5fdddf5d0fe7a8f023393a071182b9daed56b40fe  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 3000a58407..4597dc5a8c 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDEFLATE_VERSION = 1.19
+LIBDEFLATE_VERSION = 1.20
 LIBDEFLATE_SITE = $(call github,ebiggers,libdeflate,v$(LIBDEFLATE_VERSION))
 LIBDEFLATE_LICENSE = MIT
 LIBDEFLATE_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
