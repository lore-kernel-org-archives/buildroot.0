Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7228E66884
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 21:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA6F183CC7;
	Fri, 19 Dec 2025 21:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bl_3rdx0OR0O; Fri, 19 Dec 2025 21:10:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DAB983C9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766178612;
	bh=dEW0yVNQf5tJFPFfqD5PEO+ddgazKyyPbDnrVPWhhNQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=raOkBuQToqO5dh9e/DaGuWXpMnUy3c7f83Gcy0ROtqptXRFTTNJZfpY1YdsisM8q/
	 hNvZLBu+W+J26nxcSipB+ZJDwT5CXvG1BH4guNJnu5HVWaIjb9NJjroTW/3pXYAxk9
	 vVNiIRrZNi9IUYOTF574c9iFAgQ8o8y4Bbs8NiuZzN+AnWebWvNTmmY8nYUo7jCy++
	 0ZA7MQndsJzx/MRdzhRHiqHzANYsp0k12Pn39f00iauvl2Ug120GN1JgZ2hjBi+klj
	 lA/0fE7BZfPvoSuYxKdWFA+8jdbT7Zs67UIo1bI1nDAJEuASDKyaF+/8i0P4/CjLOB
	 9MgyfAuADqt1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DAB983C9E;
	Fri, 19 Dec 2025 21:10:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C9C51A6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4721F60BB4
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyPajH68zoUZ for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 21:10:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 886C460BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 886C460BB3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 886C460BB3
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:10:10 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a0d:e487:418e:8c09:857b:bc67:c232:7cba])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 862C7780383;
 Fri, 19 Dec 2025 22:10:05 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri, 19 Dec 2025 22:09:54 +0100
Message-ID: <20251219210957.556930-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766178608;
 bh=LfGE1stQ0AzYy21YpvHvb6EE1gNF9hiUFYmGeStoGkw=;
 h=From:To:Cc:Subject:Date:From;
 b=Kw8ANjE14FOJa6+bFqU6mIZdSfEpAGd7gYcEkiDhe5qLN0EJ7xx3lHtejGAjdnmhs
 6symYLUkssThRfNceBZKoAH+B8q6IwJfUJCq6rhsuGXbmn0sUmICkVuisg1VH9D2Ld
 8OkNlY7hUy6BpmWwsUNsRehZCgUo32OVf1O8qlK+QiIrIzcJ+UTYESAv4X9e0uMoeK
 yCG11fdzGJ4X79jtE0qiv9K4iuhe05lKFEUbgf0x8D91veSFDZZDizDb1P+tntoCB6
 A/FS9kKhUTeVNpbdRSu7gVnvrkzrg9cDE+mgt0ydki/3sILwZKP/kA513NQA9pmjEi
 ApKS3gfx9EOhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Kw8ANjE1
Subject: [Buildroot] [PATCH 1/4] support/testing: ddrescue: use dmsetup from
 lvm2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The ddresue runtime test is using the `dmsetup` command provided by the
dmraid package. This package is outdated and will be removed. This
command is also provided by the lvm2 package, which is still maintained.

This commit replaces the dmraid package by lvm2 in the test config.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_ddrescue.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
index 989abc8f01..042431eb7b 100644
--- a/support/testing/tests/package/test_ddrescue.py
+++ b/support/testing/tests/package/test_ddrescue.py
@@ -9,7 +9,7 @@ class TestDdrescue(infra.basetest.BRTest):
     # - A kernel config fragment enables loop blk dev and device
     #   mapper dm-dust, which are used to simulate a failing storage
     #   block device.
-    # - dmraid user space package is needed to configure dm-dust
+    # - lvm2 user space package is needed to configure dm-dust with dmsetup
     config = \
         """
         BR2_aarch64=y
@@ -23,7 +23,7 @@ class TestDdrescue(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_DDRESCUE=y
-        BR2_PACKAGE_DMRAID=y
+        BR2_PACKAGE_LVM2=y
         BR2_TARGET_ROOTFS_CPIO=y
         BR2_TARGET_ROOTFS_CPIO_GZIP=y
         # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
