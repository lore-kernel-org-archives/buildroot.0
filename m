Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72A1CD3436
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 05:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 787B061306;
	Fri,  8 May 2026 05:03:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCfJaevwHMh4; Fri,  8 May 2026 05:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53FCB612F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778216606;
	bh=aEsuoRrnpIGCEl8mkcDmY1jyR+vK2bSMg8EqfWxfw40=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DddgaaIgSFIu3NkJs0jeuOGpUrSdKJ8CWVYigP9qjg8is0yqkWEmqNzDmmEqavT50
	 quvAhuHGCKad4ou6r1KcPt72W+Fx6Q7qcJXdjBe7EEtuswfPyjCE6lTQZvWJkJP5wr
	 /HtjmCmfmTUkq78Hh4pupPeWmwWN8gaV03x3R4GJXP/rPhmbz4RvtXWJC6K47icEkM
	 R1E/Ii2TNmqN9Pl7lDzdHDSMQIf+8W0yowQ8yZlTF4YvTx5dQtjvf/qJDfpJKlvPBo
	 uOQucgjF/19UXXuiNIKsJVH6KwxjYJ7nW8qmyKYqEMjMcVZ4WGorgUHQ7BCRGddNTp
	 ohnE0RGRcu3uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53FCB612F5;
	Fri,  8 May 2026 05:03:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70CA1358
 for <buildroot@buildroot.org>; Fri,  8 May 2026 05:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 629AB4159B
 for <buildroot@buildroot.org>; Fri,  8 May 2026 05:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uyi7lAgr4rvV for <buildroot@buildroot.org>;
 Fri,  8 May 2026 05:03:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F7FB41592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F7FB41592
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F7FB41592
 for <buildroot@buildroot.org>; Fri,  8 May 2026 05:03:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05da.dip0.t-ipconnect.de [91.58.5.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A4AEBA4C0627;
 Fri,  8 May 2026 07:03:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51840)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wLDMs-0000000012M-25jP;
 Fri, 08 May 2026 05:03:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>
Date: Fri,  8 May 2026 07:03:18 +0200
Message-ID: <20260508050318.13573-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778216598;
 bh=ZXEmb3SNgiGIVeu8Mdi01hsJhZkjHRdLQqO9+WIUAWg=;
 h=From:To:Cc:Subject:Date:From;
 b=ROQ0SirPS5MD9CJPE1Yh0YJWqYx13dpKlILDP2FHOdrDJ61eo7wjIiKohjUd4cLhO
 892DBOwtB2y+M/F2tGkXN0U/fFrKRuy13xB32VO4bpkfdWyjnMcRO917mehKl5rsl8
 SA0jD/tFdUFxYsH6/y6l2JM8uIbylEeMFCMNtRRlhpF/4McIT3BEVW0MReEuLmE1gY
 lfTYm7Q1Q8ZfE+6l9HA8blrnj5o58rtdyQVDhI3787cuZ5SgvkvAjJXybPqCIXh/zU
 BfdJWNglb9I2wIviJ/qQ5bsRDiOdPLIUb0xyWCYSwNOdo/TlE4O5906tHER2KKNeMU
 YLVLLgppzy0KA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ROQ0SirP
Subject: [Buildroot] [PATCH 1/1] package/znc: bump version to 1.10.2
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

https://github.com/znc/znc/blob/znc-1.10.2/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/znc/znc.hash | 2 +-
 package/znc/znc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index 6ffb5a3917..128c84850c 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4e6e76851dbf2606185972b53ec5decad68fe53b63a56e4df8b8b3c0a6c46800  znc-1.10.1.tar.gz
+sha256  5b7561f3b100234d58ae4946eac0262ab305d275c094e64ae723e45d07be08ab  znc-1.10.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 3a0b983b09..7ddfd64715 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.10.1
+ZNC_VERSION = 1.10.2
 ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
