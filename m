Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B80FEE4EE
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 18:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 129CC83DED;
	Sat, 28 Feb 2026 18:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtKRIWndkNHt; Sat, 28 Feb 2026 18:53:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7743A83C69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772304818;
	bh=uamsKSqMDGrFQGoXH4xPGt3DOVcVQqtAf6lk1jO7csc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s6VPlmzWsSCEqkdlNpdAY2FKD6juTV9IJ3kQnJ7ohQWr9hdGiz04yue7SaDE5FDTZ
	 pBy84r130Wv/YRlaVudtUHs3MN2yPGx/b1KYxodxQ8vu7OFs27ClDf46Fkadb5t30o
	 2DhFlninI8wfnaD6S5345UMdK6IOAszz0d6VOIzaVb6EBU5W4CsFeXXnRtFsPnZDXV
	 pntfS42vop5zLK9vPdlEO9mI1qpSESW9/Z5sUJalxzbH9I41Uz9xHMlY8XVIYIUGKQ
	 lvNPwU++gLHZF1XW7RP+U6ElChgd6/P91l36L+Qv2TukvLv4QqMDFEn2vv8sQ6KP3T
	 WoAyjLFoaAZpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7743A83C69;
	Sat, 28 Feb 2026 18:53:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 265D318D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 18:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C53F60F3A
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 18:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_Ucwo_Bepne for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 18:53:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B50160F39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B50160F39
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B50160F39
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 18:53:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1F304A4C2573;
 Sat, 28 Feb 2026 19:53:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34388)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vwPRU-000000002kY-0L7M;
 Sat, 28 Feb 2026 18:53:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 28 Feb 2026 19:53:31 +0100
Message-ID: <20260228185331.1707665-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772304812;
 bh=lOCbmp1z1/SDIgHaJx827DkHdWOrdzOHGPcvxKTwD+Y=;
 h=From:To:Cc:Subject:Date:From;
 b=cTZrnDbNn5Ke3XWAJ/ehwK09tmNJpXCGDxgemgk1kwdj/8acYVGYu6ET5CgIob1tu
 lV2hpbXHtBKECIxt1ATSplQGrxc1apUeC2tk6QWbdldkdG+1HUtFp5hNo0z/RLqOpx
 gsYvW7siIFpg5UW/jktFK+OCvOzQ/OCC0kFjYky8t30AWLu3+LZtux6RHPi7gW+gQS
 P7rftg8dH2tv7Y+SB5fAaBCGT66aXByBq3/On5brYjf6ZGnJPkyAUPxr0gmgtSSZiT
 +sWty/h9/wBgLBFt9hjD09k2betb/F2/+yrjcmcx3HWdOvTj8ErNRfaQLkW9WZVHzh
 7kH8vYeBVog/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=cTZrnDbN
Subject: [Buildroot] [PATCH/next 1/1] package/fwupd-efi: bump version to 1.8
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

https://github.com/fwupd/fwupd-efi/releases/tag/1.8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fwupd-efi/fwupd-efi.hash | 2 +-
 package/fwupd-efi/fwupd-efi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fwupd-efi/fwupd-efi.hash b/package/fwupd-efi/fwupd-efi.hash
index 42f9eb83ff..8bca799e68 100644
--- a/package/fwupd-efi/fwupd-efi.hash
+++ b/package/fwupd-efi/fwupd-efi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  96d4fc45467159b2664ce86ee7d5030e265fdb4d4a4d774080654d2f5b1561ff  fwupd-efi-1.7.tar.gz
+sha256  c9f1f9b9b967ea50eb0b478f0d7693d6673d4cd76c8e7eb80c55fc44ec928925  fwupd-efi-1.8.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/fwupd-efi/fwupd-efi.mk b/package/fwupd-efi/fwupd-efi.mk
index fbff5a9043..3e41056825 100644
--- a/package/fwupd-efi/fwupd-efi.mk
+++ b/package/fwupd-efi/fwupd-efi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWUPD_EFI_VERSION = 1.7
+FWUPD_EFI_VERSION = 1.8
 FWUPD_EFI_SITE = $(call github,fwupd,fwupd-efi,$(FWUPD_EFI_VERSION))
 FWUPD_EFI_LICENSE = LGPL-2.1+
 FWUPD_EFI_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
