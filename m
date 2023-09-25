Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D32ECE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 14:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34AC88129B;
	Mon, 25 Sep 2023 14:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34AC88129B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVgHf3bCzEY1; Mon, 25 Sep 2023 14:05:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77B2F82037;
	Mon, 25 Sep 2023 14:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77B2F82037
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BEA61BF35F
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 14:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 427CB4011A
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 14:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 427CB4011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0b7mefdSiJ-1 for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 14:04:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A66A41592
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 14:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A66A41592
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59C608779D; Mon, 25 Sep 2023 14:04:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 15:49:35 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 7b18c5c56be1b2ca68272a8b0d6a7a65f0923ea1
X-Git-Newrev: 536f39e88fcc3474bb57d723378492e44707b785
X-Patchwork-Hint: ignore
Message-Id: <20230925140426.59C608779D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/ne10: install
 shared libraries only when built
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

commit: https://git.buildroot.net/buildroot/commit/?id=536f39e88fcc3474bb57d723378492e44707b785
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

The install to staging commands of the ne10 package are careful to
install the shared libraries only if they are built, but we forgot to
use the same care for the install to target commands, causing a build
failure on BR2_STATIC_LIBS=y configurations as no shared library was
built:

cp: cannot stat '/home/autobuild/autobuild/instance-15/output-1/build/ne10-1.2.1/modules/libNE10*.so*': No such file or directory

This commit fixes this by guarding the target installation commands to
BR2_STATIC_LIBS being empty.

The problem exists since the package was introduced in commit
318f3db0dcc052aa770ca57c143b5f7bc40cdaf3 ("ne10: new package"), a good
10 years ago. Most likely it was not seen for many years as this
package is only available for ARM with NEON and AArch64, and we were
not testing fully static builds, except for ARMv5 that don't have
NEON. Now that we are doing more random testing, the problem started
being visible.

Fixes:

  http://autobuild.buildroot.net/results/45b2c1af052271bc2f1bb96544f138d29e4f7dfd/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 0b764a7d1e6961cb7baa0b3a74de1167bf47a6dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ne10/ne10.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index 3946605556..ce0f7e7b77 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -42,8 +42,10 @@ define NE10_INSTALL_STAGING_CMDS
 	$(NE10_INSTALL_STAGING_SHARED_LIB)
 endef
 
+ifeq ($(BR2_STATIC_LIBS),)
 define NE10_INSTALL_TARGET_CMDS
 	cp -dpf $(@D)/modules/libNE10*.so* $(TARGET_DIR)/usr/lib/
 endef
+endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
