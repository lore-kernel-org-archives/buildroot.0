Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FB3CD4F24
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 14:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90E2E40F7E;
	Tue, 12 May 2026 14:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eeor4AuczFxs; Tue, 12 May 2026 14:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F48040DA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778597929;
	bh=mDwLnQCDn3fdnKdpYKaa9J7sGAf2HLegoKwrDmBRTOo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y6ssF0iXflcwIjU/yHdITuu7T4xKwuo/bmlsFFuDb9nsyTDnBtDSgnoUrBg+A8wcZ
	 SFumtYmb/eXBfo+eSzbcH7leyAPyUfL/26DnAi57Tg/9Dr5WXO6b45Wf2Vxj8JYZDY
	 2iGPGW7fvTw208WTDqSW+b12io/JBhlaLTj5T/1rxlN+sT66eLJmB8FGWbWb8P9pts
	 6WVlg5e8AHz1KBKPAf9TKri8nu5BUOv7TxzjXf7Huy4iLlR1z95dhHpmr5JYMWJvnA
	 gTrdSnxMWXE6mk0AdzhTLqTvzMMs0Hu4y0JkBbWcM1E/qo3zEAUUmryotLnnfZtf7H
	 vlF7weqyviWmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F48040DA5;
	Tue, 12 May 2026 14:58:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4536815F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B37C60A96
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97x8mqm0WsUD for <buildroot@buildroot.org>;
 Tue, 12 May 2026 14:58:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21F4B60A9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21F4B60A9F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21F4B60A9F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:58:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 41C6BA4C0445;
 Tue, 12 May 2026 16:58:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37548)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMoZI-000000005ci-3tJX;
 Tue, 12 May 2026 14:58:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Tue, 12 May 2026 16:58:44 +0200
Message-ID: <20260512145844.440168-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778597925;
 bh=RfCIhh5HTcKygRnK2tDOTTs1lKE5gnjt9wtcT09ELHo=;
 h=From:To:Cc:Subject:Date:From;
 b=sbIXUkRwH2WBWqzVpSmbEXw8OoMgIujKfb1+bZW2mB0drpm+xyqdrBSqaCmHs/KlT
 dGC3Dl9GqfZS6k9btXTs6+jDPIFMSuiXw3pnfpL4nJWMNmv3RYglNoeQryzYDBOU5/
 e0AHR+8gEXCHe20OifwBehPW/kvXbVPqvdQGRH+Znm+EsWf49cZwgRKK55pGVqGG/D
 isI1FWUDFc7xAtAcq7c6f2o6p3Iga5qnlCkf7MLRfCgs8+vLo+wUki4/7klBV277Ih
 UWrQIq5zfbqlykRpUxVoTwbi6zjMo7oExp5Vu1iQTeTMJVZHy9ezeIlAmKMPaXRRAV
 8iGhLIv+0tJxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=sbIXUkRw
Subject: [Buildroot] [PATCH/next 1/1] package/libxmlsec1: bump version to
 1.3.11
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

https://github.com/lsh123/xmlsec/releases/tag/1.3.11
https://github.com/lsh123/xmlsec/releases/tag/1.3.10

Switched to tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libxmlsec1/libxmlsec1.hash | 5 +++--
 package/libxmlsec1/libxmlsec1.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libxmlsec1/libxmlsec1.hash b/package/libxmlsec1/libxmlsec1.hash
index 9e0e67e732..db6e6457e9 100644
--- a/package/libxmlsec1/libxmlsec1.hash
+++ b/package/libxmlsec1/libxmlsec1.hash
@@ -1,3 +1,4 @@
+# From https://github.com/lsh123/xmlsec/releases/tag/1.3.11
+sha256  53675e98fa83b48201d24f7bfbcaeaa1b51496b8b19ff969785856bdeb196af3  xmlsec1-1.3.11.tar.gz
 # Locally computed
-sha256  a631c8cd7a6b86e6adb9f5b935d45a9cf9768b3cb090d461e8eb9d043cf9b62f  xmlsec1-1.3.9.tar.gz
-sha256  d5e9388534256360c6a009d4f19ab2b8d6ec0aa7ff32a51e22d899ed7beb5c48  Copyright
+sha256  a6d217151f3d423e06639c075bad8e442ea1936828d3a660105122ef78ecd96d  Copyright
diff --git a/package/libxmlsec1/libxmlsec1.mk b/package/libxmlsec1/libxmlsec1.mk
index 29222bc16f..4db1a7ace6 100644
--- a/package/libxmlsec1/libxmlsec1.mk
+++ b/package/libxmlsec1/libxmlsec1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXMLSEC1_VERSION = 1.3.9
+LIBXMLSEC1_VERSION = 1.3.11
 LIBXMLSEC1_SOURCE = xmlsec1-$(LIBXMLSEC1_VERSION).tar.gz
 LIBXMLSEC1_SITE = https://github.com/lsh123/xmlsec/releases/download/$(LIBXMLSEC1_VERSION)
 LIBXMLSEC1_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
