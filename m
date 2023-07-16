Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814B6EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 17:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DE7D4071B;
	Sun, 16 Jul 2023 17:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DE7D4071B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDkdvUh0JZ2R; Sun, 16 Jul 2023 17:50:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C7D94064C;
	Sun, 16 Jul 2023 17:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C7D94064C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 092D91BF391
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 17:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D333F408E4
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 17:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D333F408E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yujwyGBFvgql for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 17:49:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 066AE4090F
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 17:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 066AE4090F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8A50870F1; Sun, 16 Jul 2023 17:49:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 19:44:58 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 18706806b363962bdd2aa43de75c31ad48cd0d34
X-Git-Newrev: df3f76c86f083c38cb058189f45028b0c8cb7c71
X-Patchwork-Hint: ignore
Message-Id: <20230716174940.E8A50870F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/assimp: needs gcc
 >= 7
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

commit: https://git.buildroot.net/buildroot/commit/?id=df3f76c86f083c38cb058189f45028b0c8cb7c71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes:
http://autobuild.buildroot.net/results/d6c/d6caf3c2c0fd670e70950d3e89629df39f8ce596/

After adding various fixes for the autobuilder error and subsequent
build errors this build error can only be fixed by using gcc >= 7:

output/build/assimp-5.2.5/code/AssetLib/Obj/ObjFileParser.cpp:55:23:
 fatal error: string_view: No such file or directory

Usage of string_view was added in version 5.2.5 by upstream commit
https://github.com/assimp/assimp/commit/f6bcb160d08af267778fbc59b480ce5d9c52c92c
which was added to buildroot by commit
7d843d9cc0064d6690cfc000e579f575e2c0cc4d

Removed BR2_TOOLCHAIN_HAS_GCC_BUG_64735 which is only valid for gcc < 7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6dad3a709c7b36fd72cf90adb1e344201f3db96c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/assimp/Config.in | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 5ffb50cd79..4bddb3598d 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_ASSIMP
 	bool "assimp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
 	help
@@ -14,8 +14,6 @@ config BR2_PACKAGE_ASSIMP
 
 	  http://www.assimp.org
 
-comment "assimp needs a toolchain w/ C++, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
-
-comment "assimp needs exception_ptr"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+comment "assimp needs a toolchain w/ C++, wchar, gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
