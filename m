Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E30C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 15:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1493822D7;
	Sun, 10 Aug 2025 15:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id toNdVHSUUwcU; Sun, 10 Aug 2025 15:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07D15822D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07D15822D8;
	Sun, 10 Aug 2025 15:25:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DAA2154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F310840D8E
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XjzIOlHpaJpA for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 15:25:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 293D140ABA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 293D140ABA
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:25:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FFB687075; Sun, 10 Aug 2025 15:25:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 17:21:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92a244ba8bf1a80dba746dbb6b7ab0a45b1dd375
X-Git-Newrev: 34a3a1ee8b82b9b6aebbc73da9efabef0bbc38aa
X-Patchwork-Hint: ignore
Message-Id: <20250810152544.1FFB687075@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: Fix build with
 glibc-2.42
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6444785264862188971=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6444785264862188971==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=34a3a1ee8b82b9b6aebbc73da9efabef0bbc38aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch to fix build with glibc-2.42.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../nfs-utils/0001-Fix-build-with-glibc-2.42.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/nfs-utils/0001-Fix-build-with-glibc-2.42.patch b/package/nfs-utils/0001-Fix-build-with-glibc-2.42.patch
new file mode 100644
index 0000000000..6bf3622586
--- /dev/null
+++ b/package/nfs-utils/0001-Fix-build-with-glibc-2.42.patch
@@ -0,0 +1,59 @@
+From 9f974046c37b7c28705d5558328759fff708b1cb Mon Sep 17 00:00:00 2001
+From: Yaakov Selkowitz <yselkowi@redhat.com>
+Date: Fri, 27 Jun 2025 04:54:08 -0500
+Subject: Fix build with glibc-2.42
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+exportfs.c: In function ‘release_lockfile’:
+exportfs.c:83:17: error: ignoring return value of ‘lockf’ declared with attribute ‘warn_unused_result’ [-Werror=unused-result]
+   83 |                 lockf(_lockfd, F_ULOCK, 0);
+      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
+exportfs.c: In function ‘grab_lockfile’:
+exportfs.c:77:17: error: ignoring return value of ‘lockf’ declared with attribute ‘warn_unused_result’ [-Werror=unused-result]
+   77 |                 lockf(_lockfd, F_LOCK, 0);
+      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
+
+lockf is now marked with attribute warn_unused_result:
+
+https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=f3c82fc1b41261f582f5f9fa12f74af9bcbc88f9
+
+Signed-off-by: Steve Dickson <steved@redhat.com>
+
+Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=9f974046c37b7c28705d5558328759fff708b1cb
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ utils/exportfs/exportfs.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/utils/exportfs/exportfs.c b/utils/exportfs/exportfs.c
+index b03a047b..748c38e3 100644
+--- a/utils/exportfs/exportfs.c
++++ b/utils/exportfs/exportfs.c
+@@ -74,13 +74,19 @@ grab_lockfile(void)
+ {
+ 	_lockfd = open(lockfile, O_CREAT|O_RDWR, 0666);
+ 	if (_lockfd != -1)
+-		lockf(_lockfd, F_LOCK, 0);
++		if (lockf(_lockfd, F_LOCK, 0) != 0) {
++			xlog_warn("%s: lockf() failed: errno %d (%s)",
++			__func__, errno, strerror(errno));
++		}
+ }
+ static void
+ release_lockfile(void)
+ {
+ 	if (_lockfd != -1) {
+-		lockf(_lockfd, F_ULOCK, 0);
++		if (lockf(_lockfd, F_ULOCK, 0) != 0) {
++			xlog_warn("%s: lockf() failed: errno %d (%s)",
++			__func__, errno, strerror(errno));
++		}
+ 		close(_lockfd);
+ 		_lockfd = -1;
+ 	}
+-- 
+cgit v1.2.3
+

--===============6444785264862188971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6444785264862188971==--
