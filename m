Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9055C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 12:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 778CC82611;
	Mon, 15 Aug 2022 12:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 778CC82611
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ue5IVcEW7DRa; Mon, 15 Aug 2022 12:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A179D82605;
	Mon, 15 Aug 2022 12:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A179D82605
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E2A81BF3B9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7959B60BA8
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7959B60BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tte_v60lhNGp for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 12:36:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD88E60590
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 12:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD88E60590
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 65FBB87631; Mon, 15 Aug 2022 12:22:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 14:36:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e229943785534e0884c62c7346a8c6df8d565e1e
X-Git-Newrev: ecba9d9a91db332ab64735c9cec708d4ae8637dc
X-Patchwork-Hint: ignore
Message-Id: <20220815122201.65FBB87631@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/drbd-utils: fix build without
 threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=ecba9d9a91db332ab64735c9cec708d4ae8637dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without threads raised since bump to
version 9.21.4 in commit e4c81885ed487ccb511c4a4c4f8a8c1aa5180f78:

CompactDisplay.cpp:13:14: fatal error: pthread.h: No such file or directory
   13 |     #include <pthread.h>
      |              ^~~~~~~~~~~

For an unknown reason, previously drbdmon (which unconditionally uses
threads) was always wrongly disabled:

configure:5846: checking whether /home/fabrice/buildroot/output/host/bin/arm-linux-g++ supports C++11 features by default
configure:6141: /home/fabrice/buildroot/output/host/bin/arm-linux-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.cpp >&5
configure:6141: $? = 0
configure:6149: result: yes
configure:6824: WARNING: No C++11 compiler found, disabling drbdmon build.

The correct activation of drbdmon could be a side-effect of
https://github.com/LINBIT/drbd-utils/commit/b235e83409b0daf5a3454cdc83aec2e5b335d38e

Fixes:
 - http://autobuild.buildroot.org/results/2cc7d771176ccde7539cc93d83e9621d9ada8357

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/drbd-utils/drbd-utils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index 3ab3246f49..c1035191f1 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -20,6 +20,12 @@ else
 DRBD_UTILS_CONF_OPTS += --with-initscripttype=sysv
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+DRBD_UTILS_CONF_OPTS += --with-drbdmon
+else
+DRBD_UTILS_CONF_OPTS += --without-drbdmon
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 DRBD_UTILS_CONF_OPTS += --with-udev=yes
 DRBD_UTILS_DEPENDENCIES += udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
