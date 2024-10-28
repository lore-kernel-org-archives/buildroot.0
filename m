Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BD0D33998
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 16:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53442810DC;
	Mon, 28 Oct 2024 16:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vz9IvRbGpJOd; Mon, 28 Oct 2024 16:15:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A5A4810EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A5A4810EA;
	Mon, 28 Oct 2024 16:15:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45D21AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 16:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3370B409E0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 16:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_aU9mZ-Aerd for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 16:15:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 02BCB409EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02BCB409EF
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02BCB409EF
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 16:15:13 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-83b2a41b81cso59778139f.0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 09:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730132113; x=1730736913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1pumC1eYGJ0lQYx/ZZp48ZswuCGYObUZA5o5M2iE/Eg=;
 b=us/hpQPzu2I9vtJGcv6tHh2gf6MFmFi90yZT0enE9dwY6a53K3Q5jgJImJr1VU+5m+
 lEq1GARPG+/IoLQygtbhOKdomkz6VyNlR5O90QRa1maIMpwq+x4eaMPUb+KsKBDWYQhx
 Fjf+KsDsBlZbmiiqZjNALi5whpVrUf3lU4sYmCMCaAFK3yBKfSXMwnER85R8hx5zZQg4
 ajwLmCijBmFO51a9jeRNAmspej+u3mC0+Y6gcQHVMh0B6NjbeushL7949FvwOjqeIOgj
 Xgw43y1yxK5cKqNqB/ZPwffsscteoICm3NQOHhNWzt2u90RH1Ejt9esHK9RoCshQUffi
 2e+g==
X-Gm-Message-State: AOJu0YyX2zf+ohq52Y8nrG9eOt61saigduYJjNMl5yqNoKqNu0g7xzui
 B/LfDs+PERj4dysqjj1IA7ZYd9qAh9Aaksk6kuiYqqf0FkSxeK2hUrrilA==
X-Google-Smtp-Source: AGHT+IF9v/GbyVLx6EGVoDcT/A+W1M+Lj8UkL9fHu44LKIF9+xgPaKg8UDLzDyaa9jnFzwlZm+zADQ==
X-Received: by 2002:a05:6602:2b89:b0:835:3ec0:9 with SMTP id
 ca18e2360f4ac-83b1c62fad1mr883046839f.15.1730132112472; 
 Mon, 28 Oct 2024 09:15:12 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc72750c9dsm1769076173.101.2024.10.28.09.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 09:15:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>
Date: Mon, 28 Oct 2024 10:15:07 -0600
Message-Id: <20241028161507.186161-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028161507.186161-1-james.hilliard1@gmail.com>
References: <20241028161507.186161-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730132113; x=1730736913; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1pumC1eYGJ0lQYx/ZZp48ZswuCGYObUZA5o5M2iE/Eg=;
 b=cgnMzhH6kfjSqmtT8XVTvduVKSPpJOmpIeuudsf84RPu44zIg4swAlCZ7CvCR8m33z
 VAcMm7vV+6eH+6jcn3fylWduVoEWuIa4EQ1pkfr5Rx9jIwNGUxtO2Zk0g/2q5A4AqacO
 Wrb8KEQ5HjUyoz46Ytqx1yBy8jdDq2vb3GRH6DdmWriwz17/FiDQqJI+eDG4Q2vYXzjD
 qeyJ2HZuYoG8+HOhCgs86qHDbAjJsltW7e3U2OfdQne8S2inyH0UeP3Dq/C7Sy94QzMB
 oQGG4Axp5NF+4xFmx7QTqK6Xh9lK1SxpzrurzT8OEekVeGEbltvCEAJ4vxrGYtK8hF5S
 MAUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cgnMzhH6
Subject: [Buildroot] [PATCH v2 2/2] package/netbird: new package
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - remove package specific GOPROXY
  - update to 0.30.3
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/netbird/Config.in    | 10 ++++++++++
 package/netbird/netbird.hash |  3 +++
 package/netbird/netbird.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/netbird/Config.in
 create mode 100644 package/netbird/netbird.hash
 create mode 100644 package/netbird/netbird.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9743ae30d4..be40f986b7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1509,6 +1509,7 @@ F:	package/libucontext/
 F:	package/lilv/
 F:	package/lv2/
 F:	package/neon-2-sse/
+F:	package/netbird/
 F:	package/pipewire/
 F:	package/python*
 F:	package/rtl8192eu/
diff --git a/package/Config.in b/package/Config.in
index 57a95a6ea8..dcc1cc8268 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2550,6 +2550,7 @@ endif
 	source "package/ndisc6/Config.in"
 	source "package/net-tools/Config.in"
 	source "package/netatalk/Config.in"
+	source "package/netbird/Config.in"
 	source "package/netcalc/Config.in"
 	source "package/netcat/Config.in"
 	source "package/netcat-openbsd/Config.in"
diff --git a/package/netbird/Config.in b/package/netbird/Config.in
new file mode 100644
index 0000000000..b2e1eb6fd5
--- /dev/null
+++ b/package/netbird/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NETBIRD
+	bool "netbird"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  Connect your devices into a secure WireGuard-based
+	  overlay network with SSO, MFA and granular access
+	  controls.
+
+	  https://github.com/netbirdio/netbird
diff --git a/package/netbird/netbird.hash b/package/netbird/netbird.hash
new file mode 100644
index 0000000000..08ba5913a0
--- /dev/null
+++ b/package/netbird/netbird.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c736d7d3796eb7a5446ff0ccc562e4f79d8fa6f33e11047e4af9cb3202a4c7e3  netbird-0.30.3-go2.tar.gz
+sha256  c9f34c452ac8f054df592e3eeca0e271b91e8010c0fc6cf8c76aabf547a9388d  LICENSE
diff --git a/package/netbird/netbird.mk b/package/netbird/netbird.mk
new file mode 100644
index 0000000000..c7be6ef213
--- /dev/null
+++ b/package/netbird/netbird.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# netbird
+#
+################################################################################
+
+NETBIRD_VERSION = 0.30.3
+NETBIRD_SITE = $(call github,netbirdio,netbird,v$(NETBIRD_VERSION))
+NETBIRD_LICENSE = BSD-3-Clause
+NETBIRD_LICENSE_FILES = LICENSE
+NETBIRD_GOMOD = github.com/netbirdio/netbird
+NETBIRD_BUILD_TARGETS = client
+NETBIRD_LDFLAGS = \
+	-X github.com/netbirdio/netbird/version.version=$(NETBIRD_VERSION)
+
+define NETBIRD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/client $(TARGET_DIR)/usr/bin/netbird
+endef
+
+define NETBIRD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIREGUARD)
+endef
+
+$(eval $(golang-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
