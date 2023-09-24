Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F07BCE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 16:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47C2241600;
	Sun, 24 Sep 2023 16:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47C2241600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Trw4OGb0tkBa; Sun, 24 Sep 2023 16:07:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46D5041775;
	Sun, 24 Sep 2023 16:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46D5041775
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 550EA1BF3BB
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BE1D60760
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BE1D60760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ti80cwTNDAyX for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 16:07:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65CC960759
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 16:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65CC960759
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 561E6875AB; Sun, 24 Sep 2023 16:07:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 17:58:48 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d3c18718c1b44bfbffc85a56ec71fd86d56796c8
X-Git-Newrev: 76a487ac946848833dda268e3d89784a9031d223
X-Patchwork-Hint: ignore
Message-Id: <20230924160736.561E6875AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] support/download/git:
 properly catch failures
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

commit: https://git.buildroot.net/buildroot/commit/?id=76a487ac946848833dda268e3d89784a9031d223
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Since commit b7efb43e86da (download/git: try to recover from
utterly-broken repositories), we catch errors through an ERR
trap, so we can try and recover from a broken repository. In
that commit, we switched from using "set -e" to "set -E", so
that trap is inherited in functions, command substitutions,
and subshells.

However, the trap is not defined until we have parsed the
options, created the cache directory, and eventually chdir()ed
into it. Athough improbable, it is possible for the git helper
to fail in any of those steps, and that would not get caught.

Fix that

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit daa341cb9bc82d8bcb175c46da1ba80fd9203a98)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/git | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/download/git b/support/download/git
index 1a1c315f73..729c553f8f 100755
--- a/support/download/git
+++ b/support/download/git
@@ -5,8 +5,8 @@
 # (e.g. tar options, compression ratio or method)), we MUST update the format
 # version in the variable BR_FMT_VERSION_git, in package/pkg-download.mk.
 
-# We want to catch any unexpected failure, and exit immediately
-set -E
+# We want to catch any unexpected failure
+set -e
 
 # Download helper for git, to be called from the download wrapper script
 #
@@ -77,6 +77,7 @@ pushd "${git_cache}" >/dev/null
 
 # Any error now should try to recover
 trap _on_error ERR
+set -E
 
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
