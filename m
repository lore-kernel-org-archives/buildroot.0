Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A34ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 06:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70B6B60F2F;
	Mon, 29 Aug 2022 06:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70B6B60F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4dNwczmmPfMS; Mon, 29 Aug 2022 06:23:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D88260F15;
	Mon, 29 Aug 2022 06:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D88260F15
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFF8D1BF32A
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 06:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A3FB41528
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 06:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A3FB41528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mrVSpzkDMcQI for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 06:22:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AA0940541
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 06:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AA0940541
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 05C2D87ED2; Mon, 29 Aug 2022 06:07:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 08:13:23 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c56da683c8edd1c7555d394d4501a8423c5fcda6
X-Git-Newrev: b6c7870bf500e4dfc33bdf2c15731b2cef618435
X-Patchwork-Hint: ignore
Message-Id: <20220829060749.05C2D87ED2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] toolchain: handle white
 spaces in sysroot dir in copy_toolchain_sysroot
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6c7870bf500e4dfc33bdf2c15731b2cef618435
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

When changing permissions on all directories in the staging directory,
after copying sysroot, paths that contain spaces break the call to
chmod.

With -print0 for find and -0 for xargs white spaces are correctly
interpreted.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 235acd628a6e23e3ec79a758e1ae4a7558ecf07e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index ef8e9a5f64..eec46d44c6 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -150,7 +150,7 @@ copy_toolchain_sysroot = \
 	if test -n "$${SUPPORT_LIB_DIR}" ; then \
 		cp -a $${SUPPORT_LIB_DIR}/* $(STAGING_DIR)/lib/ ; \
 	fi ; \
-	find $(STAGING_DIR) -type d | xargs chmod 755
+	find $(STAGING_DIR) -type d -print0 | xargs -0 chmod 755
 
 #
 # Check the specified kernel headers version actually matches the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
