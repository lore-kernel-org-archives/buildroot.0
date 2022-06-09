Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD6AC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 594876060A;
	Thu,  9 Jun 2022 20:42:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ed20obU56RbB; Thu,  9 Jun 2022 20:42:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2429760681;
	Thu,  9 Jun 2022 20:42:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1060D1BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2C7640ADD
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:42:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5BhUg9hCdK2X for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:42:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4546940327
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:42:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7343886EDD; Thu,  9 Jun 2022 20:30:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 22:42:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 350772148f208c8d49f88f97b3a5ecf59c369bc6
X-Git-Newrev: dbbc25ff762348a4c32e7c5bd28a3fe3c858d9b3
X-Patchwork-Hint: ignore
Message-Id: <20220609203019.7343886EDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: disable on armeb
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dbbc25ff762348a4c32e7c5bd28a3fe3c858d9b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

armeb has never been supported by luajit since its addition in version
2.0.0 by
https://github.com/LuaJIT/LuaJIT/commit/ed6c895ae56288b6982d1651c4ea638452c9e99b:

lj_arch.h:473:2: error: #error "No support for big-endian ARM"
  473 | #error "No support for big-endian ARM"
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3751096941ae16184b835fd6879b4904f28c6432

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luajit/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index f27099e80c..d890d65b10 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm || BR2_armeb || BR2_aarch64
+	default y if BR2_arm || BR2_aarch64
 	default y if BR2_i386 || BR2_x86_64
 	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT \
 		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
