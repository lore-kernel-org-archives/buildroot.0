Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F4AC4829C
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 22:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CB35815AB;
	Sat, 10 Feb 2024 22:27:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVQ8Ovb20oad; Sat, 10 Feb 2024 22:27:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31826815CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31826815CC;
	Sat, 10 Feb 2024 22:27:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D26951BF290
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 22:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCB886060A
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 22:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hujUGI2gi80w for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 22:27:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF44660609
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF44660609
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF44660609
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 22:27:16 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A7A5A13F88D;
 Sat, 10 Feb 2024 23:27:11 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Feb 2024 23:26:59 +0100
Message-ID: <20240210222659.805747-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707604034;
 bh=noiIXswziizqsOZ2F6oU6XavbRikuQSok6BSyVRJVU4=;
 h=From:To:Cc:Subject:Date:From;
 b=Ypg1EssRPl8wNZU80deDcBW4bMLjlPOvZV4xlJXNYxlPA2qcxeAJpL3lyvLH562ni
 Q3eunTiiCCbCIZ7Tfq9CtddCXNOyhvgEXQOXLSlpcuw2mJjU9o8Se854ZvQyK7CD4h
 qNsM1xx5ora/2X4P5qZSQqz2NzqxKAy9HEpnohKBwFRCQ+c0oDV1IfEum8sbMISSpP
 T3e+viQ3Q/ttWSMMzB+9Ymdb1htt+sBfDQNwUrq+fIhinXbathEahHg16qZQ+syMeS
 U0gaE02PodOTMA2xBEhKl03TsaGlbd069katxBoFjm88JCtIGCSu3MbAXhp5heJ8k2
 aDHbvFfKgW5Vw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ypg1EssR
Subject: [Buildroot] [PATCH 1/1] package/jailhouse: install files to /usr
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
Cc: Julien Olivain <ju.o@free.fr>, Carlo Caione <carlo.caione@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The jailhouse package installs files in the /usr/local prefix. This is
not convenient, because the jailhouse binary ends up in /usr/local/sbin,
which is not in the default Buildroot PATH. See [1]. Moreover, all
other Buildroot packages install files in /usr.

This is because the Buildroot package recipe does not set any prefix
value, and the upstream Jailhouse Makefile has a default to /usr/local.
See [2].

This commit sets the prefix value in the JAILHOUSE_MAKE_OPTS and also
updates other installation commands to put all the files in /usr.

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/2023.11.1/system/Config.in#L495
[2] https://github.com/siemens/jailhouse/blob/v0.12/scripts/include.mk#L22

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jailhouse/jailhouse.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index c239e75e76..e7de40cf8c 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -15,7 +15,8 @@ JAILHOUSE_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	ARCH="$(KERNEL_ARCH)" \
 	KDIR="$(LINUX_DIR)" \
-	DESTDIR="$(TARGET_DIR)"
+	DESTDIR="$(TARGET_DIR)" \
+	prefix=/usr
 
 ifeq ($(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS),y)
 JAILHOUSE_DEPENDENCIES += \
@@ -60,8 +61,8 @@ define JAILHOUSE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/jailhouse
 	$(INSTALL) -D -m 0644 $(@D)/configs/*/*.cell $(TARGET_DIR)/etc/jailhouse
 
-	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/local/libexec/jailhouse/demos
-	$(INSTALL) -D -m 0755 $(@D)/inmates/demos/*/*.bin $(TARGET_DIR)/usr/local/libexec/jailhouse/demos
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/libexec/jailhouse/demos
+	$(INSTALL) -D -m 0755 $(@D)/inmates/demos/*/*.bin $(TARGET_DIR)/usr/libexec/jailhouse/demos
 
 	$(JAILHOUSE_INSTALL_HELPER_SCRIPTS)
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
