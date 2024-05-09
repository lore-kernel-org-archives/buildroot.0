Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18096C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC79F613BC;
	Thu,  9 May 2024 20:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6rPADtREu_U; Thu,  9 May 2024 20:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55D96613C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55D96613C7;
	Thu,  9 May 2024 20:47:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0962E1BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4200241FE0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6J9KfQM3NX1P for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25F5E41FD6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25F5E41FD6
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:46:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 218D386ADA; Thu,  9 May 2024 20:46:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:45:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc71274a347df1168efb0dc0bf77a0600fddda69
X-Git-Newrev: 72bcff308164db81341e37053d7817339f6bf67c
X-Patchwork-Hint: ignore
Message-Id: <20240509204629.218D386ADA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download: force fetching tags
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=72bcff308164db81341e37053d7817339f6bf67c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our git download backend switches the remote of our local clone, and
fetches all refs and tags from that remote.

When the local clone has a tag fetched from another remote, and the new
remote also has a tag by the same name, and that tag points to another
commit, then git refuses to fetch the new tag and exits in error, as it
considers that the new tag would clobber the existing one. This is safe
and sane behaviour when run interactively with a human that can take a
decision.

However, in our case, we don't care about any tags that were present
before, as only the last one makes sense in our case: the one from the
remote the user has requested for the current build.

Tell git to forcefully pull tags, even if they would clobber existing
ones.

Note that, although this changes the git backend, it does not change the
content of generated archives, so we do not need to bump the suffix
version.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 8134c07214..d49016e90c 100755
--- a/support/download/git
+++ b/support/download/git
@@ -132,7 +132,7 @@ _git remote set-url origin "'${uri}'"
 
 printf "Fetching all references\n"
 _git fetch origin
-_git fetch origin -t
+_git fetch origin -t -f
 
 # Try to get the special refs exposed by some forges (pull-requests for
 # github, changes for gerrit...). There is no easy way to know whether
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
