Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F71FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:48:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30F7761037
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30F7761037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB880401FD;
	Tue,  3 Aug 2021 21:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UsYYuR5anvV1; Tue,  3 Aug 2021 21:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B843400E7;
	Tue,  3 Aug 2021 21:48:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5305F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57D4F835C9
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2mU9VjVuheLP for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C201D83A9F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1878787F55; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Jul 2021 21:38:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9273b0df81e09e4ee02488cb65c34fc1e0ede4e9
X-Git-Newrev: a1c7cff1a081765c082c196bd9e6c1e72ceee797
X-Patchwork-Hint: ignore
Message-Id: <20210803211000.1878787F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Revert "core: enable 'NDEBUG'
 unless BR2_ENABLE_RUNTIME_DEBUG is set"
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1c7cff1a081765c082c196bd9e6c1e72ceee797
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enabling -DNEBUG, although correct on the paper, causes a lot of
packages to fail to build because they explicitly require not building
with NDEBUG; they use assert() to check actual runtime errors and expect
it to not be elidded away (sometimes with side effects in the arguments
passed to assert().

This reverts commit 5a8c50fe05afacc3cbe8e7347e238da9f242fab0, as
discussed on the list:
    http://lists.busybox.net/pipermail/buildroot/2021-July/313646.html

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Makefile.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 955e6a8e8c..86db62ba5b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -148,9 +148,6 @@ endif
 ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING = -g3
 endif
-ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
-TARGET_DEBUGGING += -DNDEBUG
-endif
 
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
