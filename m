Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0DAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 06:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C519660E96;
	Fri, 22 Jul 2022 06:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C519660E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mSJQLVsAN-kq; Fri, 22 Jul 2022 06:25:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDF4F60E28;
	Fri, 22 Jul 2022 06:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDF4F60E28
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D02561C11A9
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B209560ED6
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B209560ED6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id naErkdzRudjQ for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 06:25:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA9A560E96
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 06:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA9A560E96
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D112A83ED4; Fri, 22 Jul 2022 06:12:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 08:16:01 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8cd128da92b10c851407bfc547694b3863e512f6
X-Git-Newrev: 2a01961719bec7dc1bb6be51dd885f3ff5dcdf25
X-Patchwork-Hint: ignore
Message-Id: <20220722061203.D112A83ED4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/paxtest: disable
 on microblaze
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a01961719bec7dc1bb6be51dd885f3ff5dcdf25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit abfca98ea223397ed502640d6171845f331614a3)
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
