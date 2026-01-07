Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9A5D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2156B40FEC;
	Wed,  7 Jan 2026 18:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90QLD0NQkGqY; Wed,  7 Jan 2026 18:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E71240FFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809200;
	bh=xvXVGvOCLB71dy7OfrGiE/O5d/akPAYSUBfU9l/b3g0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bHqUyVrtxP2hiCFF15lyarBW0FA4El/G9muaHYHDiFTnJ066fl1xiBpsRaxz9ymDB
	 NeX3jKSjs26UjRxXCbGxBygXMa2ro16tm6OzvPk3Z4+miJuRi7X4Z1H1yaSFk4lJcw
	 m9BujmaLw/dPJ52tTjVZeEh8d4HfaXBgRl9i7BnpBMm0bN8alxqC6ZG2jU490FSJNR
	 RH24HNvWch+7SL4QZ2cOci4uL7mMuoZyapNRmUsjBB3O05BXEoUEQQ85lrqXQuVVGF
	 e+nWlf2dlasGP03bNC7Kz26Uf59feQAFddPfoe/XUuGD1FHZdYAHOsCoHFigzT+0rs
	 nzdzlXWWwepDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E71240FFC;
	Wed,  7 Jan 2026 18:06:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A4D39ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C77840389
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPzS473mm2cc for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:06:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D54740160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D54740160
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D54740160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:06:38 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:1db5:e71:2517:bbf7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4583813F8B5;
 Wed,  7 Jan 2026 19:06:34 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed,  7 Jan 2026 19:06:30 +0100
Message-ID: <20260107180630.2471280-2-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107180630.2471280-1-vjardin@free.fr>
References: <20260107180630.2471280-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767809196;
 bh=hgTflhJLqpU3crUNrF3VOrkRYe1ICjiJCQ4Gc1Lqj/c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d2mZiY8U6w6+sFycSVbpspBl0FIPTTZYdeV4/zE4z/+msaC7YwYb5E9siIptyxT6k
 5xdDLwvJe5uavQL/4OR0Riey8XdenQbQAnlVsHnVNN7Y0SBXPqjSKb5T60sDAvruoJ
 nUKhyDpNrlH0O/BALO3kPyG38I3auIywYCE68TqlhN26RZ99xxk2fopCfOxmCcpc+9
 2W1rAmrOw7rGPWWU4qm++KAmH2aWhJuUOnZzG63Cd6tSpNuuYMDz3RmV/zUlXrN2S8
 PEfRWkOBY0PHlH2JAk8kiFglGbHro7Lm3IBKkFA/g/Xh+PL6vf7pC3TKA9cnISjWT9
 J9c6QpMxsX9pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d2mZiY8U
Subject: [Buildroot] [PATCH v1 1/1] package/rpmsg-echo-test: new package
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linux userspace RPMsg echo_test demo from the OpenAMP system
reference examples. This application uses the Linux kernel RPMsg
framework to send buffers to a remote processor and verify the
echoed data.

Requires kernel headers >= 4.11 for linux/rpmsg.h.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/rpmsg-echo-test/Config.in            | 17 ++++++++++
 package/rpmsg-echo-test/rpmsg-echo-test.hash |  3 ++
 package/rpmsg-echo-test/rpmsg-echo-test.mk   | 35 ++++++++++++++++++++
 5 files changed, 57 insertions(+)
 create mode 100644 package/rpmsg-echo-test/Config.in
 create mode 100644 package/rpmsg-echo-test/rpmsg-echo-test.hash
 create mode 100644 package/rpmsg-echo-test/rpmsg-echo-test.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f982e3123a..5d968ce917 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3359,6 +3359,7 @@ F:	package/bfscripts/
 F:	package/dpdk/
 F:	package/libecoli/
 F:	package/libyang-cpp/
+F:	package/rpmsg-echo-test/
 F:	package/sysrepo-cpp/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index def3db0e50..a7b8ee68ee 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -589,6 +589,7 @@ endmenu
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
 	source "package/rockchip-rkbin/Config.in"
+	source "package/rpmsg-echo-test/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
 	source "package/rtl8188eu/Config.in"
diff --git a/package/rpmsg-echo-test/Config.in b/package/rpmsg-echo-test/Config.in
new file mode 100644
index 0000000000..32f3d37156
--- /dev/null
+++ b/package/rpmsg-echo-test/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_RPMSG_ECHO_TEST
+	bool "rpmsg-echo-test"
+	depends on BR2_USE_MMU # Linux userspace only
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 # linux/rpmsg.h
+	help
+	  Linux userspace RPMsg echo_test demo from the OpenAMP
+	  system reference examples.
+
+	  This application uses the Linux kernel RPMsg framework
+	  to send buffers to a remote processor and verify the
+	  echoed data (see "echo_test" demo in the OpenAMP docs).
+
+	  https://github.com/OpenAMP/openamp-system-reference
+
+comment "rpmsg-echo-test needs a toolchain w/ kernel headers >= 4.11"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
diff --git a/package/rpmsg-echo-test/rpmsg-echo-test.hash b/package/rpmsg-echo-test/rpmsg-echo-test.hash
new file mode 100644
index 0000000000..41f8ca4bf8
--- /dev/null
+++ b/package/rpmsg-echo-test/rpmsg-echo-test.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  8059fbde74f726efd778f1393e75f5b554871ea8a9f51278912838ea414031ca  rpmsg-echo-test-v2025.04.0.tar.gz
+sha256  62345788a019596360c7f4e4026278cc84754de6beafac82ea0de0647b23c6ed  LICENSE.md
diff --git a/package/rpmsg-echo-test/rpmsg-echo-test.mk b/package/rpmsg-echo-test/rpmsg-echo-test.mk
new file mode 100644
index 0000000000..3f98aea7c4
--- /dev/null
+++ b/package/rpmsg-echo-test/rpmsg-echo-test.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# rpmsg-echo-test
+#
+################################################################################
+
+RPMSG_ECHO_TEST_VERSION = v2025.04.0
+RPMSG_ECHO_TEST_SITE = $(call github,OpenAMP,openamp-system-reference,$(RPMSG_ECHO_TEST_VERSION))
+RPMSG_ECHO_TEST_SUBDIR = examples/linux/rpmsg-echo-test
+
+RPMSG_ECHO_TEST_LICENSE = BSD-3-Clause
+RPMSG_ECHO_TEST_LICENSE_FILES = LICENSE.md
+
+define RPMSG_ECHO_TEST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(RPMSG_ECHO_TEST_SUBDIR) \
+		CC="$(TARGET_CC)" \
+		LD="$(TARGET_LD)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)"
+endef
+
+define RPMSG_ECHO_TEST_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 \
+		$(@D)/$(RPMSG_ECHO_TEST_SUBDIR)/echo_test \
+		$(TARGET_DIR)/usr/bin/echo_test
+endef
+
+define RPMSG_ECHO_TEST_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_RPMSG)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_RPMSG_CHAR)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_RPMSG_CTRL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_RPMSG_VIRTIO)
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
