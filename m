Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A88C3DA47
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 14:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBAFA40EB9;
	Tue,  9 Jul 2024 14:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wk59hms8baX8; Tue,  9 Jul 2024 14:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A606B40ED6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A606B40ED6;
	Tue,  9 Jul 2024 14:24:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C346D1BF27A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 14:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A944640EB1
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 14:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHCk6vGpeQkQ for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 14:24:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0906540C1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0906540C1D
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0906540C1D
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 14:24:07 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 16:24:07 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jul 2024 16:24:08 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 16:24:06 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 09 Jul 2024 16:24:05 +0200
X-IronPort-AV: E=Sophos;i="6.09,195,1716242400"; d="scan'208";a="164598545"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 9 Jul 2024 16:23:59 +0200
Message-ID: <471a7327987d1940bba73b63ec6d29540d68ac31.1720535037.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720535037.git.yann.morin@orange.com>
References: <cover.1720535037.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX406.corporate.adroot.infra.ftgroup
 (10.115.27.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1720535048; x=1752071048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4hpMGK1fPoZF71uQMgeRL3+Nl6keLLSfmbbq3Wfpkwg=;
 b=hbKXF3It4EL6ENfmciMDHJJCpc0+wMqsx9ydJIs5TquWhmO4/xTDrP6h
 iYePyfdNrLPFbD7YwT1YPXwHBi2QoLLGOisA9pIlQz4Jq0zPJG50G93Bx
 5i2rWUhZ8bGWpSbg8wwoi5w6Wj6VuA7Nt/o7Jah5rdNIZEJuMk2YBW0q/
 A0FV9W0WDERyQbdFGl9L7k+r2/XfjSA75Vn8CQ8Td10IPLYevlL+TeZkr
 k9zTSF7hwH3CWYLgr9DiGveHX49GlkyWhEayMsjCahxvgFopRQ00MQF03
 gbqtP/0w1jCqxWDZjzLa5xwMpqRkxKi/sjPBEVoEXP8rtFfAEHiBG27XA
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=hbKXF3It
Subject: [Buildroot] [PATCH 3/5] package/gpsd: move python option later
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

It's in the middle of options that are specific to the daemon, while it
itslef is not specific to the daemon. We're going to add an option to
enable/disable the daemon soon, so that python option would get hidden
away.

Move it further down, out of scope of the daemon-related options.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
---
 package/gpsd/Config.in | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 44615f4e43..1b61f8c286 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -76,17 +76,6 @@ config BR2_PACKAGE_GPSD_MAX_DEV_VALUE
 config BR2_PACKAGE_GPSD_SQUELCH
 	bool "squelch gpsd_report and gpsd_hexdump to save cpu"
 
-config BR2_PACKAGE_GPSD_PYTHON
-	bool "build Python support and modules"
-	depends on BR2_USE_WCHAR # python3
-	select BR2_PACKAGE_PYTHON3
-	help
-	  Python libraries and tools for the gpsd service daemon
-	  including gpsfake test harness.
-
-comment "python support needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
-
 comment "Protocols"
 
 config BR2_PACKAGE_GPSD_AIVDM
@@ -221,4 +210,15 @@ config BR2_PACKAGE_GPSD_UBX
 	help
 	  uBlox UBX binary support
 
+config BR2_PACKAGE_GPSD_PYTHON
+	bool "build Python support and modules"
+	depends on BR2_USE_WCHAR # python3
+	select BR2_PACKAGE_PYTHON3
+	help
+	  Python libraries and tools for the gpsd service daemon
+	  including gpsfake test harness.
+
+comment "python support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 endif
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
