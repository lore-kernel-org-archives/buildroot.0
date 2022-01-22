Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03495C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 18:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9E1560B78;
	Sat, 22 Jan 2022 18:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CnJN8VvV0fh9; Sat, 22 Jan 2022 18:00:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0340D60B6C;
	Sat, 22 Jan 2022 18:00:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 055F11BF5DB
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6E62403C8
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8dDA5dC9TbzK for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 18:00:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06807400CE
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 18:00:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C0331829F4; Sat, 22 Jan 2022 17:53:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 18:54:40 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: baed11290ece14044bd5486a17b6f595a1391513
X-Git-Newrev: d259c00fb6f44a7a8512275f6751de22a99ee39f
X-Patchwork-Hint: ignore
Message-Id: <20220122175335.C0331829F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/linux-pam:
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

commit: https://git.buildroot.net/buildroot/commit/?id=d259c00fb6f44a7a8512275f6751de22a99ee39f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
