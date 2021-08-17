Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BD6C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:12:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80F3A60231
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80F3A60231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BD75426EB;
	Thu, 26 Aug 2021 22:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NgQFPiLzrsQa; Thu, 26 Aug 2021 22:12:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E15FC426F6;
	Thu, 26 Aug 2021 22:12:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E686D1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8204A614AA
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 292UfoJgGHkw for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5C6E614AB
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1635A8DC50; Thu, 26 Aug 2021 22:01:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 23:11:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 137225cef423ccbebc31d0c562bf3f37192739ac
X-Git-Newrev: f76b2cd8d81d001aca35def6f7f938e77a2094ef
X-Patchwork-Hint: ignore
Message-Id: <20210826220131.1635A8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libgeos: fix build
 failure due to missing -mcmodel=large
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

commit: https://git.buildroot.net/buildroot/commit/?id=f76b2cd8d81d001aca35def6f7f938e77a2094ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When building libgeos for or1k -mcmodel=large is needed to link, so let's
add that gcc option in case we're building for or1k.

Upstream gcc doesn't have the -mcmodel=large option for or1k, but all
released Buildroot gcc versions have the patch to add it, so that's
fine.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libgeos/libgeos.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index a355732af8..43211d0434 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -23,6 +23,10 @@ ifeq ($(BR2_arm)$(BR2_armeb),y)
 LIBGEOS_CONF_OPTS += -DDISABLE_GEOS_INLINE=ON
 endif
 
+ifeq ($(BR2_or1k),y)
+LIBGEOS_CXXFLAGS += -mcmodel=large
+endif
+
 LIBGEOS_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(LIBGEOS_CXXFLAGS)"
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
