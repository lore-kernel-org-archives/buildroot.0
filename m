Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40188EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB24941707;
	Wed, 12 Jul 2023 21:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB24941707
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ghv-G3LEfvFE; Wed, 12 Jul 2023 21:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14032416ED;
	Wed, 12 Jul 2023 21:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14032416ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4DA31BF97D
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 883F841B6F
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 883F841B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sT-j935Yxpic for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E0A741B98
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E0A741B98
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1092386F38; Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 23:22:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ec2df9fcc770c8d0ec91faa7e048d59b03ef3f1
X-Git-Newrev: a9ad8ae22a904a58eb7dea85148a6992284d2723
X-Patchwork-Hint: ignore
Message-Id: <20230712212319.1092386F38@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestZ3: use base
 configuration
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9ad8ae22a904a58eb7dea85148a6992284d2723
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The base configuration now provide a glibc toolchain,
we can safely switch to it.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_z3.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_z3.py b/support/testing/tests/package/test_z3.py
index 71b074a587..30794a250b 100644
--- a/support/testing/tests/package/test_z3.py
+++ b/support/testing/tests/package/test_z3.py
@@ -4,14 +4,8 @@ import infra.basetest
 
 
 class TestZ3(infra.basetest.BRTest):
-    # Need to use a different toolchain than the default due to
-    # z3 requiring fenv.h not provided by uclibc.
-    config = \
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_Z3=y
         BR2_PACKAGE_Z3_PYTHON=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
