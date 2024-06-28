Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60647C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 16:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B7F941D7E;
	Fri, 28 Jun 2024 16:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcBA25wXHCmm; Fri, 28 Jun 2024 16:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E565E41E1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E565E41E1C;
	Fri, 28 Jun 2024 16:47:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF8E81BF39D
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C2BA41E1C
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCLEkLTM57B2 for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 16:47:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56BE941D7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56BE941D7E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56BE941D7E
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 16:47:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cda5.dip0.t-ipconnect.de [79.214.205.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7BD62A4C07EB
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 18:47:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44218)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sNElA-000000000AT-3PPm
 for buildroot@buildroot.org; Fri, 28 Jun 2024 16:47:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 18:47:40 +0200
Message-Id: <20240628164740.11188-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719593261;
 bh=Hm6Ox/aWgnhri2sfPfpuL5jUNlKP+Kw+8M6OoWjqD20=;
 h=From:To:Subject:Date:From;
 b=v4G+59EOiu9tTqK9bhDPpIgZ7Kgyu8Qyo4oC40krJ6krfaib2ki7ut6DgSCt1CGca
 iO77QaOS0v8itxQOiFQQAh1m4omyfcn+Jf61b1JLRmK8ZoqcoYUJLjz9ecAzrVthRf
 8NWuG2h9fdFc0hF8i17KO8jYmxcEPbzhqTv/z3lq3nVdtR3fEsbT+NSpSJWbHNEZHK
 rWQCm63CszT5Aj98NHmeuuSzuAvNblHoQ0xHLz+F0tTbs8l1sCxW7SrIZ5kcmnJXy5
 JXgVNoPsQd+8jS7MDSBAEdGeJ1k+73F9QPs1jCRTd1aBqz38noLLlX7d3B6Q2xO0VD
 lxtsUrDOpGapA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=v4G+59EO
Subject: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.4.3
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

Release notes:
https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dav1d/dav1d.hash | 4 ++--
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index a62193810e..e0ca8f1e88 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,4 +1,4 @@
-# From https://download.videolan.org/pub/videolan/dav1d/1.4.1/dav1d-1.4.1.tar.xz.sha256
-sha256  8d407dd5fe7986413c937b14e67f36aebd06e1fa5cfec679d10e548476f2d5f8  dav1d-1.4.1.tar.xz
+# From https://download.videolan.org/pub/videolan/dav1d/1.4.3/dav1d-1.4.3.tar.xz.sha256
+sha256  42fe524bcc82ea3a830057178faace22923a79bad3d819a4962d8cfc54c36f19  dav1d-1.4.3.tar.xz
 # Locally computed
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 18cb81868a..4e3e8fe1cf 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 1.4.1
+DAV1D_VERSION = 1.4.3
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
 DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
