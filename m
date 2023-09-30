Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522E3E7737A
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E55EE41C26;
	Sat, 30 Sep 2023 16:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E55EE41C26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JAqCsDUVPZd; Sat, 30 Sep 2023 16:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0C0D421E3;
	Sat, 30 Sep 2023 16:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0C0D421E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A70641BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8281160EF7
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8281160EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eUCpd3vTEuKP for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:34:03 +0000 (UTC)
X-Greylist: delayed 2040 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 30 Sep 2023 16:34:03 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EE1A60D90
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EE1A60D90
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:34:03 +0000 (UTC)
Received: from [192.168.192.146] (port=52218 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1qmcNq-0003da-Rb; Sat, 30 Sep 2023 17:59:58 +0200
Date: Sat, 30 Sep 2023 17:59:57 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: buildroot@buildroot.org
Message-ID: <ZRhF_WeyOgEfAz6K@nx64de-df6d00>
Mail-Followup-To: buildroot@buildroot.org
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH] board/stm32mp157: remove hardcoded device tree
 names from post-image.sh
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
Cc: Grzegorz Szymaszek <gszymaszek@short.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The post-image.sh script is used in several STM32MP157-based board
configs. It had hardcoded device tree file names for the supported
boards which were used for matching the expected TF-A binary name.
Replace this mechanism with a pair of grep and sed that build the TF-A
binary name from the device tree file name. For example, if
BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES contained
DTB_FILE_NAME=stm32mp157c-dk2.dtb, the appropriate TF-A file would be
named tf-a-stm32mp157c-dk2.stm32.

Since the Bash Here Strings are removed with this change, I took the
opportunity to remove the only other non-POSIX command, "local", and
then I was able to change the shebang to plain /bin/sh, with -eu for
simpler error handling.

Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
---
 .../common/stm32mp157/post-image.sh           | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/board/stmicroelectronics/common/stm32mp157/post-image.sh b/board/stmicroelectronics/common/stm32mp157/post-image.sh
index 363c3127cf..fe3becae86 100755
--- a/board/stmicroelectronics/common/stm32mp157/post-image.sh
+++ b/board/stmicroelectronics/common/stm32mp157/post-image.sh
@@ -1,4 +1,4 @@
-#!/usr/bin/env bash
+#!/bin/sh -eu
 
 #
 # atf_image extracts the ATF binary image from DTB_FILE_NAME that appears in
@@ -8,22 +8,19 @@
 #
 atf_image()
 {
-	local ATF_VARIABLES="$(sed -n 's/^BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="\([\/a-zA-Z0-9_=. \-]*\)"$/\1/p' ${BR2_CONFIG})"
-
-	if grep -Eq "DTB_FILE_NAME=stm32mp157c-dk2.dtb" <<< ${ATF_VARIABLES}; then
-		echo "tf-a-stm32mp157c-dk2.stm32"
-	elif grep -Eq "DTB_FILE_NAME=stm32mp157a-dk1.dtb" <<< ${ATF_VARIABLES}; then
-                echo "tf-a-stm32mp157a-dk1.stm32"
-	elif grep -Eq "DTB_FILE_NAME=stm32mp157a-avenger96.dtb" <<< ${ATF_VARIABLES}; then
-                echo "tf-a-stm32mp157a-avenger96.stm32"
-	fi
+	ATF_VARIABLES="$(sed -n 's/^BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="\([\/a-zA-Z0-9_=. \-]*\)"$/\1/p' ${BR2_CONFIG})"
+	# make sure DTB_FILE_NAME is set
+	printf '%s\n' "${ATF_VARIABLES}" | grep -Eq 'DTB_FILE_NAME=[0-9A-Za-z_\-]*'
+	# extract the value
+	DTB_FILE_NAME="$(printf '%s\n' "${ATF_VARIABLES}" | sed 's/.*DTB_FILE_NAME=\([a-zA-Z0-9_\-]*\)\.dtb.*/\1/')"
+	echo "tf-a-${DTB_FILE_NAME}.stm32"
 }
 
 main()
 {
-	local ATFBIN="$(atf_image)"
-	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
-	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+	ATFBIN="$(atf_image)"
+	GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
+	GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 	sed -e "s/%ATFBIN%/${ATFBIN}/" \
 		board/stmicroelectronics/common/stm32mp157/genimage.cfg.template > ${GENIMAGE_CFG}
-- 
2.40.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
