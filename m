Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB29EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 06:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB4B881DF9;
	Sun, 16 Jul 2023 06:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB4B881DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qhnwPuI7jV3h; Sun, 16 Jul 2023 06:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE09A81E24;
	Sun, 16 Jul 2023 06:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE09A81E24
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C96901BF322
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2D4060AFD
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2D4060AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 42Td8XGU9y3f for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 06:22:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2EDD60739
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2EDD60739
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFB20870EA; Sun, 16 Jul 2023 06:22:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 08:09:03 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 19fc429a864be5234305bf093d4f3fd234da52d5
X-Git-Newrev: d0126da06ba98565a25393934e96388c100cc7d2
X-Patchwork-Hint: ignore
Message-Id: <20230716062213.BFB20870EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/quickjs: disable
 on microblaze
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0126da06ba98565a25393934e96388c100cc7d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

quickjs unconditionally uses FE_{DOWN,UP}WARD and so fails to build on
microblaze since its addition in commit
5d50793659acb95050c110d5fc05399df20ce30b

Fixes:
http://autobuild.buildroot.net/results/3b1/3b1b1f91998bfdec65f3e6fb8931df9c8871b953/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 72bb3e89aa3152d47584682f7a699ddb94d4abc5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quickjs/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
index dc466241ba..292dba86d0 100644
--- a/package/quickjs/Config.in
+++ b/package/quickjs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QUICKJS
 	bool "quickjs"
+	depends on !BR2_microblaze # fenv.h lacks FE_{DOWN,UP}WARD
 	depends on !BR2_nios2 # fenv.h lacks FE_{DOWN,UP}WARD on nios2
 	depends on !BR2_STATIC_LIBS
 	# No way to check for fenv support.
@@ -15,6 +16,7 @@ config BR2_PACKAGE_QUICKJS
 	  https://bellard.org/quickjs/
 
 comment "quickjs needs a glibc or musl toolchain w/ gcc >= 4.9, host gcc >= 4.9, dynamic library"
+	depends on !BR2_microblaze
 	depends on !BR2_nios2
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
