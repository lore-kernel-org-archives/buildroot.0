Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B81AC88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 16:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 943CF60614;
	Sun, 13 Sep 2026 16:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yx1QAC6Kz2P; Sun, 13 Sep 2026 16:28:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 07B7C605FA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789316882;
	b=NO9nll8GgnHf2J5U+6gT7em1Q0uzSdIWhceSLTXea7z1+UiIm2HwNBkcgcFBXNtcogoh
	 +1Evc8rVNNYViotH4097mgwmyKhbjM8Vy0cNGxxgO0QTNuEVfBCfz3J3hD4Un9dEB+zFH
	 HWy2yPRHAhPVCETvhsUoHXDZDgpksASE5YFRO89mmv8hynrYrcP5on/XsFp5hCBJ2A2j+
	 FAWWAbe40spRQiIOLSeImYN2NgOpYXaJXS7/2pSxVK79XDR4y7z59Ku/hUH8ktzGbp5n8
	 UQjA46ZhWR1/0JNN0bvevYdDBWDb0tQL5BBJRA7cV8qTzKyeXcTTJk6P9REPqYzcjng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789316882;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=723sjXBEobL323BWBy/Jp281IeDPE0q4TI5Dg8IQa+0=;
	b=AuaYphcB/tsMXsbOFFwNq8JLuvID98LGitZHX0WCMtjYVJydBXZ0FxqxKiaPp4r8pzh3
	 4savjhCNMuRXER/vrhR0TLeBUKfvEFwMaCULHfgd23oSd1UAaRSTAVTkBovdIVUyrcC3T
	 9BfnHKNAlbfL2HdIvmE+T2TVwpeb3ISx9YzPaM+R0zb1XCHIYfRCjl+OgdddMRXNFW1Qh
	 GyZrahsruIqZSjGGjizMUYufrlxkdeFFKniqLO57PyayjcWayDNHdyQbdEPQsojlszIFR
	 dstYjM0Pecr30IvSjB3Ui23zUVS1HKDdd2v1y0CBaz3J4h4GHYn4OWNPfHHnnGMbyzQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789316882;
	bh=723sjXBEobL323BWBy/Jp281IeDPE0q4TI5Dg8IQa+0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RivmXhO9kyXaV1DCxt0dNNxA6LG58/t5XP/0asCa03Fav9DTtbWnZcSkjcTgMJptH
	 YiJSTjw0dtt7meiGxUd5GgBqadE9pOcY7m1zFfXqipVEsXg/aktirY2D3gqOXm9/jL
	 6KdjIInGCmkA51F5DRgvMCbeDml6lhFQX9wGhkZ5FFN/z1Eai/qm6Aq5pTr2KMCpLU
	 1v+qQ0hFxPxESMJbEfDZ7CDsJMhW42ClAQofSjZ2c4lYq10ueeV89MasOW0lLqOgND
	 UwChoxkiBL6rNO1lORib6k37AGPgyFaeqdOz1BlCWH70uKvtIk877tUgwHrYHElWHB
	 3s8VFeOUDS4cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B7C605FA;
	Sun, 13 Sep 2026 16:28:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C4E224D
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 720C180ADA
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tESqThKh4S3d for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 16:27:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1C926809CE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789316879;
 b=amGsFRHgZDLI9tMVziyN40bE1AuR+ETllcu6tvgp/XV/NUFI7GZUeHGSyV8DXH9pXNDM
 ydAFkdyMX0t4lInKBpLpXUTzPW8lvAXUcMTImycQv/xZ+AHRqnb9WerCuYusdIyWtP5Qw
 H2F9ATkQOzEiz12bGnLqT/K7Qtw57p9fAJyQqszBIEK7MGgVGdxK5fCng3QdsCPFxfwI1
 SsGO0+wRD5MSXhWRDpusCzfSYPlcQX3fCasPT7QpmIQ8CHp8cbYwT2R7IByPwYWAuKAef
 jAoslh+nbWKRdXGlviU1fJLTErZ98RXsmBW0o7Dxk3U6TqhfAm0Hdgjo0O6iL7XLRtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789316879;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=H6FPe+YIouxEbO95rdtu4TNDFpwMu2riJTFj8a170mA=;
 b=ViWuvteKwTGID9iyi+jEa6L+M6B82H0sQQukBgq8Pgf1PHtu+aD9l2Q+44+XPPtq/xeg
 RSFAcBCloT8SKMwG+9i9vwvzmaMH8hLuy4wDNBruTPjvc0UOsWyOSVW0cNBv0XFehZV5B
 ixShIy3vYJoDjnfVmMhRTNS4lbteZiC9xWISEsMFiJ3CtviE1KW3LebDFvfuY5zvoKeIm
 usSv6Du9TNUPuKw6z4u20annI9M2igksuROAGBVx4ElBCjO7OmZEBKVi/RBNreu8Ia9Bg
 grcyxbpafbT2wWnB3bKtR+ba9aQ//1Ow33D46z8OGBa23YcFhRR5kCGiGdBLEhDoo8A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BLlGPsKO; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BLlGPsKO
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C926809CE
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789316873;
 bh=H6FPe+YIouxEbO95rdtu4TNDFpwMu2riJTFj8a170mA=;
 h=From:To:Cc:Subject:Date:From;
 b=BLlGPsKOv0WPUluOZBWcOSBByOYxoyrcPguVmIWDAOPBOxl3pXxwxshVscreNm8IH
 AvMWebtaLxnaZj0TKm2Aob/ef+UJTrLN5nONlr6K4AtE70DiBgEi9n05Mt6Ka4IGXv
 QFTDmOvMjZ+NXsY+41Ntrc8k6r4aetvr4BSuXNE4zG35oBEBqLansGdCuikdFLtygV
 AYq+a7Ud3/PgXl1Tuljwi5Uta0IiHq6iiLEMXwwtovTBEP7R2GEBAyz9BdoCyYX5or
 oM9UPZsj7zC3T2KwaXSwczvUkucKi1qXpIIJtp1mModdGPTLZ7yzT0uUnoBKSXVcET
 zb+lZd+opAkiQ==
Received: from fli4l.lan.fli4l (p54a1b732.dip0.t-ipconnect.de [84.161.183.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8A50CA4C244F;
 Sun, 13 Sep 2026 18:27:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33602)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x5n3Z-000000000je-28FR;
 Sun, 13 Sep 2026 16:27:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>
Date: Sun, 13 Sep 2026 18:27:53 +0200
Message-ID: <20260913162753.2099563-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/znc: security bump version to 1.10.3
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

https://github.com/znc/znc/blob/znc-1.10.3/ChangeLog.md
https://wiki.znc.in/ChangeLog/1.10.3

Fixes CVE-2020-11022, CVE-2020-11023, CVE-2026-82373 & CVE-2026-82374.

Updated _SITE according to
https://wiki.znc.in/index.php?title=ZNC&diff=3493&oldid=3460

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/3ac213ae64bb2cef4286cd9160f2c0b7b69168fa

 package/znc/znc.hash | 2 +-
 package/znc/znc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index 128c84850c..08cefa6a47 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5b7561f3b100234d58ae4946eac0262ab305d275c094e64ae723e45d07be08ab  znc-1.10.2.tar.gz
+sha256  68f3f6641b480c041010c5596e1234043e05c9137eda06233845017603095f5b  znc-1.10.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 7ddfd64715..1144762469 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.10.2
-ZNC_SITE = http://znc.in/releases/archive
+ZNC_VERSION = 1.10.3
+ZNC_SITE = https://files.asokolov.org
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
 ZNC_CPE_ID_VENDOR = znc
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
