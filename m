Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F21C5DF82
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 17:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED096811A5;
	Tue, 18 Aug 2026 17:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97r4CK6o_Qi5; Tue, 18 Aug 2026 17:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D6708118F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787075405;
	bh=9JrvS1IUvrduAGT14Vdk9c26220ZzKpSBombLYLpYsw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qCaJqb9IM7172IwOO4AogPJX0qivUoBcW0QJZ+vCXcPliPm3Hrr9jw30+aCtm2uwa
	 Ghw6pF7aG8oI6PHgeIPoR4f2Hz/1UEAs7VKNk0OIxmW48yRHsAunyArjWxSuaApC1n
	 nkGF0vEaUVWvykoLgHa3ONuKaIDwzuEWZYNvJh888aJDyEZqPT5hlGRsZeMRWrcCGr
	 G4p4wILG0SUrkg1kYHZQC2Eq7x4TA8cQANJU3h8ABA+cIjUfZYIwDy0b4GwcoyXW18
	 HGUh32L48mtVGUazI9lH9o5b3VZauGXjYfTPfWzLX7cJ/kou3t827SWNMRFcg0nNF/
	 lFSLx2n/2EzcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D6708118F;
	Tue, 18 Aug 2026 17:50:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0747925B
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 17:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8D3081195
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 17:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AR1wbkuaEdB6 for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 17:50:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.113;
 helo=smtpcmd02113.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAF9C8118D
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAF9C8118D
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=XXI/8S5/
Received: from smtpcmd02113.aruba.it (smtpcmd02113.aruba.it [62.149.158.113])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAF9C8118D
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 17:49:59 +0000 (UTC)
Received: from localhost.localdomain ([93.136.29.121])
 by Aruba SMTP with ESMTPSA
 id wNwiw7nWtxFXLwNwiwYcjS; Tue, 18 Aug 2026 19:49:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1787075397; bh=OzeyGydzs3HfirYpJx0IGBlB4FeIUqEFhXrtxYx8lDc=;
 h=From:To:Subject:Date:MIME-Version;
 b=XXI/8S5/S7BXp27w1Gd+WHqvmkuBg0x/IMzjN65/4y326JfpMCqte+9PQUJ4XuTSm
 iXwdQOAXvyWRWpQ+x5wACcLUxW4sfTUeRVvsxW1hJrm/U55z4SeT1U91fmzTUKhOgB
 Zz5BDyFEP9YarRX9ErbtZfUHa2O/4WKIfYTNBQujZOaXdcZkkn05PWqSUlIg3hFnEM
 5Hw3sRZm6AvsqYavL60Osv5U75b6Zm9PTylP7LEwAdpFN3657dkDRqPBv0zSWdGq9K
 /XYHDksy44ZZxODnxN7u9LbWAMJUOLyWEX5C/4DZOeAiqZ5Mzc4UwrILs6Jm13PRPz
 1+pxa4guBDl+Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Alexander Dahl <post@lespocky.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 18 Aug 2026 19:49:55 +0200
Message-ID: <20260818174955.835507-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGzrnh51/LWk9AHwmzFr50K3A6AAbv1Dnsom9QHHBvKsjMeJa+MZ79754SQQbg+BAMh5Yn4lKkPdJIdotuMasqofnAftNGKl7TmSO81sBzft7lpBAqlh
 yGOUAEnlIG3Ya/I4W1md3857MLaI0vO6LWv0UAZClr4zXLZNHaMhNT14Eh9G5cr4ObMPX42FC/drwwsbEri5qNgcc/WJVj/05QI8FJm7wVUHdWuM2nDNkhpR
 o1fHfqMSu58qkFZnTu4LhX1Vz2SrSO8mGMj2wIsaFhDNLOK20Rx1QAZGvoG0fGuBk/qjULc5LedQpRiWrCy9lw==
Subject: [Buildroot] [PATCH] package/putty: bump to version 0.85
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
https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/putty/putty.hash | 8 ++++----
 package/putty/putty.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 362467e2d7..8a9dc4b5aa 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,7 +1,7 @@
-# Hashes from: https://the.earth.li/~sgtatham/putty/0.84/{sha1,sha256,sha512}sums
-sha1  d3ed01106667b42de322b266266e0d21b70adf12  putty-0.84.tar.gz
-sha256  06057862ae198f1dbd219d0c7493080d59f606194bb5056c549e342aa01b69fe  putty-0.84.tar.gz
-sha512  647c84490c01f8c0f9cf02f565081d80ea2ea4fb90207cfb2fbe13ba5e8c3cea7c4807504363d3d3a851df5edb6087c3b39084820bf20e818dd551db54af0765  putty-0.84.tar.gz
+# Hashes from: https://the.earth.li/~sgtatham/putty/0.85/{sha1,sha256,sha512}sums
+sha1  a9f0b3ed9b90a9f48615eb446a626fa107e33267  putty-0.85.tar.gz
+sha256  13fd4db2936d03b73812a7bcc2a658e4dd29cc776a56c3670a7fc6f1a0ee8af8  putty-0.85.tar.gz
+sha512  f52c3f580a0b9e52cb65c0bfddfa834f7362af22ac8c1a3803cefb11e43e35887b98209ae32d2abc0b56c2d0ddcc03c08b42542ce72989c1dc3ef116c19d761b  putty-0.85.tar.gz
 
 # Locally calculated
 sha256  3b02f87e0063430289d9681727a98818c844fc8a4d79b24b76047fa061e77f13  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 82b16b250c..5df29714b7 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.84
+PUTTY_VERSION = 0.85
 PUTTY_SITE = https://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
