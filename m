Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A18CCA476
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 13:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 540EB845EC;
	Tue,  7 Oct 2025 13:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQQo-RJ0U3he; Tue,  7 Oct 2025 13:08:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 376B384310
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 376B384310;
	Tue,  7 Oct 2025 13:08:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5481226
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 13:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B292B413F8
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 13:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBeMbRlaYRsa for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 13:08:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E41E1413C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E41E1413C9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E41E1413C9
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 13:08:04 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1716461050; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 07 Oct 2025 13:08:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1v67Q7-004DDn-1W;
 Tue, 07 Oct 2025 15:07:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  7 Oct 2025 15:07:57 +0200
Message-Id: <20251007130757.1004115-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251007130757.1004115-1-peter@korsgaard.com>
References: <20251007130757.1004115-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=uPJryTFjisF34HzxYU/G2GQ5NfW5xGZUuyBJ4/OiOgnNvETAKw1JroHnUE03lVecSrCS5ZMlvDdHr4XtvfpR6pg47n5wjyij5HPHDLtEbNc3GiNIjGG5yQQLbrggCOCvNoUAYdAtVdmCxsm8CSgNdCMl5sDc590acRaH+YYsknKkPcmORMauWYIJT5uXgyHA1xTMnIbK87fKn+LoTZoXfWU4ZX/hSKzkViSumcj2NIQ74pNz+RNf5jyE6ERHx4ZfdSQg7Apbu9jzb95EYTLVhIjI2dCEHwOyJLAh46YmAQfncf42slIN9uLkwVRikjlBuUwRo8Nk5eOdjUWvSBZotw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=cTAfIB/qfwo5xrvM82MA0OTvZ5bBZ+5w2mCL+NrVg6g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=uPJryTFj
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 2/2] board/beagleboneai/post-build.sh: fix
 shellcheck issues
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

BOARD_DIR is not used, so drop it and quote $BINARIES_DIR to make shellcheck
happy.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                          | 1 -
 board/beagleboard/beagleboneai/post-build.sh | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a9d259a2f2..1c3bca481f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -9,7 +9,6 @@ board/asus/tinker/post-build.sh Shellcheck
 board/atmel/flasher.sh Shellcheck
 board/beagleboard/beaglebone-qt5/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch lib_patch.Upstream
 board/beagleboard/beaglebone/post-build.sh Shellcheck
-board/beagleboard/beagleboneai/post-build.sh Shellcheck
 board/boundarydevices/common/post-build.sh Shellcheck
 board/boundarydevices/common/post-image.sh Shellcheck
 board/broadcom/northstar/post-image.sh Shellcheck
diff --git a/board/beagleboard/beagleboneai/post-build.sh b/board/beagleboard/beagleboneai/post-build.sh
index 384b4d8745..8d94a8f1e4 100755
--- a/board/beagleboard/beagleboneai/post-build.sh
+++ b/board/beagleboard/beagleboneai/post-build.sh
@@ -1,4 +1,3 @@
 #!/bin/sh
-BOARD_DIR="$(dirname $0)"
 
-cp board/beagleboard/beagleboneai/uEnv.txt $BINARIES_DIR/uEnv.txt
+cp board/beagleboard/beagleboneai/uEnv.txt "$BINARIES_DIR/uEnv.txt"
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
