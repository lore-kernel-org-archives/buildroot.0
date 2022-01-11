Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1566C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 772B383E6B;
	Tue, 11 Jan 2022 21:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6UCmyDgGvh2z; Tue, 11 Jan 2022 21:03:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3E3B83E68;
	Tue, 11 Jan 2022 21:03:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 586191BF989
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 466474016A
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8qfUZ_81cIu3 for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 21:03:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 790F2408FE
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 21:03:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AD1DE82DEC; Tue, 11 Jan 2022 20:56:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 22:03:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcbd1ed224ac61cc7be8db0f5eb5f26da4e2ddc1
X-Git-Newrev: 54bd9691c876ff12780a3d6e7f8de900d8cbd14e
X-Patchwork-Hint: ignore
Message-Id: <20220111205658.AD1DE82DEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: disable LTO unconditionally
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

commit: https://git.buildroot.net/buildroot/commit/?id=54bd9691c876ff12780a3d6e7f8de900d8cbd14e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recent commit b7a00b39bca0 (package/glibc: force -fno-lto) only catered
for glibc, but all C libraries, like uClibc-NG, are impacted, for very
similar reasons.

Disable LTO unconditionally for uClibc-NG too.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/uclibc.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 87e283de2a..0feedb6cfa 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -362,10 +362,18 @@ endif
 # Commands
 #
 
+UCLIBC_EXTRA_CFLAGS = $(TARGET_ABI)
+
+# uClibc-ng does not build with LTO, so explicitly disable it
+# when using a compiler that may have support for LTO
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
+UCLIBC_EXTRA_CFLAGS += -fno-lto
+endif
+
 UCLIBC_MAKE_FLAGS = \
 	ARCH="$(UCLIBC_TARGET_ARCH)" \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
+	UCLIBC_EXTRA_CFLAGS="$(UCLIBC_EXTRA_CFLAGS)" \
 	HOSTCC="$(HOSTCC)"
 
 define UCLIBC_KCONFIG_FIXUP_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
