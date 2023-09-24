Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F8FCE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 16:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A73C241710;
	Sun, 24 Sep 2023 16:07:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A73C241710
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aDYO4aw8GwX9; Sun, 24 Sep 2023 16:07:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7179E416A2;
	Sun, 24 Sep 2023 16:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7179E416A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C118C1BF947
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A89A140962
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A89A140962
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RxUrFIvfRIlC for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 16:06:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99E8740A52
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 16:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99E8740A52
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87C8887594; Sun, 24 Sep 2023 16:06:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 17:56:15 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 53b78df10fc7e9adaff597ed74487df3313ec5ba
X-Git-Newrev: 424a575cde64fe4d594930d5ef62e6f79b97b5c4
X-Patchwork-Hint: ignore
Message-Id: <20230924160627.87C8887594@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] support/download/git:
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

commit: https://git.buildroot.net/buildroot/commit/?id=424a575cde64fe4d594930d5ef62e6f79b97b5c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
