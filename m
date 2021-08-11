Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0457FC4338F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 16:01:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45FBC6054F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 16:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45FBC6054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05E85400FC;
	Wed, 11 Aug 2021 16:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HoUADSoKCqOD; Wed, 11 Aug 2021 16:01:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A23B402EC;
	Wed, 11 Aug 2021 16:01:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 605D81BF358
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 16:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 507B46085F
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 16:01:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aXaorfvIcKjs for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 16:01:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A383607E9
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 16:01:25 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id e19so5282883ejs.9
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4UtwcPkzCxd+7VuoQuSuFctf+jc3B/c2HswQZ4K0RH8=;
 b=DfZPUiRC+H9o11V34xSjKdNewuqiorlJzlR+eZYk036XsYqP+HxI7/AqzAdrea7f4v
 SelAvB0QD+1SSnLp/CmYRETuDwi5FTwBMCpasogUia++vMt3coUOtVDncet078LyI3fh
 74v1RJVMFk6qf0fNhNL/LW+N1TjYq93GqxnveqpFlv4+Bui/R6RUQhtQXaUiUzz8fJVy
 LuaDq2th2pddohrz0vYurtzwEM+GYGRbSUwQQqfok/qGg/l4QXdLf0uHzeIGk9N1wcO4
 6lCoFX12lQ0Vr9uSY6sOHmvWbTK4ak7ZVV59EwazlRnqpxxTcN/DLz1XG73ToCmjUdKm
 1gWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4UtwcPkzCxd+7VuoQuSuFctf+jc3B/c2HswQZ4K0RH8=;
 b=kn7RDBI697l9ku1nE54cfaHy/pwUSO7qVN5th2yVyhnwRUDvpQO/urxOlltGHnlz6n
 QZqZ5WUPnCZm4oghXs+ZOHUqLblwfAfAGEUjWJTgmPcMVt+6gA0bQexygYe/+tL1Siry
 2m7sahptvGLB8gPVrtg/8FuQtOozV7sKKVu+G5u6FZV6Fv8bnCLVQJlmim63dwExBIDx
 3NAenYjp0+hacSkXMuvbe7xJvpgWMQyEhMGKhM5y5fsiXC/V4kYCgewyWzr0BXfadi/0
 5RjkGobGIP2W3z+fqUogfoKcg0DRfOfhPH4njuvkCfJ7MCxAKc15J2l5rQrq9A55IsdJ
 kzxg==
X-Gm-Message-State: AOAM533szqEl1ReC4QtSXW4yN7iOrCgxFg6CcWOHvUcImOowrpBuDfHa
 voyTQnDI23PvJAacTtDVKzcwWHUwHug5n31ELVE=
X-Google-Smtp-Source: ABdhPJw5mzcIrZRlUEduGjQmgAZj0UinedLx+D6LSlv1FqDpuc0tHE+3Nl4zrhge4KwPbz1OFY0bcg==
X-Received: by 2002:a17:907:2676:: with SMTP id
 ci22mr4475430ejc.442.1628697683355; 
 Wed, 11 Aug 2021 09:01:23 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-81imx1h9vbt9mvcxv55.18120a2.ip6.access.telenet.be.
 [2a02:1811:c06:d300:9c33:fd93:ee5a:23e9])
 by smtp.gmail.com with ESMTPSA id o24sm11295866edw.2.2021.08.11.09.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:01:22 -0700 (PDT)
From: Illia Bitkov <illia.bitkov@mind.be>
To: buildroot@buildroot.org
Date: Wed, 11 Aug 2021 18:00:55 +0200
Message-Id: <20210811160055.1156551-1-illia.bitkov@mind.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dbus-python: drop python2 dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Illia Bitkov <illia.bitkov@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Changes due to plans to depricate python2

Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
---
 package/dbus-python/Config.in      |  7 +++----
 package/dbus-python/dbus-python.mk | 16 ----------------
 2 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/package/dbus-python/Config.in b/package/dbus-python/Config.in
index 4bfb59ed91..ba77602058 100644
--- a/package/dbus-python/Config.in
+++ b/package/dbus-python/Config.in
@@ -3,16 +3,15 @@ config BR2_PACKAGE_DBUS_PYTHON
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_PACKAGE_DBUS
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_LIBGLIB2
 	# pyexpat: runtime dependency only
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_PYEXPAT
 	help
 	  Python bindings for D-Bus
 
 	  http://dbus.freedesktop.org/doc/dbus-python/
 
 comment "dbus-python needs a toolchain w/ wchar, threads"
-	depends on BR2_PACKAGE_DBUS && (BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
+	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_PYTHON3
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index f4b8996d76..9528e08d66 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -12,21 +12,6 @@ DBUS_PYTHON_LICENSE_FILES = COPYING dbus-gmain/COPYING
 DBUS_PYTHON_DEPENDENCIES = dbus libglib2
 HOST_DBUS_PYTHON_DEPENDENCIES = host-dbus host-libglib2
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-DBUS_PYTHON_DEPENDENCIES += python host-python
-
-DBUS_PYTHON_CONF_ENV += \
-	PYTHON=$(HOST_DIR)/bin/python2 \
-	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python2-config --includes`" \
-	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python2-config --ldflags`"
-
-HOST_DBUS_PYTHON_DEPENDENCIES += host-python
-
-HOST_DBUS_PYTHON_CONF_ENV += \
-	PYTHON=$(HOST_DIR)/bin/python2 \
-	PYTHON_INCLUDES="`$(HOST_DIR)/usr/bin/python2-config --includes`" \
-	PYTHON_LIBS="`$(HOST_DIR)/usr/bin/python2-config --ldflags`"
-else
 DBUS_PYTHON_DEPENDENCIES += python3 host-python3
 
 DBUS_PYTHON_CONF_ENV += \
@@ -42,7 +27,6 @@ HOST_DBUS_PYTHON_CONF_ENV += \
 	PYTHON_INCLUDES="`$(HOST_DIR)/usr/bin/python3-config --includes`" \
 	PYTHON_LIBS="`$(HOST_DIR)/usr/bin/python3-config --ldflags`" \
 	PYTHON_EXTRA_LIBS="`$(HOST_DIR)/usr/bin/python3-config --libs --embed`"
-endif
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
