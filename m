Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A13C5DF6A
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 07:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C275E406A7;
	Sun, 16 Aug 2026 07:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8eu8TId283A; Sun, 16 Aug 2026 07:32:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87D92406F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786865539;
	bh=38Me/eFapYpUjFwx38fMM1G/FUKB+biwILs5zCbziJE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HYCC/i2KZhC8+G6gXFjgeF+Z5RTjUI4v/exw52wZIjuNVJ8o4kk9AvC8+ImTLk+ub
	 CXrhABP13ew3Xm+CBunBa7a3Bbdg5V1D/0z138vCKdDO60egDtqjSSkBBSrQUDNrRw
	 /YYJ9rZu4ZWJXXVXNg/UUoxC6J9kTTUvgcM3IJ6ZOet7Fxjn1qjVkqfFIAt7Atehng
	 Ybwl6YPr81rF7SLhDGLcE59DA5XT47CObSdoTl9zw9EugwbKaefFWjhnKW74rFZRDL
	 9cXCyxlhBfBYx8MBPYwkJDVZ8IcqznSsKvfvLWps7rQ4jS8mBubgo/xHy1UDzaxYN9
	 GErK2lEeMzkng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87D92406F5;
	Sun, 16 Aug 2026 07:32:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D58EE337
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBED66062B
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMX1zHdFnkM1 for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 07:32:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 03BA360616
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03BA360616
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GuFG6DdE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03BA360616
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786865532;
 bh=sHq8eSMxJGbeiBxslz4Hprj6pngA0liecXME6SI8Zwo=;
 h=From:To:Subject:Date:From;
 b=GuFG6DdEJNP8DTyZIHWaKdAc41yKLr/2fuqfaTmJaiFbyr+/nJGVC9FkA7cQQOKW/
 UuROWDMJLOBJv/AKdDYd0JgpAWzl41JHIMAzvQbharUK8WCaTkPb+l6Z1rzVSMQKW0
 AwZO6pv/pZR566qTK85AkHWcjStFAb2uiGkENpk6Dn3wK54iXJupoYKAqGjAQrhnAS
 YReAKxufbIFfDdHQEPJIvtGUxIOgoi/5l6lWP5+0Z6DQWagpU3gDIq1m6U8KfTFyx1
 +6dND8yxqiw8LyUdq8/lCAGwQ1sHblIwoc42riXCB0pDSNZFlv6dpzbSi98RH8IyoX
 quhlg3pollQNw==
Received: from fli4l.lan.fli4l (p54a1bf47.dip0.t-ipconnect.de [84.161.191.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 52A69A4C12AD
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:32:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45140)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wvVLn-000000003J8-1OBw
 for buildroot@buildroot.org; Sun, 16 Aug 2026 07:32:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 09:32:11 +0200
Message-ID: <20260816073211.1830243-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20260812
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

https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260812
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260811

Fixes the following CVEs:

CVE-2025-31936
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01379.html

CVE-2025-31938
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01404.html

CVE-2026-20917
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01423.html

CVE-2025-35973
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01428.html

CVE-2026-20716
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01435.html

CVE-2026-20760
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01441.html

CVE-2026-20713
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01442.html

CVE-2026-20707
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01443.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d465150875451085466b514a4a4507586cdb965b

 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index bb36a52fc5..6f465fd679 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5a07ce745d0bd8b360a4713564d46d5e38be797316a52abedaff0761e1b02370  intel-microcode-20260512.tar.gz
+sha256  7614616d7b2988c278060486f47de716ef44c19317928cb45ac9e288fafd5bd1  intel-microcode-20260812.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index f6fbee54b4..9c97b0aa5e 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20260512
+INTEL_MICROCODE_VERSION = 20260812
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
