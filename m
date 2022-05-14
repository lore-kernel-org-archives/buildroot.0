Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405E4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 21:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECF0060E0F;
	Sat, 14 May 2022 21:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9qVXYg8P4eM6; Sat, 14 May 2022 21:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04DD460D5C;
	Sat, 14 May 2022 21:05:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B48781BF616
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEB0E60C1C
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yG2Ndkr8EQxy for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 21:04:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 107D560D91
 for <buildroot@buildroot.org>; Sat, 14 May 2022 21:04:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A09D184C52; Sat, 14 May 2022 20:53:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 23:03:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91600a62afa7fece61f692f0df8e446c459b09ff
X-Git-Newrev: c42d2c34a2782fd15371b38c4d3d7348a3859727
X-Patchwork-Hint: ignore
Message-Id: <20220514205359.A09D184C52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: fix BR2_PACKAGE_RAUC_GPT
 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=c42d2c34a2782fd15371b38c4d3d7348a3859727
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
c2d3033ddcf0c497cd46744bdd2bee84d18349a4:

Makefile:576: *** util-linux-libs is in the dependency chain of rauc that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/298974d87bc1f578d67de2b1861e2f11f6c22374

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 2ea51f5bad..1170e50845 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -27,6 +27,8 @@ config BR2_PACKAGE_RAUC_DBUS
 
 config BR2_PACKAGE_RAUC_GPT
 	bool "GPT support"
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
 	help
 	    This option enables support for GPT partition tables.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
