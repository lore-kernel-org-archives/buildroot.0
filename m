Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB08FCCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 08:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EA5D40F4A;
	Sun, 12 Oct 2025 08:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VW-G5DIrdV1x; Sun, 12 Oct 2025 08:58:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BAE240F43
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BAE240F43;
	Sun, 12 Oct 2025 08:58:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B364C12B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 08:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B090D81E06
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 08:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNqfsIq6gfbC for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 08:58:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7024081E0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7024081E0A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7024081E0A
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 08:58:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 355DAA4C661F
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:58:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55108)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v7ruK-000000000hn-2Vx9
 for buildroot@buildroot.org; Sun, 12 Oct 2025 08:58:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 10:58:24 +0200
Message-ID: <20251012085824.3442649-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760259505;
 bh=lLmd1ceFe6HAAOYJIQa+VrPhexzUoOrhdwK18NAKzWQ=;
 h=From:To:Subject:Date:From;
 b=nCwE1dvjzbq8y2zjW47kOp60WHi+Tlr3In14OOSguX1u+LWhwrS4Ph4lHfEscBBII
 xA9orEGlJmSqJ6bblGAJ4RGpNsXmZxr41xqe5AfzIeY3iz4Tjo4zyB9bwZIJiLeLYf
 y0SeL3iRjf6kZtNKZpmMrelJl1Ph4TGxktZZ7C5/i6oXof3vLPcOiRbSLHQsk22fBF
 DBWB8Kh891sfyv+Glb+rYJWVo/JYkWQPWSWU4tKBLlxu2T6nTF+Pyi0OUeRjAwcJg9
 P2e/m5c0Og3opXzG78wJp3ThtVacfk6Ql9RXRBtmwTaqifoeKFCDM1Wi1XEgT3AW8Y
 aDMA8doQxpuog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=nCwE1dvj
Subject: [Buildroot] [PATCH 1/1] package/mpg123: bump version to 1.33.3
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

Release notes: https://www.mpg123.org/cgi-bin/news.cgi

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mpg123/mpg123.hash | 6 +++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 67ece34528..2fc0061476 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.32.8/
-sha1  dc4d8d9d7fdc9c6c85e3036734eb937272a97800  mpg123-1.32.8.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.3/
+sha1  41dd15e29668a8e1372d31f327c8962a8ef6b595  mpg123-1.33.3.tar.bz2
 # Locally calculated
-sha256  feee1374c79540e0e405df0bc45fde20ad67011425c361a2759e2146894a27a7  mpg123-1.32.8.tar.bz2
+sha256  6a0c6472dd156e213c2068f40115ebbb73978c2d873e66bae2a250e2d2198d26  mpg123-1.33.3.tar.bz2
 # License file
 sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 2020fa55e8..5e55d33b72 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.32.8
+MPG123_VERSION = 1.33.3
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
