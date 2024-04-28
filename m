Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9BDC4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 19:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3EE860790;
	Sun, 28 Apr 2024 19:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2yOWNiF_njY; Sun, 28 Apr 2024 19:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B867160768
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B867160768;
	Sun, 28 Apr 2024 19:47:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C33C91BF3DB
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B446B81F8A
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tClJynbxFFfF for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 19:46:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F22A081F93
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F22A081F93
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2D2986230; Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 21:44:20 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3c2463c9cf50dd32930f0d577a5863da99eb2921
X-Git-Newrev: 96987026159c38af566d7f19d9b9bcf1c96cec97
X-Patchwork-Hint: ignore
Message-Id: <20240428194630.A2D2986230@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/scripts/mkusers:
 fix UID/GID confusion
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

commit: https://git.buildroot.net/buildroot/commit/?id=96987026159c38af566d7f19d9b9bcf1c96cec97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit ebbcf5a0a752519efffeba432f347b49950b1f16)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
