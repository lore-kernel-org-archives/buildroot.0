Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886A6EB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 20:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3747160A63;
	Sat,  8 Jul 2023 20:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3747160A63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n8I4Mss1AjWu; Sat,  8 Jul 2023 20:05:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DCF660E29;
	Sat,  8 Jul 2023 20:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DCF660E29
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8910A1BF3DF
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 20:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71A3060BDA
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 20:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71A3060BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOZuJ0i5Q4T8 for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 20:05:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7364260A63
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7364260A63
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 20:05:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D00A9A4C0EF5;
 Sat,  8 Jul 2023 22:04:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55090)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIEAh-0000uD-29;
 Sat, 08 Jul 2023 22:04:47 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 22:04:46 +0200
Message-Id: <20230708200447.3919009-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708200447.3919009-1-bernd@kuhls.net>
References: <20230708200447.3919009-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688846688;
 bh=NwBSqspTlyF1/bvXFDRdPIYLZs0fY0T1kBgcE/05vo0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A3m2qdThtZCjJrt6noz3Gqy/NAZygz6ELHyNBgBDwaNnwujaQ5hTMSsfhM3Pxksfa
 FMNzJTAKiRjML9SUyNLJ7edjEGrMPBLl0lwIRzAQrjgIpLsezpY7oiO2JF2vOqHo6a
 Efm5wwTFfPdRaMuCY1nj0QlD6OR+d5A/tNiExWop8yeMtVM+lc87X0ey+BZJDV7vT3
 09UrjofssAMkXi+Hgp3YTGcyrwK4YLU8M4lloybuyoWBlOISWpjX8TRrj2ctIYsqrk
 BkTCC1JH48jADfT8pG/MyhsjMF65ZiFLkbX+jzpuk3WwXtjuPhapb1Dn8aKvRIfx9C
 gOfPUA4hB2eRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=A3m2qdTh
Subject: [Buildroot] [PATCH 6/7] package/kodi-imagedecoder-heif: new package
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
Cc: Pieter De Gendt <pieter.degendt@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-imagedecoder-heif/Config.in            |  9 +++++++++
 .../kodi-imagedecoder-heif.hash                     |  3 +++
 .../kodi-imagedecoder-heif.mk                       | 13 +++++++++++++
 package/kodi/Config.in                              |  4 ++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/kodi-imagedecoder-heif/Config.in
 create mode 100644 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
 create mode 100644 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk

diff --git a/package/kodi-imagedecoder-heif/Config.in b/package/kodi-imagedecoder-heif/Config.in
new file mode 100644
index 0000000000..56ba282351
--- /dev/null
+++ b/package/kodi-imagedecoder-heif/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
+	bool "kodi-imagedecoder-heif"
+	select BR2_PACKAGE_LIBDE265
+	select BR2_PACKAGE_LIBHEIF
+	select BR2_PACKAGE_TINYXML2
+	help
+	  HEIF image decoder add-on for Kodi
+
+	  https://github.com/xbmc/imagedecoder.heif
diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
new file mode 100644
index 0000000000..4c7dec7df1
--- /dev/null
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  17f50aada11528c02db2ff3871a355c89709ab7e2a5e6b5e33957b790cf207ff  kodi-imagedecoder-heif-20.1.0-Nexus.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
new file mode 100644
index 0000000000..40b091d8b4
--- /dev/null
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-imagedecoder-heif
+#
+################################################################################
+
+KODI_IMAGEDECODER_HEIF_VERSION = 20.1.0-Nexus
+KODI_IMAGEDECODER_HEIF_SITE = $(call github,xbmc,imagedecoder.heif,$(KODI_IMAGEDECODER_HEIF_VERSION))
+KODI_IMAGEDECODER_HEIF_LICENSE = GPL-2.0+
+KODI_IMAGEDECODER_HEIF_LICENSE_FILES = LICENSE.md
+KODI_IMAGEDECODER_HEIF_DEPENDENCIES = kodi libde265 libheif tinyxml2
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a21733ea78..30f04f0552 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -290,6 +290,10 @@ menu "Audio encoder addons"
 	source "package/kodi-audioencoder-wav/Config.in"
 endmenu
 
+menu "Image decoder addons"
+	source "package/kodi-imagedecoder-heif/Config.in"
+endmenu
+
 menu "Peripheral addons"
 	source "package/kodi-peripheral-joystick/Config.in"
 	source "package/kodi-peripheral-xarcade/Config.in"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
