Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39578C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEECD41523;
	Sun,  6 Aug 2023 14:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEECD41523
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sgu3mdwT3Wx5; Sun,  6 Aug 2023 14:05:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0FB54021B;
	Sun,  6 Aug 2023 14:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0FB54021B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF901BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 733DC60E97
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 733DC60E97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LyIje-fcBN-i for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:03:49 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2EB560E2D
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2EB560E2D
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EEA1BA4C10DA;
 Sun,  6 Aug 2023 16:02:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46282)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSeLD-0000Bn-2I;
 Sun, 06 Aug 2023 16:02:43 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 16:02:34 +0200
Message-Id: <20230806140241.4155773-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230806140241.4155773-1-bernd@kuhls.net>
References: <20230806140241.4155773-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691330563;
 bh=Na+PAy3rRIKe1lVAaBR3ROVxfeuyAMkBRNf/p0QMl+E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UM9oPf69L2cBpIwtcLaPXpTz03eRlSdfGtV4Nd+DSpuyNR5Ve5zlWjHX6TSrk+sOc
 C8c26jw39IH2erbj0Lz9fzJnHHT2Iip4XDWTmFqD/8BpFJEwSdb/CZUeHvUmhVoVTW
 3Qrzmn5O9gEkqGUB9prk2FomJY3+4sqzOgz8zZShWnMd5GNba9vP05TMJo+ZbAYovV
 Zjk5Vt4HJM4ToEwP5HwJVYUYyxd5H2qd4vvF1PxMfYDwAHvq0xOGwwcAzshnLasLSn
 KYqj0boBj6Wm1Qj8Xo+QBUhGXiZkd4nzcUliMTHmi7XphJNLmwTs9/UXFji4ppfLyl
 IU5SNr7r3s+PQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=UM9oPf69
Subject: [Buildroot] [PATCH/next v9 05/12] package/systemd: provides libudev
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/systemd/Config.in  | 4 ++++
 package/systemd/systemd.mk | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 859332d9e4..40409bc612 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -25,6 +25,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # LOOP_SET_BLOCK_SIZE
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
+	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBCAP
@@ -104,6 +105,9 @@ menuconfig BR2_PACKAGE_SYSTEMD
 
 if BR2_PACKAGE_SYSTEMD
 
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "systemd"
+
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index d220673572..e52b84e013 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -60,7 +60,7 @@ SYSTEMD_DEPENDENCIES = \
 
 SYSTEMD_SELINUX_MODULES = systemd udev xdg
 
-SYSTEMD_PROVIDES = udev
+SYSTEMD_PROVIDES = libudev udev
 
 SYSTEMD_CONF_OPTS += \
 	-Ddbus=false \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
