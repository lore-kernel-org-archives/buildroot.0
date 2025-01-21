Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAC7C02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 15:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4935980FF8;
	Tue, 21 Jan 2025 15:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1fa6wC3zz8F; Tue, 21 Jan 2025 15:21:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61CE784D8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61CE784D8B;
	Tue, 21 Jan 2025 15:21:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57497959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 250A680FF8
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GWQfpa77Uk2 for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 15:21:11 +0000 (UTC)
X-Greylist: delayed 86534 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 21 Jan 2025 15:21:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C8EE84D8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C8EE84D8C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:41d0:8:894f::;
 helo=mail.arturia.com; envelope-from=victor.krawiec@arturia.com;
 receiver=<UNKNOWN> 
Received: from mail.arturia.com (mail.arturia.com [IPv6:2001:41d0:8:894f::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C8EE84D8C
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:21:09 +0000 (UTC)
Received: from vkrawiec.home (226.142.197.77.rev.sfr.net [77.197.142.226])
 (Authenticated sender: victor.krawiec@arturia.com)
 by mail.arturia.com (Postfix) with ESMTPSA id 95FD247C036E;
 Tue, 21 Jan 2025 16:21:06 +0100 (CET)
From: vkrawiec <victor.krawiec@arturia.com>
To: buildroot@buildroot.org
Cc: vkrawiec <victor.krawiec@arturia.com>
Date: Tue, 21 Jan 2025 16:20:31 +0100
Message-ID: <20250121152031.61571-1-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=arturia.com; s=privdkim; t=1737472866;
 bh=GlzFBxfBtSVbkEL+x7EiyR50QBKftFNSfyjG7x2IcMg=;
 h=From:To:Cc:Subject:Date:From;
 b=axmUkxN5bUipA8hYsnJb9Yx4YlIi/v+cxmRHvHcqaGqxJ2y6Wq4j9WaoHFdolbK+8
 vPEcUpnC34xOqBumhJ1QFD/Gvyg/0pAHqLV+JWWsr6kzEhk7CAKULYlymVQUkKWK3+
 dO48uOEqQ3ItWOkJmV/XhrIpS4LdGJFkKnxPfXRe27B0oUy+CIhsOT2Ixr1HUc9ADg
 eOHxtKdV2HxHJ58uchYguPeq1sM0KhCJXb7T5DSmPArI6QWbRYsMJWhIU0vBfyd7cv
 teoeLXtqLOOaM4LN14knlNMK/HZ0Ubm5YRtILEsPDaMFGW0HHMhoh8KDUFpa08ZJ34
 0JwP6YdDRlJUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arturia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=arturia.com header.i=@arturia.com header.a=rsa-sha256
 header.s=privdkim header.b=axmUkxN5
Subject: [Buildroot] [PATCH 1/1] package/mold: add new package host-mold
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

mold is a faster drop-in replacement for existing Unix linkers using highly parallelized algorithms
mold aims to enhance developer productivity by minimizing build time, particularly in rapid debug-edit-rebuild cycles
mold linker can be used with GCC since version 12 using argument -fuse-ld=mold

Signed-off-by: vkrawiec <victor.krawiec@arturia.com>
---
 package/Config.in.host      |  1 +
 package/mold/Config.in.host | 11 +++++++++++
 package/mold/mold.hash      |  3 +++
 package/mold/mold.mk        | 21 +++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/mold/Config.in.host
 create mode 100644 package/mold/mold.hash
 create mode 100644 package/mold/mold.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index e06824ad6b..c2487419c1 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -68,6 +68,7 @@ menu "Host utilities"
 	source "package/minisign/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/moby-buildkit/Config.in.host"
+	source "package/mold/Config.in.host"
 	source "package/mosquitto/Config.in.host"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
diff --git a/package/mold/Config.in.host b/package/mold/Config.in.host
new file mode 100644
index 0000000000..2dea168de0
--- /dev/null
+++ b/package/mold/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_MOLD
+	bool "host mold"
+	depends on BR2_HOST_GCC_AT_LEAST_11
+	help
+	  mold is a faster drop-in replacement for existing Unix linkers
+	  mold aims to enhance developer productivity by minimizing build time, particularly in rapid debug-edit-rebuild cycles.
+
+	  https://github.com/rui314/mold
+
+comment "host mold needs host gcc >= 11"
+	depends on !BR2_HOST_GCC_AT_LEAST_11
diff --git a/package/mold/mold.hash b/package/mold/mold.hash
new file mode 100644
index 0000000000..69fe32d297
--- /dev/null
+++ b/package/mold/mold.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  3f57fe75535500ecce7a80fa1ba33675830b7d7deb1e5ee9a737e2bc43cdb1c7  mold-2.36.0.tar.gz
+sha256  c98a2858469bd3b231c8865c5b65f80f6ffbf25e850d5d575967e3d9ee080755  LICENSE
diff --git a/package/mold/mold.mk b/package/mold/mold.mk
new file mode 100644
index 0000000000..2d47b0b4d2
--- /dev/null
+++ b/package/mold/mold.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# mold
+#
+################################################################################
+
+MOLD_VERSION = 2.36.0
+MOLD_SITE = $(call github,rui314,mold,v$(MOLD_VERSION))
+MOLD_LICENSE = MIT
+MOLD_LICENSE_FILES = LICENSE
+
+# GCC looks for tools in a different path from mold default installation path
+define HOST_MOLD_CREATE_SYMLINKS
+	mkdir -p $(HOST_DIR)/$(GNU_TARGET_NAME)/bin
+	ln -sfr $(HOST_DIR)/bin/mold $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/mold
+	ln -sfr $(HOST_DIR)/bin/mold $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.mold
+endef
+
+HOST_MOLD_POST_INSTALL_HOOKS += HOST_MOLD_CREATE_SYMLINKS
+
+$(eval $(host-cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
