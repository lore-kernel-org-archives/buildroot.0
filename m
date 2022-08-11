Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D58DC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 19:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B87A81A50;
	Thu, 11 Aug 2022 19:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B87A81A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-2ZYEA3bNYH; Thu, 11 Aug 2022 19:34:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21D96813E5;
	Thu, 11 Aug 2022 19:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21D96813E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96BB01BF3AA
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 19:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70060813AC
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 19:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70060813AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKeJpEVQIKD1 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 19:34:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CA8B8139E
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 19:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CA8B8139E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8425C872ED; Thu, 11 Aug 2022 19:20:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 21:30:28 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: e95fa1c56ccc4e5e7468b129f5edfb27c24bb50d
X-Git-Newrev: 9de6f14a26c5a51a79ee9aff6551c697da14161f
X-Patchwork-Hint: ignore
Message-Id: <20220811192009.8425C872ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/swupdate: add
 upstream patch to fix build with uclibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=9de6f14a26c5a51a79ee9aff6551c697da14161f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
(cherry picked from commit 2e766f73c49c529216a96bf7fa083b4c56e56820)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
