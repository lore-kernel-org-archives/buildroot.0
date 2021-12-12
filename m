Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E53FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18F2985A59;
	Sun, 12 Dec 2021 22:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JSiPySV_H8CJ; Sun, 12 Dec 2021 22:27:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B0A085A55;
	Sun, 12 Dec 2021 22:27:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 479921BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 190A240271
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRODL5oI6i01 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:23:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BFBE402AD
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 60A71836B8; Sun, 12 Dec 2021 22:18:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:12:38 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: abf7c453d828f4bd187ad09347d422db715c8a65
X-Git-Newrev: 138328309dec336250bc5e7cf3403462d5a68ecd
X-Patchwork-Hint: ignore
Message-Id: <20211212221808.60A71836B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] support/dependencies:
 avoid spurious warning on print-vars
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

commit: https://git.buildroot.net/buildroot/commit/?id=138328309dec336250bc5e7cf3403462d5a68ecd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

When calling 'printvars', the 'suitable-host-package' macro is printed
(a macro is just a variable like the others, after all, just with some
parameters). Because it is printed as a variable, it is missing its
parameters, but it still tries to evaluate the $(shell) construct.

This causes spurious warning:

    make[1]: support/dependencies/check-host-.sh: Command not found

Only try and call the script if there is actually a tool to check for.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 77304e5143bf77e9fd2f8125807bbf9665cda8bc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 4fac5c731b..a7bb1a6080 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -15,7 +15,7 @@ else
 # script should use 'which' to find a candidate. The script should return
 # the path to the suitable host tool, or nothing if no suitable tool was found.
 define suitable-host-package
-$(shell support/dependencies/check-host-$(1).sh $(2))
+$(if $(1),$(shell support/dependencies/check-host-$(1).sh $(2)))
 endef
 endif
 # host utilities needs host-tar to extract the source code tarballs, so
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
