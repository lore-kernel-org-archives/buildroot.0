Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7439C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:04:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F73960FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F73960FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 780A142628;
	Thu, 26 Aug 2021 22:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPgT7hnVz1tS; Thu, 26 Aug 2021 22:04:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31ABF42634;
	Thu, 26 Aug 2021 22:04:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34F6B1C113E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1236782AC8
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r3FIVANNrvbr for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6BB582ADD
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 37DEE8DC50; Thu, 26 Aug 2021 22:01:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 12:37:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2007a6e5e609edcccf75f7e6e58f9732cbb44cb3
X-Git-Newrev: 0744eef34d836bc8ef086ed657377bc15ed753a9
X-Patchwork-Hint: ignore
Message-Id: <20210826220127.37DEE8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/acmesystems_acqua_a5_*: bump at91bootstrap3 version
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=0744eef34d836bc8ef086ed657377bc15ed753a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

AT91Bootstrap 3.10.2 has a bug in its Makefile:[1] it gives the
-nostartfiles flag to the ld command, although this is a gcc flag, not
an ld flag. The bug happens to be harmless when using binutils 2.35.
However, the ld shipped with binutils 2.36 is more strict in its option
parsing, and fails with the following error:

    .../output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld:
    Error: unable to disambiguate: -nostartfiles
    (did you mean --nostartfiles ?)

The bug was fixed upstream in commit 3207586a.[2] However, since there
has been no tagged 3.x release since then, we just upgrade to the
current head of the branch at91bootstrap-3.x.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738145
  https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738152

[1] https://github.com/linux4sam/at91bootstrap/issues/127
[2] https://github.com/linux4sam/at91bootstrap/commit/3207586a79aba527bbf20560930089b800f191ac

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/acmesystems_acqua_a5_256mb_defconfig | 2 +-
 configs/acmesystems_acqua_a5_512mb_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 618ef0e756..00b99c0ad8 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.2"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="5232adb1c42636e1e9cf495a6abd1a8d66475f83"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index e9d74be7c8..f4af2501b8 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.2"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="5232adb1c42636e1e9cf495a6abd1a8d66475f83"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
