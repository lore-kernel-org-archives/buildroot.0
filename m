Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05612ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 09:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB0EB81970;
	Wed, 14 Sep 2022 09:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB0EB81970
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TFWhDiKUbw_E; Wed, 14 Sep 2022 09:38:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1D26819F6;
	Wed, 14 Sep 2022 09:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1D26819F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9141C1148
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBC9460BBC
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBC9460BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgiKF05r1onC for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 09:38:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07EB960BAD
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 09:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07EB960BAD
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E9F5F838D9; Wed, 14 Sep 2022 09:38:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 11:22:39 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 8326fd9b2fe5cfc633e4d6d8bc00c40cdff8096e
X-Git-Newrev: 4011982bc3a8f53802c8b7c4b7181c32a28217d2
X-Patchwork-Hint: ignore
Message-Id: <20220914093807.E9F5F838D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] Makefile: fix show-vars
 for good this time
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

commit: https://git.buildroot.net/buildroot/commit/?id=4011982bc3a8f53802c8b7c4b7181c32a28217d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Commit 5c54c3ef3db2 (Makefile: workaround make 4.3 issue for 'printvars
and 'show-vars') did not fully fix the show-vars case, which still
segfaults.

Overall, show-vars generates a JSON blurb. That is supposed to be
machine-readable, so we do not care that the variables are sorted, so
we get rid of it to (slightly) simplify the code.

Then, we currently iterate twice on the list of variables: the first one
to filter-out the 'internal' variables, and the second one to filter
only the variables matching the pattern. We can do away by iterating
only once, and applying both filters at once.

Since we now have an 'and' condition, we can take advantage of it: when
none of the items in $(and) are empty, $(and) evaluates to the last
item, while it evaluates to empty if any of the items is empty. So we
can coalesce the $(if) and $(and) together: $(if $(and a,b),c) is
equivalent to: $(and a,b,c) ; this gains us one parentheses depth.

Finally, the cause for the segfault is an overly-long call to $(info).
Reducing that is not easy: we want to call clean-json on the whole of
the JSON blurb, so we can't emit the individual variables one by one, or
the trailing comma would not be trimmed away.

So, we go crazy: we just output each word from clean-json with $(info).

We can do that, because mk-json-str transforms all spaces in a string
to an escaped UTF-8 sequence, so we will never have spaces in values;
the keys are the variables, so they won't have spaces either; spaces in
the rest of the JSON blurb are totally optional, so we don't care how
many there are. We know there are spaces, because we explicitly
introduce some (after "expanded" or "raw", for example), so we should
never hit a too-big word for $(info) to print.

Thanks to Henri for the suggestion to push $(info) further inside the
macro.

Reported-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Roosen Henri <Henri.Roosen@ginzinger.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 83f71e7cebb887d19b7ef2098e520d54129324c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 5b22216fc4..dc9916b35d 100644
--- a/Makefile
+++ b/Makefile
@@ -1074,17 +1074,24 @@ printvars:
 show-vars: VARS?=%
 show-vars:
 	@:
-	$(info $(call clean-json, { \
+	$(foreach i, \
+		$(call clean-json, { \
 			$(foreach V, \
-				$(sort $(foreach X, $(.VARIABLES), $(filter $(VARS),$(X)))), \
-				$(if $(filter-out environment% default automatic, $(origin $V)), \
+				$(.VARIABLES), \
+				$(and $(filter $(VARS),$(V)) \
+					, \
+					$(filter-out environment% default automatic, $(origin $V)) \
+					, \
 					"$V": { \
 						"expanded": $(call mk-json-str,$($V))$(comma) \
 						"raw": $(call mk-json-str,$(value $V)) \
 					}$(comma) \
 				) \
 			) \
-	} ))
+		} ) \
+		, \
+		$(info $(i)) \
+	)
 
 .PHONY: clean
 clean:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
