Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD6AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D5B942234;
	Fri, 17 Dec 2021 21:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ox5fEnysqxdU; Fri, 17 Dec 2021 21:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F43741FCB;
	Fri, 17 Dec 2021 21:47:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCEA41C1162
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB6E461168
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-H6Ihjd2l53 for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1679A61162
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1C5FF80288; Fri, 17 Dec 2021 21:41:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:46:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f0df6609a0a1045c16a7d55711f21fc42af756b
X-Git-Newrev: ac9261edec111836952970e26cf373cc15b9e8ac
X-Patchwork-Hint: ignore
Message-Id: <20211217214145.1C5FF80288@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-pam: separate locale and
 wchar dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac9261edec111836952970e26cf373cc15b9e8ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They are currently expressed as such:

     depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)

which is not the common practice in Buildroot. We prefer to use:

     depends on BR2_ENABLE_LOCALE
     depends on BR2_USE_WCHAR

This commit ensures linux-pam is consistent with this best practice.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
