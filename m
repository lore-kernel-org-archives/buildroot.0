Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EC5C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 18:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14C4C83F1C;
	Sat, 22 Jan 2022 18:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FprUif-mO5Ee; Sat, 22 Jan 2022 18:01:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 604BD83F17;
	Sat, 22 Jan 2022 18:01:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFE0A1BF5DB
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE3E2403C8
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bu9AtiKF21ua for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 18:00:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2757400CE
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 18:00:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9959F829F4; Sat, 22 Jan 2022 17:53:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 18:54:35 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 8d8d5d4d4d4853e1e1bb37f481262d7fd6324f0f
X-Git-Newrev: 986fd8838f5c8348db889b9e6418ded3a2306243
X-Patchwork-Hint: ignore
Message-Id: <20220122175343.9959F829F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/linux-pam:
 separate locale and wchar dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=986fd8838f5c8348db889b9e6418ded3a2306243
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

They are currently expressed as such:

     depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)

which is not the common practice in Buildroot. We prefer to use:

     depends on BR2_ENABLE_LOCALE
     depends on BR2_USE_WCHAR

This commit ensures linux-pam is consistent with this best practice.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ac9261edec111836952970e26cf373cc15b9e8ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-pam/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 931cfdeccf..27ba55bd61 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LINUX_PAM
 	bool "linux-pam"
-	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+	depends on BR2_ENABLE_LOCALE
+	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_FLEX
@@ -12,5 +13,5 @@ config BR2_PACKAGE_LINUX_PAM
 
 comment "linux-pam needs a toolchain w/ wchar, locale, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
+	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR \
 		|| BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
