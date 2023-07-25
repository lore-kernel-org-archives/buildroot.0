Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70E7C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 20:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A0FA60B9E;
	Tue, 25 Jul 2023 20:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A0FA60B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dBUgjRn_A5Tu; Tue, 25 Jul 2023 20:48:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C22A60743;
	Tue, 25 Jul 2023 20:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C22A60743
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B9D71BF4E5
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D284260743
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D284260743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YIUJxYORTRGu for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 20:48:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02AE2600C6
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 20:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02AE2600C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4B0182C08; Tue, 25 Jul 2023 20:48:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 22:46:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79ee81e034a2f2dd619c2109d9329216e556cc96
X-Git-Newrev: b7644af3c04b3229465d0a8b72d24737dca7384c
X-Patchwork-Hint: ignore
Message-Id: <20230725204845.E4B0182C08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: update configure
 option for libatomic
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b7644af3c04b3229465d0a8b72d24737dca7384c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this patch openssl adds -latomic twice to Libs.private in
libcrypto.pc:

cat output/per-package/opensc/host/arceb-buildroot-linux-uclibc/sysroot/usr/lib/pkgconfig/libcrypto.pc | grep atomic
Libs.private: -ldl -pthread -latomic -latomic

Instead of passing -latomic to Configure we use the target arch
"linux-latomic" which is provided by upstream since version 3.0.0
especially for libatomic handling:
https://github.com/openssl/openssl/commit/535130c39d33df41b6a7d14302a93ffaa10ebc46
https://github.com/openssl/openssl/commit/cdf2986a70d92668d882eb29737225f1aaafd0f1

To be noted: the build still fails for both bootlin-armv7m-uclibc and
bootlin-m68k-5208-uclibc, but this is not a regression due to this
patch, and is tracked as #15709.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
