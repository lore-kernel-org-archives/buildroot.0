Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF47107760E
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 20:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31CFB41754;
	Wed, 18 Mar 2026 20:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OZf07fjKGnt; Wed, 18 Mar 2026 20:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E0AE41746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773867080;
	bh=F6PryxnwRPyEPzRyDYIctwXAABH6fLc4hcZdJujKjCw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KS+NxD5jd35X9Zkn1H0eEOOxR1du6lsaom3ecPKzCpP9PBh96bEivbQUL83+5z7TO
	 p0jLhgcuQoz73pOBj7CRTvRwBkZ+UqdKRDSlGq8fXFEmvpSoNl50IduIq/tqPnFwwj
	 qIkLzqTseKqA1Uoprz3wptMxSW6MVlcV7W9ZxPYKWD2tOA7xS9SzbZsfgZGCBkmHzf
	 K6d7c9xHyBaJCBUa2rUdfbXgxp3hW08O0Gv7OB0yMAOMAx/Q8oOIcjzOzaa4EzwY28
	 m3FmVW2Zkhi9se8+QDVuVU9mfhdWqTAFhivbdj7QEP6H+PsdK1uMsJD36cUVFVjDNH
	 asu0Xlyecwptg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E0AE41746;
	Wed, 18 Mar 2026 20:51:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F3B541B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D916583CB8
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDOfjjUd44xG for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 20:51:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6299983CB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6299983CB2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6299983CB2
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:51:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ce09.dip0.t-ipconnect.de [79.214.206.9])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 25C1BA4C0DB1;
 Wed, 18 Mar 2026 21:51:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33608)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w2xrG-000000006S8-1W5B;
 Wed, 18 Mar 2026 20:51:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Wed, 18 Mar 2026 21:51:14 +0100
Message-ID: <20260318205114.3455758-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773867075;
 bh=konsoK6uoF99NkBRYQXU+HLJt3zEvv7WAsY3731eEqM=;
 h=From:To:Cc:Subject:Date:From;
 b=DsYZvt/yua+2yQ49bD9nuQoX6ieAhBvLgTzZPgXlbw+wc56E9nWKN3UvrfkjMNtNM
 l0/YdcY46QccNKGyP08xL9o5+RFPyAsdFWT/+/2jzQdscF0UfBzMzXbzTC1mOCjWY4
 eISnYe+DL0kNB8nwyY9Y6rgHWHBCH6Xup4tvU4cqysUbqNw4uHhu9FmbO3BFUVxldM
 O3gNAX7yQ6YGxX/BRMHK0zuY2NtQ+wPFNWpLvjV04pfDZrKFwXelUFseqAvL1y5w7m
 aNn0XFlatgpMkzESreAH4wRe4QikKNLr+5mMgVSTZKbDpP9QX9qOzoel/k5qgFNpVu
 VJ/SdB+w6TszA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=DsYZvt/y
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.3
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

https://lists.freedesktop.org/archives/mesa-announce/2026-March/000842.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 34555c05ea..cabdd479a1 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.0.2
+MESA3D_HEADERS_VERSION = 26.0.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 7cdaee7e79..c938372b49 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-March/000841.html
-sha256  973f535221be211c6363842b4cce9ef8e9b3e1d5ea86c5450ca86060163c7346  mesa-26.0.2.tar.xz
-sha512  0a7b9fc9b09e40345cc22d246dc1656900d74754c093882f6a39623af17fddc5f4a0c7938207c784ccf7306c5ed497be6a02c36f95c6548e01a2faa085e04c35  mesa-26.0.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-March/000842.html
+sha256  ddb7443d328e89aa45b4b6b80f077bf937f099daeca8ba48cabe32aab769e134  mesa-26.0.3.tar.xz
+sha512  82a33d0fa0c2855a63f599e38753126a2195025a13e45f38e14fda7aa008cb05925bb74088e4a1e199c9237d9388f4d4408a2c95c1d7fe79d8e6e6f27c84187b  mesa-26.0.3.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3e5ce1266e..b9243dfaec 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.0.2
+MESA3D_VERSION = 26.0.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
