Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21021C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 14:44:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2F6060FC0
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 14:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2F6060FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=theobroma-systems.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFA3140453;
	Mon, 13 Sep 2021 14:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5zn1aQoHUK50; Mon, 13 Sep 2021 14:44:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACC5F4021E;
	Mon, 13 Sep 2021 14:44:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C6A11BF3A7
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 14:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C38F40364
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 14:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N1T0q0C0CrRJ for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 14:44:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.theobroma-systems.com (vegas.theobroma-systems.com
 [144.76.126.164])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79E604035A
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 14:44:40 +0000 (UTC)
Received: from ip092042140082.rev.nessus.at ([92.42.140.82]:37314
 helo=meitner.lan) by mail.theobroma-systems.com with esmtpsa
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.80)
 (envelope-from <martin.elshuber@theobroma-systems.com>)
 id 1mPmwa-0002q5-4b; Mon, 13 Sep 2021 16:28:24 +0200
From: Martin Elshuber <martin.elshuber@theobroma-systems.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 16:26:51 +0200
Message-Id: <20210913142652.942533-2-martin.elshuber@theobroma-systems.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913142652.942533-1-martin.elshuber@theobroma-systems.com>
References: <20210913142652.942533-1-martin.elshuber@theobroma-systems.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/strongswan: Add options to select
 EAP plugins
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

Add options to chose EAP plugins.

Since the only plugin requiring libgmp is
BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2, the selection of BR2_PACKAGE_GMP
is moved down accordingly.

Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
---
 package/strongswan/Config.in     | 89 +++++++++++++++++++++++++-------
 package/strongswan/strongswan.mk | 36 ++++++-------
 2 files changed, 87 insertions(+), 38 deletions(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 368cd1ecc0..77d437d7d9 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -75,34 +75,83 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
 
 config BR2_PACKAGE_STRONGSWAN_EAP
 	bool "Enable EAP protocols"
-	select BR2_PACKAGE_GMP
-	help
-	  Enable various EAP protocols:
-	    - mschapv2
-	    - tls
-	    - ttls
-	    - peap
-	    - sim
-	    - sim-file
-	    - aka
-	    - aka-3gpp2
-	    - simaka-sql
-	    - simaka-pseudonym
-	    - simaka-reauth
-	    - identity
-	    - md5
-	    - gtc
-	    - tnc
-	    - dynamic
-	    - radius
 
 if BR2_PACKAGE_STRONGSWAN_EAP
 
+config BR2_PACKAGE_STRONGSWAN_EAP_SIM
+	bool "Enable EAP-SIM"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE
+	bool "Enable EAP-SIM file backend"
+	default y
+
 config BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC
 	bool "Enable EAP-SIM smart card backend"
 	depends on !BR2_STATIC_LIBS # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
 
+config BR2_PACKAGE_STRONGSWAN_EAP_AKA
+	bool "Enable EAP-AKA"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2
+	bool "Enable EAP-AKA 3GPP2 algorithms"
+	default y
+	select BR2_PACKAGE_GMP
+
+config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_SQL
+	bool "Enable EAP-SIM/AKA backend based on a triplet/quintuplet SQL database"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_PSEUDONYM
+	bool "Enable EAP-SIM/AKA pseudonym storage"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_REAUTH
+	bool "Enable EAP-SIM/AKA reauthentication data storage"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_EAP_IDENTITY
+	bool "Enable EAP-Identity"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_EAP_MD5
+	bool "Enable EAP-MD5"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_EAP_GTC
+	bool "Enable EAP-GDC"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2
+	bool "Enable EAP-MSCHAPv2"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_EAP_PEAP
+	bool "Enable EAP-PEAP"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_EAP_RADIUS
+	bool "Enable EAP-RADIUS"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_EAP_TLS
+	bool "Enable EAP-TLS"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_EAP_TTLS
+	bool "Enable EAP-TTLS"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_EAP_DYNAMIC
+	bool "Enable EAP-TTLS"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_EAP_TNC
+	bool "Enable EAP-TNC"
+	default y
+
 endif
 
 config BR2_PACKAGE_STRONGSWAN_UNITY
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 322abfbd7b..ebfa1a11f3 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -48,30 +48,30 @@ endif
 
 ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)
 STRONGSWAN_CONF_OPTS += \
-	--enable-eap-sim \
-	--enable-eap-sim-file \
-	--enable-eap-aka \
-	--enable-eap-aka-3gpp2 \
-	--enable-eap-simaka-sql \
-	--enable-eap-simaka-pseudonym \
-	--enable-eap-simaka-reauth \
-	--enable-eap-identity \
-	--enable-eap-md5 \
-	--enable-eap-gtc \
-	--enable-eap-mschapv2 \
-	--enable-eap-tls \
-	--enable-eap-ttls \
-	--enable-eap-peap \
-	--enable-eap-tnc \
-	--enable-eap-dynamic \
-	--enable-eap-radius
-STRONGSWAN_DEPENDENCIES += gmp
+	--enable-eap-sim=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM),yes,no) \
+	--enable-eap-sim-file=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE),yes,no) \
+	--enable-eap-aka=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA),yes,no) \
+	--enable-eap-aka-3gpp2=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2),yes,no) \
+	--enable-eap-simaka-sql=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_SQL),yes,no) \
+	--enable-eap-simaka-pseudonym=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_PSEUDONYM),yes,no) \
+	--enable-eap-simaka-reauth=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_REAUTH),yes,no) \
+	--enable-eap-identity=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_IDENTITY),yes,no) \
+	--enable-eap-md5=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_MD5),yes,no) \
+	--enable-eap-gtc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_GTC),yes,no) \
+	--enable-eap-mschapv2=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2),yes,no) \
+	--enable-eap-tls=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TLS),yes,no) \
+	--enable-eap-ttls=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TTLS),yes,no) \
+	--enable-eap-peap=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_PEAP),yes,no) \
+	--enable-eap-tnc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TNC),yes,no) \
+	--enable-eap-dynamic=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_DYNAMIC),yes,no) \
+	--enable-eap-radius=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_RADIUS),yes,no)
 endif
 
 STRONGSWAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),libgcrypt) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp) \
+	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2),gmp) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_CURL),libcurl) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),libxml2) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),pcsc-lite) \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
