Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEA2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 11:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D7CA40492;
	Mon, 25 Apr 2022 11:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pr0OVnARuGDu; Mon, 25 Apr 2022 11:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0CD74031F;
	Mon, 25 Apr 2022 11:12:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 170AE1BF3CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 11:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03E8840903
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 11:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=163.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AbV0da3LdiMh for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 11:11:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06C9840901
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 11:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=NtJHO
 V8W5dyP58Ar3YdRUGybtAulhXOOwwIaWgQ/nY4=; b=hexHJ9+gnAYagxX4nI+qu
 bft/YSbQEAtsxLZqCp0guFsXi6eUIwF1d5OFefOhcDJtaMy9jJB4f3vZv+3JhfnU
 cR50o6roe/cSl1rQm2wVbSDnLOgHvZRpD2oRKBW63FLILitWnbZbSoQq1HXvpfmG
 d4ZNUKTcjWEBG2alJrqtBU=
Received: from localhost.localdomain (unknown [123.185.181.60])
 by smtp10 (Coremail) with SMTP id DsCowAC3Xlj3gWZiShG_Cw--.57785S2;
 Mon, 25 Apr 2022 19:11:52 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 04:11:48 -0700
Message-Id: <20220425111148.87319-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: DsCowAC3Xlj3gWZiShG_Cw--.57785S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww4kGF17XrW3CF1fAryUGFg_yoW8Ww4Dpr
 4fCry2gr1rCr13CFyUK3W2vr1fXrs8G3WDC3srCw10qF4UGw1kWr1fJay5JrW7urZIyw15
 X3Z8trW5ZryjgaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEVbygUUUUU=
X-Originating-IP: [123.185.181.60]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbCqRbtjV0De-jZvQAAsm
Subject: [Buildroot] [PATCH] package/udev: move render and sgx out of
 UDEV_USERS
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Moved group render and group sgx into UDEV_USERS_SYSTEMD as they
currently only appear in systemd's udev rules.

In systemd, group render was introduced since commit 4e15a73, and group
sgx was introduced since commit c9c4899.

In eudev, group render was introduced since commit bb070c1, but was
removed since commit a8ffcd1 [1].

[1]: https://github.com/eudev-project/eudev/issues/160

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 2 --
 package/udev/udev.mk       | 7 +++++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 58a1376b51..1f2bc108bf 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -602,8 +602,6 @@ define SYSTEMD_PERMISSIONS
 endef
 
 define SYSTEMD_USERS
-	# udev user groups
-	# systemd user groups
 	- - systemd-journal -1 * - - - Journal
 	$(SYSTEMD_REMOTE_USER)
 	$(SYSTEMD_COREDUMP_USER)
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index ce93d98431..40d12ad469 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-# Required by default rules for input devices
 define UDEV_USERS
 	- - input -1 * - - - Input device group
-	- - render -1 * - - - DRI rendering nodes
 	- - kvm -1 * - - - kvm nodes
+	$(UDEV_USERS_$(call UPPERCASE,$(call qstrip,$(BR2_PACKAGE_PROVIDES_UDEV))))
+endef
+
+define UDEV_USERS_SYSTEMD
+	- - render -1 * - - - DRI rendering nodes
 	- - sgx -1 * - - - SGX device nodes
 endef
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
