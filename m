Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4142ECA5537
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 16:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE3A282640;
	Wed, 13 Sep 2023 16:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE3A282640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7vjEUdnDzbx; Wed, 13 Sep 2023 16:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B24F82324;
	Wed, 13 Sep 2023 16:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B24F82324
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D4711BF2AB
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15DC5600B3
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15DC5600B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2b---M-f5afe for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 16:10:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 312356060A
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 16:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 312356060A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 207DC86E3F; Wed, 13 Sep 2023 16:10:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 18:03:56 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f73bf9084df2228bca051f64baeed604d1f8cc0d
X-Git-Newrev: 4e4df2044aaee476e383be736b83851d3ca41555
X-Patchwork-Hint: ignore
Message-Id: <20230913161016.207DC86E3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/rtl8189fs: fix
 build with big endian
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e4df2044aaee476e383be736b83851d3ca41555
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Add local patch to allow to override CFLAGS and undefine
CONFIG_LITTLE_ENDIAN by default and use the correct endianness according
to target architecture.

Fixes:
http://autobuild.buildroot.net/results/fe67db3884573ef750eda9d0dccd5f97b3ae698e

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 624814f4ec26d470606aefeb1a817a31399a04c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ve-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 41 ++++++++++++++++++++++
 package/rtl8189fs/rtl8189fs.mk                     |  7 +++-
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
new file mode 100644
index 0000000000..f9e2d6845d
--- /dev/null
+++ b/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
@@ -0,0 +1,41 @@
+From f48d99fab8b79e573850067a3ff2d8c16aa95ce1 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 28 Sep 2022 21:17:17 +0200
+Subject: [PATCH] Makefile: move 'EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)' at the
+ end of EXTRA_FLAGS assignment
+
+At the moment USER_EXTRA_CFLAGS can't override local Makfile EXTRA_CFLAGS
+since it's assigned at the beginning of the Makefile. For example it's not
+possible to undefine the hardcoded CONFIG_LITTLE_ENDIAN and this doesn't
+allow to build these modules for big endian architectures. So let's move
+the assignment of USER_EXTRA_CFLAGS to EXTRA_CFLAGS after the last
+EXTRA_CFLAGS assignment.
+
+Upstream: https://github.com/jwrdegoede/rtl8189ES_linux/pull/101
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index dfca305..6f91d0a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,4 +1,3 @@
+-EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
+ EXTRA_CFLAGS += -O1
+ #EXTRA_CFLAGS += -O3
+ #EXTRA_CFLAGS += -Wall
+@@ -2208,6 +2207,8 @@ ifneq ($(USER_MODULE_NAME),)
+ MODULE_NAME := $(USER_MODULE_NAME)
+ endif
+ 
++EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
++
+ ifneq ($(KERNELRELEASE),)
+ 
+ ########### this part for *.mk ############################
+-- 
+2.34.1
+
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index c3eef6e071..bd29469242 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -8,10 +8,15 @@ RTL8189FS_VERSION = 75a566a830037c7d1309c5a9fe411562772a1cf2
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
+RTL8189FS_USER_EXTRA_CFLAGS = \
+	-UCONFIG_LITTLE_ENDIAN \
+	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
+
 RTL8189FS_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8189FS=m \
 	KVER=$(LINUX_VERSION_PROBED) \
-	KSRC=$(LINUX_DIR)
+	KSRC=$(LINUX_DIR) \
+	USER_EXTRA_CFLAGS="$(RTL8189FS_USER_EXTRA_CFLAGS)"
 
 ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
 RTL8189FS_MODULE_MAKE_OPTS += CONFIG_RTW_DEBUG=n
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
