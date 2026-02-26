Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD76FD8FCE
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7DD461649;
	Thu, 26 Feb 2026 15:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CvPjdOtofKmR; Thu, 26 Feb 2026 15:54:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E72A0612EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772121257;
	bh=rHBYtKxsd97YLeQycjn/HyM6NpY7qNsxDqfswz4HWHA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XX6nnLfwFBS+wqBebONFO8xGE1PH8eGJf27LwMY3vK/rfah3gYaMCc8d70bxWrDQ6
	 cVZk7P/kAoCzhIid1vRe9qALVKoUc02R0LkU5/svt+nYQSTeYfPAfv2HyzhZRFijLl
	 VLnermG6sXbNX6Q9QCDBCA+NJMzlX+5MCeeifHT14y5TR75IiSF1vHsfcCjCXi4F7Z
	 /oIMzJeKzWUyRxaEZs0M5eezPAiPV0N2X1uIucgpuhM+a2PvsuDVr9ZRsr0DUGttxV
	 o2FeGGcmspJUDrQyOKOTRslNF0IV49pFzXCV6gdsuT9m7h/aZRE+Y+smZt1eCjGZ93
	 H3mxjYNM4+9MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E72A0612EE;
	Thu, 26 Feb 2026 15:54:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FF6224E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EBEA847BA
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTKOMr1te-21 for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:54:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 94D1484789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94D1484789
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94D1484789
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:12 +0000 (UTC)
X-CSE-ConnectionGUID: 3JtfVZ4LQmGiy4yM+0iN5A==
X-CSE-MsgGUID: Vzhd7uFERpeEC+qB/ACn9w==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 26 Feb 2026 16:54:12 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 16:54:11 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Thu, 26 Feb 2026 16:54:10 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 26 Feb 2026 16:54:09 +0100
X-CSE-ConnectionGUID: o0DgY5KDQ2ee4NbKNgCsAg==
X-CSE-MsgGUID: MNZHtFMKQ0Wsb2j85zNmwQ==
X-IronPort-AV: E=Sophos;i="6.21,202,1763420400"; d="scan'208";a="400664516"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 26 Feb 2026 16:53:57 +0100
Message-ID: <9358af7bbd86a0230c3443993977b665cbf3a5b5.1772121240.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1772121240.git.yann.morin@orange.com>
References: <cover.1772121240.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX504.corporate.adroot.infra.ftgroup
 (10.115.26.28) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1772121253; x=1803657253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5vcwMQ2QOlJ1K+ZxMUuCaUlgoZuh/tHyuYdiFVJLyms=;
 b=qhyrY33T1Wgxpbyf2Qc2o/WzxEq0mE8d1b8nhdz916fqSHhVi5LylvFa
 sa8Q1rv08rgU5VX8BQIjyI+NPlk2ywDEYF1OR9JA5EPdgombVRHjRdUQp
 o03rrufUrgBz1B+7w42vbw0eZCusvy8VQXWoXWXlAJEL4G1kW61QcixxS
 JvtLm+XUmsAwqN8i/mK6/c8+9PyGgX/EpJbvhh+WF4/FrQixbNUzd54I5
 PUKTDRvCzAFCtcqAIX+A1LC94TCHUSex7VDYN9NFMQwvTVKcikhltCeS9
 Q2OMBBC36vLNSnbXE6rlYl1aK59nxuAl24wbFAfstxQXuCZZJANmqff3z
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=qhyrY33T
Subject: [Buildroot] [PATCH 03/11 v3] pakcage.mosquitto: add option to
 install CLI tools
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

mosquitto_pub/sub/rr can be handy to test a broker from the command
line, but they can get superfluous when only the broker is required
on the target.

Add an option to enable or disable them. Make that new option enabled
by default to keep backward compatibility with previous (def)config
files.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mosquitto/Config.in    | 9 +++++++++
 package/mosquitto/mosquitto.mk | 7 ++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 2667b60f57..d0f096e5cf 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -24,6 +24,15 @@ config BR2_PACKAGE_MOSQUITTO
 
 if BR2_PACKAGE_MOSQUITTO
 
+config BR2_PACKAGE_MOSQUITTO_CLIENTS
+	bool "install clients"
+	default y  # Backward compatibility
+	help
+	  Install CLI tools to publish/subscribe to the broker:
+	    mosquitto_pub
+	    mosquitto_sub
+	    mosquitto_rr
+
 config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
 	default y
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 6e9ad434ba..62934966ca 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -19,7 +19,6 @@ MOSQUITTO_CONF_OPTS = \
 	-DWITH_TESTS=OFF \
 	-DWITH_STATIC_LIBRARIES=OFF \
 	-DWITH_BUNDLED_DEPS=ON \
-	-DWITH_CLIENTS=ON \
 	-DWITH_HTTP_API=OFF \
 	-DWITH_CTRL_SHELL=OFF
 
@@ -70,6 +69,12 @@ else
 MOSQUITTO_CONF_OPTS += -DWITH_LIB_CPP=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_CLIENTS),y)
+MOSQUITTO_CONF_OPTS += -DWITH_CLIENTS=ON
+else
+MOSQUITTO_CONF_OPTS += -DWITH_CLIENTS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER),y)
 
 MOSQUITTO_CONF_OPTS += \
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
