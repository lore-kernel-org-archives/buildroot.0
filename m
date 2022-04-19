Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27242C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 19:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8A268329A;
	Tue, 19 Apr 2022 19:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjN0hQNMfQUl; Tue, 19 Apr 2022 19:48:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C118B8322A;
	Tue, 19 Apr 2022 19:48:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 885B31BF867
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 19:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 818A960A92
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 19:48:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G5Y870v5O2Ez for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 19:48:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BC3D60E0D
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 19:48:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CB6BF83DB0; Tue, 19 Apr 2022 19:38:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 21:47:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7a3501750706eeec7854e708bcd9a8a27b61352
X-Git-Newrev: 2fd41e56e0e26fd3f3265f0e0015031211e441cf
X-Patchwork-Hint: ignore
Message-Id: <20220419193846.CB6BF83DB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/shim: disable on mips64el
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fd41e56e0e26fd3f3265f0e0015031211e441cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
