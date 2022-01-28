Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F6DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 14:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C9BE415E1;
	Fri, 28 Jan 2022 14:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kL9X1uRCb27c; Fri, 28 Jan 2022 14:51:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7C2B415DC;
	Fri, 28 Jan 2022 14:51:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBECB1BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 14:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D89B684BA2
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 14:51:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EBvzoF9dOAUc for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 14:51:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8778284B76
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643381475;
 bh=HMd2wejq7wWOIVUInvPj3zgm6bA1Xxhq4/JHRhAWnBY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=lNVBDLMQwDhajnkdR00EkF265yAARbduKUJTH9UEeBms/WGWRE4kG5n94hdYlFH05
 Mk4qWGbFegjJ1HAeoeBsjwCikJ8l9sup+5okcKTUje5/mz2TlSG+l+y1Sh6P+Jkjnh
 irZgZSYDIg9kZEdzmCGaluB8vK/zbkvV7LdaUq8Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from linux.fritz.box ([62.227.220.115]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2f5T-1nFOfc0MZz-0049YQ; Fri, 28
 Jan 2022 15:51:15 +0100
From: Andreas Ehmanns <universeiii@gmx.de>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 15:51:03 +0100
Message-Id: <20220128145103.3422-1-universeiii@gmx.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:VpOEoUzhE/8MOc3TVnIa5THdgUoscOZxbnuxm5pB4jhRdnlpOaZ
 YURptJepzaTGlxZKidrbUYhs3dLbm23liuapcKR7iAkJsNR+WZhjfWyJMN3E3yh9XpxJu9/
 F+K+r7heJFXusUzljycbAetfY6tyWg2Gv7y9uNLaiE49a/AD3XroZY2bYfJ5drKtOapPdjT
 vi+UIjRXWJOlmYrm/Bafg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P0bv/wqtowo=:Y/1UBBPPfJju2em5i1AzBh
 Ujcu53jYJ9ZNa4uzNqVS2VSXebJtE8HPddRG7APUXT45oyJFPdWThB9C/1qs23FSCSYWii76p
 lqlvq9kah9iXjrT0OFIJDxexDOWgTWBqRV/sjzAbzd11eK2ghzY9j35wzgOjsCSQPf91WFENU
 1Vds8gpke6gi+8PbqofdTLvOHWY2Ex2Ylnd6jOSvjUlVdLZkTnZyv1AAtKn1mPgCRq3AmYt5B
 d1FvGgdRJsYW4DyXEJ9j8Y21/8fV9b2Uw8JXnkbEi/1cuDnMFrismtTtO7hDrpabZKqzx/RyZ
 DMJVt9srghi/9EHg7dlYhiElG94g7l2CJyVupFEprVDe4eAKbaR97LwfnEQeg+Z7l+k4YwdfV
 43nSJBeIhEmmV6r6G8xIeZlEvJddOFU4/RaO2XqlsktRRPrU85lX77xru3VPgXk3fkiIvscho
 +EQxXmKvLMByI8rz7dnfqB9iA8XXsR9wBJ1GgVOR4WfaIg//aOZd5azU/1WDkxyQ/fZ+4iPId
 0RN/tmjec5d8+S741Tf21X2Ijyzx3REm/QzTWBzKHcwLDxqBVIGauWqKHtdQ6K+mVmKEk1rx4
 UKHnox7UiPL+8grUUijPnVROE7oaW9UzRifaCw3IBE9OzWoFMi57UHqck4An2dLuPzL90jN5v
 g5DJXU25Bsw9j7ms8pbGRD9Eeep28rMhtcmGCvtluRAf19+QGaLhVQQnWpP9RVLLwQJrjJcQM
 rmAw0JmtD2JvSkSG/S5nbplAaLp0Kom5sbr9CxNInTU1aJnskVP3Y693P32Y/NkmjIQlb7dgw
 v4wi5C2EYvVx1D0ihwjSbBscY0qI8Qu/HC9mBBQuDsIDRjqRKu12CptUdu+aPD8XsCESOk/z6
 hk7GBM62PpG+YCgn7g8OzlRRuy5/KK/AeqsD5nKLnAf3wLVX5kRfRVSlW3FH6IgP9wQQ9CJot
 RBJ8EExJj3DRhI0oQj65UlXyprKl4KtfRaa+DYH0D2lgtCMSMM006/D80h+XrNl63sE1zZbgA
 1nlFJHMPKJD1p99VgyGenkGwCvZJJ8kkh57w+z8493nGJLdmIshy/1neILhozoJyf7HUvs3hz
 JCf3iNeO6HPVVk=
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: add config option
 for custom patches
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
Cc: Andreas Ehmanns <universeiii@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Many embedded board manufacturer provide their BSP as patches to
linux kernel and u-boot. They can simply be applied by setting the
corresponding buildroot config (custom patches).
Nowadays patches for the arm trusted firmware (ATF) are also part of
BSP deliveries but there is no config option in buildroot for ATF
to apply custom patches.
This patch adds (similar to linux kernel and u-boot) an option to
apply custom patches to ATF.

Signed-off-by: Andreas Ehmanns <universeiii@gmx.de>
---
 boot/arm-trusted-firmware/Config.in           |  8 +++++++
 .../arm-trusted-firmware.mk                   | 21 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index b1fc03e10b..786a3083a2 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -63,6 +63,14 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION

 endif

+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PATCH
+	string "Custom ATF patches"
+	help
+	  A space-separated list of patches to apply to ATF.
+	  Each patch can be described as an URL, a local file path,
+	  or a directory. In the case of a directory, all files
+	  matching *.patch in the directory will be applied.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
 	string "ATF platform"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 03fa83b7b5..d329bdbfc3 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -29,6 +29,27 @@ ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST
 BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
 endif

+# Analogous code exists in linux/linux.mk. Basically, the generic
+# package infrastructure handles downloading and applying remote
+# patches. Local patches are handled depending on whether they are
+# directories or files.
+ARM_TRUSTED_FIRMWARE_PATCHES = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PATCH))
+ARM_TRUSTED_FIRMWARE_PATCH = $(filter ftp://% http://% https://%,$(ARM_TRUSTED_FIRMWARE_PATCHES))
+
+define ARM_TRUSTED_FIRMWARE_APPLY_LOCAL_PATCHES
+	for p in $(filter-out ftp://% http://% https://%,$(ARM_TRUSTED_FIRMWARE_PATCHES)) ; do \
+		if test -d $$p ; then \
+			$(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
+		else \
+			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
+		fi \
+	done
+endef
+ARM_TRUSTED_FIRMWARE_POST_PATCH_HOOKS += ARM_TRUSTED_FIRMWARE_APPLY_LOCAL_PATCHES
+
+# We have no way to know the hashes for user-supplied patches.
+BR_NO_CHECK_HASH_FOR += $(notdir $(ARM_TRUSTED_FIRMWARE_PATCHES))
+
 ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES = YES

 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC),y)
--
2.26.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
