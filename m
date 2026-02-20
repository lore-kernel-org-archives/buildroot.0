Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004F5C55ABF
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 11:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5DAA83E83;
	Fri, 20 Feb 2026 11:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5BQ3TD2lOXx; Fri, 20 Feb 2026 11:53:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4153E83E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771588407;
	bh=9ef23vlgFGSLsacN6qGQbBf5mh63liTvODttgmCTup8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=efAOdBMZMDZsmCqwuK+Xlr8lx2lXdxP5zzFOcsYbKhzETpgohdCvqUAVe6AmBJ9jX
	 5T+2gRzvCXSRqQ5dFc4aUUmBvyF6tpJlSbLRaWOEZE0vB8QMHOuxwOsTrc6vrLOKDo
	 7LAhRENqK+sNFOoKGCVqtxPkN3cYojNyvYVvoBAWlKEDvZlaYUqYX0NnXb+ZmpP7Nw
	 513BI/99j3kZwKFhiTNOEhDkKtQg/4w845YubLjyudAXeIQQlNoS533HdrSnY6wq0M
	 HCk37pKGn67iBqRs52W+Bg+lECFVNuWtAmfzCtEvUzxlYTmLSlvivgV4Yo1tArd0YM
	 GA+bu32ESBtYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4153E83E84;
	Fri, 20 Feb 2026 11:53:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27D56206
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19BE860650
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMek3SL8rUiT for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 11:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F38136082C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F38136082C
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F38136082C
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:20 +0000 (UTC)
X-CSE-ConnectionGUID: fVl0dFViQC2+Qv0RNEEQZQ==
X-CSE-MsgGUID: +6d0krP5SRKCTjCKkCHicA==
Received: from unknown (HELO opfedv1rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 20 Feb 2026 12:53:19 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 12:53:19 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Fri, 20 Feb 2026 12:53:17 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Feb 2026 12:53:17 +0100
X-CSE-ConnectionGUID: YngtaqQkS5+AejHTkPwJqg==
X-CSE-MsgGUID: CuvRM+T8QqG6jDRKdgNudQ==
X-IronPort-AV: E=Sophos;i="6.21,301,1763420400"; d="scan'208";a="396645765"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 20 Feb 2026 12:53:08 +0100
Message-ID: <9171da235ae8d1dfc9940ef833611c6538feb63f.1771588390.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1771588390.git.yann.morin@orange.com>
References: <cover.1771588390.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX507.corporate.adroot.infra.ftgroup
 (10.115.27.27) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771588401; x=1803124401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J2rGpFpFAvaRoH2+KP+/JFJ8aH1GtCOx0kMnR8fL13A=;
 b=iAt7p7pw+6vi7oG+WvHUd4RAR+CFK9O2dO0nuFP7D0ZhjHumGEA9z57T
 Fj3Hqvvu4QN6IXsMo7DHGSN7cGAexvL+RqSWAjAdTL52HgtHrwhH6yWJ/
 Yn/Hyk5r7Fu15kzyMJG1Wvj6P3/k/0DvHwIjnEj1spFfSTDwqinb6gNUO
 RXQYh/4fQJhh0XKeozJ+u+6YjWElhnT+AusQAo2FfYekPhKByl2xqRTSA
 pI8XEEqfxvBr+VBpuwvRpHIV1NmzUOOn7jy4sZf+/B8nXi7qnoMouHOPt
 /mD46S0/rNNAq9JyYrgN0xjdepXNvCJJ4i7MS+CM9riPtwjqixwJvtG/I
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=iAt7p7pw
Subject: [Buildroot] [PATCH 3/8] pakcage.mosquitto: add option to install
 CLI tools
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

mosquitto_sub/pub/rr can be handy to test a broker from the command
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
index e767d97bee..de952e9d77 100644
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
