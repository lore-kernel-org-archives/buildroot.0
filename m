Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A9BC04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 12:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12EA981AD1;
	Sat, 30 Jul 2022 12:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12EA981AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0PkkfiXBQEL; Sat, 30 Jul 2022 12:18:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C9F88149A;
	Sat, 30 Jul 2022 12:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C9F88149A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD5E11BF391
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C005841703
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C005841703
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e8NvM-LNIJUr for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 12:18:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D8BE416FC
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 12:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D8BE416FC
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9B502868B0; Sat, 30 Jul 2022 12:04:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Jul 2022 14:17:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae6e1444055e684ae15712eff79d7df06b74d2dc
X-Git-Newrev: 5c54c3ef3db26d3630c79fc1bad10469b889d0dd
X-Patchwork-Hint: ignore
Message-Id: <20220730120435.9B502868B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: workaround make 4.3 issue for
 'printvars and 'show-vars'
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c54c3ef3db26d3630c79fc1bad10469b889d0dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 Makefile | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index fb0ef32c6b..a743e42f91 100644
--- a/Makefile
+++ b/Makefile
@@ -1048,23 +1048,19 @@ ifeq ($(NEED_WRAPPER),y)
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
@@ -1072,13 +1068,14 @@ printvars: check-make-version
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
