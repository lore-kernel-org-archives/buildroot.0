Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A7EC4167B
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 13:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5151A41A42;
	Wed,  8 Nov 2023 13:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5151A41A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GfyR793umY7q; Wed,  8 Nov 2023 13:48:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A0DA4146F;
	Wed,  8 Nov 2023 13:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A0DA4146F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCE421BF3DE
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 13:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A24BA61046
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 13:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A24BA61046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4MvDM18BcOYh for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 13:47:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40CD061087
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 13:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40CD061087
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1961486CB6; Wed,  8 Nov 2023 13:47:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 14:37:12 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: cb8fed92a8a17b9e4a7abe2d37b5d9e3f7288824
X-Git-Newrev: f2bd43c79dad4c174f16f0fb59facd8fc317115e
X-Patchwork-Hint: ignore
Message-Id: <20231108134734.1961486CB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x]
 boot/arm-trusted-firmware: set BUILD_STRING to package version
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2bd43c79dad4c174f16f0fb59facd8fc317115e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

TF-A prints a version string at boot which includes the version number as
specified in the Makefile and additional "build" information, specified by
the BUILD_STRING parameter:

https://trustedfirmware-a.readthedocs.io/en/v2.9/getting_started/build-options.html

BUILD_STRING: Input string for VERSION_STRING, which allows the TF-A build
to be uniquely identified.  Defaults to the current git commit id.

This is implemented as:

 # Default build string (git branch and commit)
 ifeq (${BUILD_STRING},)
	BUILD_STRING  :=  $(shell git describe --always --dirty --tags 2> /dev/null)
 endif

https://github.com/ARM-software/arm-trusted-firmware/blob/master/Makefile#L225-L228

Which is never correct in the context of Buildroot, as the TF-A build
directory is never a git repo, and git will move up the directory tree and
possibly and (possibly) pick up the git version of Buildroot instead.

To fix that, explicitly set BUILD_STRING to the version of the package.
Pass it before BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES so it
can still be overridden by the user if needed.

strings images/tf-a-* | egrep '^v2\.'
v2.9(debug):2023.08-859-g99d78b52a0
v2.9(debug):v2.9

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5a8a7530bfb37017c08f768693f7581992dc033c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 648f62ed85..049beed36a 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -60,6 +60,7 @@ endif
 
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
+	BUILD_STRING=$(ARM_TRUSTED_FIRMWARE_VERSION) \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
 	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
