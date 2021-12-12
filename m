Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB049C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6898984F4E;
	Sun, 12 Dec 2021 22:30:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dqc-IG3ubuJL; Sun, 12 Dec 2021 22:30:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8EE784F4C;
	Sun, 12 Dec 2021 22:30:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E9281BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B409860781
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5x362a4Co4Q1 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:23:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF94360673
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:23:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5119583654; Sun, 12 Dec 2021 22:18:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:12:50 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: be8b42242bfb1a702287cba36ab9f98ca7f2865e
X-Git-Newrev: c63dcc457969c1dce18a0fd06ac358fae1883703
X-Patchwork-Hint: ignore
Message-Id: <20211212221828.5119583654@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] support/dependencies:
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

commit: https://git.buildroot.net/buildroot/commit/?id=c63dcc457969c1dce18a0fd06ac358fae1883703
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
