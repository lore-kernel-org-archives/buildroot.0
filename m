Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6601C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51CAC40AA2;
	Fri, 22 Jul 2022 21:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51CAC40AA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3V_ePu7hHuD; Fri, 22 Jul 2022 21:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 065D340469;
	Fri, 22 Jul 2022 21:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 065D340469
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F8531BF215
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5743042376
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5743042376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MRa_2fXlgGza for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:04:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 582564092A
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 582564092A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id ECB6F841C6; Fri, 22 Jul 2022 20:50:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 23:03:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1666b661c6c103d05bbbea05f0f2b89ee4560527
X-Git-Newrev: 2e766f73c49c529216a96bf7fa083b4c56e56820
X-Patchwork-Hint: ignore
Message-Id: <20220722205055.ECB6F841C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: add upstream patch to
 fix build with uclibc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2e766f73c49c529216a96bf7fa083b4c56e56820
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with uclibc:

core/bootloader.c: In function 'register_bootloader':
core/bootloader.c:28:15: warning: implicit declaration of function 'reallocarray' [-Wimplicit-function-declaration]
   28 |  entry *tmp = reallocarray(available, num_available + 1, sizeof(entry));
      |               ^~~~~~~~~~~~
core/bootloader.c:28:15: warning: initialization of 'entry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
[...]
.../arm-buildroot-linux-uclibcgnueabi/bin/ld: core/built-in.o: in function `register_bootloader':
(.text.register_bootloader+0x2c): undefined reference to `reallocarray'

Fixes:

  http://autobuild.buildroot.net/results/46dc484759549162ec246e0bff2647995c307ab5/

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...otloader.c-fix-build-without-reallocarray.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch b/package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch
new file mode 100644
index 0000000000..d90ae7906e
--- /dev/null
+++ b/package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch
@@ -0,0 +1,35 @@
+From f30c4771e93cad7e77d7f2add94327865d226553 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 15 May 2022 14:53:35 +0200
+Subject: [PATCH] core/bootloader.c: fix build without reallocarray
+
+Use realloc instead of reallocarray to avoid the following build failure
+with uclibc raised since version 2022.05 and
+https://github.com/sbabic/swupdate/commit/b8897ed695e1cd954859142b14ec8546d2e7994a:
+
+microblaze-buildroot-linux-uclibc/bin/ld: core/built-in.o: in function `register_bootloader':
+(.text.register_bootloader+0x30): undefined reference to `reallocarray'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7208e8189b4a6f35aaa4ed7777ecdd37421a7c7f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Backported from: f30c4771e93cad7e77d7f2add94327865d226553
+Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
+---
+ core/bootloader.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/core/bootloader.c b/core/bootloader.c
+index f34cb414..5694d43d 100644
+--- a/core/bootloader.c
++++ b/core/bootloader.c
+@@ -25,7 +25,7 @@ static unsigned int num_available = 0;
+ 
+ int register_bootloader(const char *name, bootloader *bl)
+ {
+-	entry *tmp = reallocarray(available, num_available + 1, sizeof(entry));
++	entry *tmp = realloc(available, (num_available + 1) * sizeof(entry));
+ 	if (!tmp) {
+ 		return -ENOMEM;
+ 	}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
