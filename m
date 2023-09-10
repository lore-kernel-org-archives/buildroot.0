Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2868CC71153
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4833409C8;
	Sun, 10 Sep 2023 21:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4833409C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhNR7U9_n5LI; Sun, 10 Sep 2023 21:54:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEBD54059B;
	Sun, 10 Sep 2023 21:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEBD54059B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C75411BF573
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0AE560B06
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0AE560B06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dG-o1f7OIbAm for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:54:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 831AE60797
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 831AE60797
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72E8186C04; Sun, 10 Sep 2023 21:54:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 23:50:13 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 072e6d0cffb12ab288fe5883cc60e10bc51f7197
X-Git-Newrev: 00316d993a186b96f4f643cfe246247a3c34d17d
X-Patchwork-Hint: ignore
Message-Id: <20230910215455.72E8186C04@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] less: use default "make
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

commit: https://git.buildroot.net/buildroot/commit/?id=00316d993a186b96f4f643cfe246247a3c34d17d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
index dfbd411863..c4049c074a 100644
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
