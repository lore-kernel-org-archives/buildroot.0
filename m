Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BC5C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8B8940437;
	Mon, 22 Jul 2024 12:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRnvk2udPKCp; Mon, 22 Jul 2024 12:14:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6C8540638
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6C8540638;
	Mon, 22 Jul 2024 12:14:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22CD11BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DF3B80E11
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iq6F_4n6qsKV for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:14:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4404880DDC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4404880DDC
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:14:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C99787000; Mon, 22 Jul 2024 12:14:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 14:14:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 758b424582afdad7e7adc2b1ff06e06db7a1296f
X-Git-Newrev: d30c1e3c582545a770d40a63be5b7b477d6b1cba
X-Patchwork-Hint: ignore
Message-Id: <20240722121431.2C99787000@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/picotool: fix libusb dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=d30c1e3c582545a770d40a63be5b7b477d6b1cba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libusb dependencies are wrong since the addition of the package in
commit f7aac1c008f9c59f8c669bade17864b099221065:
 - BR2_HOST_GCC_AT_LEAST_4_9 is used instead of
   BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 - BR2_TOOLCHAIN_HAS_THREADS is missing

Fixes: f7aac1c008f9c59f8c669bade17864b099221065
 - http://autobuild.buildroot.org/results/22689afc092e33b6e3c1c7ffea0d0e3b5bf76d99

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/picotool/Config.in | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/picotool/Config.in b/package/picotool/Config.in
index 0046f8ad61..bbbcef405d 100644
--- a/package/picotool/Config.in
+++ b/package/picotool/Config.in
@@ -1,10 +1,13 @@
-comment "picotool needs a toolchain w/ C++ and gcc >= 4.9"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_4_9
+comment "picotool needs a toolchain w/ C++, threads, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_PICOTOOL
 	bool "picotool"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libusb
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_PICO_SDK
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
