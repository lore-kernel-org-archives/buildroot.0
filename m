Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6676C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 14:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27A2D60AF2;
	Wed, 29 Dec 2021 14:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T76UctnLeNtL; Wed, 29 Dec 2021 14:38:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BDB660A87;
	Wed, 29 Dec 2021 14:38:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC3751BF3A6
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 14:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C99EA40204
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 14:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l4KXvY5OT4iT for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 14:38:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD904400CD
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 14:38:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 94CF5200005;
 Wed, 29 Dec 2021 14:38:47 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Wed, 29 Dec 2021 15:38:42 +0100
Message-Id: <20211229143843.1271981-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/scripts/generate-gitlab-ci-yml: make it
 possible to test multiple defconfigs
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Already supported:

 - Pushing a branch called "<foo>-defconfigs" tests all defconfigs.

 - Pushing a branch called "<foo>-defconfig-<defconfig-name>" will
   test one particular defconfig

This commit adds support for:

 - Pushing a branch called "<foo>-defconfigs-<pattern>" which will
   test all defconfigs whose name start with the pattern. For example
   "<foo>-defconfigs-qemu_" will test all Qemu defconfigs

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Ideally, this should be documented in the Buildroot manual, but I'm
not sure where it should be documented.
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
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
