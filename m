Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AE6C2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 09:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5951D83104;
	Wed, 26 Jan 2022 09:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3goHf4AuWmBE; Wed, 26 Jan 2022 09:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E9AB819CC;
	Wed, 26 Jan 2022 09:05:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDD8D1BF580
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 09:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB5CF819CC
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 09:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xzn1gT58iHo0 for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 09:05:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay01.ispgateway.de (smtprelay01.ispgateway.de
 [80.67.18.13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DFA48198A
 for <buildroot@busybox.net>; Wed, 26 Jan 2022 09:05:04 +0000 (UTC)
Received: from [91.21.118.156] (helo=exchange.go-sys.de)
 by smtprelay01.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>) id 1nCeEk-0003mE-2G
 for buildroot@busybox.net; Wed, 26 Jan 2022 10:05:06 +0100
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2375.18; Wed, 26
 Jan 2022 10:04:59 +0100
Received: from go-sys.de (192.168.1.113) by exchange.go-sys.de (192.168.1.17)
 with Microsoft SMTP Server id 15.1.2375.18 via Frontend Transport;
 Wed, 26 Jan 2022 10:04:59 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Wed, 26 Jan 2022 10:04:57 +0100
Message-ID: <20220126090457.32015-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 77b28032-c882-4527-ad15-de6c89cb71cd
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH 1/1] package/network-manager: add optional nmcli
 support
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
Cc: Michael Fischer <mf@go-sys.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When NetworkManager is built without the READLINE package the nmcli was not build.

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/network-manager/Config.in          | 7 ++++++-
 package/network-manager/network-manager.mk | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index a48cb37b15..1a123a26e2 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -37,6 +37,12 @@ config BR2_PACKAGE_NETWORK_MANAGER_TUI
 	help
 	  This option enables terminal based UI
 
+config BR2_PACKAGE_NETWORK_MANAGER_CLI
+        bool "nmcli support"
+        select BR2_PACKAGE_READLINE
+        help
+          This option enables support for NetworkManager Command Line Interface
+
 config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
 	bool "modem-manager support"
 	select BR2_PACKAGE_MODEM_MANAGER
@@ -54,7 +60,6 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 	select BR2_PACKAGE_JANSSON
 	help
 	  This option enables support for OpenVSwitch
-
 endif
 
 comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 4.6, dynamic library, wchar, threads, gcc >= 4.9"
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 974320fce0..1eb9233b44 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -135,7 +135,7 @@ else
 NETWORK_MANAGER_CONF_OPTS += --disable-polkit
 endif
 
-ifeq ($(BR2_PACKAGE_READLINE),y)
+ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_CLI),y)
 NETWORK_MANAGER_DEPENDENCIES += readline
 NETWORK_MANAGER_CONF_OPTS += --with-nmcli
 else
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
