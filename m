Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA60C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 290D6427A5;
	Sat, 28 May 2022 19:28:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Wm1gluvGNTI; Sat, 28 May 2022 19:28:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2B1A426AD;
	Sat, 28 May 2022 19:28:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26E5E1BF962
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04E1283DF1
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WWf6Y4sEVhLN for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56930837C9
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 21FD685DB4; Sat, 28 May 2022 19:16:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 21:06:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: bf4b7f7455c21b0dc8f76452e257ccbe8f281f72
X-Git-Newrev: ed9f08b6efa41362d796df63ddec3f9bad5fbb09
X-Patchwork-Hint: ignore
Message-Id: <20220528191613.21FD685DB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rtl8189fs: fix
 big-endian builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed9f08b6efa41362d796df63ddec3f9bad5fbb09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix rtl8189fs builds for big-endian platforms. For this purpose remove
default little-endian configuration option from rtl8189fs Makefile.
Configure proper endianness using USER_EXTRA_CFLAGS instead.

Fixes:
- http://autobuild.buildroot.net/results/51e95561103e40ae94f38b9bb944bdfcd4ab50ed/
- http://autobuild.buildroot.net/results/8ac7921926ab48aeb95dc4ea20f3c9970094c71d/
- http://autobuild.buildroot.net/results/7f0bdd03c41bcc9e567fe722ed271e5dcf210f44/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1d6abde27c98a1c6d8965a1ee2aa4afce8a34c5d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Makefile-remove-default-endianness.patch  | 30 ++++++++++++++++++++++
 package/rtl8189fs/rtl8189fs.mk                     |  3 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/package/rtl8189fs/0001-Makefile-remove-default-endianness.patch b/package/rtl8189fs/0001-Makefile-remove-default-endianness.patch
new file mode 100644
index 0000000000..47e42415eb
--- /dev/null
+++ b/package/rtl8189fs/0001-Makefile-remove-default-endianness.patch
@@ -0,0 +1,30 @@
+From 480d9da302885d9e8b3d1f9c68def569e3c8a8c0 Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Mon, 9 May 2022 00:17:21 +0300
+Subject: [PATCH] Makefile: remove default endianness
+
+There is no way to remove configuration options from EXTRA_CFLAGS
+without editing Makefile. So default LE configuration can not be
+conveniently replaced by BE. Remove default endianness from the
+Makefile to enable its configuration via USER_EXTRA_CFLAGS.
+
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index dfca305..fde4e6b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -22,7 +22,6 @@ endif
+ 
+ EXTRA_CFLAGS += -I$(src)/include
+ 
+-EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
+ EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
+ 
+ EXTRA_LDFLAGS += --strip-debug
+-- 
+2.35.1
+
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 6031a3072c..1c398919ba 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -11,7 +11,8 @@ RTL8189FS_LICENSE = GPL-2.0
 RTL8189FS_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8189FS=m \
 	KVER=$(LINUX_VERSION_PROBED) \
-	KSRC=$(LINUX_DIR)
+	KSRC=$(LINUX_DIR) \
+	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN"
 
 define RTL8189FS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
