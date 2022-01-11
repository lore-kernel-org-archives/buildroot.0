Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C52C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AB8B6FB4A;
	Tue, 11 Jan 2022 21:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WxdaNVIWDVfh; Tue, 11 Jan 2022 21:03:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C704C6FB38;
	Tue, 11 Jan 2022 21:03:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 393F61BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2714C83E27
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQRWFYe2aLdR for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 21:03:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8021883E23
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 21:03:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B50F3834DC; Tue, 11 Jan 2022 20:56:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 22:03:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54bd9691c876ff12780a3d6e7f8de900d8cbd14e
X-Git-Newrev: a5a4de201bf0f747ba438c6f1d45fb4bd2c4dfbc
X-Patchwork-Hint: ignore
Message-Id: <20220111205658.B50F3834DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musl: disable LTO unconditionally
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5a4de201bf0f747ba438c6f1d45fb4bd2c4dfbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recent commit b7a00b39bca0 (package/glibc: force -fno-lto) only catered
for glibc, but all C libraries, like musl, are impacted, for very
similar reasons.

Disable LTO unconditionally for musl too.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/musl/musl.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index d4f26b50a7..b89945e3be 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -26,6 +26,12 @@ MUSL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 MUSL_INSTALL_STAGING = YES
 
+# musl does not build with LTO, so explicitly disable it
+# when using a compiler that may have support for LTO
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
+MUSL_EXTRA_CFLAGS += -fno-lto
+endif
+
 # Thumb build is broken, build in ARM mode, since all architectures
 # that support Thumb1 also support ARM.
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
