Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F5DC636D3
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 19:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 876CA820C0;
	Wed,  8 Feb 2023 19:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 876CA820C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJqZX7AKTZPU; Wed,  8 Feb 2023 19:28:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4C6A820BD;
	Wed,  8 Feb 2023 19:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4C6A820BD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B69C1BF2FE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7514061174
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7514061174
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M2FLZ4sQWcYv for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 19:28:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DF5661166
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 19:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DF5661166
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B204847AF; Wed,  8 Feb 2023 19:28:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 20:27:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd2e9a2a0d7fd4e407e831503979cc00aa2c4858
X-Git-Newrev: 672544148b3cafa1cda47cd6e4b88210fc693e14
X-Patchwork-Hint: ignore
Message-Id: <20230208192809.8B204847AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723ds: change CFLAGS approach
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

commit: https://git.buildroot.net/buildroot/commit/?id=672544148b3cafa1cda47cd6e4b88210fc693e14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of undefining endiannes CFLAGS let's change the approach.

Let's disable the CONFIG_PLATFORM_I386_PC that is set to y by default
involving the endianness to be set to little. This way we can set the
CFLAGS according to architecture with some default define like:

 -DCONFIG_IOCTL_CFG80211
 -DRTW_USE_CFG80211_STA_EVENT
 -Wno-error

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8723ds/rtl8723ds.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 7e27fa75ea..f303a24041 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -8,12 +8,14 @@ RTL8723DS_VERSION = a638cc8639015b8b9390af3350fab0366b6c87e7
 RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 
-# Undefine the hardcoded CONFIG_LITTLE_ENDIAN
-RTL8723DS_USER_EXTRA_CLAGS = -UCONFIG_LITTLE_ENDIAN
-# Set endianness
-RTL8723DS_USER_EXTRA_CLAGS += -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
+RTL8723DS_USER_EXTRA_CLAGS = \
+	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
+	-DCONFIG_IOCTL_CFG80211 \
+	-DRTW_USE_CFG80211_STA_EVENT \
+	-Wno-error
 
 RTL8723DS_MODULE_MAKE_OPTS = \
+	CONFIG_PLATFORM_I386_PC=n \
 	CONFIG_RTL8723DS=m \
 	KVER=$(LINUX_VERSION_PROBED) \
 	KSRC=$(LINUX_DIR) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
