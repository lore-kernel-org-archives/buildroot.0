Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA818CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 16:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92505605D8;
	Sun, 12 Oct 2025 16:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G68RUh_uzL_3; Sun, 12 Oct 2025 16:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8DC86061B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8DC86061B;
	Sun, 12 Oct 2025 16:49:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2423BC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BE9B81083
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-nrnerqxZ16 for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 16:49:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F4738107D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F4738107D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F4738107D
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:49:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DECBFA4C63B2
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:48:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58192)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v7zFi-000000001wl-17bR
 for buildroot@buildroot.org; Sun, 12 Oct 2025 16:48:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 18:48:58 +0200
Message-ID: <20251012164858.3447839-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760287738;
 bh=Xqu9A18yKOsAbzfhMKK5vJkJMbcC4WDU44sfxDWz0L8=;
 h=From:To:Subject:Date:From;
 b=Im6fpivZvInvpO+dpMHmvWuB0+RQVZWO5wNhce8iQ5LePUfxazaeAQGqe5hiZA3mq
 Xh9SNR1BipMgG5tlvBy5TxJl3Neckqo+20a/dz0qJRSsIx5ThgdaA4sD+fCT7I94ib
 zwu1AjbxbLr1dgRx+dyX+m4fh4DWNAareoAPnUlljFFRxrpfjYPNf0pNCNh5coYrby
 99RjOEIONwREfnXSwaBB8O8S4RAg81/tHMvLdAUfO+EnpogBIZkTiupRA3ATNaoK8z
 Qg93VXykdqFsKs722wdDcbptGSHBlpmEnQqqScRoiVJte50HDltMYKtzdyZ1cjEgXu
 rNIqqzMZmjw6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=Im6fpivZ
Subject: [Buildroot] [PATCH 1/1] package/util-linux: bump version to 2.41.2
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
https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.2-ReleaseNotes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index d1c2986ca6..af850c03d6 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
-sha256  be9ad9a276f4305ab7dd2f5225c8be1ff54352f565ff4dede9628c1aaa7dec57  util-linux-2.41.1.tar.xz
+sha256  6062a1d89b571a61932e6fc0211f36060c4183568b81ee866cf363bce9f6583e  util-linux-2.41.2.tar.xz
 # License files, locally calculated
 sha256  4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3  README.licensing
 sha256  527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1  Documentation/licenses/COPYING.BSD-2-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 3098a81a72..555a1e74c0 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.41
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
