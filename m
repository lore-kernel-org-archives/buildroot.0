Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E886C433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57E3F405FA;
	Mon, 21 Nov 2022 21:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57E3F405FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4eU3W_hWb6uE; Mon, 21 Nov 2022 21:34:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73C6B405EB;
	Mon, 21 Nov 2022 21:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73C6B405EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9DDE1BF385
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B26A3813DF
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B26A3813DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hxx2Axr6rUe4 for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:34:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7DEF81452
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7DEF81452
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5E25840B5; Mon, 21 Nov 2022 21:34:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 22:33:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ebfe647b6df76016fb8a50b718d60fdff15fe87
X-Git-Newrev: 354f9387f33b5fab023cb98e52d84d58624f0ecf
X-Patchwork-Hint: ignore
Message-Id: <20221121213407.B5E25840B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723ds: fix build failure due
 to endianness and Linux version 6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=354f9387f33b5fab023cb98e52d84d58624f0ecf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patch pending upstream[0] to override CFLAGS to set endianness
according to BR2_ENDIAN. Let's also bump version to latest to support up to
Linux 6.1.

[0]: https://github.com/lwfinger/rtl8723ds/pull/29

Fixes:
http://autobuild.buildroot.net/results/2646ec0512f867e20c25c1d0a6417826218942d6/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ve-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 39 ++++++++++++++++++++++
 package/rtl8723ds/rtl8723ds.hash                   |  2 +-
 package/rtl8723ds/rtl8723ds.mk                     | 10 ++++--
 3 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
new file mode 100644
index 0000000000..4495817358
--- /dev/null
+++ b/package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
@@ -0,0 +1,39 @@
+From 769a1943cb409f89f3c91208294a89b09bf47b86 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 16 Nov 2022 16:08:21 +0100
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
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index aa57f85..3d91574 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,4 +1,3 @@
+-EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
+ EXTRA_CFLAGS += -O1
+ #EXTRA_CFLAGS += -O3
+ #EXTRA_CFLAGS += -Wall
+@@ -1738,6 +1737,8 @@ ifneq ($(USER_MODULE_NAME),)
+ MODULE_NAME := $(USER_MODULE_NAME)
+ endif
+ 
++EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
++
+ ifneq ($(KERNELRELEASE),)
+ 
+ rtk_core :=	core/rtw_cmd.o \
+-- 
+2.34.1
+
diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index 440ce75ef4..cbc77e14c1 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  cc5dcf9d17cefabfeba3e68671367c7d69091936e40f71dc5e1165c61195a9fb  rtl8723ds-76146e85847beb2427b1d4958fa275822f2b04ab.tar.gz
+sha256  691040a85d838f8d8d7da0f2ed460f1ea5f6734c40dc73770ba7e260b6cda9cc  rtl8723ds-5ab2d3f3858dc4c833013c47a79faa05b10198f6.tar.gz
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 8598f906a9..0d96e6b03a 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,14 +4,20 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = 76146e85847beb2427b1d4958fa275822f2b04ab
+RTL8723DS_VERSION = 5ab2d3f3858dc4c833013c47a79faa05b10198f6
 RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 
+# Undefine the hardcoded CONFIG_LITTLE_ENDIAN
+RTL8723DS_USER_EXTRA_CLAGS = -UCONFIG_LITTLE_ENDIAN
+# Set endianness
+RTL8723DS_USER_EXTRA_CLAGS += -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
+
 RTL8723DS_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8723DS=m \
 	KVER=$(LINUX_VERSION_PROBED) \
-	KSRC=$(LINUX_DIR)
+	KSRC=$(LINUX_DIR) \
+	USER_EXTRA_CFLAGS="$(RTL8723DS_USER_EXTRA_CLAGS)"
 
 define RTL8723DS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
