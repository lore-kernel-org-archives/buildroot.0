Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E63C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 17:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21E476107A;
	Wed,  3 Aug 2022 17:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21E476107A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kZclHW9qUb4z; Wed,  3 Aug 2022 17:06:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C25F60BDC;
	Wed,  3 Aug 2022 17:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C25F60BDC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C5B31BF281
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 17:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2494260BDC
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 17:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2494260BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZ2SPoir_n9B for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 17:06:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5264260586
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 17:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5264260586
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BEDEB86D85; Wed,  3 Aug 2022 16:52:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 3 Aug 2022 19:05:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83f71e7cebb887d19b7ef2098e520d54129324c6
X-Git-Newrev: ec82347cdee190a5fa451b83cdb3727c78cda315
X-Patchwork-Hint: ignore
Message-Id: <20220803165240.BEDEB86D85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: error out printvars target when
 VARS is empty or unset
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec82347cdee190a5fa451b83cdb3727c78cda315
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

printvars returns nothing when VARS is not passed or empty. This is done
on purpose, see commit fd5bd12379dc ("Makefile: printvars: don't print
anything when VARS is not set").

An error message making explicit what is required from the user in order
to use printvars is however better than silently doing nothing.

This adds a check for a non-empty VARS variable.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 07b594ea8a..5f266e36b2 100644
--- a/Makefile
+++ b/Makefile
@@ -1058,6 +1058,10 @@ endif
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
