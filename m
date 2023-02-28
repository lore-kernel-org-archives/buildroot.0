Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95626C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 16:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C79B82078;
	Tue, 28 Feb 2023 16:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C79B82078
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id to_urD8oOI2L; Tue, 28 Feb 2023 16:19:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A4368206E;
	Tue, 28 Feb 2023 16:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A4368206E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5FFD71BF5A8
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 16:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46CAA6110F
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 16:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46CAA6110F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAlkQAK_RQ7Z for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 16:19:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B61E60E3C
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 16:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B61E60E3C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58CA986D47; Tue, 28 Feb 2023 16:19:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 17:18:23 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 3ad9e059909f3b1cb463a48d7986a0f2776b8f53
X-Git-Newrev: e157c87919e6fbe6ad102ab3268045eec8bd3b74
X-Patchwork-Hint: ignore
Message-Id: <20230228161909.58CA986D47@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/rtl8723ds: change
 CFLAGS approach
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

commit: https://git.buildroot.net/buildroot/commit/?id=e157c87919e6fbe6ad102ab3268045eec8bd3b74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit 672544148b3cafa1cda47cd6e4b88210fc693e14)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
