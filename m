Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D66EE6428
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 14:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2805811F8;
	Wed, 31 Dec 2025 14:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWHk1epZxxni; Wed, 31 Dec 2025 14:32:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0050811DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767191556;
	bh=Lpzeiyfgwo69uaJgO4r3cPlBCCQq222TZUnNoGjvPR0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A1TwD3hKgCBtyo0sjs/hc+hn85b0Se4C4mBzmGPQy5Ii9YUupezIcwDMJaLzro4oR
	 80LE7ptTyOEnPwwyt9El32XTcGkOOZB95M/4ri45CiWXRP2OZXDx+cG2zNI24TpCsC
	 0ZBxswWg1UBfkPen72XPhxN88tcc9xd4+4NnG5Zp1kUjZucWalkOr4H7nBiGntfZza
	 tRQxHrJx8hgnv7sgS91HPqfNikg+VlhUG/0+oaHuEy+vAoXUTmVUtMWhYBTScxBXFj
	 K1xPnsjy3NTQLnL72sl/1sDjkZP+CCKbLLhPsb8wiKBZvUUl/jx4crz6/OPTRLhdBB
	 xPjt7ZJebfloA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0050811DE;
	Wed, 31 Dec 2025 14:32:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98317D8
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 14:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E39F60852
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 14:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfbqqqfoirGI for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 14:32:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBCD160821
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBCD160821
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBCD160821
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 14:32:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A733FA4C2506;
 Wed, 31 Dec 2025 15:32:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34666)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaxFU-000000001Xg-3MPV;
 Wed, 31 Dec 2025 14:32:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Wed, 31 Dec 2025 15:32:28 +0100
Message-ID: <20251231143229.597000-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767191549;
 bh=CaA9GGnCw8rfO1aNCRhl0cVDTagdiDF4boxkWEOPowE=;
 h=From:To:Cc:Subject:Date:From;
 b=jWcY3OKcqT9nNNZ1VMIvK9Tn1zCfQ8L+kh5HjMfkhXnIj7iAqRpuJ0GZY4i1163LZ
 JEw3N9S2mvVvICVwcmw9CA3gpX6p5qBc+/RBTQLiUdf0wPcS9fS5S1R4L74TNFS4dW
 +07EsFCdI3yfEOsxXAar6ohHpFJh70xG5N3MKfdscTj2UFfMvSnvoxBl9qepaBRbSs
 Pr3jiVqS24OWdTOQVaZmWsKYxOnCo1B8QaMCT4lLHHlyYUuuuwWIKE0ft5eGL/dmO9
 87Y0RsXOvBSG0qq5JO/3wSX7ZvUDT1oPVjtajlQEePq99JK8RDfa4DpcPa/V2Y3Yj3
 LiIHQF2Qeus7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=jWcY3OKc
Subject: [Buildroot] [PATCH 1/1] package/{opencv4,
 opencv4-contrib}: bump version to 4.13.0
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

https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs#version4130

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/opencv4-contrib/opencv4-contrib.hash | 2 +-
 package/opencv4-contrib/opencv4-contrib.mk   | 2 +-
 package/opencv4/opencv4.hash                 | 2 +-
 package/opencv4/opencv4.mk                   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/opencv4-contrib/opencv4-contrib.hash b/package/opencv4-contrib/opencv4-contrib.hash
index dc9e810318..84e249cd30 100644
--- a/package/opencv4-contrib/opencv4-contrib.hash
+++ b/package/opencv4-contrib/opencv4-contrib.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4197722b4c5ed42b476d42e29beb29a52b6b25c34ec7b4d589c3ae5145fee98e  opencv4-contrib-4.12.0.tar.gz
+sha256  1e0077a4fd2960a7d2f4c9e49d6ba7bb891cac2d1be36d7e8e47aa97a9d1039b  opencv4-contrib-4.13.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4-contrib/opencv4-contrib.mk b/package/opencv4-contrib/opencv4-contrib.mk
index c1273237aa..c21be2f948 100644
--- a/package/opencv4-contrib/opencv4-contrib.mk
+++ b/package/opencv4-contrib/opencv4-contrib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update opencv4
-OPENCV4_CONTRIB_VERSION = 4.12.0
+OPENCV4_CONTRIB_VERSION = 4.13.0
 OPENCV4_CONTRIB_SITE = $(call github,opencv,opencv_contrib,$(OPENCV4_CONTRIB_VERSION))
 OPENCV4_CONTRIB_INSTALL_TARGET = NO
 OPENCV4_CONTRIB_LICENSE = Apache-2.0
diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
index a39b199166..283f7606b1 100644
--- a/package/opencv4/opencv4.hash
+++ b/package/opencv4/opencv4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  44c106d5bb47efec04e531fd93008b3fcd1d27138985c5baf4eafac0e1ec9e9d  opencv4-4.12.0.tar.gz
+sha256  1d40ca017ea51c533cf9fd5cbde5b5fe7ae248291ddf2af99d4c17cf8e13017d  opencv4-4.13.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 9691eb78e8..d31d0ae598 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update opencv4-contrib
-OPENCV4_VERSION = 4.12.0
+OPENCV4_VERSION = 4.13.0
 OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
 OPENCV4_INSTALL_STAGING = YES
 OPENCV4_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
