Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577D5C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 05:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0300480CC7;
	Thu,  8 Aug 2024 05:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1xV_mM-o5Fl; Thu,  8 Aug 2024 05:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05B7E80D42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05B7E80D42;
	Thu,  8 Aug 2024 05:25:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9D6D1BF2CC
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 05:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4262608E3
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 05:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_uZptbOZNS2 for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 05:25:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.155;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4EDFD6066A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EDFD6066A
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.155])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EDFD6066A
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 05:24:59 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 57B29337F0AB
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 07:24:57 +0200 (CEST)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out013.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id tfrxIb01NGwG for <buildroot@buildroot.org>;
 Thu,  8 Aug 2024 07:24:54 +0200 (CEST)
Received: from int-mx011.mykolab.com (unknown [10.9.13.11])
 by mx.kolabnow.com (Postfix) with ESMTPS id A23AD337F0AA
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 07:24:52 +0200 (CEST)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
 by int-mx011.mykolab.com (Postfix) with ESMTPS id 666C5311BB27
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 07:24:52 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Thu,  8 Aug 2024 07:24:43 +0200
Message-Id: <20240808052443.86164-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received:received:received; s=
 dkim20240523; t=1723094694; x=1724909095; bh=Y2n5QsmOLqtWb3lX4Pj
 ckeBEU/ZkoPuMuC6/C/TYv1k=; b=jsiDMa3iZkmbEpON028fSZ4mS4T1QqqDf7t
 CvyTJOLgF7te/lL6lUNJ44I8gZ1Qedrb92S1ZtZU0FSPtYYXlNXxE4g4FYuWQb5Q
 ivkJxVSUWyJYYDM8UPvgrd+un0lblcu0bJ/mgIFRaCxERYg+X8J1fLhmjMpNWoEd
 xnbRlu2ygAyJnr/5Ow29IxIMlc71doRj/Fo9tVHrwj3lTXikPTaf+eBWMTMnEzlR
 uy6bSBtxvRewHR0bWLgcS+sVlHOPL1WUWyDI/qzqQnBT2FNDqFQ/z/hfr6njnz+V
 zvJWldnJEj5bWIrEH0WVxITuopvPn2sYRYh+U9OHjglkWbvbzpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kolabnow.com header.i=@kolabnow.com header.a=rsa-sha256
 header.s=dkim20240523 header.b=jsiDMa3i
X-Mailman-Original-Authentication-Results: ext-mx-out013.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH 1/1] package/simple-mail: bump to 3.0.0,
 enable for qt6
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 package/simple-mail/Config.in        |  5 +++--
 package/simple-mail/simple-mail.hash |  2 +-
 package/simple-mail/simple-mail.mk   | 10 ++++++++--
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/simple-mail/Config.in b/package/simple-mail/Config.in
index 681a8410db..fd82a224d3 100644
--- a/package/simple-mail/Config.in
+++ b/package/simple-mail/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_SIMPLE_MAIL
 	bool "simple-mail"
-	depends on BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE_NETWORK
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT5BASE_NETWORK if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_NETWORK if BR2_PACKAGE_QT6
 	select BR2_PACKAGE_OPENSSL
 	help
 	  An SMTP library written in C++ for Qt.
diff --git a/package/simple-mail/simple-mail.hash b/package/simple-mail/simple-mail.hash
index 67d6caff87..4de1525b53 100644
--- a/package/simple-mail/simple-mail.hash
+++ b/package/simple-mail/simple-mail.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2026f2017662508b0f25da72694f1dd13ab3ccf82c0454f7c40f8a6cc450c410  simple-mail-2.3.0.tar.gz
+sha256  f93e93843d11da5c4ec44225eba46ccb3e9710fd594a27b966901745429ed4f4  simple-mail-3.0.0.tar.gz
 
 # Hash for license file
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  LICENSE
diff --git a/package/simple-mail/simple-mail.mk b/package/simple-mail/simple-mail.mk
index 68484f79b0..9f2929345b 100644
--- a/package/simple-mail/simple-mail.mk
+++ b/package/simple-mail/simple-mail.mk
@@ -4,12 +4,18 @@
 #
 ################################################################################
 
-SIMPLE_MAIL_VERSION = 2.3.0
+SIMPLE_MAIL_VERSION = 3.0.0
 SIMPLE_MAIL_SITE = $(call github,cutelyst,simple-mail,v$(SIMPLE_MAIL_VERSION))
 SIMPLE_MAIL_INSTALL_STAGING = YES
 SIMPLE_MAIL_LICENSE = LGPL-2.1+
 SIMPLE_MAIL_LICENSE_FILES = LICENSE
-SIMPLE_MAIL_DEPENDENCIES = qt5base
 SIMPLE_MAIL_CONF_OPTS = -DBUILD_DEMOS=OFF
+ifeq ($(BR2_PACKAGE_QT5BASE),y)
+SIMPLE_MAIL_DEPENDENCIES += qt5base
+endif
+ifeq ($(BR2_PACKAGE_QT6BASE),y)
+SIMPLE_MAIL_DEPENDENCIES += qt6base
+SIMPLE_MAIL_CONF_OPTS += -DQT_VERSION_MAJOR=6
+endif
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
