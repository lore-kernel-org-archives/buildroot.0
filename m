Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723FCC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:18:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9047660BD3
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9047660BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AE086069F;
	Sun,  8 Aug 2021 20:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXqxNnjgJmd5; Sun,  8 Aug 2021 20:18:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8400C605CE;
	Sun,  8 Aug 2021 20:18:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 604091BF422
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5096D82BC4
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:18:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HdeWMiXRZ8Z0 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 20:18:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7549582BBA
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 20:18:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1835B8659C; Sun,  8 Aug 2021 20:18:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 22:18:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e16ecfa990006308e638685fbea3800706c0f84
X-Git-Newrev: 3e524755a943e1d22b404c256deeb137fd895100
X-Patchwork-Hint: ignore
Message-Id: <20210808201802.1835B8659C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: fix build on ARM big endian
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=3e524755a943e1d22b404c256deeb137fd895100
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the follownig build failure on ARM big endian raised since bump to
version 3.68 in commit 0a73b9b962421ce7a72c88e5f5bbd8849f21b041:

Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Compress_Native':
sha256-armv8.c:(.text.SHA256_Compress_Native+0x0): multiple definition of `SHA256_Compress_Native'
Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Compress_Native+0x0): first defined here
Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Update_Native':
sha256-armv8.c:(.text.SHA256_Update_Native+0x0): multiple definition of `SHA256_Update_Native'
Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Update_Native+0x0): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/237aba0c16a34fec1b0fe50fe08cace438eda1bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...sha512.c-fix-SHA256-redefinition-on-ARM-b.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch b/package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch
new file mode 100644
index 0000000000..f925f20051
--- /dev/null
+++ b/package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch
@@ -0,0 +1,47 @@
+From 434d79c52db5b680accc531572319bd7094fa470 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 7 Aug 2021 23:19:01 +0200
+Subject: [PATCH] lib/freebl/sha512.c: fix SHA256 redefinition on ARM big
+ endian
+
+For an unknown reason, SHA256_{Compress,Update}_Native are defined in
+lib/freebl/sha512.c if IS_LITTLE_ENDIAN is undefined since version 3.68
+and
+https://github.com/nss-dev/nss/commit/e1e00f21f2d73e0d5d27651ad5606efa5714abe4
+
+This raises the following build failure on ARM big endian:
+
+Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Compress_Native':
+sha256-armv8.c:(.text.SHA256_Compress_Native+0x0): multiple definition of `SHA256_Compress_Native'
+Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Compress_Native+0x0): first defined here
+Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Update_Native':
+sha256-armv8.c:(.text.SHA256_Update_Native+0x0): multiple definition of `SHA256_Update_Native'
+Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Update_Native+0x0): first defined here
+
+Revert this change as it seems completely unrelated to the commit title
+"Bug 1655493 - Support SHA2 HW acceleration using Intel SHA Extension"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/237aba0c16a34fec1b0fe50fe08cace438eda1bf
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ nss/lib/freebl/sha512.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/lib/freebl/sha512.c b/nss/lib/freebl/sha512.c
+index 946ab9f7f..3ec414b52 100644
+--- a/nss/lib/freebl/sha512.c
++++ b/nss/lib/freebl/sha512.c
+@@ -164,7 +164,7 @@ static void SHA256_Compress_Generic(SHA256Context *ctx);
+ static void SHA256_Update_Generic(SHA256Context *ctx, const unsigned char *input,
+                                   unsigned int inputLen);
+ 
+-#if !defined(USE_HW_SHA2) || !defined(IS_LITTLE_ENDIAN)
++#if !defined(USE_HW_SHA2)
+ void
+ SHA256_Compress_Native(SHA256Context *ctx)
+ {
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
