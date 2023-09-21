Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC1DE7D0A8
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43E1A83CC3;
	Thu, 21 Sep 2023 19:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E1A83CC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nnEnKU8Dbd1x; Thu, 21 Sep 2023 19:27:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 998E983CB8;
	Thu, 21 Sep 2023 19:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 998E983CB8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A76B81BF390
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FE9D41822
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FE9D41822
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsNWMIZH_ef0 for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:27:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83F7441821
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83F7441821
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FACA874EE; Thu, 21 Sep 2023 19:27:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 21:24:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 579896c2f240c927767b68979b12bf4747199a16
X-Git-Newrev: 056958724b8c7581aff2bc022841c1ca6db1e590
X-Patchwork-Hint: ignore
Message-Id: <20230921192743.6FACA874EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fio: remove -march=native
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=056958724b8c7581aff2bc022841c1ca6db1e590
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Per default, the fio package uses the "-march=native" GCC option. This
is of course wildly inappropriate for cross-compilation and can result
in illegal instructions. Thus we make sure fio will not use that
compiler option by adding --disable-native to FIO_OPTS.

Signed-off-by: Jens Maus <mail@jens-maus.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/fio/fio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index b1763d6c73..f6e7b036bb 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -9,7 +9,7 @@ FIO_SITE = http://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
 
-FIO_OPTS = --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)"
+FIO_OPTS = --disable-native --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBAIO),y)
 FIO_DEPENDENCIES += libaio
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
