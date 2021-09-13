Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A76CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 14:44:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CBD260FC0
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 14:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CBD260FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=theobroma-systems.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14F7540453;
	Mon, 13 Sep 2021 14:44:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FkUHfXBWTEim; Mon, 13 Sep 2021 14:44:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FED0402D1;
	Mon, 13 Sep 2021 14:44:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7BB21BF3A7
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 14:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D431E402D1
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 14:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BWplbt35cYLl for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 14:44:37 +0000 (UTC)
X-Greylist: delayed 00:16:48 by SQLgrey-1.8.0
Received: from mail.theobroma-systems.com (vegas.theobroma-systems.com
 [144.76.126.164])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A56934021E
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 14:44:37 +0000 (UTC)
Received: from ip092042140082.rev.nessus.at ([92.42.140.82]:37314
 helo=meitner.lan) by mail.theobroma-systems.com with esmtpsa
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.80)
 (envelope-from <martin.elshuber@theobroma-systems.com>)
 id 1mPmwf-0002q5-QC; Mon, 13 Sep 2021 16:28:29 +0200
From: Martin Elshuber <martin.elshuber@theobroma-systems.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 16:26:52 +0200
Message-Id: <20210913142652.942533-3-martin.elshuber@theobroma-systems.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913142652.942533-1-martin.elshuber@theobroma-systems.com>
References: <20210913142652.942533-1-martin.elshuber@theobroma-systems.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] strongswan: add md4 hash algorithm option
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Martin Elshuber <martin.elshuber@theobroma-systems.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Add the option to enable the md4 hash algorithm and default it to 'no'
since this is a new option.

Since md4 is required by EAP-MSCHAPv2 it is selected by
BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2. See
https://wiki.strongswan.org/projects/strongswan/wiki/Autoconf for
further details.

Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
---
 package/strongswan/Config.in     | 4 ++++
 package/strongswan/strongswan.mk | 1 +
 2 files changed, 5 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 77d437d7d9..2d972f525a 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -73,6 +73,9 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_20
 config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
 	bool "Enable dynamic TNCCS protocol discovery module"
 
+config BR2_PACKAGE_STRONGSWAN_MD4
+	bool "Enable MD4 hash algorithm"
+
 config BR2_PACKAGE_STRONGSWAN_EAP
 	bool "Enable EAP protocols"
 
@@ -126,6 +129,7 @@ config BR2_PACKAGE_STRONGSWAN_EAP_GTC
 
 config BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2
 	bool "Enable EAP-MSCHAPv2"
+	select BR2_PACKAGE_STRONGSWAN_MD4
 	default y
 
 config BR2_PACKAGE_STRONGSWAN_EAP_PEAP
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index ebfa1a11f3..b9f3de83bc 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -37,6 +37,7 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--enable-wolfssl=$(if $(BR2_PACKAGE_STRONGSWAN_WOLFSSL),yes,no) \
+	--enable-md4=$(if $(BR2_PACKAGE_STRONGSWAN_MD4),yes,no) \
 	--with-ipseclibdir=/usr/lib \
 	--with-plugindir=/usr/lib/ipsec/plugins \
 	--with-imcvdir=/usr/lib/ipsec/imcvs \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
