Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BFFC5DF67
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 22:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AC70407F2;
	Sat, 15 Aug 2026 22:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v276Pw8ARsvI; Sat, 15 Aug 2026 22:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E88E4078E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786831202;
	bh=P2wGc03GChz8sLZdny6cOpVw7bVL6SLQt+Np21jlaVo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DAoE3fFL1WkeqEHxHzD5vK0WactGeOxq5fwSIebuOSd8ijSjLgZGLewxHSZ5bR/CD
	 4LDuKC/km++BOsAxcwQg4BQ8ydwPi1UcWqCfdBPqr50G+YI9pK9RtoCDOhFcZU9KM8
	 eUZKOvRNyXofqP1vNwno96oDzkHesvb2VE7SCgVn1OyRa5+Nnbhlo8g3EGqi+Ubth3
	 qhO5+zQx8iRzXn6vkO72k9NzE4b7wTY/61VHe6Tvo9g+xlPiszqS1XPyQ38nuesWSi
	 Pj2PHwCe5W2ejuSyQJtbexgoNjtQlvCg9eQODS2Mf0v7fTOKipLVUVfQXY1YCjbfGv
	 15eVgHYRJygQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E88E4078E;
	Sat, 15 Aug 2026 22:00:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 38164333
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3593F80DFF
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6lS3XYbaIyl for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 21:59:59 +0000 (UTC)
X-Greylist: delayed 398 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 15 Aug 2026 21:59:58 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD92380DF8
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD92380DF8
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=bPcFUft2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.68;
 helo=smtpcmd0768.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Received: from smtpcmd0768.aruba.it (smtpcmd0768.aruba.it [62.149.156.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD92380DF8
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 21:59:58 +0000 (UTC)
Received: from localhost.localdomain ([93.138.165.36])
 by Aruba SMTP with ESMTPSA
 id vMPyws3NjtpTfvMPzwB7FH; Sat, 15 Aug 2026 23:59:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1786831195; bh=mDlzEFsaB0M8HNLvGvKP9Z2ZkOOXooyC/WJsKAo+/kQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=bPcFUft2GKMO1SsUUzbN9PXoBVKxj/nTm4WrDnRNvyYjRtnNb6AWUm5R2o1uaEOdk
 pYyXxIcOdQ6GWdSUq8h2r4XBKM0FhGLR8LWJiGwPTJX5/0GmPxkxtAy+6/2hoYRjuA
 df+xDzmGtScxyQ4ZOWzLOMfMCmNXPDai1+4iuMtrAjjTqxIT9hWiEntKb1eVMX3fOf
 M9V1RB/AYiMV7TGchSM7eiFxhIBhwJACxgz37DbOc9eeuLKyaEQorwSeidSRAYZhFd
 PWqsrMxpbTJWBcELJpLdMt4FDghHPHSR6+05d0mUH+C53VSVmkToJLLGbBzW1pR+Zh
 rc/whVtuU+uvw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 15 Aug 2026 23:59:53 +0200
Message-ID: <20260815215953.1015733-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMCbybpMcdOi5iL/UUPtksYHHkZ3OXlZz8jO+ouB7zCCZHjBcwAFU6Dfhy4eU/t++7QL4m2GLXyvfn1jHnAr2HiYIi6XdJjOSN7w8azjLLBgPfU0mPaq
 +/+zJS0RI3bfocPrRwvzMbO8w0RrnFycgo0vUofFqYBaVjYJbO+TTzGBk1Gkby5XnFlZNGSsrdR74xKQ2dM+4jKlW5b7Byb6osGIWxN/2e0bBGfOIwpvJkNa
 Td0ePyF8IjuUSN6ghx1uxBWK1QGHhdBHR5nxSgSQCAYjcSQGypN5RhM0wxEqZfA9
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 14.3.1
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

https://github.com/harfbuzz/harfbuzz/blob/14.3.1/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index c9739b2b92..3d7540f788 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.2.1
-sha256  a54a5d8e9380a41fbb762ce367bcbf7704792dfca0d93f1bbca86c5a57902e0e  harfbuzz-14.2.1.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.3.1
+sha256  9dae9538aae2ffdf70cec31f2c27bf68e2aaeeae3112688467697d5faf6194f7  harfbuzz-14.3.1.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index d87d2c41bf..909629d7d0 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.2.1
+HARFBUZZ_VERSION = 14.3.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
