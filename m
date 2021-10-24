Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD31DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:23:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A2A460F70
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A2A460F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4191C401BC;
	Sun, 24 Oct 2021 13:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFbBmDvXd6zY; Sun, 24 Oct 2021 13:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A69F840196;
	Sun, 24 Oct 2021 13:23:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FC0D1BF969
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A4D5401E5
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjNujZjRTq1X for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 13:23:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6358F40124
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 13:23:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BC36E88597; Sun, 24 Oct 2021 13:20:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 15:22:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d1a17083b1d588a6fb55f18dc617b5f6b7a6b1d
X-Git-Newrev: 2033992ac079c38ed3c2d38eb693d345fb0d5c89
X-Patchwork-Hint: ignore
Message-Id: <20211024132022.BC36E88597@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: fix build with headers
 < 3.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=2033992ac079c38ed3c2d38eb693d345fb0d5c89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 2.37.2 in
commit 27a46793b1a0c6c13c00b07d07bd5743e2c9c7b6 and the addition of
uclampset in
https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=9dd95bea42a3b467c1f773fd2e781cc9f0d88847:

checking for syscall sched_setattr... no
configure: WARNING: Unable to detect syscall sched_setattr.
checking for syscall sched_setattr... (cached) no
configure: WARNING: Unable to detect syscall sched_setattr.
configure: error: uclampset selected but sched_setattr syscall not found

Fix this build failure by adding a dependency on headers >= 3.14 for
scheduling utilities:
https://github.com/torvalds/linux/commit/e6cfc0295c7d51b008999a8b13a44fb43f8685ea

Fixes:
 - http://autobuild.buildroot.org/results/9fe26ab98c93b67f937293f28625843da7ccb77f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-tools/Config.in | 6 ++++--
 package/util-linux/Config.in  | 6 +++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 2287ef5888..28641dccdd 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -105,6 +105,7 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	depends on BR2_USE_MMU  # bash
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 # util-linux schedutils
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_BASH # runtime
 	select BR2_PACKAGE_NCURSES
@@ -126,9 +127,10 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	  This is very much a use at your risk option and may not work
 	  for every setup or every architecture.
 
-comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS and a toolchain w/ dynamic library"
+comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS and a toolchain w/ dynamic library and headers >= 3.14"
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS || BR2_STATIC_LIBS
+	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
 config BR2_PACKAGE_LINUX_TOOLS_TMON
 	bool "tmon"
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index f045361ab5..9e9b8933e5 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -330,8 +330,12 @@ comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic lib
 
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 	bool "scheduling utilities"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	help
-	  Scheduling utilities (chrt, ionice, taskset)
+	  Scheduling utilities (chrt, ionice, taskset, uclampset)
+
+comment "scheduling utilities need a toolchain w/ headers >= 3.14"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
 config BR2_PACKAGE_UTIL_LINUX_SETPRIV
 	bool "setpriv"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
