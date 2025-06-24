Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA70C7EE30
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 17:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D4D440E53;
	Tue, 24 Jun 2025 17:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CoWFVgmyRMax; Tue, 24 Jun 2025 17:08:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2446540DC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2446540DC9;
	Tue, 24 Jun 2025 17:08:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1DEE12C
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 17:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D734960699
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 17:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLw6yLyHoDfE for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 17:08:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C760C607A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C760C607A5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C760C607A5
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 17:08:39 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -305859111; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Jun 2025 17:08:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uU78O-00BpQH-1T;
 Tue, 24 Jun 2025 19:08:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 19:08:33 +0200
Message-Id: <20250624170834.2819257-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624170834.2819257-1-peter@korsgaard.com>
References: <20250624170834.2819257-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=rjynL4oy8A/9OpYECZpCVLha1HDHBrZeYIOpfzuAIjVxe/0i/NeqeA6Nj4Fzwyy/81UHlSJZklSvLFRx85sDT0uT26mJRwv43o3hnFP1wUPhF41KGfXlzpbIPO+ULNbf5ywtAYZwOFJJV0JVH2svV0dfuE2Tk8ZlxTl8TQwhOVQltvA/YE1di76pElyDpg1SywAvSBaVvyQRSo64dFVUkP9H9cj55MvxO5gDZcZCy52jbsS2Z7D9fmTSpWSlVBKgpN6SX8bAftnXpsEZZ7nqjcdMxYBE2JrlHMjUvWvWtIn7CJvN4owXYaVWPxmZEsSW6s0FY4zPzkMMk//I1X7X1Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=HF1jtvV9rxiLMDg7JEG5PPmlbJc/mVKu4ETdBZMfGy8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=rjynL4oy
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 2/2] Makefile: unexport TOPDIR to fix gnu-efi >=
 3.0.18 build issue
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

gnu-efi fails to build if TOPDIR is exported in the environment since the
move to version 3.0.18 in commit 9efeb7e914 ("package/gnu-efi: bump to
version 3.0.18").

The reason is the change in TOPDIR logic introduced by upstream commit
31913f8489 ("Make: make TOPDIR actually work and get rid of unused CDIR"):

https://github.com/ncroxon/gnu-efi/commit/31913f8489f8e6eb624b6447d2e5cf1f6367bebf

export TOPDIR=foo; make gnu-efi
...
/path/to/buildroot/output-gnuefi/host/bin/aarch64-linux-ld: cannot find
 /path/to/buildroot/output-gnuefi/build/gnu-efi-4.0.0//apps/../aarch64/gnuefi/crt0-efi-aarch64.o:
 No such file or director
make[2]: *** [Makefile:89: apps] Error 2
make[1]: *** [package/pkg-generic.mk:273: /path/to/buildroot/output-gnuefi/build/gnu-efi-4.0.0/.stamp_built] Error 2
make: *** [Makefile:23: _all] Error 2

As a workaround, unexport TOPDIR like we do for other sensitive environment
variables.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index a052628ac7..c581067320 100644
--- a/Makefile
+++ b/Makefile
@@ -428,6 +428,7 @@ unexport QMAKESPEC
 unexport RANLIB
 unexport TAR_OPTIONS
 unexport TERMINFO
+unexport TOPDIR
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
