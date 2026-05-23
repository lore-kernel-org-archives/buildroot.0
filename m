Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88418CD4F54
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 08:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 928846087F;
	Sat, 23 May 2026 08:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x1C35uohVRZA; Sat, 23 May 2026 08:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E2D860876
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779525971;
	bh=/85Xi2u++STcb2PBfwebyinZrGnjxCXt3HNOVlRsx5w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GNTOpQ5huHiJXV1gB7Hqi9LwYwhw5l8R5pgWrw3dVqgxp6sZRyAxRCBMDdVqXKm50
	 lYtbtQY3u1pRqNN97Kk7dOv3BfVioC93jTAYMvm1c8hJlKs254MmrCaBMk9t2lP3jN
	 KYem5vouoxH/stULkQiEbUUh30aUFpbOd7kl5xFjVnkIu/227Jm0dpjE5wI/wbaEL6
	 eNdm5wpJ7npYfpW64DRRc+PlUNo+h5gXutzGrwbune8slHwO6Qi/j+/sDRFkIDk9eB
	 8W7ACrt1MV6g/lothFAYumh54ad+rROGsEt3YAJvAKBanrrhmScn/Mald2lbrjYutm
	 0SqeGBzHmErbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E2D860876;
	Sat, 23 May 2026 08:46:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2B4B263
 for <buildroot@buildroot.org>; Sat, 23 May 2026 08:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B41A660876
 for <buildroot@buildroot.org>; Sat, 23 May 2026 08:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYD-D9CURhLf for <buildroot@buildroot.org>;
 Sat, 23 May 2026 08:46:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A37CD60874
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A37CD60874
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A37CD60874
 for <buildroot@buildroot.org>; Sat, 23 May 2026 08:46:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5dd.dip0.t-ipconnect.de [84.161.181.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 926EFA4C0CCD;
 Sat, 23 May 2026 10:46:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59860)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wQhzY-000000005BZ-3U2I;
 Sat, 23 May 2026 08:46:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 May 2026 10:45:57 +0200
Message-ID: <20260523084557.106578-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779525966;
 bh=HlqakxTHcQCdkUKljR1dP9vU/p4nTr/jh0JyveKRSU0=;
 h=From:To:Cc:Subject:Date:From;
 b=j5q2/Op24rv13wc9Fez3A2AX7U4mNSQuYAjMouLsg+z3TlfOJM6kX8uXJC0OOJ6B2
 vb1VjoQng1LLOrvDzUEOFrpF8kqsEQCBmDzgO38vfRbe+3TNIHuuYvagj4PDJq2bvJ
 D76nxk+6mqXNR5wJiZsB6hkwJgfWdfCKezf3rUrjmhtA14mqkkm0eZnazYVJqw2/5U
 g7mw8RF3nkZUrP/VeSXD5aV/Z5dEvMQqYCmKB9Yqow8UC0lq5/yi/FYWoF6ydoX0Z5
 5NfSKJUXHLnbSbYEc+/piE5Lbso6epqw/TIW4Mxr3LkC1yxBooSOhx57RDuyIab38y
 HXbgB7a60NfdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=j5q2/Op2
Subject: [Buildroot] [PATCH/next 1/1] package/cmake: bump version to 4.3.3
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

https://cmake.org/cmake/help/latest/release/4.3.html#id3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index f531e73c31..af7c7dd72b 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.3/cmake-4.3.2-SHA-256.txt
-sha256  b0231eb39b3c3cabdc568c619df78208a7bd95ea10c9b2236d61218bac1b367d  cmake-4.3.2.tar.gz
+# From https://cmake.org/files/v4.3/cmake-4.3.3-SHA-256.txt
+sha256  cba4bb7a44edf2877bb6f059932896383babe435b3a8c3b5df48b4aa41c9bb85  cmake-4.3.3.tar.gz
 
 # Locally calculated
 sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 0223e65551..6971232f76 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.3
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
