Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AB0C43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 21:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B026B61006;
	Mon, 20 Jun 2022 21:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B026B61006
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GQ_qMJKdfEhu; Mon, 20 Jun 2022 21:42:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B19CB61004;
	Mon, 20 Jun 2022 21:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B19CB61004
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74F841BF9B9
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47031401DF
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47031401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jSemKIW-_Pn5 for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 21:41:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44BC4402C3
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44BC4402C3
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 21:41:06 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id lw20so1260196ejb.4
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 14:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8BVeG0ueQIXE7Zr4UEp8B6x5rCjjLXx/M6UNyLMD1Ws=;
 b=iV0aVhKqOPz5xiWOlnSOaYEUckpYf5qbGdwY8iNsFdfBlUjQEM6P9OSceKb1DKW0xY
 G3P+gxz7Lrhr5QoQVRqmGlDTF1e1vQrB7j5mfthTGBXECR4sBQMSbpeJVbDFgCQ7QkrR
 jtWN3k/qfoRE2B64QxAI0y1SjTE9tL8AJnzJsMGnroXa8FQTlDGR4h+2+6AQxG58bHmq
 4GdbbbUhUTGa++N+5eeF8E6cs1qevsNG/MLCHExzCIy/Zl6s6EcnqxlbM8bTcmL0rJvN
 gZtcTuoD8QA25rCwOztLLdJAFzRjjx/SeR2sDGXnYLyHsC/dfLiXGncm0o028jeSricv
 dfXQ==
X-Gm-Message-State: AJIora8Ep8OahnXC94u20bBYxiIIuR7V5vQQXaLxgY+Rocy7Yq+sZgna
 Dd/BBFMqdhWVxBhaenTyHxdH1oRPOpC3Kw==
X-Google-Smtp-Source: AGRyM1tOsvWCC4K07NMev3PAkxyub1jlRdpHLWzujKdO3+D79b97hYCA/83e0fniG+DPjO5NX5omEQ==
X-Received: by 2002:a17:906:7489:b0:722:dce1:f5d with SMTP id
 e9-20020a170906748900b00722dce10f5dmr2001838ejl.329.1655761264522; 
 Mon, 20 Jun 2022 14:41:04 -0700 (PDT)
Received: from localhost.localdomain (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 q11-20020a056402518b00b004307c8e1c3fsm11696111edd.34.2022.06.20.14.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 14:41:04 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 23:40:58 +0200
Message-Id: <20220620214058.1435436-5-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620214058.1435436-1-angelo@amarulasolutions.com>
References: <20220620214058.1435436-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8BVeG0ueQIXE7Zr4UEp8B6x5rCjjLXx/M6UNyLMD1Ws=;
 b=c/YJXNkKsss6TDVlD+MoBNpB84UIQu63aBeHIN3rZoCDT7GAuvJzNk0f6Kiq+iY3Vv
 Ev8SkcqG29PvpX4/hQdFlTBOq0c9uQkzkQZgvM1CLQrWyV1E+a/hXcw17xxBz53QgaAI
 d/DQhJ+V6JXEWH+ou6QkiQ9aCz+wHSU6Q2YMA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=c/YJXNkK
Subject: [Buildroot] [PATCH 4/4] package/busybox: add service to load kernel
 modules at boot
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In cases where no hotplug is available (by choice or by the lack of a
proper hotplug method for a device), this service can be used to load
kernel module drivers by reading the /etc/modules file.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/busybox/S02modules | 56 ++++++++++++++++++++++++++++++++++++++
 package/busybox/busybox.mk |  2 ++
 2 files changed, 58 insertions(+)
 create mode 100644 package/busybox/S02modules

diff --git a/package/busybox/S02modules b/package/busybox/S02modules
new file mode 100644
index 0000000000..f25712e1ca
--- /dev/null
+++ b/package/busybox/S02modules
@@ -0,0 +1,56 @@
+#!/bin/sh
+
+MODULES="modules"
+
+load_unload() {
+	[ ! -f /etc/${MODULES} ] && echo ' OK' && exit 0
+
+	while read module args; do
+
+		case "$module" in
+			""|"#"*) continue ;;
+		esac
+
+		if [ "$1" = "load" ]; then
+			modprobe -q ${module} ${args} >/dev/null && \
+				printf ' %s success,' "$module" ||
+				printf ' %s failed,' "$module"
+		else
+			rmmod ${module} >/dev/null
+		fi
+
+	done < /etc/${MODULES}
+}
+
+start() {
+	printf 'Starting %s:' "$MODULES"
+
+	load_unload load
+
+	echo ' OK'
+}
+
+stop() {
+	printf 'Stopping %s: ' "$MODULES"
+
+	load_unload unload
+
+	echo 'OK'
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 3e49de0a84..40490e866a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -382,6 +382,8 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
 	$(BUSYBOX_INSTALL_ZCIP_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
+	$(INSTALL) -m 0755 -D package/busybox/S02modules \
+			$(TARGET_DIR)/etc/init.d/S02modules;
 endef
 
 # Install the sysvinit scripts, for the moment, but not those that already
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
