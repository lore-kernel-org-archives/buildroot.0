Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415EDEA4FC4
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 14:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1659441A7A;
	Mon, 23 Feb 2026 14:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nycLhYzQ_nUU; Mon, 23 Feb 2026 14:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B4E741A4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771856284;
	bh=1hZMfGvyWZzbWiPsEGwDoaEZ02qGak95IVFlRsBzk5U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mMDUg4LNCMZGE8DheykezI1qgO8D6BuXvPkm1SKWqSkvkJqQR8vZdzBdm+QYbKXWM
	 GGrdthW7PzGHr45R4r2iEBNl3TDygbC/U17XyCs42xTbOf19hbx50Y4GGAtvrVGrL5
	 1vVI5bKIR/3z2jU0LP63ZnEAy0wJWcdGlFj8sOZ291wpXBaRk1nyPg7hLzE63OyxXl
	 TDN6Tx1YAJXXh8PleF78VxqxL7tsUPaR8q5QsqNa0qh9OBc96iJZmT6vjLbdUD+YSV
	 5vi1UyK/K6immHOiRkfjoLv6MeMWiXMX7Kn4O1tbUfp/iAZhjSaInfWnWaB0NyzzGW
	 4ELe/uPdprUFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B4E741A4F;
	Mon, 23 Feb 2026 14:18:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D43971CE
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5E94842AD
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTBqjY9e4vZ2 for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 14:18:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 705D6842A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 705D6842A8
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 705D6842A8
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:00 +0000 (UTC)
X-CSE-ConnectionGUID: K4eK7iSmSZKuEwfGNeNCWw==
X-CSE-MsgGUID: ZsqPG5v0RdKy++uxkEAiqw==
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Feb 2026 15:17:58 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 15:17:58 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Mon, 23 Feb 2026 15:17:56 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Feb 2026 15:17:55 +0100
X-CSE-ConnectionGUID: 7HVPFCzYSgG7jfFORg96Tg==
X-CSE-MsgGUID: qIYGcG+8RqKEoNQ0KR9CSQ==
X-IronPort-AV: E=Sophos;i="6.21,306,1763420400"; d="scan'208";a="395694155"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 23 Feb 2026 15:17:44 +0100
Message-ID: <c85a3653f0925bf04f55fee3a527afbcf73c282f.1771856260.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1771856259.git.yann.morin@orange.com>
References: <cover.1771856259.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771856280; x=1803392280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9yFCnGzX3R5BeyQX7JOm+iJufDQ0eXLZxO1J1JDXnIA=;
 b=QMC1p4C5NOcVqL7IsRjWL6RX3DBgWv4GHJffyXJjbvMZfW2wEChb0ySB
 M0J7oMm6AOieVQ7bGf23ZN67kXt3smaeciNDyKglQ/3iKJlNTDEox4n1Q
 PMnYdjsfTFRocB2OtjRD9JIvpyH2nmNg3QydiwI2juiFP3XqHfkNHvBgm
 LUE1NQdijBO0kk03gBtp2OUoX61j9L8GTtLJ38WoEBFzYTuABn7j8Gzrh
 MoGK+Fbcj/JlkMVhTTJ9PtpcmRAfwxX7y3Efru40KcwltvByBlJoZ/NAA
 nC6ZfgTncntB7tPnSjR/dQDF1qOBPj6zHCID4hQgkmyuYgeoaTNozS2h/
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=QMC1p4C5
Subject: [Buildroot] [PATCH 4/8 v2] package/mosquitto: add option to build
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
index de952e9d77..1cfc052003 100644
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
@@ -123,7 +128,6 @@ MOSQUITTO_POST_INSTALL_TARGET_HOOKS += MOSQUITTO_INSTALL_TARGET_CONF
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
