Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DCDE7D0C5
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 05:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F64841799;
	Tue, 26 Sep 2023 05:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F64841799
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EPBoYBLyKz3h; Tue, 26 Sep 2023 05:50:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95BC7417B9;
	Tue, 26 Sep 2023 05:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95BC7417B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F0F71BF969
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 05:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDCC54178A
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 05:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDCC54178A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WyDJ25eUqZ3w for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 05:49:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 075A24040D
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 05:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 075A24040D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6204877C2; Tue, 26 Sep 2023 05:49:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 00:36:59 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 20ffaad8b6ad7e961b33bae0e4124049b82adef8
X-Git-Newrev: bfcc79b2ae07715eee81fb60fba9eaf253a99fa4
X-Patchwork-Hint: ignore
Message-Id: <20230926054946.E6204877C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/fio: remove
 -march=native
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfcc79b2ae07715eee81fb60fba9eaf253a99fa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Per default, the fio package uses the "-march=native" GCC option. This
is of course wildly inappropriate for cross-compilation and can result
in illegal instructions. Thus we make sure fio will not use that
compiler option by adding --disable-native to FIO_OPTS.

Signed-off-by: Jens Maus <mail@jens-maus.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 056958724b8c7581aff2bc022841c1ca6db1e590)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
