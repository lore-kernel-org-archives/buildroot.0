Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277B2C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 17:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFCA960A5B;
	Sun, 18 May 2025 17:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1La58lLh79p; Sun, 18 May 2025 17:41:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33CDA60ADD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33CDA60ADD;
	Sun, 18 May 2025 17:41:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08D4D1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEA4F60AA0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSVgH4tJFuFh for <buildroot@buildroot.org>;
 Sun, 18 May 2025 17:41:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 03D6A60A5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03D6A60A5B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03D6A60A5B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:41:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 29195A4C13B8
 for <buildroot@buildroot.org>; Sun, 18 May 2025 19:41:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52726)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGi10-0000000032B-1aOD
 for buildroot@buildroot.org; Sun, 18 May 2025 17:41:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 19:41:34 +0200
Message-Id: <20250518174134.2148362-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747590095;
 bh=knxQSjY5O7anrsv1pje+LBgkv6LYR8b1JDEEdkMHnwc=;
 h=From:To:Subject:Date:From;
 b=hmPo1Mcqxnp0a5MxPd5DItSQbZqO3xdFuaEqIwAKcMoytilNSK/w1rmIlKMzRzbnD
 StWVFXvUtpqqGvc+kMJ067HpuihtZs1gF/7YjYIV2ojcw4XbNluQzEvE+zF8wNq676
 xbip6Yg4c+ZtUVSTjmquMC4xEFLatbmphGc2gtkZldzgEkOsA0pJI9aSoAjnapYd18
 PpLRMhQpMK5i2USsA0KI85n6ZhHIHwr3P2hRTcZH+JntjfyD44+eAZJXca/JUOcQ+y
 V7kKFEegY7BB+xXPHHsPrrS2vBnZw/RxFzKf/rSstlcXmmx1My1bzOtMGSafx1x7I5
 kMPcBpJi0XjOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=hmPo1Mcq
Subject: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.5.1
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

Release notes:
https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dav1d/dav1d.hash | 4 ++--
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index a32f2ae716..2a64b5bc46 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,4 +1,4 @@
-# From http://download.videolan.org/pub/videolan/dav1d/1.5.0/dav1d-1.5.0.tar.xz.sha256
-sha256  14bd6f5157808ed9aedcafbe50df689d304fd4810ac20be6eec1ab037436afd6  dav1d-1.5.0.tar.xz
+# From https://download.videolan.org/pub/videolan/dav1d/1.5.1/dav1d-1.5.1.tar.xz.sha256
+sha256  401813f1f89fa8fd4295805aa5284d9aed9bc7fc1fdbe554af4292f64cbabe21  dav1d-1.5.1.tar.xz
 # Locally computed
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 7358690b62..c7b5156b21 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 1.5.0
+DAV1D_VERSION = 1.5.1
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
 DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
