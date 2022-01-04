Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCB5C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5A44812C2;
	Tue,  4 Jan 2022 17:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yUpsvoH0kuro; Tue,  4 Jan 2022 17:18:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 416828141B;
	Tue,  4 Jan 2022 17:18:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 780631BF32A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ED4360BD2
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CQPIGL84tEhI for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:17:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C410760BD3
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:17:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3DDBA82DFB; Tue,  4 Jan 2022 17:11:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 17:53:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63b1ebe94d96951c56bab97eba56b6298cf015ff
X-Git-Newrev: 25cec5ea733251eb27745adb489f268e7e4d5a76
X-Patchwork-Hint: ignore
Message-Id: <20220104171106.3DDBA82DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: disable 'printvars' and
 'show-vars' recipes for Make 4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=25cec5ea733251eb27745adb489f268e7e4d5a76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make 4.3 is buggy and leads to a "Segmentation fault (core dumped)" when
calling 'make printvars' or 'make show-vars', so let's refuse to execute
those recipes if Make 4.3 by adding 'check-make-version' recipe as
depedendency of 'printvars' and 'show-vars' as suggested by Yann E. Morin.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 0b8c7b2867..ac98b84425 100644
--- a/Makefile
+++ b/Makefile
@@ -1058,13 +1058,20 @@ ifeq ($(NEED_WRAPPER),y)
 	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
 endif
 
+.PHONY: check-make-version
+check-make-version:
+ifneq ($(filter $(RUNNING_MAKE_VERSION),4.3),)
+	@echo "Make 4.3 doesn't support 'printvars' and 'show-vars' recipes"
+	@exit 1
+endif
+
 # printvars prints all the variables currently defined in our
 # Makefiles. Alternatively, if a non-empty VARS variable is passed,
 # only the variables matching the make pattern passed in VARS are
 # displayed.
 # show-vars does the same, but as a JSON dictionnary.
 .PHONY: printvars
-printvars:
+printvars: check-make-version
 	@:
 	$(foreach V, \
 		$(sort $(filter $(VARS),$(.VARIABLES))), \
@@ -1077,7 +1084,7 @@ printvars:
 
 .PHONY: show-vars
 show-vars: VARS?=%
-show-vars:
+show-vars: check-make-version
 	@:
 	$(info $(call clean-json, { \
 			$(foreach V, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
