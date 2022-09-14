Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C27ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 09:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BE5D81399;
	Wed, 14 Sep 2022 09:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BE5D81399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sGaRee6OtUlc; Wed, 14 Sep 2022 09:38:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61BD381336;
	Wed, 14 Sep 2022 09:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61BD381336
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 167611BF355
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B044240886
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B044240886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id puZengnw6DJM for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 09:38:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EB6940284
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 09:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EB6940284
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 012B8838FF; Wed, 14 Sep 2022 09:38:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 11:22:56 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 4011982bc3a8f53802c8b7c4b7181c32a28217d2
X-Git-Newrev: 3443db75b0f0dbd668b789490f486b352179c907
X-Patchwork-Hint: ignore
Message-Id: <20220914093808.012B8838FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] Makefile: error out
 printvars target when VARS is empty or unset
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

commit: https://git.buildroot.net/buildroot/commit/?id=3443db75b0f0dbd668b789490f486b352179c907
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

printvars returns nothing when VARS is not passed or empty. This is done
on purpose, see commit fd5bd12379dc ("Makefile: printvars: don't print
anything when VARS is not set").

An error message making explicit what is required from the user in order
to use printvars is however better than silently doing nothing.

This adds a check for a non-empty VARS variable.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ec82347cdee190a5fa451b83cdb3727c78cda315)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index dc9916b35d..e8a4703a51 100644
--- a/Makefile
+++ b/Makefile
@@ -1059,6 +1059,10 @@ endif
 # to workaround a bug in make 4.3; see https://savannah.gnu.org/bugs/?59093
 .PHONY: printvars
 printvars:
+ifndef VARS
+	@echo "Please pass a non-empty VARS to 'make printvars'"
+	@exit 1
+endif
 	@:
 	$(foreach V, \
 		$(sort $(foreach X, $(.VARIABLES), $(filter $(VARS),$(X)))), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
