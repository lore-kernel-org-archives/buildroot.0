Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E350C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CDC540148;
	Sat,  8 Jan 2022 15:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X-cNwHaUkL2z; Sat,  8 Jan 2022 15:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50D3140177;
	Sat,  8 Jan 2022 15:16:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7ECED1BF95E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D992814B7
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2fORZxcRtzO for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:15:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC2FA813E2
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:15:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 43E1182DF2; Sat,  8 Jan 2022 15:09:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 15:48:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7244efa8284627412a0385d9f07c2110717ee2c
X-Git-Newrev: b1cc6061fd368b987d8b03e63cd06a1f792492e3
X-Patchwork-Hint: ignore
Message-Id: <20220108150928.43E1182DF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/generate-gitlab-ci-yml:
 ignore branch name prefix <foo> containing a single hyphen
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1cc6061fd368b987d8b03e63cd06a1f792492e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit [1] added a sed command used to retreive a pattern
to keep only defconfigs whose name start with the pattern.

"<foo>-defconfigs-<pattern>"

The sed command doesn't work as expected if <foo> contains a
single hyphen [2]:

"qemu-6.2.0-defconfigs-qemu"

Update the sed command to ignore completely the part before
"-defconfigs-".

[1] 65d2f04c012af492a9b9da04dfa3b3cbd20347f1
[2] http://lists.busybox.net/pipermail/buildroot/2022-January/632507.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/generate-gitlab-ci-yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 3e0c68091b..bd79807914 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -66,8 +66,8 @@ gen_tests() {
           (*-defconfigs)
             do_defconfigs=base
             ;;
-	  (*-defconfigs-*)
-            pattern=$(echo ${CI_COMMIT_REF_NAME} | sed 's%[^\-]*-defconfigs-\(.*\)%\1%')
+          (*-defconfigs-*)
+            pattern=$(echo ${CI_COMMIT_REF_NAME} | sed 's%^.*-defconfigs-\(.*\)%\1%')
             defconfigs=( $(cd configs; LC_ALL=C ls -1 | grep ^${pattern}) )
             do_defconfigs=base
             ;;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
