Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6596C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06C3A413C4;
	Tue,  4 Feb 2025 14:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sn_zbo0xkH6Z; Tue,  4 Feb 2025 14:35:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFEDD41693
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFEDD41693;
	Tue,  4 Feb 2025 14:35:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B74812A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39D17813A7
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmYklvdvqBb5 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7020281395
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7020281395
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F49786D3A; Tue,  4 Feb 2025 14:35:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 15:17:15 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 6be96dee22ab948c246e23dba88be3d7cc1c48f5
X-Git-Newrev: 09c243a8348bf82dc92525f5a87d5faa92044045
X-Patchwork-Hint: ignore
Message-Id: <20250204143535.5F49786D3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/uemacs: fix call
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

commit: https://git.buildroot.net/buildroot/commit/?id=09c243a8348bf82dc92525f5a87d5faa92044045
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

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
