Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56726C43334
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 06:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4D30614A4;
	Sat, 25 Jun 2022 06:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4D30614A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-cbcrxdoGtB; Sat, 25 Jun 2022 06:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D16614A3;
	Sat, 25 Jun 2022 06:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49D16614A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 292181BF95F
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1111E614A3
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1111E614A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GO_BEzfLYZHY for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5475F60F12
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5475F60F12
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 26BEC87560; Sat, 25 Jun 2022 06:34:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 25 Jun 2022 08:40:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e82614287407f18c1029bb26e49b0bcdbea2bf95
X-Git-Newrev: abfca98ea223397ed502640d6171845f331614a3
X-Patchwork-Hint: ignore
Message-Id: <20220625063418.26BEC87560@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/paxtest: disable on microblaze
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

commit: https://git.buildroot.net/buildroot/commit/?id=abfca98ea223397ed502640d6171845f331614a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable paxtest on microblaze to avoid the following build failure:

shlibtest.c:9:1: error: requested alignment '65536' exceeds object file maximum 32768
    9 | char shbss[PAGE_SIZE_MAX] __pagealigned;
      | ^~~~

Updating second patch to set PAGE_SIZE_MAX to 32768 will raise another
build failure:

/tmp/cccMSYDr.s: Assembler messages:
/tmp/cccMSYDr.s: Error: PC relative branch to label buf which is not in the instruction space

Fixes:
 - http://autobuild.buildroot.org/results/aba489143b4017617f67c1012bba1f4687708380

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/paxtest/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/paxtest/Config.in b/package/paxtest/Config.in
index 1e09820ba3..565c45cc19 100644
--- a/package/paxtest/Config.in
+++ b/package/paxtest/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PAXTEST
 	bool "paxtest"
+	depends on !BR2_microblaze
 	# No UCLIBC or MUSL because __NO_A_OUT_SUPPORT
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
@@ -8,4 +9,5 @@ config BR2_PACKAGE_PAXTEST
 	  http://pax.grsecurity.net/docs
 
 comment "paxtest needs a glibc toolchain"
+	depends on !BR2_microblaze
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
