Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3C6EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 06:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06EBA81A39;
	Sun, 16 Jul 2023 06:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06EBA81A39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GKuT4h3Opdwr; Sun, 16 Jul 2023 06:22:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65A3081BA8;
	Sun, 16 Jul 2023 06:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65A3081BA8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7B0C1BF322
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FDAB40354
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FDAB40354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBKzsCZCM1yU for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 06:21:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13F4340576
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13F4340576
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB97787035; Sun, 16 Jul 2023 06:21:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 08:09:22 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: b32591f5f56d3aeb1c63cf65ed101936de313428
X-Git-Newrev: f2fd4a377542e6deaa73ca293efa9c48c8cbb2dd
X-Patchwork-Hint: ignore
Message-Id: <20230716062108.EB97787035@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/quickjs: disable
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2fd4a377542e6deaa73ca293efa9c48c8cbb2dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
