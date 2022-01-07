Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C17FC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E07ED60A98;
	Fri,  7 Jan 2022 18:07:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kdvoAHdizw5x; Fri,  7 Jan 2022 18:07:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42A9D60A88;
	Fri,  7 Jan 2022 18:07:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E76A1BF5E9
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D60A81338
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id givG6Y9-3_g7 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A1308132A
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:07:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1E5F283493; Fri,  7 Jan 2022 18:01:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 19:06:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc91d35da7a04d8d28b20ba4ca32672a2dd1c736
X-Git-Newrev: 338b2e58d46ac32ded7877e2f211515024bd881a
X-Patchwork-Hint: ignore
Message-Id: <20220107180129.1E5F283493@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/git: add missing "git lfs
 install" invocation for LFS support
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

commit: https://git.buildroot.net/buildroot/commit/?id=338b2e58d46ac32ded7877e2f211515024bd881a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original patch for commit cff428fe31 ("download/git: support Git
LFS") included a call to "git lfs install" but this was a problem as it
could modify ~/.gitconfig outside the dl/ tree.  When this was
updated it was thought that the modification to gitconfig was
unnecessary because the LFS fetch and checkout steps are performed
manually.

Unfortunately, this is not correct and the LFS checkout fails with:

	Cannot checkout LFS objects, Git LFS is not installed.

Add the call to "git lfs install", with the --local option so that only
the repository's .git/config is modified and not the user's global
~/.gitconfig.

This is also required for submodules as the parent repository's config
is not inherited.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/git | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/download/git b/support/download/git
index 41c3160099..1a1c315f73 100755
--- a/support/download/git
+++ b/support/download/git
@@ -209,10 +209,12 @@ fi
 
 # If there are large files then fetch them.
 if [ ${large_file} -eq 1 ]; then
+    _git lfs install --local
     _git lfs fetch
     _git lfs checkout
     # If there are also submodules, recurse into them,
     if [ ${recurse} -eq 1 ]; then
+        _git submodule foreach --recursive ${GIT} lfs install --local
         _git submodule foreach --recursive ${GIT} lfs fetch
         _git submodule foreach --recursive ${GIT} lfs checkout
     fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
