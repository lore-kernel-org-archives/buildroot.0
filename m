Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFDBC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F1064011A;
	Mon,  6 Nov 2023 21:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F1064011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xg4v83oILYHF; Mon,  6 Nov 2023 21:38:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8870D400FF;
	Mon,  6 Nov 2023 21:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8870D400FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 699A71BF3A6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41FDC4208D
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41FDC4208D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NijLHRoaxWl9 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:38:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50AA8408E3
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50AA8408E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C1F586ABE; Mon,  6 Nov 2023 21:38:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:27:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 718794637b948d4fcff9a3c6b7e6785e01697ee0
X-Git-Newrev: d5d4e88a96a41542bcb30cb648f7d8750c48f419
X-Patchwork-Hint: ignore
Message-Id: <20231106213813.3C1F586ABE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flashrom: fix build on sh4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5d4e88a96a41542bcb30cb648f7d8750c48f419
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure on sh4 raised since bump to version
1.3.0 in commit

/home/thomas/autobuild/instance-3/output-1/per-package/flashrom/host/bin/../lib/gcc/sh4a-buildroot-linux-gnu/12.3.0/../../../../sh4a-buildroot-linux-gnu/bin/ld: libflashrom.a(internal.o): in function `internal_chip_readn':
internal.c:(.text+0x8): undefined reference to `mmio_readn'

Fixes:
 - http://autobuild.buildroot.org/results/f74a9d315fb519f284428234713f43fcf4e35fd0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...CONFIG_INTERNAL-depends-on-raw-mem-access.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/flashrom/0001-Makefile-CONFIG_INTERNAL-depends-on-raw-mem-access.patch b/package/flashrom/0001-Makefile-CONFIG_INTERNAL-depends-on-raw-mem-access.patch
new file mode 100644
index 0000000000..9d3f3d9c51
--- /dev/null
+++ b/package/flashrom/0001-Makefile-CONFIG_INTERNAL-depends-on-raw-mem-access.patch
@@ -0,0 +1,35 @@
+From aac91025386aa9d7b8214f8ad1746ef5c02f2d8d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 5 Nov 2023 10:38:32 +0100
+Subject: [PATCH] Makefile: CONFIG_INTERNAL depends on raw mem access
+
+CONFIG_INTERNAL depends on raw mem access resulting in the following
+build failure on sh4 since version 1.3.0:
+
+/home/thomas/autobuild/instance-3/output-1/per-package/flashrom/host/bin/../lib/gcc/sh4a-buildroot-linux-gnu/12.3.0/../../../../sh4a-buildroot-linux-gnu/bin/ld: libflashrom.a(internal.o): in function `internal_chip_readn':
+internal.c:(.text+0x8): undefined reference to `mmio_readn'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f74a9d315fb519f284428234713f43fcf4e35fd0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://review.coreboot.org/c/flashrom/+/78930
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index bf01d0f8..cd21f22f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -115,6 +115,7 @@ DEPENDS_ON_RAW_MEM_ACCESS := \
+ 	CONFIG_ATAPROMISE \
+ 	CONFIG_DRKAISER \
+ 	CONFIG_GFXNVIDIA \
++	CONFIG_INTERNAL \
+ 	CONFIG_INTERNAL_X86 \
+ 	CONFIG_IT8212 \
+ 	CONFIG_NICINTEL \
+-- 
+2.42.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
