Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532AEC7EE33
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 11:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B088740940;
	Thu, 26 Jun 2025 11:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1CU9NZTDKei; Thu, 26 Jun 2025 11:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5F6A4184A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5F6A4184A;
	Thu, 26 Jun 2025 11:25:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6096154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C382D40099
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_Dl65lJ6w2k for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 11:25:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::8fa8;
 helo=smtp-8fa8.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D88D7413CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D88D7413CD
Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::8fa8])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D88D7413CD
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:25:35 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bSbp36B2KzTqD;
 Thu, 26 Jun 2025 13:20:27 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4bSbp32wmgzZ1r; Thu, 26 Jun 2025 13:20:27 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Thu, 26 Jun 2025 13:20:19 +0200
MIME-Version: 1.0
Message-Id: <20250626-strongswan-misc-martin-v1-2-a4c4da74ba9c@cherry.de>
References: <20250626-strongswan-misc-martin-v1-0-a4c4da74ba9c@cherry.de>
In-Reply-To: <20250626-strongswan-misc-martin-v1-0-a4c4da74ba9c@cherry.de>
To: buildroot@buildroot.org
Cc: Martin Elshuber <martin.elshuber@cherry.de>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 2/3] package/strongswan: allow non-root
 user/group to own IKE charon daemon
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

Strongswan allows[1] to run the IKE charon daemon as non-root (defaults
to running as root) user/group, so let's allow that.

[1] https://docs.strongswan.org/docs/latest/install/reducedPrivileges.html#_running_strongswan_as_non_root
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/strongswan/Config.in     |  5 +++++
 package/strongswan/strongswan.mk | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index feaf7142137d7853e62819b18ab2afaadc4d34de..047b460be82e16e23d4b858ff294dfcbc18414cd 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -204,6 +204,11 @@ config BR2_PACKAGE_STRONGSWAN_SQL
 config BR2_PACKAGE_STRONGSWAN_BYPASS_LAN
 	bool "Enable BYPASS-LAN plugin"
 
+config BR2_PACKAGE_STRONGSWAN_NONROOT
+	bool "Run as non-root"
+	help
+	  This allows running the IKE charon daemon as the non-root
+	  user/group charon/charon.
 endif
 
 config BR2_PACKAGE_STRONGSWAN_PKI
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 072d8681d40925b94786f4a31450ff75d8faa015..0ee26df43d66acf48efc683388952cd7819b1476 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -66,6 +66,16 @@ ifeq ($(BR2_PACKAGE_STRONGSWAN_DROP_CAPS),y)
 STRONGSWAN_CONF_OPTS += --with-capabilities=libcap
 endif
 
+ifeq ($(BR2_PACKAGE_STRONGSWAN_NONROOT),y)
+STRONGSWAN_CONF_OPTS += \
+	--with-user=charon \
+	--with-group=charon
+
+define STRONGSWAN_USERS
+	charon -1 charon -1 * - - -
+endef
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 STRONGSWAN_CONF_ENV += LIBS='-latomic'
 endif

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
