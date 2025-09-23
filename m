Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D423BCAC5B0
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 10:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DD2560D79;
	Tue, 23 Sep 2025 10:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ev56ymwvybv; Tue, 23 Sep 2025 10:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9341860D68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9341860D68;
	Tue, 23 Sep 2025 10:26:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E7A1498
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 10:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04EA540BE1
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 10:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7D7Nu4Da-qjZ for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 10:26:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 438E740B92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 438E740B92
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 438E740B92
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 10:26:49 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b07d4d24d09so912914666b.2
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 03:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758623207; x=1759228007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0tSLBw3C8RQlVbVDxp5Wlk2jDs/tybgYHd8nI6Qd8Z0=;
 b=Z0ixhOR6MsSafmMUccK+yO0dmAwhfHUA8DbeSX69Hw7aVlGKNTyQaqxXgSIQIWpfNM
 CGCdIZ8kNwYS+WgTeu4lcKFqs8tBFAbGkMFKAk+3XfsVsrZ/enotGBfqllYEbn4ALFtH
 gd2BwWELZLxkYwktaESdEvb/PlVgUFt5bbzdduFBJc/V4P1zW+ecEWLyvYS8kpMRvVwl
 7BzrgPHRSQfjAHuN17tw4FMfdmElEO0IpGlMek219VFPlTvBbBKGBXsfmxOFJzWY8WSw
 W46YfCv/iy5m0IlKcHwRsi8f9hX2RP+My9vzu94VWzylrjdB/l5kV3bhiZIkuyJBc64T
 OuWg==
X-Gm-Message-State: AOJu0YwF87Fbf2nryZI7sZXlaarx+KmvnTVmgxONOGJjlxjVM5iRyP5M
 /xi0O92J62wykOHDWd5z4lyobXvrSeHLqmZF2WMGcyhrtORGWxYpvuzLAnNR
X-Gm-Gg: ASbGnctkzozAzVxmIJsD+6IrgSNWAADlvlLHpTsxBBGAMBRe8X7oxl50NpINdHazIPB
 aht3QjUfOD1uUKBVAO53j11e3lbZF1NE/9zaCYFAScYsHF1IEk6xS2aZbILRdg8w62FhkHirQO3
 lPFSjv7e1eBmuDJo1mi6x2JFpHKzS4UupEjFRAQBQ0L1wCyLIFlvvQ0QqjxSnhSYLvHvD71ekpn
 TsLV8Z9FZchfttwNKVN4fQCshKuRFj0MLWo/W1tTw6zVVjGfIoqEdGEGoalmQj3CvHt4BESyHya
 Sro1vG0MTJT982tMa/HaKqG989sGfXxGe4GIABfl7b9b75sTMQf8nCfEC6B1TsJdfi+RwYhttgU
 lLwKjtlyKM8wQG1th9nxrfCYhFQQ=
X-Google-Smtp-Source: AGHT+IEMvySp5ByIQLoNGFepyzNSt9iVfI5aKxN5qI+vHys+inqJ7yhPzms/WW1y4KFSkdGM8lb1JQ==
X-Received: by 2002:a17:907:3f21:b0:b09:2331:f14d with SMTP id
 a640c23a62f3a-b302dc63619mr165163066b.64.1758623206755; 
 Tue, 23 Sep 2025 03:26:46 -0700 (PDT)
Received: from devhost1 ([2a02:a319:a1e0:eb00:f133:8e97:2009:ce5d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b27d7eeafc7sm839576566b.86.2025.09.23.03.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 03:26:46 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org,
	thomas.petazzoni@bootlin.com
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 23 Sep 2025 12:26:42 +0200
Message-ID: <20250923102642.304379-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250728131926.848832-1-shirokovalexs@gmail.com>
References: <20250728131926.848832-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758623207; x=1759228007; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0tSLBw3C8RQlVbVDxp5Wlk2jDs/tybgYHd8nI6Qd8Z0=;
 b=BAVgOEfCyB1JvjEIwmTDaYvkfA2cP9NxiT4fQM4WzYA77z/3zu2/LJAMDa1r9k0q6n
 47F2p1zsYW6W0JUfz/rxKn4w9SFcBle6MapjdDtuJ9yAShLVDCPcewCf5Ij5WSGsphDb
 WZT3VyyqSABdkcFaNRLMHgHRJHAVSb/cZ5fr2N96vV5Vryu1vPELKPxM5F+X2aO3E51w
 gcVg0XrM1/XwkCvnAcNJFfNpZbi/1rL5uxdCoIfWeBXj+Pt7PNLV4HcaEfGUgcab4iHX
 Z9mju70+wH9CPY+koSQnW1OlJ159zqYGGELww4Hpn6WCU7WyQQZNhcBH7nlZyFgDcLj3
 T4kA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BAVgOEfC
Subject: [Buildroot] [v4,1/1] package/zellij: new package
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

An advanced terminal multiplexer with batteries included. Supports
layouts, floating and stacked panes, plugins, and customization.
Provides rich functionality out of the box.

Zellij is aimed at developers, operations-oriented users, and anyone who
loves the terminal.

https://github.com/zellij-org/zellij

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
Changes v4->v3:
-  Bump version to 0.43.1

Changes v3->v2:
-  Changes have been squashed.

Changes v1->v2:
- Fixed format of Config.in file. Added comments.
- Fixed ZELLIJ_VERSION.'v' symbol is removed from the variable.
- Updated DEVELOPERS list.
---

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/zellij/Config.in   | 17 +++++++++++++++++
 package/zellij/zellij.hash |  3 +++
 package/zellij/zellij.mk   | 12 ++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/zellij/Config.in
 create mode 100644 package/zellij/zellij.hash
 create mode 100644 package/zellij/zellij.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4c6ff40886..e0c5ebe20b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -93,6 +93,7 @@ F:	package/cpp-httplib/
 
 N:	Alexander Shirokov <shirokovalexs@gmail.com>
 F:	package/nnn/
+F:	package/zellij/
 
 N:	Alessandro Partesotti <a.partesotti@gmail.com>
 F:	package/oatpp/
diff --git a/package/Config.in b/package/Config.in
index 85928509f8..37b2fd34c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2816,6 +2816,7 @@ comment "Utilities"
 	source "package/xmlstarlet/Config.in"
 	source "package/xxhash/Config.in"
 	source "package/ytree/Config.in"
+	source "package/zellij/Config.in"
 	source "package/zoxide/Config.in"
 endmenu
 
diff --git a/package/zellij/Config.in b/package/zellij/Config.in
new file mode 100644
index 0000000000..64b158cfe3
--- /dev/null
+++ b/package/zellij/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_ZELLIJ
+	bool "zellij"
+	# Zellij uses the cranelift crate which has architecure
+	# dependencies. Specify them explicitly. See details here:
+	# https://docs.rs/cranelift-codegen/0.122.0/cranelift_codegen/
+	depends on BR2_x86_64 || BR2_x86_i686 || BR2_aarch64
+	depends on BR2_PACKAGE_HOST_RUSTC
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	help
+	  An advanced terminal multiplexer with batteries included.
+	  Supports layouts, floating and stacked panes, plugins, and
+	  customization. Provides rich functionality out of the box.
+
+	  Zellij is aimed at developers, operations-oriented users,
+	  and anyone who loves the terminal.
+
+	  https://github.com/zellij-org/zellij
diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
new file mode 100644
index 0000000000..6a8c5a5857
--- /dev/null
+++ b/package/zellij/zellij.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  248cb15f4853079dbc02962f2d41db8e1108c5b7b369bbf6feb484d8b1a5be5d  zellij-0.43.1-cargo4.tar.gz
+sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
new file mode 100644
index 0000000000..d345c34d4c
--- /dev/null
+++ b/package/zellij/zellij.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# zellij
+#
+################################################################################
+
+ZELLIJ_VERSION = 0.43.1
+ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
+ZELLIJ_LICENSE = MIT
+ZELLIJ_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
