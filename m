Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC4ACD5BCB
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 15:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45F1F60A67;
	Thu,  5 Sep 2024 15:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bg3L78B65--5; Thu,  5 Sep 2024 15:45:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50D2660A71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50D2660A71;
	Thu,  5 Sep 2024 15:45:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B42611BF3D4
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 15:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE1534067D
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 15:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dP7-ILET8Zwx for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 15:45:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.193.142;
 helo=mail0.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 882A040679
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 882A040679
Received: from mail0.insia.net (mail0.insia.net [163.172.193.142])
 by smtp4.osuosl.org (Postfix) with ESMTP id 882A040679
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 15:45:37 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail0.insia.net (Postfix) with ESMTP id 9E6DA1FBA8;
 Thu,  5 Sep 2024 17:45:31 +0200 (CEST)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id 354055F497;
 Thu,  5 Sep 2024 17:42:00 +0200 (CEST)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Thu,  5 Sep 2024 17:45:11 +0200
Message-Id: <20240905154511.1319010-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail0; t=1725551131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=D7rt25BnKZgQlwUFix2RrIw/B3N+XapOwfOITuiT8Nw=;
 b=pjzKTop28mf+HJctZp4iMqfzUE1MKjL+fzlNb8BaVUIXkfRj+mPRopi/pQ2b8pu7FKeNaW
 6gM1qhulOaqX4KMJQAzFZLqdpscWFWLz24dWWOLB9JGdlXbM4XyKa2v4ImyZgRVb+NcgK/
 wCFRo7/Y6b9j8L1x6qHY9556kal3VKkmoYBO4lFsyuGDlASP/XqQIxmjrpteT/4TRkHL9K
 UJBn1KR5qYJvtJPJdQQHVVQULWFN04/QBAodWhnXudliPYdHtJiGz3S7KkT0KWogaj+w4l
 DSDLvI0zrBESuIVLRGUJf5esSjBYAySZAqpEFvOPywnMRx+QvjdJENZOpbJeKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail0 header.b=pjzKTop2
Subject: [Buildroot] [PATCH 4/4] package/alsa-plugins: add support for
 pulseaudio
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

build package with pulseaudio support only if package is selected in menuconfig

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
---
 package/alsa-plugins/alsa-plugins.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
index 25ecc589fc..deeca838b1 100644
--- a/package/alsa-plugins/alsa-plugins.mk
+++ b/package/alsa-plugins/alsa-plugins.mk
@@ -14,12 +14,18 @@ ALSA_PLUGINS_DEPENDENCIES = host-pkgconf alsa-lib
 ALSA_PLUGINS_CONF_OPTS = \
 	--disable-jack \
 	--disable-usbstream \
-	--disable-pulseaudio \
 	--disable-libav \
 	--disable-maemo-plugin \
 	--disable-maemo-resource-manager \
 	--with-speex=no
 
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+ALSA_PLUGINS_DEPENDENCIES += pulseaudio
+ALSA_PLUGINS_CONF_OPTS += --enable-pulseaudio
+else
+ALSA_PLUGINS_CONF_OPTS += --disable-pulseaudio
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_UTILS),y)
 ALSA_PLUGINS_DEPENDENCIES += alsa-utils
 endif
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
