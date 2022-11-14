Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D4CC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 15:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A241408C4;
	Mon, 14 Nov 2022 15:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A241408C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJaBJ3zmqy10; Mon, 14 Nov 2022 15:52:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C09A3415D7;
	Mon, 14 Nov 2022 15:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C09A3415D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0752C1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 15:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5C6D408C4
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 15:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5C6D408C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Yj5mgZDjobU for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 15:51:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAB49408AD
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 15:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAB49408AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C121083951; Mon, 14 Nov 2022 15:51:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 16:30:18 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 779681a530da511589dc5f577ff825205c7dbf47
X-Git-Newrev: a91cc9e565b805a2744b3865a42c7cb31dc64982
X-Patchwork-Hint: ignore
Message-Id: <20221114155133.C121083951@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/swupdate: specify
 SWU_VER during build
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

commit: https://git.buildroot.net/buildroot/commit/?id=a91cc9e565b805a2744b3865a42c7cb31dc64982
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

The swupdate build process uses SWU_VER as part of the build commandline
for compiling objects to define the value for use in globals.h (see also
Makefile.flags).

This value is also used to communicate capabilities to lua handlers
(see upstream 0f38ff186e76c55c8d00ccb53739a29bcca91445).

When swupdate gets built, SWU_VER defaults to using `git describe` to
determine the version. This, unfortunately, picks up the version of the
Buildroot checkout and not the actual version of swupdate.

Now, specify SWU_VER as part of the make options to override the
calculated value so the proper version is reported.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0b4a9930124f7fb4c7bfae281db900905006a2da)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index b2f50d2b71..2f618b2e79 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -209,6 +209,7 @@ SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
 SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 
 SWUPDATE_MAKE_OPTS = \
+	SWU_VER="$(SWUPDATE_VERSION) (Buildroot $(BR2_VERSION_FULL))"
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
 	CONFIG_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
