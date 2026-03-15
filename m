Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC34ED58B14
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 08:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E5E46104F;
	Sun, 15 Mar 2026 08:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0RjQutpyeXnd; Sun, 15 Mar 2026 08:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 816F260A3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773561754;
	bh=5Wjtp+wiJVHj6H2NMnMwySK5Q6HFDJbe7mnKBcIlzWc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VfkmIvGjCZRFidIDG9/A6izMkbmWC7cAG6+jeHE7A7Fu0Bd+4of3ztU7YyS+uWhKC
	 eB3CSZBozcqdfLl9ujETmRj2i9UYFstY25s6ds4ekgPolvkUKkd779Jj3EgsoSJ8QQ
	 4LOOOA1yaxfdjrDNq7Mg9gEbKzPOwVxSkurjl8nWcly0QVBl6Dlcpa7mVjCEOewc7Q
	 fxl85+XcwqKPgSw5nNAxWUye0rydiMsH+eap5tcekbvXGeIOHJyn+iZnME513h2gaf
	 uWuYvvffsi8Q4ZfEeHFH5+c3U8jja19dQgKIebWfNv9Vv5LiBoeaIQx1T+4/qVQ8kH
	 Lb0dlYyGl2dew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 816F260A3F;
	Sun, 15 Mar 2026 08:02:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CE60201
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 08:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62E9381801
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 08:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lV-qRJeWFt7m for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 08:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DEB5817FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DEB5817FF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DEB5817FF
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 08:02:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B0F82A4C11D8
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 09:02:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39830)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1gQf-00000000272-1fiy
 for buildroot@buildroot.org; Sun, 15 Mar 2026 08:02:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 09:02:29 +0100
Message-ID: <20260315080229.66759-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773561749;
 bh=DY4e0egyDkmENU2qDYiDDHWhpiNRFqFJj6yjFe8ZCsM=;
 h=From:To:Subject:Date:From;
 b=K87xyQViKR9VD5keMcyAnhNd0JoR70anYYV4qFWfXc+gyOc+TBgVt2NB7P2ThP7Qj
 P+hjWYyh4F6iZHEUQFF9F2Us9FbDKC0M6gzKxoOQh6mJ5IaiFhKAVhMRYsxl4cSnXZ
 yCV2bJO1TGkQd/HBTdAbqUuqCJl5sj74J4JLP8Ru7/qMXbMCKq+I/SeaAiSeCvJU3O
 u7cyyJeSJwOYtLqqKwgQ+aNA0PJphPrmh/dSacNFU4aVfLFvRt3Ko8irrE5rSMr4QR
 uxewp3by87P8rE0WYj+yu7Rbgd/ry/8/CBv4A25jO7UG4fFwu2dzB5XgVpqKroSjpw
 chRkAZLr8E2bA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=K87xyQVi
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-zattoo: bump version to
 21.0.5-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index 484e12324c..e4930b9fb5 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7e1fab309232e7115efa0868c8c3c13c2e7639628ef8bc59a93bf4aa82a3b20d  kodi-pvr-zattoo-21.0.4-Omega.tar.gz
+sha256  b9bf700f0ee93f0d6b87952e9420e277c384cf0d3b07dc2849f5496304104af9  kodi-pvr-zattoo-21.0.5-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 6a981e12b7..8171939c60 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 21.0.4-Omega
+KODI_PVR_ZATTOO_VERSION = 21.0.5-Omega
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
