Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874AFEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 16:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F359405AE;
	Mon, 10 Jul 2023 16:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F359405AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1bK08oh-Ytt; Mon, 10 Jul 2023 16:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFF084053D;
	Mon, 10 Jul 2023 16:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFF084053D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1871BF414
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3199F81F97
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3199F81F97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlMHnfhyMOQq for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 16:39:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BD7B81F31
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 16:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BD7B81F31
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3925886B3B; Mon, 10 Jul 2023 16:39:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 18:39:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88a2e0c473fe78ba571bf48fb4e9cc94c86a3df4
X-Git-Newrev: 025ce96406309d1dd4411ae253e5cc6a8cdb9aec
X-Patchwork-Hint: ignore
Message-Id: <20230710163934.3925886B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/emlog: fix build on Linux 6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=025ce96406309d1dd4411ae253e5cc6a8cdb9aec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/f6c/f6c52f58c3c016cee59d2dfe513c449d96dc3b09/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/emlog/0001-Fix-build-on-Linux-6.4.patch | 34 +++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/emlog/0001-Fix-build-on-Linux-6.4.patch b/package/emlog/0001-Fix-build-on-Linux-6.4.patch
new file mode 100644
index 0000000000..65440c1933
--- /dev/null
+++ b/package/emlog/0001-Fix-build-on-Linux-6.4.patch
@@ -0,0 +1,34 @@
+From 32ec7f7b4eb1466100d59aaea8855d770af54327 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 8 Jul 2023 13:10:24 +0200
+Subject: [PATCH] Fix build on Linux 6.4
+
+Needed after upstream changes in kernel 6.4:
+https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/diff/include/linux/device/class.h?id=1aaba11da9aa
+
+Upstream: https://github.com/nicupavel/emlog/pull/15
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ emlog.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/emlog.c b/emlog.c
+index 4462466..2ead738 100644
+--- a/emlog.c
++++ b/emlog.c
+@@ -500,7 +500,11 @@ static int __init emlog_init(void)
+ 
+     pr_info("version %s running, major is %u, MINOR is %u, max size %d K.\n", EMLOG_VERSION, (unsigned)MAJOR(emlog_dev_type), (unsigned)MINOR(emlog_dev_type), emlog_max_size);
+ 
++#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 4, 0)
+     emlog_class = class_create(THIS_MODULE, DEVICE_NAME);
++#else
++    emlog_class = class_create(DEVICE_NAME);
++#endif
+     if (emlog_class == NULL) {
+         pr_err("Can not class_create.\n");
+         ret_val = -4; goto emlog_init_error;
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
