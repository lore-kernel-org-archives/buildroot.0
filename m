Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A423C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 14:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A092240EF0;
	Tue,  9 Jul 2024 14:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1bLW3moTgIu; Tue,  9 Jul 2024 14:24:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3722040EE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3722040EE6;
	Tue,  9 Jul 2024 14:24:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 432871BF27A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 14:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DCEC60F2D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 14:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aF6zYVqMaPSq for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 14:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0CF1360B57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CF1360B57
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CF1360B57
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 14:24:09 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 16:24:09 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jul 2024 16:24:10 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 16:24:08 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 09 Jul 2024 16:24:07 +0200
X-IronPort-AV: E=Sophos;i="6.09,195,1716242400"; d="scan'208";a="164740580"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 9 Jul 2024 16:24:00 +0200
Message-ID: <9b8d275201bc342691e17cc408baa851c1b04a5a.1720535037.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720535037.git.yann.morin@orange.com>
References: <cover.1720535037.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX101.corporate.adroot.infra.ftgroup (10.115.26.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1720535050; x=1752071050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nOpINeZntumzjPX8MXln83tekrXtSL7G2quuyaaFbDs=;
 b=eM88rwwtwB5ApPKDrbUWXB69ajusBchvxw8VXvSORvR2ffnmvW/DLylG
 2tptXMXWFAIu+Dvkdht+yD2KYxesGD0nm3g/I/6rBn7gcZ7nrXg5jkjVZ
 nw8wVtF7YC5u/YVEP3Jg3YA8l5piyO3r6tlJLuNikxGYz56PNTwXvGzZc
 jeGTxnHLHzOtC3dXYJIZVSDDBxuPjRgsaqAB/ZjkVK4a8CcIoeNiTjBgr
 ZGbXe++qO6AYS9ROzvVXY14g/u0rCqq0Ru6j+2fHzJBp6MlGr6IOsue0J
 VA2LYrdqj1Z+JvvkPWfvWSTN+ht0/0ujrg710EsLLctauUPK70QYkrID3
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=eM88rwwt
Subject: [Buildroot] [PATCH 4/5] package/gpsd: add option to enable clients
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
Cc: Bernd Kuhls <bernd@kuhls.net>, yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

In some cases, the clients are useless on the target, e.g. when there is
no need to adjust the gpsd daemon at runtime.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
---
 package/gpsd/Config.in | 11 +++++++++++
 package/gpsd/gpsd.mk   |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 1b61f8c286..cbdcdb5725 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -210,6 +210,17 @@ config BR2_PACKAGE_GPSD_UBX
 	help
 	  uBlox UBX binary support
 
+config BR2_PACKAGE_GPSD_CLIENTS
+	bool "gpsd clients"
+	default y # legacy
+	help
+	  Build and install gspd client programs, like:
+	    - gpsctl
+	    - gpsdctl
+	    - gpsdecode
+	    - gpspipe
+	    - ...
+
 config BR2_PACKAGE_GPSD_PYTHON
 	bool "build Python support and modules"
 	depends on BR2_USE_WCHAR # python3
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index c57fad83c3..77c6f6c562 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -178,6 +178,12 @@ ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
 GPSD_SCONS_OPTS += max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
 endif
 
+ifeq ($(BR2_PACKAGE_GPSD_CLIENTS),y)
+GPSD_SCONS_OPTS += gpsdclients=yes
+else
+GPSD_SCONS_OPTS += gpsdclients=no
+endif
+
 ifeq ($(BR2_PACKAGE_GPSD_PYTHON),y)
 GPSD_SCONS_OPTS += \
 	python=yes \
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
