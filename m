Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0624C83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 13:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF06D40DA9;
	Mon, 28 Jul 2025 13:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmp-v2LSPcXP; Mon, 28 Jul 2025 13:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD3BC40C8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD3BC40C8C;
	Mon, 28 Jul 2025 13:20:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10EB91BE
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C81C560784
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khwyixaTcKYB for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 13:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A1059606C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1059606C7
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1059606C7
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:20:01 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-615378b42ecso2061758a12.0
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 06:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753708799; x=1754313599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NEICtPFkgv/lJGEN9dQ5nholUcMq5yAVGwWzSxDasfE=;
 b=qXi0zcH6UGmyFwiW9gQTrzxrzPnIEEo8vwWW37CYPMrNCU+lx2Xj7FfGZWUhVOw7HJ
 6LDkR7xWYEnUmQnd0ZqqdNcN8urLhI6SukoJQZduFoqp50YtLWtwoi4S7fxzRtaRWMLI
 JPUNosBLU9+zLRKmQhk/6OSmL+o4mD79eCA+zsHEnpyVW+tDTvwMCaxjWwAXQOxlJmZ5
 /qA8XZW+3wdi2zsAShI8/EW79G10s3kc9SeQuY9fqlDgSrrE/PeJEy8pUg4B697W3KHp
 IVOx688v2mcdSm8i36FMWQjppCh5bts9XUGedMhdF4XXUfC1VH6VPgr8GycKB3YeGSih
 cybw==
X-Gm-Message-State: AOJu0YyNUC4qdr1f4GJi8+q5WUhvB2h6kwP65f2+6YNzrkuHDCJTCBA6
 ChA1eIjvmAK4X0W3KjS0BBare3Qwj7qBPkPSOi7IngYf2aueHT/8fVKxIhR5
X-Gm-Gg: ASbGnctXWGut2hBdGRzuMWzapAjYNibCpFfIkwvNRTS+/dEC1m/ZOh6z0Dpao3UBEwC
 REVEiGT3VF57eVjOymwtukC9i5jkeOEw9gnodxfYmdV3nEfhh3IMZ+HHqVEchsUBVCrG1YMHrRk
 gVKcma5K3UXxpfBSwaSYpt59OJKJDDJ7VWoHQ9iIuNJhKObMNjkUhshLSq/rSISmmepQ4Xs8GY4
 S4a3JwnNkRdY/sArRls4hhtuyUGbsVHaUc00lZVZ5g45hEltpydsilUB/kyJYYesylMmgrgkIyB
 xXq/YpM10802hSPyigrDOR4e+i6BLJFrsozE/qZki6qfICb7SECOKLS4bstalEJwG3u3iOt0f1J
 TbHbYl4JUihku1Lo186DWac0HDx0vyy4BHhaU
X-Google-Smtp-Source: AGHT+IF+Qu0BR0oSM/HgQiRq+UTtH2C9xVrViYbzeUjSEakfHgUP2XhJCwg8XVMcoGrszI7Ah2Q/pw==
X-Received: by 2002:a05:6402:524d:b0:612:d8b3:a9e7 with SMTP id
 4fb4d7f45d1cf-614f1bbc851mr9992903a12.5.1753708799101; 
 Mon, 28 Jul 2025 06:19:59 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6153a041a4esm1428591a12.28.2025.07.28.06.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 06:19:58 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Mon, 28 Jul 2025 15:19:26 +0200
Message-ID: <20250728131926.848832-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753708799; x=1754313599; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NEICtPFkgv/lJGEN9dQ5nholUcMq5yAVGwWzSxDasfE=;
 b=SE+Bhno/GhWGt76vCA3Lbn8yXsulCgETYboykzM2hWEICtELKCMwEG+LCTQAhZTRDl
 TwuqHVpqDruPVZxj69w7Z7gtkNAWWA+K/IA28SKOXdmWeSCACdd+uoguNUlEVw6jVr+s
 CK3dLqGvCoV84EZFSIvyAeQC0A/jXjqE0z0qf9i7orR9WU5x6riZDAMque/QqEwBiQ25
 cDFUVF2km/VDI/P4EZ3b6CvPRMe7mjYsiAU/GewoDEV0hUTTdm3ggfc4M4Bjocf8y9eG
 9K/GEuLRSAdonH2dyKRgoDvcnLDfmPoAzn1oZg5ZwiZRmStXQM+LihkQbxc3uWjQ8xZw
 KQNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SE+Bhno/
Subject: [Buildroot] [v1,1/1] package/zellij: new package
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
 package/Config.in          |  1 +
 package/zellij/Config.in   | 15 +++++++++++++++
 package/zellij/zellij.hash |  3 +++
 package/zellij/zellij.mk   | 12 ++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/zellij/Config.in
 create mode 100644 package/zellij/zellij.hash
 create mode 100644 package/zellij/zellij.mk

diff --git a/package/Config.in b/package/Config.in
index 137f74ed82..3699f1d1d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2832,6 +2832,7 @@ comment "Utilities"
 	source "package/xmlstarlet/Config.in"
 	source "package/xxhash/Config.in"
 	source "package/ytree/Config.in"
+	source "package/zellij/Config.in"
 	source "package/zoxide/Config.in"
 endmenu
 
diff --git a/package/zellij/Config.in b/package/zellij/Config.in
new file mode 100644
index 0000000000..24383511ce
--- /dev/null
+++ b/package/zellij/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_ZELLIJ
+	bool "zellij"
+	depends on BR2_x86_64 || BR2_x86_i686 || BR2_aarch64
+	depends on BR2_PACKAGE_HOST_RUSTC
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	help
+
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
index 0000000000..e2ce86a7cf
--- /dev/null
+++ b/package/zellij/zellij.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  cd32cd0790fb133dc6d5e5b6f707ff57d63827188e0256ec0438a0ea9b5dd852  zellij-v0.42.2-cargo4.tar.gz
+sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
new file mode 100644
index 0000000000..b015991aab
--- /dev/null
+++ b/package/zellij/zellij.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# zellij
+#
+################################################################################
+
+ZELLIJ_VERSION = v0.42.2
+ZELLIJ_SITE = $(call github,zellij-org,zellij,$(ZELLIJ_VERSION))
+ZELLIJ_LICENSE = MIT
+ZELLIJ_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
