Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A48CAC593
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D14760E06;
	Tue, 17 Sep 2024 18:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jM5i0gNZTfTQ; Tue, 17 Sep 2024 18:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87E9060E3C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87E9060E3C;
	Tue, 17 Sep 2024 18:21:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 965EE1BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8403941981
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jll_UjvCqjyG for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:21:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 461044197F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 461044197F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 461044197F
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:21:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0e02.dip0.t-ipconnect.de [91.58.14.2])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DBFC3A4C1FCF;
 Tue, 17 Sep 2024 20:21:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52542)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sqcpD-000000000i6-0CUR;
 Tue, 17 Sep 2024 18:21:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 20:21:18 +0200
Message-Id: <20240917182118.3009727-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1726597278;
 bh=zJ7Njmhn4krbpZ5H2Dk+Vh33aRG15p2bQkDZlKRapu8=;
 h=From:To:Cc:Subject:Date:From;
 b=CbFcTdxZixKFEhygIgra6XGRxi2BVg+IY0nNLYwsvQBWo/gihA0iI6Zlev8KC/83c
 EW/vYJd98nAXFyO/G7tAaCDGP3/GdQRVbF2B6veV6/tf1TDd3qka7nISiqdiQMVCqQ
 5LYZBkBOrDi3bxmuf7LD+rZLuZstZlmAZv9u9o+ssl5Xohnt9XR+479yZEhTqc8crj
 wHGX6blq09GXsMPnv/3X4AmOxsJBelRxWRS8WcrSyHf0JdhErcXRvmg31rJ785px5M
 +PqTD38a4a3RhtvO7y/NGEdTZx76f+UjgqIdzB9nbTz4KWGvYJ0wRu+YuYbh7r8rdg
 InamOLZcKFmBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=CbFcTdxZ
Subject: [Buildroot] [PATCH 1/1] package/libcurl: security bump version to
 8.10.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Changelog: https://curl.se/changes.html#8_10_0

Fixes CVE-2024-8096.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 1d01935501..d0feafde1e 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.9.1.tar.xz.asc
+# https://curl.se/download/curl-8.10.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  f292f6cc051d5bbabf725ef85d432dfeacc8711dd717ea97612ae590643801e5  curl-8.9.1.tar.xz
+sha256  e6b142f0e85e954759d37e26a3627e2278137595be80e3a860c4353e4335e5a0  curl-8.10.0.tar.xz
 sha256  adb1fc06547fd136244179809f7b7c2d2ae6c4534f160aa513af9b6a12866a32  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 3661cbf5bd..681799c6ac 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.9.1
+LIBCURL_VERSION = 8.10.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
