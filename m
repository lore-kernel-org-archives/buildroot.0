Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770C3C001B0
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30775838AC;
	Sat, 22 Jul 2023 21:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30775838AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yS9xDT0iYIpS; Sat, 22 Jul 2023 21:27:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E64F8356E;
	Sat, 22 Jul 2023 21:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E64F8356E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D16551BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B87E4405F9
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B87E4405F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hgc93EnUR9xJ for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:27:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A159A40500
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A159A40500
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 917CF82200; Sat, 22 Jul 2023 21:27:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 23:27:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4ab45a5c1db05f84efb5f3b6909982263afb1d4
X-Git-Newrev: d1e79b4c95b9ae0590f5a2155517934daaef59f1
X-Patchwork-Hint: ignore
Message-Id: <20230722212754.917CF82200@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/supertuxkart: fix build with
 bluetooth enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1e79b4c95b9ae0590f5a2155517934daaef59f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The wiiuse code force an out-of-tree build:
https://github.com/supertuxkart/stk-code/blob/master/lib/wiiuse/cmake/cmake-4.0.0-modules/RequireOutOfSourceBuild.cmake#L41

Fixes a build error not yet caught by the autobuilders:

-- Configuring WiiUse version 0.15.5
CMake Error at lib/wiiuse/cmake/cmake-4.0.0-modules/RequireOutOfSourceBuild.cmake:41 (message):
  You must set a binary directory that is different from your source
  directory.  You might consider

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/supertuxkart/supertuxkart.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
index 1f9ad4102b..6bdd512eac 100644
--- a/package/supertuxkart/supertuxkart.mk
+++ b/package/supertuxkart/supertuxkart.mk
@@ -44,6 +44,7 @@ SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF \
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 SUPERTUXKART_DEPENDENCIES += bluez5_utils
 SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=ON -DUSE_SYSTEM_WIIUSE=ON
+SUPERTUXKART_SUPPORTS_IN_SOURCE_BUILD = NO
 else
 # Wiimote support relies on bluez5.
 SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
