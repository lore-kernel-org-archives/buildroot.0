Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B46E77182
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 19:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39BC081F1A;
	Wed, 11 Dec 2024 19:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1Xrc0Q_sqEY; Wed, 11 Dec 2024 19:26:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4056C81FDE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4056C81FDE;
	Wed, 11 Dec 2024 19:26:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4595A962
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 408766110C
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeJKECTzvOon for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 19:26:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5284F61122
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5284F61122
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5284F61122
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:26:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b472.dip0.t-ipconnect.de [84.161.180.114])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4DB78A4C3C95
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:26:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40064)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tLSLV-000000004dq-2gWp
 for buildroot@buildroot.org; Wed, 11 Dec 2024 19:26:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 20:26:04 +0100
Message-Id: <20241211192605.1631785-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211192605.1631785-1-bernd@kuhls.net>
References: <20241211192605.1631785-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1733945166;
 bh=IHjJ4A9nRQmwNbHL6PidlNYhFIRKVa0fuqCfiAdWsgs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=i5uJkkAs4oDFMMM2X2FabbHyJs2WvD9MSBmZaRKV5/HI0FcGLuxlNQldjWKt9rQUv
 Ez2TByhmq1UtiMFC3x3Y7ph2XIK8IdQIoybvSqtvlf3V0FdCs7AwhcQTo66MPfl4yD
 d331DEGxo+yy4zWt2FdX3jwzRIG/b23R4efGaHC+lKFtVjkBghHCNCtwGDnAkALWqs
 L10MN8TYPasy8sPq6Q7J6qI+modvAI1JeheA+fOTfbuhK44kYDfWo/OWjanDKxtpMQ
 wuHbCiun3hdqloLiHMFaJ9auICbuqs//oAGxx0MJ71cpMDDanqt4nyMDjhmTNS3MPz
 kfxwFCLSD3xUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=i5uJkkAs
Subject: [Buildroot] [PATCH 2/3] package/intel-mediadriver: bump version to
 24.4.4
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
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 565dd4ee68..9bceeb1aa5 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cbc2ccdae2cf84bd1e36a9d5acec4861922ae68f849e89ddcc2f2c5579bd6022  intel-media-24.4.1.tar.gz
+sha256  3000723faf4dc56eb8276f402c4aa798459bbce860b408a0c480d863b28130ed  intel-media-24.4.4.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 229cb5e2da..ecd1942a15 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 24.4.1
+INTEL_MEDIADRIVER_VERSION = 24.4.4
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
