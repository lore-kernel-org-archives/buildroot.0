Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E67E7848A
	for <buildroot@archiver.kernel.org>; Wed, 24 Dec 2025 20:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C94E8128D;
	Wed, 24 Dec 2025 20:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXiMWjTs5uUh; Wed, 24 Dec 2025 20:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9677811F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766606602;
	bh=5Xb/9buaqpAuqqVoo3djnAEQfTEOJg2xbUfTzi814N8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fm/tP0eM+fLRb5V0kBMJNgixDWE7s94a9xkPUoI5XG4TaBNJaxqxPjRtSfQF2Pypl
	 OvIv4ltfzNd2UxNzIuC1lYY34LkCYnHkdkMPAuK2Rd9j25pSfw+zFSTGJrMNYxRf6R
	 pgHP9dE8k0AbpdIBnIgT064yZJNXBDHgn2l2IXVAbSOgxi4WraiaBo6bA2vNFnI0Gb
	 3tFwkbNgJFsnoTGgCbrVLbdIGPLDk4fC3bHw4X8B+nXr0oy6QVuYPq/LVC1h21JYfs
	 0OnQNAB3BWcKpo8WVPimdAc2Wr8jDu76yex0WoNi/a8MZ+qI8FpotALnhGGicQXJB7
	 DUPD4Pg1XCDjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9677811F1;
	Wed, 24 Dec 2025 20:03:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 816EBBE
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 20:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6766C60ADA
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 20:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfHiahqxhncO for <buildroot@buildroot.org>;
 Wed, 24 Dec 2025 20:03:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 80DD460ACE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80DD460ACE
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80DD460ACE
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 20:03:15 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id YV4iv9eY2fibdYV4ivd4pG; Wed, 24 Dec 2025 21:03:13 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 24 Dec 2025 20:59:34 +0100
Message-ID: <20251224195935.4089179-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBwIdDfJtKrio8polVVXFoV8VFmCxhfCY9vDsbqoyQtwECKwsZ07bQiaacEyEMtujp4cVD5qFr+sfpELp8rZZt/XBRFw23rUw9RtyUK5fsaSSzh1fcJ6
 iUvWvgdZX0XpD/9I4ARqFZ8Zve9f2389nz+rCf9UWGYo9I0eUgVLfeP/Wm3eLiQJp3Wo9fzddKgmZbUk8a3XKTnGgkyAvN52SlWtZFTl/1ryNq5Opa0MHV6N
 V2wDd4v0TZMHegBFP0PJa0SX2Ba90NVZ1BLnRnKB/78=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766606593; bh=cGK43yjwM8OuJVJpp6DN99usGt91eUtQag8FhQTpB5M=;
 h=From:To:Subject:Date:MIME-Version;
 b=KBLc7sxIpcEQ+CqA3XLE4wM104XlC9jQ4+vE+Gxxf6DPawjBXP7C7pHaoyU0SCGl3
 F+Gn72mIUVQts11rNpElB9ajy5POQcy5txaChsEIZo1ibcuGebDh7KhNjpTe29TgES
 zzo2P6/NpapQeNOSBHQlHvDFPUcMdCikeLThzj7JUonYe3onUcF5L14VAOeydgU1Wk
 9yaMiEAtfFDdJc8nN0tqHxodxqG7Vel6hQOUkFLTiATHyq2EDcDZ4r8V6ti7dZHYdw
 +YlcdYNBxiTKaT60m81eQFz/Tta1ejd2UrdtDXaUyaUmwlCEsFzqhXw1fp3DAYrsn7
 nru3DymoCJ0cw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=KBLc7sxI
Subject: [Buildroot] [PATCH] package/util-linux: bump version to 2.41.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.3-ReleaseNotes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index af850c03d6..eab8a0c3b5 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
-sha256  6062a1d89b571a61932e6fc0211f36060c4183568b81ee866cf363bce9f6583e  util-linux-2.41.2.tar.xz
+sha256  3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b  util-linux-2.41.3.tar.xz
 # License files, locally calculated
 sha256  4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3  README.licensing
 sha256  527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1  Documentation/licenses/COPYING.BSD-2-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 16d086f333..d0a03be404 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.41
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).3
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
