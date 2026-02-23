Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3349EA4FBA
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 14:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B68C940DB6;
	Mon, 23 Feb 2026 14:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLABiTEQwwsw; Mon, 23 Feb 2026 14:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C366B41ADF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771856297;
	bh=w5QvTSrPtDkrGy/qPpKq4UwHFSuHBv/oxvNx2dcGczE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=suYzmXCo47GHrqZoi6Wm0Rs2LRCdXKrA4SzSIk+xYoxe1DqVIT4lhslSjibpLFHep
	 yuZBe5gb1EanEorftLgLWWq2xwOzYXiDhrv98mMSYMlYAxAuhX7X0E301C9utOyX6/
	 4iXqeaajXtVB9mnY93bAlU38tXxk7T8QD96XUVjzgw+1DlzoXYcwBB4H+vmGwGDx2L
	 2gdDhZWtoNH0RaDmO82LflqkB8xrqq8jrjMSMZjmyuaJN9sw9TpvEyz2Pb3un5VZEY
	 A1cpU/qiOU9kotNCyiN4K9q+6KvVcio9k4KGyR25E7p7UFHgP9/OFfazmcp14HPWqN
	 b+MJICaB+ZZcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C366B41ADF;
	Mon, 23 Feb 2026 14:18:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2525249
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEF4140A39
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENCHZ3K3t0w6 for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 14:18:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 71A7141AAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71A7141AAA
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71A7141AAA
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:07 +0000 (UTC)
X-CSE-ConnectionGUID: X7nL/eAGQgixIdpsRSp+YQ==
X-CSE-MsgGUID: 7F4DQm7qS2ysmZ2CdtmV1A==
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Feb 2026 15:18:06 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 15:18:06 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Mon, 23 Feb 2026 15:18:05 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Feb 2026 15:18:04 +0100
X-CSE-ConnectionGUID: naZtW6ZPQpiPoxNw0zccQA==
X-CSE-MsgGUID: 2KjDRVLgTnWoIwS5Mk9W7w==
X-IronPort-AV: E=Sophos;i="6.21,202,1763420400"; d="scan'208";a="395722999"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 23 Feb 2026 15:17:48 +0100
Message-ID: <4a23d0cf09f1c12e1a93552b59113153b2078511.1771856260.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1771856259.git.yann.morin@orange.com>
References: <cover.1771856259.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX504.corporate.adroot.infra.ftgroup
 (10.115.26.28) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771856287; x=1803392287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b+TwwY03VkG0rHEtgB2PX/+XMM/mbs2UhQ/0CnvH/cg=;
 b=eC70Q61eRsdkWAR4H/u1hpbSP6puUYTWsh1jusyEfJmX0CtC3Fuy6Rl2
 fUwyp+w8/2LRhe8qMVf8NrAylgZhIw3sREOtdv91um9z+nbWJVfE9p9eq
 yaFK26dfAIPq2e1Mh0wBN9Q/SgRV7oc/GLJzTC7S/LowaCUf/oKevx7Vm
 Eg5IQsyliQN93OyWWy05/O5U3igOSAMdZEXGknV6VFsErlnrwqJNzzMOg
 M9KrOaxIInlNyavodmoY2e/yx5eZebjkJOSfwxF1JzfOsgqVfhL6codzJ
 myjVjl/m/O1xoyLRKlqX+g0LfNHIzPDLoTGP2jjlZAcxmK2czrxxjNywI
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=eC70Q61e
Subject: [Buildroot] [PATCH 8/8 v2] package/mosquitto: add option to enable
 the persist-sqlite plugin
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
Cc: yann.morin@orange.com, Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

That plugin can be used instead of the builtin support to persist the
mosquitto state across restarts.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mosquitto/Config.in    | 7 +++++++
 package/mosquitto/mosquitto.mk | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index f7bd5a01b8..b57abbe982 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -109,6 +109,13 @@ config BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN
 	  Build and install the dynamic security plugin for
 	  mosquitto broker onto target.
 
+config BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_PERSIST_SQLITE
+	bool "persist-sqlite plugin"
+	select BR2_PACKAGE_SQLITE
+	help
+	  Add the persist-sqlite plugin, to persist the broker
+	  state across restarts.
+
 endif
 
 comment "mosquitto broker needs a toolchain w/ dynamic library"
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 4d0f51176c..0650cfa37a 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -96,7 +96,6 @@ MOSQUITTO_CONF_OPTS += \
 	-DWITH_BROKER=ON \
 	-DWITH_PLUGINS=ON \
 	-DWITH_PLUGIN_EXAMPLES=OFF \
-	-DWITH_PLUGIN_PERSIST_SQLITE=OFF \
 	-DWITH_PLUGIN_SPARKPLUG_AWARE=OFF
 
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD),y)
@@ -117,6 +116,13 @@ else
 MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_DYNAMIC_SECURITY=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_PERSIST_SQLITE),y)
+MOSQUITTO_DEPENDENCIES += sqlite
+MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_PERSIST_SQLITE=OM
+else
+MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_PERSIST_SQLITE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 MOSQUITTO_CONF_OPTS += -DWITH_SYSTEMD=ON
 MOSQUITTO_DEPENDENCIES += systemd
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
