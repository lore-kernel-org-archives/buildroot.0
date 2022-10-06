Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D2FC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 14:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E23FC40CCF;
	Thu,  6 Oct 2022 14:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E23FC40CCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wI8s79JdwQum; Thu,  6 Oct 2022 14:24:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25CF840C9E;
	Thu,  6 Oct 2022 14:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25CF840C9E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C208E1BF33F
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 14:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99B1B40C9E
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 14:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99B1B40C9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 02QBCBYy2dbb for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 14:23:56 +0000 (UTC)
X-Greylist: delayed 00:15:11 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B223C4015E
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by smtp2.osuosl.org (Postfix) with ESMTP id B223C4015E
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 14:23:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [123.185.181.104])
 by smtp12 (Coremail) with SMTP id EMCowADHNHZi4T5jEmYvCQ--.33838S2;
 Thu, 06 Oct 2022 22:08:39 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Thu,  6 Oct 2022 07:07:54 -0700
Message-Id: <20221006140754.46144-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: EMCowADHNHZi4T5jEmYvCQ--.33838S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW3ArykXFykAF4UJw4kXrb_yoW8GFW5p3
 yfur47Kw4I93y5J3y0g3W7Ar1Y9FZ8urWUG3Z7Cw10va47JF1Iva4UKF48X347urZrAw4U
 Zw1rWFsrWr48JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUU5r7UUUUU=
X-Originating-IP: [123.185.181.104]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiGgeSjVaEDCokLgAAs8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=kHmy0
 30+Wl+2fEeFCAfJiz4q4MBpl61bYs6X1/JS60o=; b=efcaS8NIzf6x6g+YZYr02
 Eid4Ktmhm4R1Od2Nl0MleFuJkWV38+hmDWT7o9jiWclxbD/y6mNmf7GY5/YTUINl
 9e+D1WiGeV1/0WfF38RctZ2w8Gex+dQ9zbb9eO3PMYpoCkbPWMBtCxE3mWrMS5RI
 8rcSumr2TIPB/9VHrMmUF8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=efcaS8NI
Subject: [Buildroot] [PATCH 1/1] package/crun: support crun as runtime in
 containerd
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Create runc symlink to crun when runc is missing.

See: https://github.com/containerd/containerd/discussions/6162

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/containerd/Config.in | 2 +-
 package/crun/crun.mk         | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/containerd/Config.in b/package/containerd/Config.in
index 0e3a55ef39..e69dd6768a 100644
--- a/package/containerd/Config.in
+++ b/package/containerd/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_CONTAINERD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
 	depends on BR2_USE_MMU # util-linux
-	select BR2_PACKAGE_RUNC # runtime dependency
+	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
 	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index 4a0c150594..19dda71a9f 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -36,4 +36,11 @@ else
 CRUN_CONF_OPTS += --disable-systemd
 endif
 
+ifeq ($(BR2_PACKAGE_RUNC),)
+define CRUN_CREATE_SYMLINK
+	ln -sf crun $(TARGET_DIR)/usr/bin/runc
+endef
+CRUN_POST_INSTALL_TARGET_HOOKS += CRUN_CREATE_SYMLINK
+endif
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
