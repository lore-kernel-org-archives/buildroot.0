Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1B2C54ED1
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 14:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86DA5606D3;
	Tue, 27 May 2025 14:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfrXYXquON8k; Tue, 27 May 2025 14:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85D2B607E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85D2B607E8;
	Tue, 27 May 2025 14:16:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B175D28B
 for <buildroot@buildroot.org>; Tue, 27 May 2025 14:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A34AC607E8
 for <buildroot@buildroot.org>; Tue, 27 May 2025 14:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpQJ0bAngClI for <buildroot@buildroot.org>;
 Tue, 27 May 2025 14:16:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2011D606D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2011D606D3
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2011D606D3
 for <buildroot@buildroot.org>; Tue, 27 May 2025 14:16:13 +0000 (UTC)
X-CSE-ConnectionGUID: JEKmDCDkRAyVmgPNb5ZAsA==
X-CSE-MsgGUID: hVRzlV+GRKip7tJxld3LEQ==
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 16:16:11 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 May 2025 16:16:11 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Tue, 27 May 2025 16:16:09 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 27 May 2025 16:16:09 +0200
X-CSE-ConnectionGUID: v9IDwI0ZTQOSiq22LJdwPg==
X-CSE-MsgGUID: PFkPElheSnWlE6EpCMKDPA==
X-IronPort-AV: E=Sophos;i="6.15,318,1739833200"; d="scan'208";a="295179466"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Tue, 27 May 2025 16:16:09 +0200
Message-ID: <0cc8c132abc7f2117de95906fc1ae4729100c564.1748355369.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX304.corporate.adroot.infra.ftgroup
 (10.115.26.13) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1748355374; x=1779891374;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SJyXQOPDEnQmaDDStbQAMX+5nAW6F/9djcvXeYMcfvk=;
 b=kjK63/24uoIqmutZFTSXmj0noEerOg7s/K6Ah8nQxsGpNZO4A5AUkiqw
 5oJi3gYka6DG4r/7QbWaggSsmXU9G1UtXDniLSJnihU2EJXQz51TTEPkW
 tvO02H/Wz8TseOy/Sv0Bhd1iH7e8IPD1CKmIn+p8oN4uppdJQUWfkzNFd
 In74VKLi24o1l26xyftnuup0MdhrSdE0JiyxxYXnLR8V2izO56CgnfsHx
 MQY44iOnlVRV+7SG8fBi+ii0cwgB/iaNPI+6VHR1LhQbGSoom1D3asN3m
 7Qj1V++RqMFQiekM0n0H8QZmjXmv5trMa2RJmupwdtNa4YhCwWlirCexL
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=kjK63/24
Subject: [Buildroot] [PATCH] package/gpsd: bump to 3.26.1
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

From: "Yann E. MORIN" <yann.morin@orange.com>

Support for RTCM104v2 and v3, as well as for ublox, are now
unconditionally built, so drop our corresponding options. No
needfor legacy options: users that had those enabled will
still get them.

Support for Oceanserver has been dropped upstream, so drop our
option and add legacy handlimg to infrom users they should
complain upstream if they needed it (very unlikely).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 Config.in.legacy       |  6 ++++++
 package/gpsd/Config.in | 20 --------------------
 package/gpsd/gpsd.hash |  2 +-
 package/gpsd/gpsd.mk   | 14 +-------------
 4 files changed, 8 insertions(+), 34 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 54792bc22f..fbdfacddfd 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.05"
 
+config BR2_PACKAGE_GPSD_OCEANSERVER
+	bool "gpsd OceanServer removed upstream"
+	select BR2_LEGACY
+	help
+	  Support for OceanServer has been removed in gpsd upstream.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 	bool "mesa Gallium swrast driver was replaced by softpipe"
 	select BR2_LEGACY
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index fa4dc7a814..0848f8181a 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -166,26 +166,11 @@ config BR2_PACKAGE_GPSD_NMEA2000
 	help
 	  NMEA2000/CAN support
 
-config BR2_PACKAGE_GPSD_OCEANSERVER
-	bool "OceanServer"
-	help
-	  OceanServer Digital Compass support
-
 config BR2_PACKAGE_GPSD_ONCORE
 	bool "OnCore"
 	help
 	  OnCore support
 
-config BR2_PACKAGE_GPSD_RTCM104V2
-	bool "RTCM104 v2"
-	help
-	  RTCM104 v2 support
-
-config BR2_PACKAGE_GPSD_RTCM104V3
-	bool "RTCM104 v3"
-	help
-	  RTCM104 v3 support
-
 config BR2_PACKAGE_GPSD_SIRF
 	bool "SiRF"
 	help
@@ -216,11 +201,6 @@ config BR2_PACKAGE_GPSD_TRUE_NORTH
 	help
 	  True North Technologies support
 
-config BR2_PACKAGE_GPSD_UBX
-	bool "UBX"
-	help
-	  uBlox UBX binary support
-
 endif  # GPSD_DAEMON
 
 config BR2_PACKAGE_GPSD_CLIENTS
diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index 15e1181ed9..984ddab125 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b368b6a305e3f7a6382d23a0cbfc1d78923060b6b7f54cf7987a73c7b4a9afc2  gpsd-3.25.tar.gz
+sha256  dc7e465968c1540e61bc57c7586d6a57a0047212a014efdad348f907bc2e0990  gpsd-3.26.1.tar.gz
 sha256  fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716  COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 8f87766dcc..1b20210c49 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.25
+GPSD_VERSION = 3.26.1
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
@@ -120,18 +120,9 @@ endif
 ifneq ($(BR2_PACKAGE_GPSD_NMEA2000),y)
 GPSD_SCONS_OPTS += nmea2000=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_OCEANSERVER),y)
-GPSD_SCONS_OPTS += oceanserver=no
-endif
 ifneq ($(BR2_PACKAGE_GPSD_ONCORE),y)
 GPSD_SCONS_OPTS += oncore=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_RTCM104V2),y)
-GPSD_SCONS_OPTS += rtcm104v2=no
-endif
-ifneq ($(BR2_PACKAGE_GPSD_RTCM104V3),y)
-GPSD_SCONS_OPTS += rtcm104v3=no
-endif
 ifneq ($(BR2_PACKAGE_GPSD_SIRF),y)
 GPSD_SCONS_OPTS += sirf=no
 endif
@@ -150,9 +141,6 @@ endif
 ifneq ($(BR2_PACKAGE_GPSD_TRUE_NORTH),y)
 GPSD_SCONS_OPTS += tnt=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_UBX),y)
-GPSD_SCONS_OPTS += ublox=no
-endif
 
 # Features
 ifeq ($(BR2_PACKAGE_GPSD_SQUELCH),y)
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
