Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD10EE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26FD940BA4;
	Mon, 21 Aug 2023 20:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26FD940BA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QmjIvWhxxK4Q; Mon, 21 Aug 2023 20:06:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FD4540BC2;
	Mon, 21 Aug 2023 20:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FD4540BC2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A9A61BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 675F441529
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 675F441529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hhRgbVMbZ_CF for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7096410A1
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7096410A1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE03886026; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 17:12:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8382f0eb41bc12098f032c12781fb488aa63d901
X-Git-Newrev: 8b1bc64d924e386466d715637a4a09228322beef
X-Patchwork-Hint: ignore
Message-Id: <20230821200123.AE03886026@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] less: use default "make
 install" behavior
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b1bc64d924e386466d715637a4a09228322beef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The less package currently installs only the "less" binary, rather
than running the default "make install" behavior from the autotools
build system.

However, at least another binary, "lessecho" is needed for the "s"
command in less to work properly: so in that sense this commit is
fixing a broken behavior.

Since the less installation only installs 3 programs, "less",
"lessopen" and "lesskey", there is no good reason to not use the
default installation command, which we do in this commit.

Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>
[Thomas: rework commit message]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/less/less.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/less/less.mk b/package/less/less.mk
index 91ce08f4f0..f7211ef112 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -11,8 +11,4 @@ LESS_LICENSE_FILES = COPYING
 LESS_CPE_ID_VENDOR = gnu
 LESS_DEPENDENCIES = ncurses
 
-define LESS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 $(@D)/less $(TARGET_DIR)/usr/bin/less
-endef
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
