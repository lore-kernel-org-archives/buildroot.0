Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2429AC7EE32
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 11:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD1C0404EF;
	Thu, 26 Jun 2025 11:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RS2JlHs4swpX; Thu, 26 Jun 2025 11:25:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 212BC40663
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 212BC40663;
	Thu, 26 Jun 2025 11:25:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EA3D154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44ABA842E4
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGVAPePoBhOU for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 11:25:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::8faa;
 helo=smtp-8faa.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6AE26842DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AE26842DC
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::8faa])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AE26842DC
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:25:33 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bSbp333FtzTwL;
 Thu, 26 Jun 2025 13:20:27 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4bSbp268wczXbw; Thu, 26 Jun 2025 13:20:26 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Thu, 26 Jun 2025 13:20:18 +0200
MIME-Version: 1.0
Message-Id: <20250626-strongswan-misc-martin-v1-1-a4c4da74ba9c@cherry.de>
References: <20250626-strongswan-misc-martin-v1-0-a4c4da74ba9c@cherry.de>
In-Reply-To: <20250626-strongswan-misc-martin-v1-0-a4c4da74ba9c@cherry.de>
To: buildroot@buildroot.org
Cc: Martin Elshuber <martin.elshuber@cherry.de>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 1/3] package/strongswan: allow to drop unneeded
 capabilities
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

From: Quentin Schulz <quentin.schulz@cherry.de>

strongSwan allows to drop unneeded capabilities[1] after the IKE daemon
has been started, based on libcap, so let's allow that via a config
option.

While the "native" (capset) way of dropping capabilities is supported,
it is deprecated so its support is not added in Buildroot.

While the documentation specifically mentions the IKE daemon (charon) as
being the one impacted by this change, the ifdefery with this autotools
option exists in various libraries in the source code, hence why this is
kept independent from the charon Kconfig option status.

[1] https://docs.strongswan.org/docs/latest/install/reducedPrivileges.html#_dropping_capabilities
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/strongswan/Config.in     | 10 ++++++++++
 package/strongswan/strongswan.mk |  7 ++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 22caa2a5730df9de446a3fbe6a318a4be1684c21..feaf7142137d7853e62819b18ab2afaadc4d34de 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -73,6 +73,16 @@ config BR2_PACKAGE_STRONGSWAN_CURL
 config BR2_PACKAGE_STRONGSWAN_MD4
 	bool "Enable MD4 hash algorithm"
 
+config BR2_PACKAGE_STRONGSWAN_DROP_CAPS
+	bool "Drop unneeded capabilities after initialization"
+	select BR2_PACKAGE_LIBCAP
+	help
+	  strongSwan supports capability dropping. The IKE charon daemon
+	  is started as root and most of its privileges are dropped
+	  immediately.
+	  After the daemon has been initialized, further unneeded
+	  capabilities are dropped.
+
 config BR2_PACKAGE_STRONGSWAN_CHARON
 	bool "Enable the IKEv1/IKEv2 keying daemon charon"
 	default y
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 823b58555d3659015448b24c592df2f15bc44158..072d8681d40925b94786f4a31450ff75d8faa015 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -62,6 +62,10 @@ STRONGSWAN_CONF_OPTS += \
 	--with-imcvdir=/usr/lib/ipsec/imcvs \
 	--with-dev-headers=/usr/include
 
+ifeq ($(BR2_PACKAGE_STRONGSWAN_DROP_CAPS),y)
+STRONGSWAN_CONF_OPTS += --with-capabilities=libcap
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 STRONGSWAN_CONF_ENV += LIBS='-latomic'
 endif
@@ -75,7 +79,8 @@ STRONGSWAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_STRONGSWAN_CURL),libcurl) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),libxml2) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),pcsc-lite) \
-	$(if $(BR2_PACKAGE_STRONGSWAN_WOLFSSL),wolfssl)
+	$(if $(BR2_PACKAGE_STRONGSWAN_WOLFSSL),wolfssl) \
+	$(if $(BR2_PACKAGE_STRONGSWAN_DROP_CAPS),libcap)
 
 ifeq ($(BR2_PACKAGE_STRONGSWAN_SQL),y)
 STRONGSWAN_DEPENDENCIES += \

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
