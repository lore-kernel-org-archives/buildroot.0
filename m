Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AE6EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87C1E416DA;
	Wed, 12 Jul 2023 21:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87C1E416DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bwQx9xG_p8uy; Wed, 12 Jul 2023 21:23:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC20E416C4;
	Wed, 12 Jul 2023 21:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC20E416C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2297B1BF3A8
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED92A611A4
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED92A611A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eh-FRNWO2qrp for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 292B660D95
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 292B660D95
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1726786F39; Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 23:22:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9ad8ae22a904a58eb7dea85148a6992284d2723
X-Git-Newrev: 51c53ef92edf64dac7479bf03c6c5d826dd133a0
X-Patchwork-Hint: ignore
Message-Id: <20230712212319.1726786F39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: Test{No, All,
 NonDefaultLimited}Timezone: use base configuration
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

commit: https://git.buildroot.net/buildroot/commit/?id=51c53ef92edf64dac7479bf03c6c5d826dd133a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While at it remove Glibc from the test name since all Timezone
now use a Glibc toolchain.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/core/test_timezone.py | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/support/testing/tests/core/test_timezone.py b/support/testing/tests/core/test_timezone.py
index f661519196..0e5009494d 100644
--- a/support/testing/tests/core/test_timezone.py
+++ b/support/testing/tests/core/test_timezone.py
@@ -26,11 +26,9 @@ class TestNoTimezone(infra.basetest.BRTest):
         self.assertEqual(tz[0].strip(), "UTC")
 
 
-class TestGlibcAllTimezone(infra.basetest.BRTest):
-    config = \
+class TestAllTimezone(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_TZ_INFO=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
@@ -48,11 +46,9 @@ class TestGlibcAllTimezone(infra.basetest.BRTest):
         self.assertEqual(tz[0].strip(), "CET")
 
 
-class TestGlibcNonDefaultLimitedTimezone(infra.basetest.BRTest):
-    config = \
+class TestNonDefaultLimitedTimezone(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_TZ_INFO=y
         BR2_TARGET_TZ_ZONELIST="northamerica"
         BR2_TARGET_LOCALTIME="America/New_York"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
