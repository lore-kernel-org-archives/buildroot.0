Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C267C43217
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 14:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0136E815AB;
	Mon, 28 Nov 2022 14:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0136E815AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b-uV-pgYi-LW; Mon, 28 Nov 2022 14:34:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3842F812C1;
	Mon, 28 Nov 2022 14:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3842F812C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 525D41BF33D
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 14:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A77A41775
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 14:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A77A41775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LmRIPLU1e6ZT for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 14:34:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0CC1416C7
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0CC1416C7
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 14:34:11 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 74FB65C3D2E;
 Mon, 28 Nov 2022 15:34:08 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 15:33:57 +0100
Message-Id: <330af443072a1a0716c5890eb87216a6bfbe99e7.1669645942.git.stefan@agner.ch>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1669646048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=YHgg1509R/vyrVc2Q8UdnZFrwSuArMYvHC9/U2GFtjg=;
 b=K3mDR9HTZnWJwS7TWU79GFuhyFE42ZJqJqT5oBNuky3vGlyi/jPIp4sAzfNwCeuVrX1DF6
 W1BzbKj8KmUoc4lU1SmOqrU2xIvHLQmUeq9c9YwTmzP6R+fcWq/xyCMNpwvp3n2zYrLQxn
 aOjQzIPYQQCcH1CzAVDirsN6k16Vs/w=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=K3mDR9HT
Subject: [Buildroot] [PATCH] package/iptables: add option to use iptables
 with nf_tables backend
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
Cc: Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a configuration option to let the iptables and ip6tables symlinks
point to the nf_tables variant.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/iptables/Config.in   | 5 +++++
 package/iptables/iptables.mk | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/iptables/Config.in b/package/iptables/Config.in
index e6b12603e0..ec7fbb7eea 100644
--- a/package/iptables/Config.in
+++ b/package/iptables/Config.in
@@ -24,6 +24,11 @@ config BR2_PACKAGE_IPTABLES_NFTABLES
 	help
 	  Build nftables compat utilities.
 
+config BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT
+	bool "nftables compat as default"
+	help
+	  Use nftables compat utilities by default for iptables/ip6tables.
+
 comment "nftables compat needs a toolchain w/ wchar, dynamic library, headers >= 3.12"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index a6143677d1..b53ae928af 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -49,6 +49,15 @@ else
 IPTABLES_CONF_OPTS += --disable-bpf-compiler --disable-nfsynproxy
 endif
 
+ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT),y)
+define IPTABLES_INSTALL_SYMLINK
+	ln -fs xtables-nft-multi $(TARGET_DIR)/usr/sbin/iptables
+	ln -fs xtables-nft-multi $(TARGET_DIR)/usr/sbin/ip6tables
+endef
+
+IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_INSTALL_SYMLINK
+endif
+
 define IPTABLES_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
