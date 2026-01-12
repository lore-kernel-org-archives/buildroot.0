Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BCBC9EC6C
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 10:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF9441838;
	Mon, 12 Jan 2026 10:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-b8r9xoLNCC; Mon, 12 Jan 2026 10:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5092D4182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768214856;
	bh=d21cGQyDMYn34WU3+6v4Hr0pCRt2tn6YjqSA0AUu75o=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QwDU0U9W/vn1UWr0Rt9OZCsX4BAA8xUvO7vYVdkjRjcqYDRUXXyw+OKVIl3eGJE/k
	 f9Ui6cN5uB7DULQ/NfY83mTGF95XyJMZbRvhRQ4P6j/XK1tWpJMS0xDC1DgLkVBxyE
	 5yt/7O/XEEarUruVlF+fm1GqfUzFNndqt95MdgQrk8LfkvPKdudz5y+fJM+42k9t2V
	 xXRcpFyWo55sHhQxhUoyA7wFZNPR0NcLOD3/aAMPvBknXf1Y8ypJOsDCQ1EbIu3A6a
	 NOLdr9UHKuawUmAD8bkNF0qU6k54xhavBCejjF4urFJUhLRunVpJvZOBm++28mJF8t
	 TWUt7U4TVrYZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5092D4182B;
	Mon, 12 Jan 2026 10:47:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 657441CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 10:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C882616BC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 10:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6rbw4uSCm-tb for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 10:47:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B5E8616B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B5E8616B9
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B5E8616B9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 10:47:31 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id fFSJvsDJ6IfDkfFSKvkn6q; Mon, 12 Jan 2026 11:47:28 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>
Date: Mon, 12 Jan 2026 11:47:27 +0100
Message-ID: <20260112104727.2624299-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA56dBLEjgt3KftTpTmLnzdMNx6/FGjeCczBkVkJieijXAPYYk7YdyyDaDr2ZRprR4E5o68DkZ/Oj8F52jRyfwNb7wWajW5gKHVdHHFTX/eCOkHIl36Q
 +XDR9OoCKQYoqR3+o6zh2lkjBDPw+V8t6pPiVqHLPrGTVT70NjrsE4W0EnMerGv7ePwZxgjsqxnSY5GN42OROU+bqnfvzO+SOV4uLHsysfyU8BkQyqpA56N9
 4qpW9Hhxeem8/ZjVDm34B4VphKD3D+y/c3zIEHOPPUR60TddDFvGg6edeSutBvBZbBmvBwn7LmxLzqgL12rspEVY1RhDKmvbj0gF1d4s9md8cyRc5jTx/upi
 wP/lT8bU
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768214848; bh=brE+X7bgqeNKUZtAtvB3heNnxRrG5TGr8xFFcTn7v5E=;
 h=From:To:Subject:Date:MIME-Version;
 b=eqRWxLbTWYQF/I9IMpeaeNsVqmzzzBN0UCNyBmPXWjRJL8umHk04Jjos6wVxQZ/9D
 EslL9LnyxfAgyJnMcmohINgmHulHGZFQ+U2VItJ+MxnI6hIOglqmmwd10odRlxcxe8
 kBGFhsD8A07B4QW52QqeZyA9r0+WJ4RMmAshHlbVA8BE/D8BYK5RBosYcXphIF4eIw
 wc73MoJwBA13tlOUnY+kgCg//Hkk4MEiUIf/q8T6Eh0eBs9fCBdFXqvbW1gCoVFPC8
 pdfqJr6T1l+VQJYhnQX/0T+O9aTduZGqHKMAtoZUWhzNwgzdXbqQBZQWdX5eVoi6OB
 E/O+07DN239iA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=eqRWxLbT
Subject: [Buildroot] [PATCH] board/bananapi: simplify berry and ultra
 configurations
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

The genimage.cfg and post-build.sh files for Banana Pi Berry and
Ultra are identical. Replace the files in the M2 Ultra directory
with symbolic links pointing to the M2 Berry directory to reduce
code duplication and ease maintenance.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/bananapi/bananapi-m2-ultra/genimage.cfg  | 17 +----------------
 board/bananapi/bananapi-m2-ultra/post-build.sh |  7 +------
 2 files changed, 2 insertions(+), 22 deletions(-)
 mode change 100644 => 120000 board/bananapi/bananapi-m2-ultra/genimage.cfg
 mode change 100755 => 120000 board/bananapi/bananapi-m2-ultra/post-build.sh

diff --git a/board/bananapi/bananapi-m2-ultra/genimage.cfg b/board/bananapi/bananapi-m2-ultra/genimage.cfg
deleted file mode 100644
index 92c8677545..0000000000
--- a/board/bananapi/bananapi-m2-ultra/genimage.cfg
+++ /dev/null
@@ -1,16 +0,0 @@
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8K
-		size = 1016K # 1MB - 8KB
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/bananapi/bananapi-m2-ultra/genimage.cfg b/board/bananapi/bananapi-m2-ultra/genimage.cfg
new file mode 120000
index 0000000000..aa6832894c
--- /dev/null
+++ b/board/bananapi/bananapi-m2-ultra/genimage.cfg
@@ -0,0 +1 @@
+../bananapi-m2-berry/genimage.cfg
\ No newline at end of file
diff --git a/board/bananapi/bananapi-m2-ultra/post-build.sh b/board/bananapi/bananapi-m2-ultra/post-build.sh
deleted file mode 100755
index 21a2b0d8e7..0000000000
--- a/board/bananapi/bananapi-m2-ultra/post-build.sh
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname "$0")"
-
-install -m 644 -D "${BOARD_DIR}"/extlinux.conf \
-	"${TARGET_DIR}"/boot/extlinux/extlinux.conf
diff --git a/board/bananapi/bananapi-m2-ultra/post-build.sh b/board/bananapi/bananapi-m2-ultra/post-build.sh
new file mode 120000
index 0000000000..01ca59fa50
--- /dev/null
+++ b/board/bananapi/bananapi-m2-ultra/post-build.sh
@@ -0,0 +1 @@
+../bananapi-m2-berry/post-build.sh
\ No newline at end of file
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
