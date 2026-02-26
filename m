Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAFDFD8FCF
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21792421FB;
	Thu, 26 Feb 2026 15:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aw7nnYP7v_md; Thu, 26 Feb 2026 15:54:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9A5740D35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772121260;
	bh=EIUffGuEh0oiLZGqUA9OpFn64YDtgwHl4uVVggtEOvY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ASaI7DGvdgi8fr+82qT5DYdOlaGpYoWJTrEsjZlsT5UZ2mAbJMzo+rAPYT5yZG9pp
	 Tuid7sCQbejxtCihluQh2daeUMyVIMc367JzyQbpNkp0ZF2O27l8YYVhJL0odrgXKQ
	 ShpREG0ivfg1412LCZnEvlk8x5v2sVA72oE+yLtMpFxfWqpPNvO5QJhcmVjUpB1Moz
	 YufxAMHlYTmHfCZDeulLuZD05o2Ff7kY/a+gQ68Qm/rDgCgJe2h1DlB73mdn6Fj7Ki
	 IFTTSx+8MhV6G/43pk9+FawNpF8HmMqHnW0oaVN9XWBUOn3qcHfaMfIf40uNgbMSAZ
	 QekkCVlNBdjRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9A5740D35;
	Thu, 26 Feb 2026 15:54:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33A4C204
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 255A3847BA
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUT9amvJdwp5 for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:54:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5D5F84790
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5D5F84790
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5D5F84790
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:15 +0000 (UTC)
X-CSE-ConnectionGUID: TKMQ4MItTmWkhBzACx008Q==
X-CSE-MsgGUID: 1oCxNoK2Tye7zlhnqXcjtQ==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 26 Feb 2026 16:54:14 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 16:54:13 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Thu, 26 Feb 2026 16:54:12 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 26 Feb 2026 16:54:11 +0100
X-CSE-ConnectionGUID: 2oe4EwX4Ru+9fj53TA9x3g==
X-CSE-MsgGUID: rRJ6r2hHQ7ulz5BEbe/59g==
X-IronPort-AV: E=Sophos;i="6.21,202,1763420400"; d="scan'208";a="400664521"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 26 Feb 2026 16:53:58 +0100
Message-ID: <5a3a067d4c029f1480f682bc87940eb33549195d.1772121240.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1772121240.git.yann.morin@orange.com>
References: <cover.1772121240.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX603.corporate.adroot.infra.ftgroup
 (10.115.26.31) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1772121256; x=1803657256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RN9+4/SJ+inh8Ok7r29ZSbQRt0mNM74ZHH90CdB3uWg=;
 b=X4V1HTKnrCtq0mM+VCAb30RX/ZdtOIhWDzgQGv75N097GlKbZebP38oz
 0c5dPHxe/mpQnDHw9mLADJJNqTMJLshHFIfnSy1hUW0n+Un1yNEQSU7Fw
 g4I41uB1hiI04TczkOMachWWpIpg9kn4CtKzjo7GApn9KsTs3Ya7WrKAG
 0ZsPowauvTYDSXdt6uxLZOrUXZUhelRVDHy6zNXgqqNqIIYmCKU2DBybb
 MSmniXpWZFNl0W8sii7RPEpiDjkFlb3o8KzHKqovi80iVZUb6VZKVAWMc
 GVEebdCiioRDRQpmn9RsgoBEMPXr0JyLU7MwBQrx7+pan+/Q1bfopMJBj
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=X4V1HTKn
Subject: [Buildroot] [PATCH 04/11 v3] package/mosquitto: add option to build
 broker-related apps
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
Cc: yann.morin@orange.com, Titouan Christophe <titouan.christophe@mind.be>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

mosquitto_{ctrl,db_dump,passwd,signal} can be handy to interact with
the mosquitto broker during development, but are usually unnecessary
on the target.

Add an option to enable or disable them. Make that new option enabled
by default when the broker is enabled, to keep backward compatibility
with previous (def)config files.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Fiona Klute <fiona.klute@gmx.de>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>

---
Changes v1 -> v2:
  - s/TLS/openssl/  (Fiona)
---
 package/mosquitto/Config.in    | 16 ++++++++++++++++
 package/mosquitto/mosquitto.mk | 12 ++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index d0f096e5cf..c19d80c943 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -33,6 +33,22 @@ config BR2_PACKAGE_MOSQUITTO_CLIENTS
 	    mosquitto_sub
 	    mosquitto_rr
 
+config BR2_PACKAGE_MOSQUITTO_APPS
+	bool "install apps"
+	default y if BR2_PACKAGE_MOSQUITTO_BROKER  # Backward compatibility
+	depends on BR2_USE_WCHAR  # libedit
+	# For mosquitto_ctrl shell feature, mandatorily enabled:
+	select BR2_PACKAGE_READLINE if !BR2_PACKAGE_LIBEDIT
+	help
+	  Those apps can be used to interact with the broker:
+	    mosquitto_db_dump
+	    mosquitto_signal
+
+	  Additionally, when openssl is enabled, the following apps are
+	  also installed:
+	    mosquitto_ctrl
+	    mosquitto_passwd
+
 config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
 	default y
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 62934966ca..a1848f96b3 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -19,8 +19,7 @@ MOSQUITTO_CONF_OPTS = \
 	-DWITH_TESTS=OFF \
 	-DWITH_STATIC_LIBRARIES=OFF \
 	-DWITH_BUNDLED_DEPS=ON \
-	-DWITH_HTTP_API=OFF \
-	-DWITH_CTRL_SHELL=OFF
+	-DWITH_HTTP_API=OFF
 
 # adns uses getaddrinfo_a
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
@@ -75,12 +74,18 @@ else
 MOSQUITTO_CONF_OPTS += -DWITH_CLIENTS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_APPS),y)
+MOSQUITTO_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBEDIT),libedit,readline)
+MOSQUITTO_CONF_OPTS += -DWITH_APPS=ON -DWITH_CTRL_SHELL=ON
+else
+MOSQUITTO_CONF_OPTS += -DWITH_APPS=OFF -DWITH_CTRL_SHELL=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER),y)
 
 MOSQUITTO_CONF_OPTS += \
 	-DCMAKE_INSTALL_SYSCONFDIR=/etc \
 	-DWITH_BROKER=ON \
-	-DWITH_APPS=ON \
 	-DWITH_PLUGINS=ON \
 	-DWITH_PLUGIN_ACL_FILE=ON \
 	-DWITH_PLUGIN_PASSWORD_FILE=ON \
@@ -125,7 +130,6 @@ MOSQUITTO_POST_INSTALL_TARGET_HOOKS += MOSQUITTO_INSTALL_TARGET_CONF
 else # !BR2_PACKAGE_MOSQUITTO_BROKER
 MOSQUITTO_CONF_OPTS += \
 	-DWITH_BROKER=OFF \
-	-DWITH_APPS=OFF \
 	-DWITH_PLUGINS=OFF
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
