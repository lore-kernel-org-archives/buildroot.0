Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61D7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87B14415FC;
	Sun, 22 May 2022 10:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lp28x2YSx4YM; Sun, 22 May 2022 10:32:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 273AB415F1;
	Sun, 22 May 2022 10:32:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9036C1BF962
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C61840256
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DUeX44HREysT for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:32:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D62B1400B8
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3F44B86316; Sun, 22 May 2022 10:20:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 12:29:04 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fb517e83439cba19b9419e3145403b12a9fa1cf7
X-Git-Newrev: 1d763fce2cb0cd8ac95678a2b1d166d67e798e59
X-Patchwork-Hint: ignore
Message-Id: <20220522102053.3F44B86316@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/shim: disable on
 mips64el
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d763fce2cb0cd8ac95678a2b1d166d67e798e59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure on mips64el raised since commit
11b347c03ab0b38389ec11b48f63236a3b4d6547:

In file included from shim.h:47,
                 from shim.c:14:
/nvmedata/autobuild/instance-17/output-1/build/shim-15.4/include/system/stdarg.h:72:2: error: #error what arch is this
   72 | #error what arch is this
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/74f4f1d010cfde6978fd614195ef0006f0acb45a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2fd41e56e0e26fd3f3265f0e0015031211e441cf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/shim/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/shim/Config.in b/boot/shim/Config.in
index 2f74d6f332..b0e549a51b 100644
--- a/boot/shim/Config.in
+++ b/boot/shim/Config.in
@@ -2,6 +2,7 @@ config BR2_TARGET_SHIM
 	bool "shim"
 	# it includes gnu-efi
 	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
+	depends on !BR2_mips64el
 	help
 	  Boot loader to chain-load signed boot loaders under Secure
 	  Boot.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
