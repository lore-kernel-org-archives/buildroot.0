Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A92C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 13:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 185D9402EB;
	Sun,  9 Jan 2022 13:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mXLo7MYy4S4Q; Sun,  9 Jan 2022 13:09:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 080B140503;
	Sun,  9 Jan 2022 13:09:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE0321BF4D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB48E40354
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wPdLPuEOAkz4 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 13:08:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0278E402BF
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 13:08:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6DD2D82B94; Sun,  9 Jan 2022 13:02:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 14:04:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97eb7d0c131feb060a6f55fffbcda8a82c9b5bb1
X-Git-Newrev: 92297637d7e408be927c6ca5994751549eba7bf7
X-Patchwork-Hint: ignore
Message-Id: <20220109130244.6DD2D82B94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openrc: add patch to create
 /run/lock/subsys
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

commit: https://git.buildroot.net/buildroot/commit/?id=92297637d7e408be927c6ca5994751549eba7bf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Together with changes to sysv/busybox init, this directory
will already exist on all init systems before any service
scripts are run.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...006-Also-create-run-lock-subsys-directory.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/openrc/0006-Also-create-run-lock-subsys-directory.patch b/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
new file mode 100644
index 0000000000..cf592a88b0
--- /dev/null
+++ b/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
@@ -0,0 +1,29 @@
+From 49e5929b468f604d80a0c04a6ce78eb96ca36090 Mon Sep 17 00:00:00 2001
+From: Norbert Lange <nolange79@gmail.com>
+Date: Sun, 9 Jan 2022 00:22:40 +0100
+Subject: [PATCH] Also create /run/lock/subsys directory
+
+Buildroot service scripts regularly use this directory, so
+create it in the most appropriate spot.
+
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+---
+ sh/init.sh.Linux.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sh/init.sh.Linux.in b/sh/init.sh.Linux.in
+index e8afc1fb..662ab223 100644
+--- a/sh/init.sh.Linux.in
++++ b/sh/init.sh.Linux.in
+@@ -82,7 +82,7 @@ elif ! mountinfo -q /run; then
+ fi
+ 
+ checkpath -d "$RC_SVCDIR"
+-checkpath -d -m 0775 -o root:daemon /run/lock
++checkpath -d -m 0775 -o root:daemon /run/lock /run/lock/subsys
+ 
+ # Try to mount xenfs as early as possible, otherwise rc_sys() will always
+ # return RC_SYS_XENU and will think that we are in a domU while it's not.
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
