Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D21C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08DB9607B4;
	Tue, 26 Jul 2022 21:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08DB9607B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uz-8Xl0dWg0y; Tue, 26 Jul 2022 21:30:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1F71607A8;
	Tue, 26 Jul 2022 21:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1F71607A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9649D1BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7112F607A8
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7112F607A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FMZ4HOZvlPbb for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:30:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCA836079D
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCA836079D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2C8AC8632B; Tue, 26 Jul 2022 21:16:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 23:11:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 558d62490b4486f47248c63aa0eceaaa27e3069c
X-Git-Newrev: 235acd628a6e23e3ec79a758e1ae4a7558ecf07e
X-Patchwork-Hint: ignore
Message-Id: <20220726211651.2C8AC8632B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: handle white spaces in sysroot
 dir in copy_toolchain_sysroot
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

commit: https://git.buildroot.net/buildroot/commit/?id=235acd628a6e23e3ec79a758e1ae4a7558ecf07e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When changing permissions on all directories in the staging directory,
after copying sysroot, paths that contain spaces break the call to
chmod.

With -print0 for find and -0 for xargs white spaces are correctly
interpreted.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
