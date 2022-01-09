Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E772AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94BAD40378;
	Sun,  9 Jan 2022 15:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fT-YRFFyirrK; Sun,  9 Jan 2022 15:08:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68CAE40198;
	Sun,  9 Jan 2022 15:08:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CCFB1BF4D5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AF6460B69
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ac2wTUcsywSQ for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:08:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8208C60B68
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 15:08:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C229D82DC2; Sun,  9 Jan 2022 15:02:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 16:03:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c08fa13d363b7e3faa2f065f6261af6fa52445f6
X-Git-Newrev: c669bd5115d748a76018490af0c798df2747657d
X-Patchwork-Hint: ignore
Message-Id: <20220109150224.C229D82DC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: explicitly state binutils
 paths
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

commit: https://git.buildroot.net/buildroot/commit/?id=c669bd5115d748a76018490af0c798df2747657d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are not passing TARGET_CONFIGURE_OPTS when building busybox; instead
we are passing variables explicitly. As thus, it is missing the ar, nm,
and ranlib that we are using.

We add explicit AR, NM, and RANLIB, so that the ones we want to use
(i.e. the gcc-wrapped ones) are actually used.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[yann.morin.1998@free.fr:
  - reword the commit log to explain why we need that
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 3523cf21d0..60ebc4985f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -91,6 +91,9 @@ BUSYBOX_MAKE_ENV += \
 endif
 
 BUSYBOX_MAKE_OPTS = \
+	AR="$(TARGET_AR)" \
+	NM="$(TARGET_NM)" \
+	RANLIB="$(TARGET_RANLIB)" \
 	CC="$(TARGET_CC)" \
 	ARCH=$(KERNEL_ARCH) \
 	PREFIX="$(TARGET_DIR)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
