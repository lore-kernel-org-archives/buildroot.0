Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA6BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 11:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CABD040386;
	Sat,  8 Jan 2022 11:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 59eVeGIsRVyO; Sat,  8 Jan 2022 11:04:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BABC64016F;
	Sat,  8 Jan 2022 11:04:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B62FB1BF34E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 11:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B12094033F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 11:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mif-AHptI-K6 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 11:04:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D11F74016F
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 11:04:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B72C382B60; Sat,  8 Jan 2022 10:58:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 12:04:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 726209fc7999986fa414d629ff60d1bc76c63a2c
X-Git-Newrev: c240410d4b38c7946d2dd65c1c1eec6d172a0814
X-Patchwork-Hint: ignore
Message-Id: <20220108105818.B72C382B60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{gpsd,
 benejson}: drop host-python3 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=c240410d4b38c7946d2dd65c1c1eec6d172a0814
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These packages needed to depend on host-python3 because their Scons
machinery was written in python3, but host-scons itself was depending
on host-python. Now that host-scons depends on host-python3, the
packages that use host-scons no longer have to carry a host-python3
dependency.

The other package using scons, mongodb, does not have a direct
dependency on host-python3, but on a number of host Python 3.x modules
which are needed during the build, so no changes is necessary there.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/benejson/benejson.mk | 2 +-
 package/gpsd/gpsd.mk         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/benejson/benejson.mk b/package/benejson/benejson.mk
index f6f936ec71..680e5b5bda 100644
--- a/package/benejson/benejson.mk
+++ b/package/benejson/benejson.mk
@@ -9,7 +9,7 @@ BENEJSON_SITE = $(call github,codehero,benejson,$(BENEJSON_VERSION))
 BENEJSON_LICENSE = MIT
 BENEJSON_LICENSE_FILES = LICENSE
 BENEJSON_INSTALL_STAGING = YES
-BENEJSON_DEPENDENCIES = host-python3 host-scons
+BENEJSON_DEPENDENCIES = host-scons
 
 # wchar support needs to be manually disabled
 ifeq ($(BR2_USE_WCHAR),)
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 61391f0e9b..636c6c95ba 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -12,7 +12,7 @@ GPSD_CPE_ID_VENDOR = gpsd_project
 GPSD_SELINUX_MODULES = gpsd
 GPSD_INSTALL_STAGING = YES
 
-GPSD_DEPENDENCIES = host-python3 host-scons host-pkgconf
+GPSD_DEPENDENCIES = host-scons host-pkgconf
 
 GPSD_LDFLAGS = $(TARGET_LDFLAGS)
 GPSD_CFLAGS = $(TARGET_CFLAGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
