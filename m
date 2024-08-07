Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD288C52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A124D606EE;
	Wed,  7 Aug 2024 14:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8O7vXudYSfK; Wed,  7 Aug 2024 14:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A82646070A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A82646070A;
	Wed,  7 Aug 2024 14:55:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA9451BF391
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A791140267
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpivzYcLsRkR for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.155;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C978A40184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C978A40184
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.155])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C978A40184
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:55:30 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 6D13C32B33EA
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 16:55:28 +0200 (CEST)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out013.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id q_n4HDM8oRUH for <buildroot@buildroot.org>;
 Wed,  7 Aug 2024 16:55:25 +0200 (CEST)
Received: from int-mx009.mykolab.com (unknown [10.9.13.9])
 by mx.kolabnow.com (Postfix) with ESMTPS id B653232B33E9
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 16:55:24 +0200 (CEST)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
 by int-mx009.mykolab.com (Postfix) with ESMTPS id 9734D20C32A0
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 16:55:24 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:55:17 +0200
Message-Id: <20240807145517.3019024-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received:received:received; s=
 dkim20240523; t=1723042525; x=1724856926; bh=GbXi4w4BVGiiqYLO9mE
 IKhixpjWFtPop9Fe3IvdL6og=; b=XRPmf3LpiTqI4t24eARM2wo8e8ipiRlu/SV
 PjvsXoA95m4lFRhhY8Bf2GVDfvHXV/K8Ix+2+DMJjjhKWAXbFWYf/toaiZpu253F
 pkeC4aLwXm403WEbeChKdB/D8Ih7yDYyZR7vXekQz2njlokMvbl1MXdysH7zAq2L
 M/l0yN9SthwyvkhZC1oTCK6WsmEiCnAYoAVGM3Cd2vxkzAazciDeYiNELVv9m0HE
 UrwGx1h7X6IRFaBLCxsHtBVuxQN48HhWBR1vCwACPq9fG9jb/eu4H6XdPZUZI32R
 hOKDW7Ff8dC7yzQRVrtoODiPsue1GQn0UiPy6VRBUZFuCa74EOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kolabnow.com header.i=@kolabnow.com header.a=rsa-sha256
 header.s=dkim20240523 header.b=XRPmf3Lp
X-Mailman-Original-Authentication-Results: ext-mx-out013.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH 1/1] package/grantlee: bump to 5.3.1 and enable
 for Qt6
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
 package/grantlee/Config.in     |  8 +++++---
 package/grantlee/grantlee.hash |  2 +-
 package/grantlee/grantlee.mk   | 11 +++++++++--
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index 779306bc2e..a64f8a589b 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_GRANTLEE
 	bool "grantlee"
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5SCRIPT
-	select BR2_PACKAGE_QT5BASE_GUI
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT5SCRIPT if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6DECLARATIVE if BR2_PACKAGE_QT6
 	help
 	  Qt implementation of the Django template framework
 
diff --git a/package/grantlee/grantlee.hash b/package/grantlee/grantlee.hash
index 6508aa70cc..57061fb03f 100644
--- a/package/grantlee/grantlee.hash
+++ b/package/grantlee/grantlee.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  139acee5746b957bdf1327ec0d97c604d4c0b9be42aec5d584297cb5ed6a990a  grantlee-5.2.0.tar.gz
+sha256  ba288ae9ed37ec0c3622ceb40ae1f7e1e6b2ea89216ad8587f0863d64be24f06  grantlee-5.3.1.tar.gz
 
 # Hash for license file
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index 7079679ca4..387558319b 100644
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -4,11 +4,18 @@
 #
 ################################################################################
 
-GRANTLEE_VERSION = 5.2.0
+GRANTLEE_VERSION = 5.3.1
 GRANTLEE_SITE = $(call github,steveire,grantlee,v$(GRANTLEE_VERSION))
 GRANTLEE_INSTALL_STAGING = YES
 GRANTLEE_LICENSE = LGPL-2.1+
 GRANTLEE_LICENSE_FILES = COPYING.LIB
-GRANTLEE_DEPENDENCIES = qt5base qt5script
+ifeq ($(BR2_PACKAGE_QT5BASE),y)
+GRANTLEE_DEPENDENCIES += qt5base qt5script
+endif
+ifeq ($(BR2_PACKAGE_QT6BASE),y)
+GRANTLEE_DEPENDENCIES += qt6base qt6declarative
+GRANTLEE_CONF_OPTS += \
+	-DGRANTLEE_BUILD_WITH_QT6=ON
+endif
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
