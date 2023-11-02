Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483B2C4167D
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 11:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEF06418D3;
	Thu,  2 Nov 2023 11:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEF06418D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hoQIqsVj5SuS; Thu,  2 Nov 2023 11:15:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27B9840334;
	Thu,  2 Nov 2023 11:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27B9840334
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C49501BF836
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 11:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CDD640B5E
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 11:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CDD640B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJe1cfxIV_PK for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 11:14:53 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AECE140192
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 11:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AECE140192
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E1FAE0002;
 Thu,  2 Nov 2023 11:14:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1qyVey-0094mn-1i;
 Thu, 02 Nov 2023 12:14:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 12:14:46 +0100
Message-Id: <20231102111447.2163334-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: set BUILD_STRING to
 package version
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
