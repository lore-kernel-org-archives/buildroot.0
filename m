Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96E5C6FD19
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 21:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92CC382244;
	Thu,  9 Mar 2023 21:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92CC382244
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j2aEyRZOwjAw; Thu,  9 Mar 2023 21:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7A8382195;
	Thu,  9 Mar 2023 21:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7A8382195
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6103B1BF366
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47AA1419D3
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47AA1419D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtqjRg11K6Jy for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 21:50:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48C3F41974
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 21:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48C3F41974
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36BC686D5E; Thu,  9 Mar 2023 21:50:55 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Mar 2023 22:49:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 964254bfd99a5bb7c405a03bdd165f11ddc36f4a
X-Git-Newrev: cda8dabfeb8f53b1a7dd1341ad9fc7e37bff516e
X-Patchwork-Hint: ignore
Message-Id: <20230309215055.36BC686D5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgcrypt: fix Thumb mode
 workaround
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

commit: https://git.buildroot.net/buildroot/commit/?id=cda8dabfeb8f53b1a7dd1341ad9fc7e37bff516e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure:

/tmp/ccRqWxnA.s:98: Error: instruction not supported in Thumb16 mode -- `adds ip,fp,r0'

Fixes:
 - http://autobuild.buildroot.org/results/4b96f4e41724e5c9c806a6c7df397a58d1ae1b1e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libgcrypt/libgcrypt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 8f4e5ec8c0..9232debb3a 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -27,8 +27,8 @@ LIBGCRYPT_CONF_OPTS += --disable-asm
 endif
 
 # Code doesn't build in thumb mode
-ifeq ($(BR2_arm),y)
-LIBGCRYPT_CONF_ENV += CFLAGS="$(patsubst -mthumb,,$(TARGET_CFLAGS))"
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+LIBGCRYPT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
