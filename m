Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE7BC67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 09:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25BD0400BA;
	Mon,  8 Apr 2024 09:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paSuxQDr6AYI; Mon,  8 Apr 2024 09:23:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3330040AE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3330040AE6;
	Mon,  8 Apr 2024 09:23:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D3BF1BF3D2
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 09:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE51281F32
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 09:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EunYOJo7_tAi for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 09:23:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A119381F31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A119381F31
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A119381F31
 for <buildroot@busybox.net>; Mon,  8 Apr 2024 09:23:31 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 94A4A440209;
 Mon,  8 Apr 2024 12:23:02 +0300 (IDT)
To: buildroot@busybox.net
Date: Mon,  8 Apr 2024 12:23:08 +0300
Message-ID: <be7460b2010a5732e757b9cbc60b94d28b580273.1712568188.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1712568182;
 bh=dM6lvFGxBL2MRBgGHkZPDy9AOH3GjAiK5S3iMTq8MXk=;
 h=From:To:Cc:Subject:Date:From;
 b=WO0l2HvMbnk5FzgsRm6s/4HeuN/wXa48gVsF6SJTkbhDcskJ27GRS6hpLNxR6zkq2
 MsmxY62f2hlsvd9YEZDCkSTGvDaU5yoDx7iRC531EEo6Luy66tW+fIu+HeHl7Ydp/J
 0VYYxzM1ibcXGACGsArKb8AujN1eurk2hk8Ew/AZ2kmVdKORj3jTeEEWSKHXStaIjq
 zQw8mpoQnf4TAOg4eQKtY76o5gLB3ozKXavFIg50xTWELKQfNMv/A2oZbCV0PeB6T2
 SEYTOLASHC3Ia8r55b9MnMM0U/j74mbA+yWKuWPUMdBe2l8Vnj6guQhj975jPEpb9U
 kNHslupTeohGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=WO0l2HvM
Subject: [Buildroot] [PATCH] linux: add option to include git submodules
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some kernel users find it useful to store submodules in the kernel
source tree for cross source trees definitions. Add option to download
these submodules.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 linux/Config.in | 6 ++++++
 linux/linux.mk  | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index d520dc379f0e..3f5b088a193f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -126,6 +126,12 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
 
 endif
 
+config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
+	bool "Download also git submodules"
+	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
+	help
+	  Include git submodules in the kernel source tree.
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "6.6.22" if BR2_LINUX_KERNEL_LATEST_VERSION
diff --git a/linux/linux.mk b/linux/linux.mk
index 4e12b36c1fd4..16d9f1947089 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -24,6 +24,9 @@ LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = git
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES),y)
+LINUX_GIT_SUBMODULES = YES
+endif
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_HG),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = hg
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
