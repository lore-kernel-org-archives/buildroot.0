Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA7EEC8733
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C785F822DB;
	Thu,  7 Sep 2023 15:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C785F822DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xuB7rByNYos; Thu,  7 Sep 2023 15:03:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDA558146F;
	Thu,  7 Sep 2023 15:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDA558146F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32B5C1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEF6241DC5
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEF6241DC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0t-pgDccO6p for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0147F41D81
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0147F41D81
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F380786A1E; Thu,  7 Sep 2023 14:51:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 16:35:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 223596c75d73a7eb29152235d3c5d9bf53bd58f5
X-Git-Newrev: 206d08c04a0bb8e7d03a672a322a4c30c2b0dde8
X-Patchwork-Hint: ignore
Message-Id: <20230907145125.F380786A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download: fix shellcheck errors in
 svn backend
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=206d08c04a0bb8e7d03a672a322a4c30c2b0dde8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bizarrely enough, the unquoted expansion of ${quiet} does not trigger
any warning from shellcheck, so we do not add any exception for it.

${SVN} can contain more than one item, but we don't care about splitting
on spaces when we just print it for debug, so we can just quote it
rather than add an exception.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore  | 1 -
 support/download/svn | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f5c4f807e7..429776af25 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1651,7 +1651,6 @@ support/download/go-post-process Shellcheck
 support/download/hg Shellcheck
 support/download/scp Shellcheck
 support/download/sftp Shellcheck
-support/download/svn Shellcheck
 support/download/wget Shellcheck
 support/gnuconfig/update Shellcheck
 support/libtool/buildroot-libtool-v1.5.patch ApplyOrder Sob Upstream
diff --git a/support/download/svn b/support/download/svn
index b23b7773d3..d9325b7478 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -20,6 +20,7 @@ set -e
 # Environment:
 #   SVN      : the svn command to call
 
+# shellcheck disable=SC1090 # Only provides mk_tar_gz()
 . "${0%/*}/helpers"
 
 quiet=
@@ -41,12 +42,13 @@ shift $((OPTIND-1)) # Get rid of our options
 # being expanded a second time (in case there are spaces in them)
 _svn() {
     if [ -z "${quiet}" ]; then
-        printf '%s ' ${SVN} "${@}"; printf '\n'
+        printf '%s ' "${SVN}" "${@}"; printf '\n'
     fi
     _plain_svn "$@"
 }
 # Note: please keep command below aligned with what is printed above
 _plain_svn() {
+    # shellcheck disable=SC2086 # We want word-splitting for SVN
     eval ${SVN} "${@}"
 }
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
