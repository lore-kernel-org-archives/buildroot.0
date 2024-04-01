Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31877CD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 18:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB84E406D0;
	Mon,  1 Apr 2024 18:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnu-uKj2_YW4; Mon,  1 Apr 2024 18:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB08C406D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB08C406D8;
	Mon,  1 Apr 2024 18:48:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B9AD1BF28E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38C0081A8E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tu_DDvuq83Mo for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 18:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54634817AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54634817AC
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 18:48:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BF0284735; Mon,  1 Apr 2024 18:48:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 17:03:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d69e13b0e965961019b4aab38e187267af3cab78
X-Git-Newrev: ebbcf5a0a752519efffeba432f347b49950b1f16
X-Patchwork-Hint: ignore
Message-Id: <20240401184812.3BF0284735@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/mkusers: fix UID/GID
 confusion
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebbcf5a0a752519efffeba432f347b49950b1f16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 41ea61d59c3e (support/scripts/mkusers: allow option for system
uid/gid) confused GID and UID variables: the GID limits were used to
create UIDs.

Fix that.

Note that this fixes a shellcheck error; although there are many more
shellcheck errors, these fixes are semantically a bug that need to be
fixed separately from the coding style issues reported by shellcheck.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/mkusers | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index 4fc06f8fdf..d786943cf8 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -324,9 +324,9 @@ add_one_user() {
 
     # Generate a new UID if needed
     if [ ${uid} -eq ${AUTO_USER_ID} ]; then
-        uid="$( generate_uid "${username}" $FIRST_USER_GID $LAST_USER_GID )"
+        uid="$( generate_uid "${username}" $FIRST_USER_UID $LAST_USER_UID )"
     elif [ ${uid} -eq ${AUTO_SYSTEM_ID} ]; then
-        uid="$( generate_uid "${username}" $FIRST_SYSTEM_GID $LAST_SYSTEM_GID )"
+        uid="$( generate_uid "${username}" $FIRST_SYSTEM_UID $LAST_SYSTEM_UID )"
     fi
 
     # Remove any previous instance of this user
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
