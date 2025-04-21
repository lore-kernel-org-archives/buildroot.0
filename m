Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D092C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C3E360B2D;
	Mon, 21 Apr 2025 21:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfyftPh92fDf; Mon, 21 Apr 2025 21:52:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F0FF60B3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F0FF60B3C;
	Mon, 21 Apr 2025 21:52:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57A2D1BC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 499C881090
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XE9hMheao-dC for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:52:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CF4181086
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CF4181086
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:52:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 885518609F; Mon, 21 Apr 2025 21:52:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 23:52:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cca8d68461e6b49b4751dd4134fb8d574e5192db
X-Git-Newrev: 3ffdcc5b9db2a703259f900fdc8251c4e0d14dfb
X-Patchwork-Hint: ignore
Message-Id: <20250421215230.885518609F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: save shell history only
 on exit
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ffdcc5b9db2a703259f900fdc8251c4e0d14dfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Both busybox.config and busybox-minimal.config set
CONFIG_FEATURE_EDITING_SAVEHISTORY=y. This causes the Busybox shell to
write the history file after every command, which can be a problem on
storage with limited write cycles (e.g. eMMC).

Set CONFIG_FEATURE_EDITING_SAVE_ON_EXIT=y to change behavior to write
the history file only on exit, which reduces writes without losing the
history feature.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/busybox-minimal.config | 2 +-
 package/busybox/busybox.config         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 9733dd2156..1e4b404479 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -105,7 +105,7 @@ CONFIG_FEATURE_EDITING_MAX_LEN=1024
 CONFIG_FEATURE_EDITING_VI=y
 CONFIG_FEATURE_EDITING_HISTORY=999
 CONFIG_FEATURE_EDITING_SAVEHISTORY=y
-# CONFIG_FEATURE_EDITING_SAVE_ON_EXIT is not set
+CONFIG_FEATURE_EDITING_SAVE_ON_EXIT=y
 CONFIG_FEATURE_REVERSE_SEARCH=y
 CONFIG_FEATURE_TAB_COMPLETION=y
 # CONFIG_FEATURE_USERNAME_COMPLETION is not set
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 69d896bebd..823fcd2b46 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -108,7 +108,7 @@ CONFIG_FEATURE_EDITING_MAX_LEN=1024
 CONFIG_FEATURE_EDITING_VI=y
 CONFIG_FEATURE_EDITING_HISTORY=999
 CONFIG_FEATURE_EDITING_SAVEHISTORY=y
-# CONFIG_FEATURE_EDITING_SAVE_ON_EXIT is not set
+CONFIG_FEATURE_EDITING_SAVE_ON_EXIT=y
 CONFIG_FEATURE_REVERSE_SEARCH=y
 CONFIG_FEATURE_TAB_COMPLETION=y
 # CONFIG_FEATURE_USERNAME_COMPLETION is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
