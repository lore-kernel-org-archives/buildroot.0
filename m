Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B612EC352A1
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 13:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5318D60A79;
	Wed,  7 Dec 2022 13:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5318D60A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O9O5XbOOf6Xm; Wed,  7 Dec 2022 13:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7698460DB7;
	Wed,  7 Dec 2022 13:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7698460DB7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2D141BF4D8
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBA17405F5
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBA17405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qtEW6ocmUeqb for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 13:39:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B478B40156
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 13:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B478B40156
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A26F185DCF; Wed,  7 Dec 2022 13:39:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Dec 2022 14:33:59 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 0e96939212a5f4379712c57a24e2cc199f51deaf
X-Git-Newrev: c885c005cefa760e5a0e54b51ff2aac54b5df0a4
X-Patchwork-Hint: ignore
Message-Id: <20221207133943.A26F185DCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/git: security
 bump to version 2.31.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=c885c005cefa760e5a0e54b51ff2aac54b5df0a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Fixes:
 * CVE-2022-39253:
   When relying on the `--local` clone optimization, Git dereferences
   symbolic links in the source repository before creating hardlinks
   (or copies) of the dereferenced link in the destination repository.
   This can lead to surprising behavior where arbitrary files are
   present in a repository's `$GIT_DIR` when cloning from a malicious
   repository.

   Git will no longer dereference symbolic links via the `--local`
   clone mechanism, and will instead refuse to clone repositories that
   have symbolic links present in the `$GIT_DIR/objects` directory.

   Additionally, the value of `protocol.file.allow` is changed to be
   "user" by default.

 * CVE-2022-39260:
   An overly-long command string given to `git shell` can result in
   overflow in `split_cmdline()`, leading to arbitrary heap writes and
   remote code execution when `git shell` is exposed and the directory
   `$HOME/git-shell-commands` exists.

   `git shell` is taught to refuse interactive commands that are
   longer than 4MiB in size. `split_cmdline()` is hardened to reject
   inputs larger than 2GiB.

https://github.com/git/git/blob/v2.31.5/Documentation/RelNotes/2.31.5.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c1d783d4ddcda520fa8bcf4d8cd3f68eaa2188a8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 41afa83f86..af09ea817b 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  84fc20acf8fbea5cad7d5d7be0dfeb32494f1dac8e6c61675c904d1fd3d8c016  git-2.31.4.tar.xz
+sha256  dbc80f88d36fcde2c7acaaa9343cfab0f56effe9aee60e5eb00f3f36b8a619b4  git-2.31.5.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index dc587170e8..653b4f46ad 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.31.4
+GIT_VERSION = 2.31.5
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
