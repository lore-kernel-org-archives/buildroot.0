Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BC6EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5583B4051B;
	Sun, 10 Sep 2023 21:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5583B4051B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kePNeYjDKkUL; Sun, 10 Sep 2023 21:53:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 941B440ACE;
	Sun, 10 Sep 2023 21:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 941B440ACE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1AAF1BF573
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AB4A40351
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AB4A40351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uHDj1sb6KY6r for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:53:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B5944034C
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B5944034C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6799E86BFD; Sun, 10 Sep 2023 21:53:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 23:50:40 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: bf06180dc8718b755dc2347d30cdd76508d2acc2
X-Git-Newrev: f16afb8d9f2b410fcb190874b59971fef16dfeca
X-Patchwork-Hint: ignore
Message-Id: <20230910215342.6799E86BFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] less: use default "make
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f16afb8d9f2b410fcb190874b59971fef16dfeca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit 8b1bc64d924e386466d715637a4a09228322beef)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/less/less.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/less/less.mk b/package/less/less.mk
index f01f94d6c8..2c68ac5a11 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -14,8 +14,4 @@ LESS_DEPENDENCIES = ncurses
 # 0001-End-OSC8-hyperlink-on-invalid-embedded-escape-sequence.patch
 LESS_IGNORE_CVES += CVE-2022-46663
 
-define LESS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 $(@D)/less $(TARGET_DIR)/usr/bin/less
-endef
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
