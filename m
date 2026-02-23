Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02974EA4FC4
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 14:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC93B41AB7;
	Mon, 23 Feb 2026 14:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdHF-6qCoKRi; Mon, 23 Feb 2026 14:18:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B80941A73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771856285;
	bh=c64/zCQIHk/4M24A5ghHNXKbkBZ1iaHcoV0t4ZxCSGM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tEMLJZUIxBLUEqlyE76HO/dvc+kNPmXxiiZDc+rlr0E5uMeChrkKhYtIBnlpVMAnN
	 Hx1uGIV+cBQ2c/Fj/dnB+ic4A2C3PMrnia+LHx8PBXAqGU0jIXOjnpTlpJyVGiYkL2
	 AtGC+SXUiBeFFAJ9xrj5trlS+f/54t1Pb04RGMXRuMKFZkMuDPg5ei9a+jJyJHCcUk
	 M7K6Rw/+v9R30Jq11RoQuF2B2NFfbadkVlap/JiFneoNVfYBPj7Xj3OyWU6r7OQ0I0
	 SAa4ZdU+6T43BL7/Rj215CbsiRtaD1mKc0Wi8Fyt1qmXdw7hBGMGqBxADvoxfKqOwM
	 lfPDOqSt+wS7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B80941A73;
	Mon, 23 Feb 2026 14:18:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD3DF1CE
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE429842A8
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNl3N4o7cYgy for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 14:18:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6021D842A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6021D842A6
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6021D842A6
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:01 +0000 (UTC)
X-CSE-ConnectionGUID: 92W0hOyYQOCWYGZFgm3Q4A==
X-CSE-MsgGUID: 6cTwp4GAQ+mSdOe7lllQCQ==
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Feb 2026 15:18:00 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 15:18:00 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Mon, 23 Feb 2026 15:17:58 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Feb 2026 15:17:57 +0100
X-CSE-ConnectionGUID: UT+HhnMVTjmcOirNYRr2lg==
X-CSE-MsgGUID: GDSEMMutT4+BfPesX+tq5g==
X-IronPort-AV: E=Sophos;i="6.21,306,1763420400"; d="scan'208";a="395694169"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 23 Feb 2026 15:17:45 +0100
Message-ID: <0ba9ce66f0227b6b7c83f87c6ba6d91f944150aa.1771856260.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1771856259.git.yann.morin@orange.com>
References: <cover.1771856259.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771856281; x=1803392281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=faEQqWfIOI/611Pr6037pE/yMUll+BSlJ6KYB4uMObc=;
 b=IZYQ2Tnwt67M0+GxZsyUPk4W0KjRBnziwr93yxIuJ1wTfM5VDPxe+WAP
 juUXXcO+GB+7GrXxhShNL4zGdw31gpC6xW0JBq8Sr8Sn2gH3++7jhTdMO
 V9ekNmMn5RslpwJlfolxpf25nPYyFFnEvrCxWeXv2bRS3Sm3sEHRwQfg3
 C+9bga0HGBrZhPvz1BDUtI4FEqayyDBHxivjoTDj+A8eOXod4HkLeyVK6
 N0nNXQ1aG7v0xTqOfUGpERoq+Jd8ygguXLWKhMKzgazEbS9jQ9kXUY8Xr
 JlnCzMVzXFDTWL4vdgj34JxsUnF2bqR3QYn5/1c6sVvd0+q90ZJ7VTaSE
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=IZYQ2Tnw
Subject: [Buildroot] [PATCH 5/8 v2] package/mosquitto: add option for
 websockets
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

Mosquitto 2.1.x adds the possibility to use a builtin websocket
implementation, as an alternative to using libwebsockets.

When using libwebsockets as the implementation, only the broker supports
websockets, and CLI tools do not; only when using the builtin one are
websockets usable with CLI tools (and the broker, of course).

Add a choice to select what type of websockets support to enable, if
any. Since the builtin implementation is still new, we keep the
libwebsockets one available.

Since this inverts the dependency logic to libwebsockets, we can't
provide a backward compatibility with existing (def)config files.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mosquitto/Config.in    | 25 ++++++++++++++++++++++++-
 package/mosquitto/mosquitto.mk |  4 +++-
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index c19d80c943..6e0644e9b6 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -49,10 +49,33 @@ config BR2_PACKAGE_MOSQUITTO_APPS
 	    mosquitto_ctrl
 	    mosquitto_passwd
 
+choice
+	prompt "Websockets support"
+	help
+	  Choose what websocket implementation to use. Note that
+	  the mosquitto_{sub,pub,rr} clients (above) only support
+	  websockets with the builtin implementation, while the
+	  broker supports websockets with either libwebsockets
+	  or the builtin implementation.
+
+config BR2_PACKAGE_MOSQUITTO_WS_NONE
+	bool "none"
+
+config BR2_PACKAGE_MOSQUITTO_WS_LIBWS
+	bool "with libwebsockets"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBWEBSOCKETS
+	select BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL
+
+config BR2_PACKAGE_MOSQUITTO_WS_BUILTIN
+	bool "with builtin implementation"
+	select BR2_PACKAGE_OPENSSL
+
+endchoice
+
 config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
 	default y
-	select BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL if BR2_PACKAGE_LIBWEBSOCKETS
 	help
 	  Build and install the mosquitto broker onto target.
 
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 1cfc052003..f63170daef 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -41,9 +41,11 @@ MOSQUITTO_CONF_OPTS += \
 	-DWITH_TLS=ON \
 	-DWITH_TLS_PSK=ON
 
-ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
+ifeq ($(BR2_PACKAGE_MOSQUITTO_WS_LIBWS),y)
 MOSQUITTO_DEPENDENCIES += libwebsockets
 MOSQUITTO_CONF_OPTS += -DWITH_WEBSOCKETS=ON -DWITH_WEBSOCKETS_BUILTIN=OFF
+else ifeq ($(BR2_PACKAGE_MOSQUITTO_WS_BUILTIN),y)
+MOSQUITTO_CONF_OPTS += -DWITH_WEBSOCKETS=ON -DWITH_WEBSOCKETS_BUILTIN=ON
 else
 MOSQUITTO_CONF_OPTS += -DWITH_WEBSOCKETS=OFF -DWITH_WEBSOCKETS_BUILTIN=OFF
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
