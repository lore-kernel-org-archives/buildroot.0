Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2DAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 15:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1FE7400C6;
	Tue, 21 Dec 2021 15:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id thv50EB0ZTZg; Tue, 21 Dec 2021 15:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D63744016B;
	Tue, 21 Dec 2021 15:01:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F5C91BF5DA
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 15:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F74E408F9
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 15:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tGCX9sfvtdK1 for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 15:01:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55ECD408E9
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 15:01:13 +0000 (UTC)
Received: from machine.home (lfbn-lyo-1-1484-111.w86-207.abo.wanadoo.fr
 [86.207.51.111])
 by linux.microsoft.com (Postfix) with ESMTPSA id 0577020B717B;
 Tue, 21 Dec 2021 06:55:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0577020B717B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1640098524;
 bh=c8KVtKkG+7WQK3uHPjvZBkkRhKOfpcCOL8tVx04rwGs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hTJ3kR4nQ5jhLrUp10bXP0EB+K5DQMBjn6uWZ8LUtThhF05Tyde7hrEtkmMJRj+DP
 a/iaxBO/rvRkSZpGzY/DsdcBroP+ex0bEcTATTogXLhUIJa5K/A4b1RosCYGVlBXIp
 02qrI3JFSlhS7HRtlJ7Qm4tinJY/wUekNoEL2nww=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Tue, 21 Dec 2021 15:54:29 +0100
Message-Id: <20211221145428.43829-3-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211221145428.43829-1-flaniel@linux.microsoft.com>
References: <20211221145428.43829-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v1 2/2] linux: Add host-pahole as linux
 dependencies if selected by user.
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If user set BR2_PACKAGE_HOST_PAHOLE, we add host-pahole to linux dependencies in
case the user also wants to compile the kernel with CONFIG_DEBUG_BTF_INFO which
relies on pahole to generate BTF information used by CO-RE BPF tools.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 linux/linux.mk                | 6 ++++++
 package/pahole/Config.in.host | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 61fdc0c76c..057d898c86 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -120,6 +120,12 @@ ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS),y)
 LINUX_DEPENDENCIES += host-uboot-tools
 endif
 
+# If host-pahole is selected by the user, assume it is needed to create a custom
+# kernel with CONFIG_DEBUG_INFO_BTF.
+ifeq ($(BR2_PACKAGE_HOST_PAHOLE),y)
+LINUX_DEPENDENCIES += host-pahole
+endif
+
 ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 define LINUX_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),linux)
diff --git a/package/pahole/Config.in.host b/package/pahole/Config.in.host
index e427629632..521874961b 100644
--- a/package/pahole/Config.in.host
+++ b/package/pahole/Config.in.host
@@ -3,4 +3,6 @@ config BR2_PACKAGE_HOST_PAHOLE
 	help
 	  Pahole and other DWARF utils.
 
+	  Select this if you want to build a kernel with CONFIG_DEBUG_INFO_BTF set.
+
 	  https://git.kernel.org/pub/scm/devel/pahole/pahole.git
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
