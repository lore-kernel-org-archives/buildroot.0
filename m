Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0990ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 09:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6654A60BDA;
	Wed, 14 Sep 2022 09:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6654A60BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SNon_Fyxb_2T; Wed, 14 Sep 2022 09:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 925FE60BBF;
	Wed, 14 Sep 2022 09:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 925FE60BBF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC7461BF355
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A50E160BC1
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A50E160BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6sAWdizokTJ2 for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 09:40:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D364960BBC
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 09:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D364960BBC
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C106783916; Wed, 14 Sep 2022 09:40:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 11:25:59 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a344a5b7cbcd989fa8ee3bfa2538c4980948233f
X-Git-Newrev: c47f728a78a54eb9f8c0e5df9029fddace8af32b
X-Patchwork-Hint: ignore
Message-Id: <20220914094044.C106783916@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Makefile: error out
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

commit: https://git.buildroot.net/buildroot/commit/?id=c47f728a78a54eb9f8c0e5df9029fddace8af32b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index c39df4c58b..aa6c11acec 100644
--- a/Makefile
+++ b/Makefile
@@ -1061,6 +1061,10 @@ endif
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
