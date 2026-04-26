Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7914BFF8850
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 07:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F7544277F;
	Sun, 26 Apr 2026 07:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMUzHFyHWyJC; Sun, 26 Apr 2026 07:18:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B13064276F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777187914;
	bh=SBDmZBP8fV8/5NscInTk98peXM57xkarMUbgOMCfy9c=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NzeeeVrfjdWL/xhsEUJoP4eDV7BbzSydnYq1CxF4hyg9MJo9G7OlVDybu1yIy8y6m
	 rJwz4OunLdCrTpzfobOTYHo0cUangWPG1epKFTPYyTNj+iyxVDHifvZGnkqbt45eHH
	 eaKvyr/jG3jyrJWV6/TShMdRGtoe5KRnW8m1lM4pMVA2Sbj2eJG2Mi7tsn9Hj28CwT
	 aGVU0OgRt2TjQrqIpInuSIv8nJgwBY2shjyx1F2PW+n8ZamObjGAQZ/TW6HaPW/oN0
	 DwX/9cSGG9SR2IfFFB3uvfM59b8eF+JZJLnNFaAw0Ztf/eRA8nHLksmr+5DrfHDJ/r
	 Brqd+mfwT/kjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B13064276F;
	Sun, 26 Apr 2026 07:18:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D0FF369
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A9864276F
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjCqguwFLbYq for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 07:18:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 749A34276D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 749A34276D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 749A34276D
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:18:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9BAA4A4C0CF4;
 Sun, 26 Apr 2026 09:18:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54644)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGtl6-000000003zJ-3lBF;
 Sun, 26 Apr 2026 07:18:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Apr 2026 09:18:29 +0200
Message-ID: <20260426071829.369415-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777187909;
 bh=Ihaxp5+6sJ7qT1V/v7JDbR6jrLr1EvzFjIMe2RTbVVs=;
 h=From:To:Cc:Subject:Date:From;
 b=EJl7Prs2gumxFUSnl+6RQG3sCFyIjSLMxK2g9TuCTt/HYrcXqdyUYvpXYfrl9htOM
 XlVQTIQf5S3wTfojo5HcgStkCaQ1in8Vurt75Qsw6dCtWBSt8JgT+2W6VmxPjRlrq6
 Xoa4hFExlkgS5gd6Lkrio6h4hYFw3Ta1LXKGMqsSqxnvrI+LOW7F010fOgYTiQnIKQ
 GXNkTr/NLA7osinvXPfGeuoVWNt8KDbYuGi+Gs6JVLu99VVOLPuUwSEKW+9bPBf2Qh
 yFUGlxmqAINtM9X52wk1sAYlqlENOHd+81jhzigFscRlQk/2FeOOuv/jBS54xjwgif
 mKpdSfZfAV7Pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=EJl7Prs2
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.3.2
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

https://cmake.org/cmake/help/latest/release/4.3.html#id2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 5367ae2cd5..f531e73c31 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.3/cmake-4.3.1-SHA-256.txt
-sha256  0798f4be7a1a406a419ac32db90c2956936fecbf50db3057d7af47d69a2d7edb  cmake-4.3.1.tar.gz
+# From https://cmake.org/files/v4.3/cmake-4.3.2-SHA-256.txt
+sha256  b0231eb39b3c3cabdc568c619df78208a7bd95ea10c9b2236d61218bac1b367d  cmake-4.3.2.tar.gz
 
 # Locally calculated
 sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 4fdd294f5a..0223e65551 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.3
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
