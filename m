Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E76C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 11:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9242C605F0;
	Sun, 26 Jan 2025 11:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHLEvOPGOhz4; Sun, 26 Jan 2025 11:32:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D6B960793
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D6B960793;
	Sun, 26 Jan 2025 11:32:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BB9EF10
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15ECF60793
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdpDaHEVfwR4 for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 11:32:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E7413605C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7413605C9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7413605C9
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:32:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 426CA60005;
 Sun, 26 Jan 2025 11:32:36 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Jan 2025 12:32:28 +0100
Message-ID: <20250126113234.4164811-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250126113234.4164811-1-thomas.petazzoni@bootlin.com>
References: <20250126113234.4164811-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737891156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FiFc4df1l9VDo1BqLT2HPt21RFtippvh07NCx5irUFo=;
 b=eHNRLSJSiyuFmtVRox4oh12w6gVCPaqJiz2wNhCcDKwb88KaZKLjySttN8RriQXxjwOHXt
 5ksYFAV2hC9AZfuPKQdbP5IdVFiU2+nKJSbbC2RG4Nz68wpfYb5nio/k6ycfUwg+7swG6R
 zXT283Y0SWqQ7yv3KBFFySNrBe0aC+Vc4Af+aIYH5W2sGQGTpezWkTNYNrQiS3Dvf327nI
 orHOe/gc3+JJa9yGL0yEussKWAUEkD5De35jB9QzHzxkaw/zkLDqAEKh3LYhwTID3Bu2RM
 i5R8Ymn3yko2beUQ7UNA/uw5cfvjUbU9Nf7PrQPnYlg3N/fYtrJBNDqC8e3spQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eHNRLSJS
Subject: [Buildroot] [PATCH 1/4] support/testing/tests/package/test_gdb.py:
 fix ARC test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the disabling of the Synopsys ARC toolchain in
11a8cdd2bbbd0ef4adf600e4792d75f6f2122ec8, the test
tests.package.test_gdb.TestGdbArc was failing as it was relying on
this external toolchain.

Let's switch the test to use BR2_archs38, which allows to use a
Bootlin toolchain.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/8892696282

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_gdb.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gdb.py b/support/testing/tests/package/test_gdb.py
index 4712162349..324052efdb 100644
--- a/support/testing/tests/package/test_gdb.py
+++ b/support/testing/tests/package/test_gdb.py
@@ -95,7 +95,7 @@ class TestGdbArc(BaseGdb):
     config = \
         """
         BR2_arcle=y
-        BR2_archs4x_rel31=y
+        BR2_archs38=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_PACKAGE_HOST_GDB=y
         BR2_PACKAGE_GDB=y
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
