Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BFFC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 18:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E175610A2;
	Wed, 21 Dec 2022 18:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E175610A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8BOIfKyKoZy; Wed, 21 Dec 2022 18:08:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A44BB61096;
	Wed, 21 Dec 2022 18:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A44BB61096
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 420EE1BF3A6
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 18:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E2AF8201A
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 18:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E2AF8201A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PTqEdx14ezgO for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 18:08:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5066B80E07
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 18:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5066B80E07
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 408E086C91; Wed, 21 Dec 2022 18:08:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 19:07:56 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 2f817f53ffc9387438b0974fc24f57fe1a12410a
X-Git-Newrev: d878588b532014da392c19030dd03cb804ce8739
X-Patchwork-Hint: ignore
Message-Id: <20221221180827.408E086C91@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/rtl8192eu: fix
 build failure on Big Endian architectures
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

commit: https://git.buildroot.net/buildroot/commit/?id=d878588b532014da392c19030dd03cb804ce8739
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Let's disable the CONFIG_PLATFORM_I386_PC that is set to y by default
involving the endianness to be set to little. This way we can set the
CFLAGS according to architecture with some default define like:
-DCONFIG_IOCTL_CFG80211
-DRTW_USE_CFG80211_STA_EVENT
-Wno-error

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 447abe169af7e69a82a3e0218670006a42914053)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8192eu/rtl8192eu.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index 0e8ffea5cb..c3bf31a996 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -7,9 +7,16 @@
 RTL8192EU_VERSION = 1e15b6d451731bc4d3ffd587194dc4bd0f286ac0
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
+
+RTL8192EU_USER_EXTRA_CFLAGS = -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
+			      -DCONFIG_IOCTL_CFG80211 \
+			      -DRTW_USE_CFG80211_STA_EVENT \
+			      -Wno-error
+
 RTL8192EU_MODULE_MAKE_OPTS = \
+	CONFIG_PLATFORM_I386_PC=n \
 	CONFIG_RTL8192EU=m \
-	USER_EXTRA_CFLAGS="-Wno-error"
+	USER_EXTRA_CFLAGS="$(RTL8192EU_USER_EXTRA_CFLAGS)"
 
 define RTL8192EU_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
