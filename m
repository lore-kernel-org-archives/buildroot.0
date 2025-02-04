Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F30CC02196
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F227D60FDB;
	Tue,  4 Feb 2025 14:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdYfTOERBf3P; Tue,  4 Feb 2025 14:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06A3A60FE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06A3A60FE3;
	Tue,  4 Feb 2025 14:36:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7362112A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 330E460FDB
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2IIFzDKN9LL for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E89260FEE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E89260FEE
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:36:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C59586D67; Tue,  4 Feb 2025 14:36:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 15:16:53 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 86d4ef1d877fc236071c9cf9b16736dd76ed16d6
X-Git-Newrev: c4a75ea14d4c8a8566404ca3b9dfc12782f3ed3e
X-Patchwork-Hint: ignore
Message-Id: <20250204143642.4C59586D67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/uemacs: fix call
 to cuserid
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4a75ea14d4c8a8566404ca3b9dfc12782f3ed3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

cuserid is deprecated and breaks the compilation on some new toolchains.
This patch fixes this issue.

Fixes:
    #81

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a141b117e0c02a6742ce2df3e28d00df2e364be3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uemacs/02-Replace-cuserid.patch | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/uemacs/02-Replace-cuserid.patch b/package/uemacs/02-Replace-cuserid.patch
new file mode 100644
index 0000000000..0e7eaf371f
--- /dev/null
+++ b/package/uemacs/02-Replace-cuserid.patch
@@ -0,0 +1,34 @@
+From 289ccf8f0e77ae4f240eca988eb3a6ac19afbae9 Mon Sep 17 00:00:00 2001
+From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+Date: Fri, 17 Jan 2025 22:10:41 +0100
+Subject: [PATCH] Replace cuserid
+
+cuserid has been removed from some toolchains and is no longer in the
+POSIX standard since 1990. getlogin has been in the standard since 2001.
+
+This commit uncomments the call to getlogin and thus replaces cuserid
+with getlogin.
+
+Upstream: https://github.com/torvalds/uemacs/pull/46
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+---
+ pklock.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/pklock.c b/pklock.c
+index dc30b76..5f4865b 100644
+--- a/pklock.c
++++ b/pklock.c
+@@ -80,8 +80,7 @@ char *dolock(char *fname)
+ 	}
+ 	if ((n = read(fd, locker, MAXNAME)) < 1) {
+ 		lseek(fd, 0, SEEK_SET);
+-/*		strcpy(locker, getlogin()); */
+-		cuserid(locker);
++		strcpy(locker, getlogin());
+ 		strcat(locker + strlen(locker), "@");
+ 		gethostname(locker + strlen(locker), 64);
+ 		write(fd, locker, strlen(locker));
+-- 
+2.48.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
