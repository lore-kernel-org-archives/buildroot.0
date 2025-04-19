Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1193DC369D1
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 15:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE0DC80A9C;
	Sat, 19 Apr 2025 15:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcBdOVuOYgYv; Sat, 19 Apr 2025 15:10:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CC4C81466
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CC4C81466;
	Sat, 19 Apr 2025 15:10:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AB9422F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58A8E606B8
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSkVJ02BwIbS for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 15:10:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9152E6071E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9152E6071E
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:10:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D14585BED; Sat, 19 Apr 2025 15:10:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 17:10:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a14ae70918764d8c85555767b5de6040133242b6
X-Git-Newrev: a1012b363a286125978de529eacf9d187d95907f
X-Patchwork-Hint: ignore
Message-Id: <20250419151032.5D14585BED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/git: use FOO_DL_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1012b363a286125978de529eacf9d187d95907f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The manual states that FOO_DL_OPTS are valid for all the different
download backends, but that is not the case: at least the git backend
does not use them (it does not fail, it just ignores them).

Accept FOO_DL_OPTS in the git backend, and pass them to 'git fetch'.
There is no way that we can pass such options to submodules or lfs,
though.

Update the manual accordingly.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-generic.adoc | 4 +++-
 support/download/git                     | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index f0b0508f53..7e2e066c16 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -270,7 +270,9 @@ not and can not work as people would expect it should:
   server-side checking for user logins and passwords, or to use a proxy.
   All download methods valid for +LIBFOO_SITE_METHOD+ are supported;
   valid options depend on the download method (consult the man page
-  for the respective download utilities).
+  for the respective download utilities). For git, +FOO_DL_OPTS+ will
+  only be passed to `git fetch` and no other git command (esp. not to
+  `git lfs fetch` or `git submodule update`).
 
 * +LIBFOO_EXTRA_DOWNLOADS+ is a space-separated list of additional
   files that Buildroot should download. If an entry contains +://+
diff --git a/support/download/git b/support/download/git
index 8123bc3153..fdc00607cc 100755
--- a/support/download/git
+++ b/support/download/git
@@ -133,8 +133,8 @@ fi
 _git remote set-url origin "'${uri}'"
 
 printf "Fetching all references\n"
-_git fetch origin
-_git fetch origin -t -f
+_git fetch "${@}" origin
+_git fetch "${@}" origin -t -f
 
 # Try to get the special refs exposed by some forges (pull-requests for
 # github, changes for gerrit...). There is no easy way to know whether
@@ -143,7 +143,7 @@ _git fetch origin -t -f
 # below, if there is an issue anyway. Since most of the cset we're gonna
 # have to clone are not such special refs, consign the output to oblivion
 # so as not to alarm unsuspecting users, but still trace it as a warning.
-if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
+if ! _git fetch "${@}" origin "'${cset}:${cset}'" >/dev/null 2>&1; then
     printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
 fi
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
