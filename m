Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DAFC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:24:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D18D60F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D18D60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E84F44060E;
	Tue,  3 Aug 2021 23:24:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BxcUT6GAlDNI; Tue,  3 Aug 2021 23:24:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF369405B1;
	Tue,  3 Aug 2021 23:24:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36D011BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 970BF40667
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-luGS-zZL1W for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C96F404E3
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A20DF87F55; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 8 Jul 2021 22:33:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1fe532c076c99901b34f8768ea05536ad75f856c
X-Git-Newrev: b928074e2d83f5b873bf1ba381b212dfad9bf207
X-Patchwork-Hint: ignore
Message-Id: <20210803211000.A20DF87F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Revert "package/pkg-python:
 invalidate precompiled _sysconfigdata*.pyc"
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=b928074e2d83f5b873bf1ba381b212dfad9bf207
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This causes build failure for the first host python package get built,
because the $(STAGING_DIR)/usr/lib/python* may not yet exist by tht
time, so find will whine and fail.

This was was alrady the case for the existing find call, a few lines
above, but that was ignored as find is a left-hand-side of a pipe, so
its return code was ignored.

Fixes:
    http://autobuild.buildroot.org/results/860a188bd270c59b1fee2f56f31e73689f0e4979/build-end.log

... where we can see the two find error messages, but only the second
one causes the breakage.

This reverts commit 836528f03eb89fdc64432f7a7470145ddf553b8c.

Reported-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Herve Codina <herve.codina@bootlin.com>
---
 package/pkg-python.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 1e4fd5ba33..59a48e5a87 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -97,8 +97,6 @@ define PKG_PYTHON_FIXUP_SYSCONFIGDATA
 	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
 		-name "_sysconfigdata*.py" | xargs --no-run-if-empty \
 		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g"
-	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
-		-name "_sysconfigdata*.pyc" -delete
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
