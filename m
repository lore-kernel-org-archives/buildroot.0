Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD1DD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 11:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6961280C0F;
	Sun, 28 Dec 2025 11:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QldkYqGj4ddz; Sun, 28 Dec 2025 11:35:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EB5480C47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766921701;
	bh=S9Jcypq6ApnppEIir/yUA6w1YD+I5Kea47zIvzCZ+gE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ll4DWovn7q02Us+wROLY86kXQQZWe4sQYAbL4F77PAj6gv3I6CSO/6IpbculygXom
	 A8rWf9qR5iof5FWmKhRQFO/dTGX13quKgLNn9YZFj7ej/PKHm+p9LUX1kwr5wFP09d
	 kB8hRpsjfQwTCdFC75EDtDB+4DmOZkZ/q/6rGHnXij8BfV/p6THdcakg3giocONxOd
	 J/wYVW33khar5HR6xmBE42bcwfp75y/cSKoTKtIIZT9dEw07+oTGamx5Z1tEcGcRqT
	 raUnWKs87M0Tz7s7fJDW80zVF2e2rCzJQ28PJIciGtGGh2YxMcsBb+cc5PecaYvLLH
	 DhbQiYuSCgkTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EB5480C47;
	Sun, 28 Dec 2025 11:35:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BCE561E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 11:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF35F404ED
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 11:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqX09M6yLbya for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 11:35:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A8B5404A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A8B5404A9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A8B5404A9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 11:34:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EF76CA4C03A4;
 Sun, 28 Dec 2025 12:34:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49590)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZp31-000000006wb-1YEa;
 Sun, 28 Dec 2025 11:34:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>
Date: Sun, 28 Dec 2025 12:34:55 +0100
Message-ID: <20251228113455.3051809-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766921696;
 bh=j82skDzuVFHv00o8T6NDrBkBlmPvUcqN7nNjE/1Q3K4=;
 h=From:To:Cc:Subject:Date:From;
 b=qWNtUk7JlbFwJiysbfdU9N1iQHV4+LNUGQ0VjueLD48lEwtNJzOpwr1BQLpXqPbEq
 3RvdzDNzivzIG/e3FTE+EcyX4XQ90EeFsPGUyQXO887i3Gk501tK9Z/aVfWf4UzcBv
 nyvGd+c31tjlxhuXGEqWPRjMcQcIuXUUZM1teWXCJOxyNX2C0vKzLY3LlLuDhPtdS+
 RTP+itxyRG/WgVkPsx4yiFsdk5RwFEyBCC23xmY5QwkBCd2POLhOBWqvn41JNx6l5d
 kP1KuNmU/vI/2vAqLOc2c4/DxR266LVXGZ5+CjrONdiT5JdAOHXAZU16rzxBzcG2en
 pVfyKYwngsRQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=qWNtUk7J
Subject: [Buildroot] [PATCH v2 1/1] package/odhcp6c: bump version
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

Due to upstream commit
https://git.openwrt.org/?p=project/odhcp6c.git;a=commitdiff;h=adc651ffed55d4b538317e50da1a7ec143dbfd1d
libubox is a mandatory dependency.

Fixes:
https://autobuild.buildroot.net/results/22d/22da3760982b80d5ccba1bef1ca9c90e9b2292d8/
(cmake 4 build error which does not exist in a maintained stable branch)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: switched libubox to a mandatory dependency (Julien)

 package/odhcp6c/Config.in    |  8 ++++++++
 package/odhcp6c/odhcp6c.hash |  2 +-
 package/odhcp6c/odhcp6c.mk   | 10 ++--------
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/odhcp6c/Config.in b/package/odhcp6c/Config.in
index ca3a2f6424..83b38755c3 100644
--- a/package/odhcp6c/Config.in
+++ b/package/odhcp6c/Config.in
@@ -1,8 +1,16 @@
 config BR2_PACKAGE_ODHCP6C
 	bool "odhcp6c"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # libubox
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libubox -> json-c
+	select BR2_PACKAGE_LIBUBOX
 	help
 	  odhcp6c is a minimal DHCPv6 and RA-client for use in
 	  embedded Linux systems, especially routers.
 
 	  https://git.openwrt.org/project/odhcp6c.git
+
+comment "odhcp6c needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
index f1641d7101..86c9c659c4 100644
--- a/package/odhcp6c/odhcp6c.hash
+++ b/package/odhcp6c/odhcp6c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c5cadd71a72e94df6b664d3e9f0b1eeffa779ba9624ab35b6a93c7172fe378a0  odhcp6c-53f07e90b7f1da6977143a488dd5cb73a33b233b-git4.tar.gz
+sha256  e9cfddfcc12c4ca0bf8d8211bb72c7018c0e0f8da6903d680da122b4ce551c56  odhcp6c-f19dd37fb467c9cf10cad57aefa0d048312d7dfd-git4.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
index dd3a9d3e28..92688b7237 100644
--- a/package/odhcp6c/odhcp6c.mk
+++ b/package/odhcp6c/odhcp6c.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-ODHCP6C_VERSION = 53f07e90b7f1da6977143a488dd5cb73a33b233b
+ODHCP6C_VERSION = f19dd37fb467c9cf10cad57aefa0d048312d7dfd
 ODHCP6C_SITE = https://git.openwrt.org/project/odhcp6c.git
 ODHCP6C_SITE_METHOD = git
 ODHCP6C_LICENSE = GPL-2.0
 ODHCP6C_LICENSE_FILES = COPYING
+ODHCP6C_DEPENDENCIES = libubox
 
 define ODHCP6C_INSTALL_SCRIPT
 	$(INSTALL) -m 0755 -D $(@D)/odhcp6c-example-script.sh \
@@ -17,11 +18,4 @@ endef
 
 ODHCP6C_POST_INSTALL_TARGET_HOOKS += ODHCP6C_INSTALL_SCRIPT
 
-ifeq ($(BR2_PACKAGE_LIBUBOX),y)
-ODHCP6C_CONF_OPTS += -DUSE_LIBUBOX=1
-ODHCP6C_DEPENDENCIES += libubox
-else
-ODHCP6C_CONF_OPTS += -DUSE_LIBUBOX=0
-endif
-
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
