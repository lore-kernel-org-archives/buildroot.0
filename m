Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95191C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2DFA4042B;
	Thu, 28 Jul 2022 20:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2DFA4042B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i82xfiUtAwJY; Thu, 28 Jul 2022 20:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE2CC4031D;
	Thu, 28 Jul 2022 20:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE2CC4031D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2372A1BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1B7860A9F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1B7860A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XCZfWqLy3iqa for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:51:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C256606B0
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C256606B0
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F0B7B864A4; Thu, 28 Jul 2022 20:37:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 22:51:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f897a557a615241db83464abac9714b752b79a0c
X-Git-Newrev: 543333ecae495b25ed702043c1f6358c8ed9eb6f
X-Patchwork-Hint: ignore
Message-Id: <20220728203734.F0B7B864A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: requires MD4 in
 openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=543333ecae495b25ed702043c1f6358c8ed9eb6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable MD4 in openssl to avoid the following build failure raised since
the addition of the package in commit
736c4c1655d93652a9a7e79235bbe726b3d46176:

In file included from src/lib/md4.c:16:
src/lib/md4.c: In function 'fr_md4_calc':
src/freeradius-devel/md4.h:76:33: error: unknown type name 'MD4_CTX'; did you mean 'FR_MD4_CTX'?
   76 | #  define FR_MD4_CTX            MD4_CTX
      |                                 ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/a8aa12a8129056391f975820ea3d1d62241ac051

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeradius-server/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freeradius-server/Config.in b/package/freeradius-server/Config.in
index 52a50bd3a7..d51d92714d 100644
--- a/package/freeradius-server/Config.in
+++ b/package/freeradius-server/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_FREERADIUS_SERVER
 	depends on !BR2_STATIC_LIBS # libtalloc
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBTALLOC
 	help
 	  FreeRADIUS is an open source server which implements
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
