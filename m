Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D701FC32793
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 20:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 801C640B54;
	Wed, 18 Jan 2023 20:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 801C640B54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BBRPV48XnXvC; Wed, 18 Jan 2023 20:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2D27401F8;
	Wed, 18 Jan 2023 20:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2D27401F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5A9E1BF28B
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 20:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE71A820BF
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 20:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE71A820BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cYiWHXnZxdhq for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 20:43:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00A81818A2
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 20:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00A81818A2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0FDC87CF5; Wed, 18 Jan 2023 20:43:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 18 Jan 2023 21:42:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8447f17b8a589af5a88fc1ffdacde3b130c539d
X-Git-Newrev: 94b66fb49cd57d0863245fbe0a3dc0833e76aad0
X-Patchwork-Hint: ignore
Message-Id: <20230118204304.E0FDC87CF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xxhash: set XXH_NO_INLINE_HINTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=94b66fb49cd57d0863245fbe0a3dc0833e76aad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set XXH_NO_INLINE_HINTS to marks all internal functions as static,
giving the compiler full control on whether to inline or not. This will
fix the following build failure raised since bump to version 0.8.1 in
commit 5dbdb2535c649ee617595b8c4ae3cbba0ee37b97:

In file included from xxhash.c:43:
In function 'XXH3_accumulate',
    inlined from 'XXH3_hashLong_internal_loop' at xxhash.h:4390:9,
    inlined from 'XXH3_hashLong_64b_internal' at xxhash.h:4453:5,
    inlined from 'XXH3_hashLong_64b_withSecret' at xxhash.h:4473:12,
    inlined from 'XXH3_64bits_internal' at xxhash.h:4554:12,
    inlined from 'XXH3_64bits_withSecret' at xxhash.h:4570:12:
xxhash.h:4196:1: error: inlining failed in call to 'always_inline' 'XXH3_accumulate_512_scalar': function not considered for inlining
 4196 | XXH3_accumulate_512_scalar(void* XXH_RESTRICT acc,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f2c52238df97cc4c13117d8dc1423235231a094c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xxhash/xxhash.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 04bc98690f..40e3c2696c 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -28,6 +28,7 @@ endif
 
 define XXHASH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		CFLAGS="$(TARGET_CFLAGS) -DXXH_NO_INLINE_HINTS" \
 		$(XXHASH_TARGETS)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
