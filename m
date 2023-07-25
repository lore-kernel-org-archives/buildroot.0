Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264DBC001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 18:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 955AF61099;
	Tue, 25 Jul 2023 18:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 955AF61099
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pqCgp44CbXZa; Tue, 25 Jul 2023 18:50:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9FD7610AA;
	Tue, 25 Jul 2023 18:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9FD7610AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E0D91BF47E
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 18:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55EFF4182B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 18:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55EFF4182B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7EeMn5KCkM6 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 18:50:11 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39D05417A5
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 18:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39D05417A5
Received: from fli4l.lan.fli4l (p54a1bcc1.dip0.t-ipconnect.de [84.161.188.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54DD4A4C07EA
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 20:50:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57594)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qON6i-0005me-30
 for buildroot@buildroot.org; Tue, 25 Jul 2023 20:50:05 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 20:50:04 +0200
Message-Id: <20230725185004.3276758-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690311005;
 bh=4YCSd8whu1wjhfHCGu80wsI/Z7lrpcSUObzHrUmLfqY=;
 h=From:To:Subject:Date:From;
 b=TjaMJjX69m0N1Lgr42kUk/lUnsmZ2rfg+2b8UknUC653cQ8Nqt1J25J09vYXaVJJi
 wpztJ1eoNnGaCp/Rtf0Vggy1jx4bg2/0KWWgeYJRVg6CbAa0majRpQy/2KYNx9qXCm
 T50A/67dSoWCkwtamDcyUhDAuPgTUkqds4EmRhfU9gW4gpDxCyghPs/H0+hPfI3Pbo
 8TdXXcMNvnMgUYBo4OX5Sp/rvuTw4njUBAvAeIqSukGtJ0Yk7K7dbUENFmJGZ/cV3c
 4rD78yw/kupukvaH3gqPMVztUwUK1W4K90LZSsAzV1tepbueOgxxK+ullnmoIa9G16
 go/XAtWRNZbYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=TjaMJjX6
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: fix configure option
 for libatomic
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

Without this patch openssl adds -latomic twice to Libs.private in
libcrypto.pc:

cat output/per-package/opensc/host/arceb-buildroot-linux-uclibc/sysroot/usr/lib/pkgconfig/libcrypto.pc | grep atomic
Libs.private: -ldl -pthread -latomic -latomic

Instead of passing -latomic to Configure we use the target arch
"linux-latomic" which is provided by upstream since version 3.0.0
especially for libatomic handling:
https://github.com/openssl/openssl/commit/535130c39d33df41b6a7d14302a93ffaa10ebc46
https://github.com/openssl/openssl/commit/cdf2986a70d92668d882eb29737225f1aaafd0f1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Build-tested using this defconfig

BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBOPENSSL_BIN=y

                             arm-aarch64 [ 1/45]: OK
                   bootlin-aarch64-glibc [ 2/45]: OK
               bootlin-arcle-hs38-uclibc [ 3/45]: OK
                    bootlin-armv5-uclibc [ 4/45]: OK
                     bootlin-armv7-glibc [ 5/45]: OK
                   bootlin-armv7m-uclibc [ 6/45]: FAILED
                      bootlin-armv7-musl [ 7/45]: OK
                bootlin-m68k-5208-uclibc [ 8/45]: FAILED
               bootlin-m68k-68040-uclibc [ 9/45]: OK
             bootlin-microblazeel-uclibc [10/45]: OK
                bootlin-mipsel32r6-glibc [11/45]: OK
                   bootlin-mipsel-uclibc [12/45]: OK
                     bootlin-nios2-glibc [13/45]: OK
                 bootlin-openrisc-uclibc [14/45]: OK
        bootlin-powerpc64le-power8-glibc [15/45]: OK
           bootlin-powerpc-e500mc-uclibc [16/45]: OK
                   bootlin-riscv32-glibc [17/45]: OK
                   bootlin-riscv64-glibc [18/45]: OK
                    bootlin-riscv64-musl [19/45]: OK
                 bootlin-s390x-z13-glibc [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                   bootlin-sparc64-glibc [22/45]: OK
                    bootlin-sparc-uclibc [23/45]: OK
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: OK
                            br-arm-basic [28/45]: OK
                    br-arm-full-nothread [29/45]: OK
                      br-arm-full-static [30/45]: OK
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: OK
                           sourcery-mips [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 0 skipped, 2 build failed, 0 legal-info failed, 0 show-info failed

Reported the two unrelated build errors:
https://bugs.busybox.net/show_bug.cgi?id=15709

 package/libopenssl/Config.in     | 1 +
 package/libopenssl/libopenssl.mk | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 26c8f4c085..fdfa135f52 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -26,6 +26,7 @@ config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH
 	# linux-generic{32,64}, see
 	# https://github.com/openssl/openssl/issues/9839
 	default "linux-generic64 no-asm"	if BR2_ARCH_IS_64 && !BR2_MIPS_NABI32
+	default "linux-latomic no-asm"		if BR2_TOOLCHAIN_HAS_LIBATOMIC
 	default "linux-generic32 no-asm"
 
 config BR2_PACKAGE_LIBOPENSSL_BIN
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 06eac8f3d9..41626d20e1 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -73,7 +73,6 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(LIBOPENSSL_TARGET_ARCH) \
 			--prefix=/usr \
 			--openssldir=/etc/ssl \
-			$(if $(BR2_TOOLCHAIN_HAS_LIBATOMIC),-latomic) \
 			$(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
 			$(if $(BR2_STATIC_LIBS),no-shared,shared) \
 			$(if $(BR2_PACKAGE_CRYPTODEV_LINUX),enable-devcryptoeng) \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
