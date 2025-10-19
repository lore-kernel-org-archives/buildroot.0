Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549B2CCD183
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 10:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C25283E94;
	Sun, 19 Oct 2025 10:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGIVi3u5c7CW; Sun, 19 Oct 2025 10:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BB5183E95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BB5183E95;
	Sun, 19 Oct 2025 10:42:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7177243F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 10:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 632C883E95
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 10:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ltbvnJKSvZdT for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 10:42:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C0D383E94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C0D383E94
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C0D383E94
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 10:42:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 85B91A4C25DA;
 Sun, 19 Oct 2025 12:42:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39628)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vAQro-000000008HZ-2UaX;
 Sun, 19 Oct 2025 10:42:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 12:42:24 +0200
Message-ID: <20251019104224.605009-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760870544;
 bh=84iVwu30yN7VlVjFUnV/PdpeTZ+7mASxBAlp3VOitHY=;
 h=From:To:Cc:Subject:Date:From;
 b=GVdoQbrTQSfSrfoq1WcKyadEuCm2Ky5J5S9AHd3q1mmEXzJozvtgANGQfBY0L+Lbv
 q9pYdajP/SB3MpDtB6qEI8SHUNvQA6cRuwqL/oUiLlu/OUF8PnrX6PTGeDyqAop65k
 FMQ9RenHc2863GLJn33DPVOwQTnoHwdnhw17Jhh2muigvva6gKmxTNS4+f89DItlyA
 7lrYo3h4gQvvR+aFyYpQCISUvx3dPwOHrpGAilpty9W3PVPWbzp696M6RRgN3Jvx/J
 V7HyfoOO+GqQOlEG87CXUOHFo4hm+rUNslB3lDA8hyjp+122VNq5PlF5ek/B9A5DDQ
 LZ6Sd0QWXYQ+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=GVdoQbrT
Subject: [Buildroot] [PATCH v2 1/1] package/python3: bump version to 3.13.9
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://www.python.org/downloads/release/python-3139/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed subject, 3.13.9 has no security fixes

 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index a7ab3856cd..d1a8f3780f 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3138/
-md5  ba3da8187b03db6f42052f8707c22564  Python-3.13.8.tar.xz
+# From https://www.python.org/downloads/release/python-3139/
+md5  516aabdf3de01eeefb6de1aacf9df810  Python-3.13.9.tar.xz
 # Locally computed
-sha256  b9910730526b298299b46b35595ced9055722df60c06ad6301f6a4e2c728a252  Python-3.13.8.tar.xz
+sha256  ed5ef34cda36cfa2f3a340f07cac7e7814f91c7f3c411f6d3562323a866c5c66  Python-3.13.9.tar.xz
 sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b501aa7859..7aad14a8ca 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
