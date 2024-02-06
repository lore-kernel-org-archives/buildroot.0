Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D8DC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B3D7611F4;
	Tue,  6 Feb 2024 13:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B3D7611F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5dMQHhJmE8z4; Tue,  6 Feb 2024 13:20:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54A8F611F8;
	Tue,  6 Feb 2024 13:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54A8F611F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1756B1BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E447B4144E
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E447B4144E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sqaMerhYOzNi for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:20:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBD0340C88
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBD0340C88
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A58A98705B; Tue,  6 Feb 2024 13:20:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 14:19:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3b99c79d9dc5325f33353d3f66e7b0fb2c1cc15
X-Git-Newrev: e3debd90836ffa7f30175587e79bbcb13c7b30f5
X-Patchwork-Hint: ignore
Message-Id: <20240206132021.A58A98705B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/stmicroelectronics: generalise
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES regex
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3debd90836ffa7f30175587e79bbcb13c7b30f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The regex was a bit too strict in which characters it allowed. Thus,
if e.g. a file name appears in the
BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES string, it no
longer matches, and we end up with an empty ATF_VARIABLES. This makes
the subsequent grep fail, and the post-image.sh script fails without
any error message (thanks to the -e option).

Simplify the regex to match everything except the closing quotation
mark. Note that Kconfig doesn't allow quotation marks at all inside a
string (even escaped ones), so this regular expression is always OK.

Signed-off-by: Marleen Vos <marleen.vos@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/stmicroelectronics/common/stm32mp157/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/common/stm32mp157/post-image.sh b/board/stmicroelectronics/common/stm32mp157/post-image.sh
index 65809e46a4..0cf52f4564 100755
--- a/board/stmicroelectronics/common/stm32mp157/post-image.sh
+++ b/board/stmicroelectronics/common/stm32mp157/post-image.sh
@@ -8,7 +8,7 @@
 #
 atf_image()
 {
-	ATF_VARIABLES="$(sed -n 's/^BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="\([\/a-zA-Z0-9_=. \-]*\)"$/\1/p' ${BR2_CONFIG})"
+	ATF_VARIABLES="$(sed -n 's/^BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="\([^\"]*\)"$/\1/p' ${BR2_CONFIG})"
 	# make sure DTB_FILE_NAME is set
 	printf '%s\n' "${ATF_VARIABLES}" | grep -Eq 'DTB_FILE_NAME=[0-9A-Za-z_\-]*'
 	# extract the value
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
