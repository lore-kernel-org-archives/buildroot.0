Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDF3C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 20:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F1B340475;
	Mon,  7 Mar 2022 20:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6-WQQR3BOUT; Mon,  7 Mar 2022 20:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EE83403A4;
	Mon,  7 Mar 2022 20:51:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 330581BF3A0
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 20:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2109C403A4
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 20:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61Xn-ZUoCVnv for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 20:51:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 392364016A
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 20:51:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7F26482DF0; Mon,  7 Mar 2022 20:42:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 21:49:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d0aedaa45b1a4711416a8b1247aed21f0614774
X-Git-Newrev: a6b348b3c74b829868347b827612a451851c7247
X-Patchwork-Hint: ignore
Message-Id: <20220307204241.7F26482DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webkit: disable JIT with
 mips32r6
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6b348b3c74b829868347b827612a451851c7247
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable JIT with mips32r6 to avoid the following build failure raised
since bump to version 5.212.0-alpha4 in commit
df0b0fe6919c0d0f3750f439a3cfa765232bd569:

/tmp/ccHw2rHQ.s:18: Error: opcode not supported on this processor: mips32r6 (mips32r6) `addi $a0,$sp,-8'

Fixes:
 - http://autobuild.buildroot.org/results/5191600b463cda078203eeffae880ed989f8ac0f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 6401c39d3d..9012a588d4 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -20,6 +20,10 @@ QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3-Clause, BSD-2-Clause
 # in the archive.
 QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
 
+ifeq ($(BR2_MIPS_CPU_MIPS32R6),y)
+QT5WEBKIT_CONF_OPTS += -DENABLE_JIT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL),y)
 QT5WEBKIT_CONF_OPTS += \
 	-DENABLE_OPENGL=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
