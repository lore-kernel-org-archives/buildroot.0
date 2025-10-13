Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8906CCD185
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 18:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A243060E09;
	Mon, 13 Oct 2025 18:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YlAio-JKV-Qs; Mon, 13 Oct 2025 18:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BA8560E10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BA8560E10;
	Mon, 13 Oct 2025 18:45:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01ADD1C9
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0A9560E10
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WqEz8qNP1x9J for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 18:45:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06CEB60E09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06CEB60E09
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06CEB60E09
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:45:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 143BFA4C6880
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:45:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43978)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8NXc-000000005nT-1pBk
 for buildroot@buildroot.org; Mon, 13 Oct 2025 18:45:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 20:45:04 +0200
Message-ID: <20251013184504.3610364-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760381115;
 bh=Ri0JNn60YbCA9xDJ/cwv04l/KaQMJJ9djF15lG/X+5M=;
 h=From:To:Subject:Date:From;
 b=drmstPYsT+T/JEnXzv9PPXSFPk9+trN5oqgLpswBdLZXdRwiR5w5WGd/3gBQWbDcl
 Uc6zk5s3g7w2Sst+fWA2wEPw8cnStjahn6Iuwk1LF0LTDEO5un6FNnhd8GgWDqavxi
 ujUC2BgNAjw0NSK7QD627hOasmuBubaYqEZzgAwinq2+tbFtEWO7jWs2MJU9FVYXRF
 V4IWHz3V8ARsF17AsFim6iP/WKO2aVOeYXjLxj2DcetpbdYqg5ViGgkNXGu1qTaMJV
 CPFUv+usL4BfVcdEMXMA5lr+MJ+LOMDFWFnTyvDlCWJNBhPPLJYV6KX2pyZwVmHQbQ
 5D4sfFHx3wxpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=drmstPYs
Subject: [Buildroot] [PATCH 1/1] package/liburiparser: bump version to 0.9.9
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

Changelog:
https://github.com/uriparser/uriparser/blob/uriparser-0.9.9/ChangeLog

Renamed license file due to upstream commit:
https://github.com/uriparser/uriparser/commit/460ff9e573b4b2bc3a3114d91e95c885d8745458

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/liburiparser/liburiparser.hash | 4 ++--
 package/liburiparser/liburiparser.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index f2e3317897..bed9c8ee9b 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1d71c054837ea32a31e462bce5a1af272379ecf511e33448e88100b87ff73b2e  uriparser-0.9.8.tar.xz
-sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING
+sha256  85645df1bb220a3867c42f8adeba4f6a4b2fdc1563e91ad7d9f92d14d3dd377d  uriparser-0.9.9.tar.xz
+sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index b0ba8c387b..66ec72409c 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.9.8
+LIBURIPARSER_VERSION = 0.9.9
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
-LIBURIPARSER_LICENSE_FILES = COPYING
+LIBURIPARSER_LICENSE_FILES = COPYING.BSD-3-Clause
 LIBURIPARSER_CPE_ID_VENDOR = uriparser_project
 LIBURIPARSER_CPE_ID_PRODUCT = uriparser
 LIBURIPARSER_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
