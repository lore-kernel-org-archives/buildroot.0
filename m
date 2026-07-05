Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12199C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 07:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D33C606D3;
	Sun,  5 Jul 2026 07:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6EyCTSEXo9l; Sun,  5 Jul 2026 07:57:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FA7A6068F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783238270;
	bh=/U7xa3sejncDMpwuzN6EdUmvyhAU/1WBczwYWlaOKCg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A6+9PdUItjnHufpoUAZOaHZGcTXF5XHL6reGWjsQRwQcpc82IVpdpfu6Xac2dJXPr
	 /1p+riSsrlIU2s6S1bSdHLKDx2TqvCOyUi6+EJ2SZwqyRWS3goqx8oi7S72tkyto1J
	 7ynLz3a8wXktX6v7I3FM323dVks2TOClhwWIUZhJFO5rmOF6Y0TapjCeN4We/sVWpT
	 P9GtmaXjV1UTD6OOPnHNTEV757sWOWThhICjM4YGXtLKdiofuBxH16D7l4QRJGCuCD
	 so+Xfu81iaspOTFpCp0CbuPlRbed/XYFRtFK9tuQ2IjiIPh7u8aFbVjmv1EJMRzwLy
	 cf3/SIN33ysfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FA7A6068F;
	Sun,  5 Jul 2026 07:57:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B919F2
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 07:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DF2880F2B
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 07:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGne1cBT9JH6 for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 07:57:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C132080D4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C132080D4B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C132080D4B
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 07:57:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6b5.dip0.t-ipconnect.de [79.214.198.181])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7242DA4C1073
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:57:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58570)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wgHjV-000000004XR-0VlP
 for buildroot@buildroot.org; Sun, 05 Jul 2026 07:57:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  5 Jul 2026 09:57:45 +0200
Message-ID: <20260705075745.3485915-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783238265;
 bh=cCzPMX2eECv9C/e/d9nLCA53bDmGrE0HlIdxWO2C7fA=;
 h=From:To:Subject:Date:From;
 b=ouYk6P8Fa26UQ6bDoCQh3iN8E+PfKcSIfj45aGvkvMXM1yak0koMPl7ETmmVDmxC3
 GZzCLkRJIn0buiDvsbPISZcPssyndKXkenS7oeY5TSuG3DVDA+0/WyRJvKVDAOSq3L
 AA0HwWgORHoFZE9uvbcqw+c0+QxSifKWzstNkJHv7SnXtH37vNzy0MbWZpbTFEI4QX
 Blaaw8udMu3UnScnkjLZxintqkqN7JxkZGuz3EP7v3F+GiK/pXUU34ioOtXBD+UwC/
 zVtBlhFmRFzcdxnkIz2SBNogyLh4yCM/j40FcDkQo3RhL3BXPZl5zeBHYc7Sn5GOCx
 RuG2N+HNcfGUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ouYk6P8F
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.409
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

https://github.com/vcrhonek/hwdata/releases/tag/v0.409
https://github.com/vcrhonek/hwdata/releases/tag/v0.408
https://github.com/vcrhonek/hwdata/releases/tag/v0.407

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/2e51c00910a914bc0f9aac50361e7a3500bb7878

 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index b7323fe117..74a7f5e7e7 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1ccfd1ca723595b1fe8794f4157ec5635be1ebedb5d13769b4be75d0b75bc199  hwdata-0.406.tar.gz
+sha256  23006accc0f931dd5187d0307a57d0744e2b8feb85e73c37bc0f5229fb31eadd  hwdata-0.409.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index e12ce7efb6..7300b908b1 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.406
+HWDATA_VERSION = 0.409
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
