Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30BAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56B0E405AE;
	Sun, 12 Dec 2021 14:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6pdvsXKJZCnB; Sun, 12 Dec 2021 14:22:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42D3C40531;
	Sun, 12 Dec 2021 14:22:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85CAB1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02EC160A94
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWX7O_HrCHTV for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:20:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FB3A60A9B
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:20:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4C3C582DFB; Sun, 12 Dec 2021 14:15:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 14:26:30 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 61758f3ed357ccd734520db2976f8e7777e15905
X-Git-Newrev: 1005fcfc597a41ad00a90b9a649b8e1365f4a6b8
X-Patchwork-Hint: ignore
Message-Id: <20211212141522.4C3C582DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libnss: fix build
 on ARM big endian
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

commit: https://git.buildroot.net/buildroot/commit/?id=1005fcfc597a41ad00a90b9a649b8e1365f4a6b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit 3e524755a943e1d22b404c256deeb137fd895100)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
