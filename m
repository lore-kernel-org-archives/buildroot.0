Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D06ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 09:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B302B8196A;
	Wed, 14 Sep 2022 09:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B302B8196A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DnAd70dZ9btq; Wed, 14 Sep 2022 09:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5640981991;
	Wed, 14 Sep 2022 09:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5640981991
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0851F1BF355
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D270140B53
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D270140B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k4V8N3FcenS3 for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 09:38:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0429740B63
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 09:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0429740B63
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E0B8F838FD; Wed, 14 Sep 2022 09:38:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 11:22:31 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: ff3b466025c0f1d508eadeac1d43a14f8027978d
X-Git-Newrev: 8326fd9b2fe5cfc633e4d6d8bc00c40cdff8096e
X-Patchwork-Hint: ignore
Message-Id: <20220914093807.E0B8F838FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] Makefile: workaround make
 4.3 issue for 'printvars and 'show-vars'
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

commit: https://git.buildroot.net/buildroot/commit/?id=8326fd9b2fe5cfc633e4d6d8bc00c40cdff8096e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Event though the bug with make 4.3 has been reported and fixed, there
has not been a release of make with the fix for a long time, see [1].

As the root cause seems the 'filter' command cannot handle large
chunks of data, like .VARIABLES, we can workaround the problem by
using a foreach command over .VARIABLES, then use the filter command.

It might not be logical to program it that way, but at least the
functionality is now usable.

[1] https://savannah.gnu.org/bugs/?59093#comment10

Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
[yann.morin.1998@free.fr: add comment to reference the bug]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5c54c3ef3db26d3630c79fc1bad10469b889d0dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 2c28f3cfc4..5b22216fc4 100644
--- a/Makefile
+++ b/Makefile
@@ -1049,23 +1049,19 @@ ifeq ($(NEED_WRAPPER),y)
 	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
 endif
 
-.PHONY: check-make-version
-check-make-version:
-ifneq ($(filter $(RUNNING_MAKE_VERSION),4.3),)
-	@echo "Make 4.3 doesn't support 'printvars' and 'show-vars' recipes"
-	@exit 1
-endif
-
 # printvars prints all the variables currently defined in our
 # Makefiles. Alternatively, if a non-empty VARS variable is passed,
 # only the variables matching the make pattern passed in VARS are
 # displayed.
 # show-vars does the same, but as a JSON dictionnary.
+#
+# Note: we iterate of .VARIABLES and filter each variable individually,
+# to workaround a bug in make 4.3; see https://savannah.gnu.org/bugs/?59093
 .PHONY: printvars
-printvars: check-make-version
+printvars:
 	@:
 	$(foreach V, \
-		$(sort $(filter $(VARS),$(.VARIABLES))), \
+		$(sort $(foreach X, $(.VARIABLES), $(filter $(VARS),$(X)))), \
 		$(if $(filter-out environment% default automatic, \
 				$(origin $V)), \
 		$(if $(QUOTED_VARS),\
@@ -1073,13 +1069,14 @@ printvars: check-make-version
 			$(info $V=$(if $(RAW_VARS),$(value $V),$($V))))))
 # ')))) # Syntax colouring...
 
+# See details above, same as for printvars
 .PHONY: show-vars
 show-vars: VARS?=%
-show-vars: check-make-version
+show-vars:
 	@:
 	$(info $(call clean-json, { \
 			$(foreach V, \
-				$(sort $(filter $(VARS),$(.VARIABLES))), \
+				$(sort $(foreach X, $(.VARIABLES), $(filter $(VARS),$(X)))), \
 				$(if $(filter-out environment% default automatic, $(origin $V)), \
 					"$V": { \
 						"expanded": $(call mk-json-str,$($V))$(comma) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
