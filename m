Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E805BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 17:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB0D960B7B;
	Thu, 30 Dec 2021 17:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJtNJNbxMlMY; Thu, 30 Dec 2021 17:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DDC260B8A;
	Thu, 30 Dec 2021 17:42:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 067721BF3C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E93854030F
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JpD0hMZG-ajZ for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 17:42:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D04640205
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 17:42:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DAA9B82DE9; Thu, 30 Dec 2021 17:36:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 18:41:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 029a3c3ed7d84f26e7f2d5726aeb46af797fda5d
X-Git-Newrev: 65d2f04c012af492a9b9da04dfa3b3cbd20347f1
X-Patchwork-Hint: ignore
Message-Id: <20211230173607.DAA9B82DE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/generate-gitlab-ci-yml:
 make it possible to test multiple defconfigs
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

commit: https://git.buildroot.net/buildroot/commit/?id=65d2f04c012af492a9b9da04dfa3b3cbd20347f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Already supported:

 - Pushing a branch called "<foo>-defconfigs" tests all defconfigs.

 - Pushing a branch called "<foo>-defconfig-<defconfig-name>" will
   test one particular defconfig

This commit adds support for:

 - Pushing a branch called "<foo>-defconfigs-<pattern>" which will
   test all defconfigs whose name start with the pattern. For example
   "<foo>-defconfigs-qemu_" will test all Qemu defconfigs

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/generate-gitlab-ci-yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 8aaa456b03..3e0c68091b 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -66,6 +66,11 @@ gen_tests() {
           (*-defconfigs)
             do_defconfigs=base
             ;;
+	  (*-defconfigs-*)
+            pattern=$(echo ${CI_COMMIT_REF_NAME} | sed 's%[^\-]*-defconfigs-\(.*\)%\1%')
+            defconfigs=( $(cd configs; LC_ALL=C ls -1 | grep ^${pattern}) )
+            do_defconfigs=base
+            ;;
           (*-*_defconfig)
             defconfigs=( "${CI_COMMIT_REF_NAME##*-}" )
             do_defconfigs=base
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
