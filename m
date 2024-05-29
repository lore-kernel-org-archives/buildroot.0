Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20631C25B7C
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 07:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3438408F3;
	Wed, 29 May 2024 07:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNgZ17WQYtWp; Wed, 29 May 2024 07:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72191408FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72191408FA;
	Wed, 29 May 2024 07:45:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52E631D32A9
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 07:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F4CB812EE
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 07:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTwK8H2kg4qD for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 07:45:40 +0000 (UTC)
X-Greylist: delayed 600 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 29 May 2024 07:45:39 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8A85812EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A85812EC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::42aa;
 helo=smtp-42aa.mail.infomaniak.ch;
 envelope-from=slaveze@smartandconnective.com; receiver=<UNKNOWN> 
Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::42aa])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8A85812EC
 for <buildroot@buildroot.org>; Wed, 29 May 2024 07:45:39 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Vq1Gt2v8zzZQT;
 Wed, 29 May 2024 09:29:26 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4Vq1Gs66fTzMB4; Wed, 29 May 2024 09:29:25 +0200 (CEST)
From: Sebastien Laveze <slaveze@smartandconnective.com>
To: buildroot@buildroot.org
Date: Wed, 29 May 2024 09:29:10 +0200
Message-Id: <20240529072911.288748-1-slaveze@smartandconnective.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartandconnective.com; s=20191114; t=1716967766;
 bh=t+3sUKXnZqLrl1Z+NlLgL+gmrdL9ajh7oFFAK3tYbjI=;
 h=From:To:Cc:Subject:Date:From;
 b=V/CfOQNfUatLrgxatf8YYDgWB6DSYgSufTUgaiiv4zh9h2AYHpgHY2Lqam9mTEgeA
 9RwChiJncrQASHq3iF5K0lAxMa9oRAsDVeCvNReMEk6rfRvUhlKrtCZe3Qyz1mYAHR
 4h5VVx2XA+5Q0E6TZ95om/1aWU9dAb+zZBy72QF4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=smartandconnective.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smartandconnective.com header.i=@smartandconnective.com
 header.a=rsa-sha256 header.s=20191114 header.b=V/CfOQNf
Subject: [Buildroot] [PATCH] package/mosquitto: add target mosquitto_passwd
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Sebastien Laveze <slaveze@smartandconnective.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The mosquitto_passwd utility is useful on target if user accounts need
to be created runtime.

Signed-off-by: Sebastien Laveze <slaveze@smartandconnective.com>
---
 package/mosquitto/Config.in    | 7 +++++++
 package/mosquitto/mosquitto.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 8bedf2ad21..fe722108da 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -29,6 +29,13 @@ config BR2_PACKAGE_MOSQUITTO_BROKER
 	help
 	  Build and install the mosquitto broker onto target.
 
+config BR2_PACKAGE_MOSQUITTO_PASSWORD
+	bool "install the target mosquitto password utility"
+	default n
+	depends on BR2_PACKAGE_MOSQUITTO
+	help
+	  Build and install the target mosquitto password utility.
+
 comment "mosquitto broker needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index b847e56fec..9226d3d7f1 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -94,6 +94,10 @@ ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER),y)
 MOSQUITTO_MAKE_DIRS += src
 endif
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_PASSWORD),y)
+MOSQUITTO_MAKE_DIRS += apps/mosquitto_passwd
+endif
+
 define MOSQUITTO_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DIRS="$(MOSQUITTO_MAKE_DIRS)" \
 		$(MOSQUITTO_MAKE_OPTS)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
