Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAABC3DA49
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 03:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D26C660E93;
	Fri, 19 Jul 2024 03:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrUNKp1oEIo6; Fri, 19 Jul 2024 03:05:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63E52608E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63E52608E4;
	Fri, 19 Jul 2024 03:05:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C8401BF33E
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68E5340279
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTw7dY9eOWMf for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 03:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1856C4027B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1856C4027B
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1856C4027B
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 03:05:45 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-383dfcd8cdfso5515465ab.1
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721358345; x=1721963145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KEOiqLs3K9AZyupEISLhMQ/+U5Xy3DL+AW+RdeOeHQI=;
 b=uVrFJqirCUlj+ngYFomLWd9JQjo/gVYwduDiSsrvTdLdK9WlIk7fVgF+mPVBO96gxO
 nd2S2Xa415IVwsBwtYYjfF5ULRWgGIWFXSpFyISG+fBrdL6j8GL3yoganOGG/v/PODkm
 1nWAJuEAUwIHvBTcFVDzplr704xVTekUI/umS/85cnqJSeMiCLrh+GeRN/uOcudtJqgp
 YzW5y3xwN4LpvQ0E9Tmn6MQgRcpErrZ61v8z7dyoYuS0uBB4leQdqgdCvMTI3SPpiUIq
 aRK0XYqLSplgK7cgXEIoAyYy/Dv71dtmgZvLdRuIn7Xap6qiFuXT7DvjgMAHX/983RBQ
 ubZQ==
X-Gm-Message-State: AOJu0YxNH6gxJJkKCo3tdUnQapBKC8HGrD5hQBhb/SuLN5zoFvcKgl6D
 V/B2zDwKxY+jjvpMLK2Q1ru+Dw8VEeMIRgXZwaeNSEb3PQ7TssaCgg5nXA==
X-Google-Smtp-Source: AGHT+IGbr37oyNM/YhkIn5KubO0aV/mO3sAJ6CIRuw0yJeIoTHoIDGEI4wQSn4zooQ/yJN/EALFpZw==
X-Received: by 2002:a05:6e02:1d10:b0:376:1fae:4635 with SMTP id
 e9e14a558f8ab-39556e590a8mr93851675ab.24.1721358344747; 
 Thu, 18 Jul 2024 20:05:44 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-397f565f1cbsm1548645ab.29.2024.07.18.20.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 20:05:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 21:05:37 -0600
Message-Id: <20240719030537.3156999-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719030537.3156999-1-james.hilliard1@gmail.com>
References: <20240719030537.3156999-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721358345; x=1721963145; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEOiqLs3K9AZyupEISLhMQ/+U5Xy3DL+AW+RdeOeHQI=;
 b=fzcfR5OuI4qPPzgpj2Bybo6boCHYDbYCtDF0ZcGjegjwXcO+dPZYhcBxoG/wEjwD1l
 govokLiXOhCQjsKzH+1ZEoD0hgfQMlvhL6xaV7aZtVF8KeRMuj8i+/KbkgoeSCMtFWkt
 X6naAIwktr2jbH23h/Zj7M5bNtn8Ks+7GGfNnE6cGX9uoZ5OEIfexecdXpaXKzXZrPo+
 i5CwkfphNRJJ3aESvXk5UF2DGgLPLTp8zGk7ORlADbvFw/OvIi0zYg8Wv/jTTpyhU9yp
 vXi1dnpeqeLiY0u2oDND41L/LNzWQ9ZhuJM1VH+sVIdXxNT/i+z5oajHMYte818pdHHZ
 HZ/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fzcfR5Ou
Subject: [Buildroot] [PATCH 2/2] package/tailscale: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                |  1 +
 package/tailscale/Config.in      |  8 ++++++++
 package/tailscale/tailscale.hash |  3 +++
 package/tailscale/tailscale.mk   | 19 +++++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/tailscale/Config.in
 create mode 100644 package/tailscale/tailscale.hash
 create mode 100644 package/tailscale/tailscale.mk

diff --git a/package/Config.in b/package/Config.in
index f2e10b2b5e..35927bbd94 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2613,6 +2613,7 @@ endif
 	source "package/stunnel/Config.in"
 	source "package/suricata/Config.in"
 	source "package/system-config-printer/Config.in"
+	source "package/tailscale/Config.in"
 	source "package/tcpdump/Config.in"
 	source "package/tcping/Config.in"
 	source "package/tcpreplay/Config.in"
diff --git a/package/tailscale/Config.in b/package/tailscale/Config.in
new file mode 100644
index 0000000000..c81a7134ee
--- /dev/null
+++ b/package/tailscale/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TAILSCALE
+	bool "tailscale"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  The easiest, most secure way to use WireGuard and 2FA.
+
+	  https://github.com/tailscale/tailscale
diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
new file mode 100644
index 0000000000..882ff9d5d0
--- /dev/null
+++ b/package/tailscale/tailscale.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  a961aa07a3b0927cd647d6ae69fc212afbbdb0e4c47b8aeb181cb64360b7f143  tailscale-1.70.0-go2.tar.gz
+sha256  d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
new file mode 100644
index 0000000000..49907278ef
--- /dev/null
+++ b/package/tailscale/tailscale.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# tailscale
+#
+################################################################################
+
+TAILSCALE_VERSION = 1.70.0
+TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
+TAILSCALE_LICENSE = BSD-3-Clause
+TAILSCALE_LICENSE_FILES = LICENSE
+TAILSCALE_GOMOD = tailscale.com
+TAILSCALE_BUILD_TARGETS = cmd/tailscale cmd/tailscaled
+TAILSCALE_INSTALL_BINS = tailscale tailscaled
+TAILSCALE_DL_GOPROXY = https://proxy.golang.org
+TAILSCALE_LDFLAGS = \
+	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
+	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
+
+$(eval $(golang-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
