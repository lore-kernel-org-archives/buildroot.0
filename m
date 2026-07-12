Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525DBC43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 11:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AAC240B50;
	Sun, 12 Jul 2026 11:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZmjxHsu_GBR; Sun, 12 Jul 2026 11:10:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33F5F40B7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783854653;
	bh=rAN0QgRLz/C4fkHIYHTf2qwerG3H5Od5yFHTWhZ7hiY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=axAyC7nY9g9dTjAFgZ821NgydY+bGjbJiI4sOx5FWjMFIrdEYMkiOiW7tNRlK9GDJ
	 Xx4SrGZfFsSHfR2UB01NKeKz3J6sPmj1O07BFM65vrAimDpRRKmG+vU+m6wl/EGsRq
	 2mR+8+FVcLp9mb8mcMeHnfS9QOfjBv8236VApDb27UARy23/ij4CnNBfD7NAq/PFDA
	 dDCs2cBzXWhhO4JXwxJm1lwPYNeSVG5TTU5wXy8CCwWmJ/xxS7erMvf7yTzQY6+7fF
	 bZclCzForYGf34Jod7yVRT6/Nx8y6+ZNIbX39e7W3QbBrgcPFHypvjoWlUJmzwESne
	 gi1XzPbP7qyhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33F5F40B7C;
	Sun, 12 Jul 2026 11:10:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7F622EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE4808154C
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oA6j-ccbxTLK for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 11:10:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DEFCD81549
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEFCD81549
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEFCD81549
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:10:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d51.dip0.t-ipconnect.de [91.58.13.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0F03CA4C2FC5;
 Sun, 12 Jul 2026 13:10:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45706)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wis5A-000000005QS-2wU9;
 Sun, 12 Jul 2026 11:10:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2026 13:10:48 +0200
Message-ID: <20260712111048.1545641-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783854649;
 bh=UCc47pZPYAZqvtYxNE6f2haA0I18uTfXJubO5RupUow=;
 h=From:To:Cc:Subject:Date:From;
 b=QV4xNd2DZfLTOuPXrHqklchEWvJxdajxhNfCbNkvvtxXGoZpfD5gLMl/YAvyd5foh
 VldcAbJl8U9aSbvXXGU1sRgdVG/LL0gRUWC/rfmZ2S15lX/l0QbcHX4E4UrEjsBnR4
 1Xr99gkB8Enk+vsStEI5JMphqy+BWPnEOvWEm7bn8Qdsu6f1uUy2p2QqWGcmxXVFgk
 QQFhnE5lsSQvmWxxj80PdBi2ofAsBldbjB9MDx7jFwLivfCjE8/kC1Z4RgFmVsV6tV
 q2xNmtTrYIKObZh8FRE8ERiY3M8/1TFMQfxfbvbS57LfG9ESKDJQ0ToA5sywLE/CBb
 lq2DMWIuk/8mg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=QV4xNd2D
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.4.0
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

https://cmake.org/cmake/help/latest/release/4.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ab6ce70346b46c69425b1c1858ae2d44011ba652

 package/cmake/Config.in.host | 5 +++++
 package/cmake/cmake.hash     | 4 ++--
 package/cmake/cmake.mk       | 4 ++--
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index 0d96ee2233..b8221a7d22 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -79,10 +79,15 @@ config BR2_HOST_CMAKE_AT_LEAST_4_3
 	bool
 	select BR2_HOST_CMAKE_AT_LEAST_4_2
 
+config BR2_HOST_CMAKE_AT_LEAST_4_4
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_4_3
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "4.4"	if BR2_HOST_CMAKE_AT_LEAST_4_4
 	default "4.3"	if BR2_HOST_CMAKE_AT_LEAST_4_3
 	default "4.2"	if BR2_HOST_CMAKE_AT_LEAST_4_2
 	default "4.1"	if BR2_HOST_CMAKE_AT_LEAST_4_1
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 8b6572c558..8a2942493d 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.3/cmake-4.3.4-SHA-256.txt
-sha256  fdeff897b9eb49d764539f2b1edc6eb7e1440df325678a97c1978499e931adda  cmake-4.3.4.tar.gz
+# From https://cmake.org/files/v4.4/cmake-4.4.0-SHA-256.txt
+sha256  65757f442fdd242e27f1728fc26dc0cba4164f7a0791a5c788631c00080369bc  cmake-4.4.0.tar.gz
 
 # Locally calculated
 sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 1422f80a70..007a1efa0b 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 4.3
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).4
+CMAKE_VERSION_MAJOR = 4.4
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
