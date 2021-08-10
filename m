Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BD6C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 06:46:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AC5161052
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 06:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AC5161052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1853401AD;
	Tue, 10 Aug 2021 06:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ADIZ0aRL6pnF; Tue, 10 Aug 2021 06:46:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3904A403AC;
	Tue, 10 Aug 2021 06:46:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EA511BF30D
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 06:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78E4640261
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 06:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lsCxUrGdVpf3 for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 06:45:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AB6C4025C
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 06:45:52 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id u10so27497936oiw.4
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 23:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PxuS0ksrVlYVPS7QMXDBZ0mb1Bin0oVP+1OxPGY5w5Q=;
 b=jyAjdRZS5LKyVCH9rRBBcKMzjB1JQ5belAWYzx2DNREycNRPT6Ev3x7ZAajb17SLY5
 QcpSeLX8vkENH+TE5LjbjdQwt2OLUkuVqqnrMx33h52LVqQbniS1jjBhTXzSPNdgshUH
 gPA0VFh/t9NyTad2OQibm4LowsvcEdOQMkC0tv68UgCr00NXEEUFvceG3jVzoHyI99Ov
 yAQeM8N3nCK4+TPQyl8zMB34u1XDddxTp80TKhhL6Y16nnQS/TXYswCYqtRvC3xmpM9+
 pH+dxpWH1mwlNq5GuZzSORW1S1MA8K0/AjowEWz054r9RUunkCwbyNZbG1iRSeE3S8Zp
 CdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PxuS0ksrVlYVPS7QMXDBZ0mb1Bin0oVP+1OxPGY5w5Q=;
 b=dsWCcQn4ZzFH5/vl9WT3EgkJMbKwiMXQH3kStticXugkCmCDpnTkNjO+U81ht65Jdn
 6GDyAVnwlXh7acLkVOrb9vxln5rI5aULgvrgViy9xjSHsWaPO1hXxd9zSg40Hyb6Dg3n
 7Ztrcl6ZJdDx5MhiYLu7B7E8oft91qCcnkjTeyj+TKHIYXOW2deBCGaBnR3RMSxEa0TT
 3oq/96x4c5H6m9B3fxmQ1dAJMnzvLBwxDj2R+SpeCkUzt9Qu7GXQZtB+TCoWUaAa0Adi
 W+vmXAvg7/H+k1Zv0UUNPLf7V/JCoCh9tZZDaR1ji9FDCHdGivR1bViBGvvRBam4jE+D
 QzuA==
X-Gm-Message-State: AOAM533TRB9z7WAbxSJ06rc9uF9rSbrcsvOkTajbzy1CMLZhIsY1Wo2p
 i8wGlmUotjHE9fVMnxTqjWUwDWwu59k=
X-Google-Smtp-Source: ABdhPJwIm1KfrBVN/dutXNN765J/baAR9TiclMtJcScJKWstnTkMiUfj8Hx5Ee0plSiXhc8KN91UiA==
X-Received: by 2002:a05:6808:610:: with SMTP id
 y16mr7235042oih.100.1628577950981; 
 Mon, 09 Aug 2021 23:45:50 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id i8sm3461677otk.51.2021.08.09.23.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 23:45:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 00:45:47 -0600
Message-Id: <20210810064547.2579380-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210810064547.2579380-1-james.hilliard1@gmail.com>
References: <20210810064547.2579380-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/linux-tools: add host-bpftool
 support
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This will be required for building systemd with bpf support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in.host                       |  1 +
 package/linux-tools/Config.in.host           | 11 +++++++++++
 package/linux-tools/linux-tool-bpftool.mk.in | 20 ++++++++++++++++++++
 package/linux-tools/linux-tools.mk           | 17 +++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 package/linux-tools/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 8d443ea255..98cc67b238 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -45,6 +45,7 @@ menu "Host utilities"
 	source "package/jsmin/Config.in.host"
 	source "package/kmod/Config.in.host"
 	source "package/libp11/Config.in.host"
+	source "package/linux-tools/Config.in.host"
 	source "package/lld/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
diff --git a/package/linux-tools/Config.in.host b/package/linux-tools/Config.in.host
new file mode 100644
index 0000000000..b228f9b02d
--- /dev/null
+++ b/package/linux-tools/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_LINUX_TOOLS
+	bool
+
+config BR2_PACKAGE_HOST_LINUX_TOOLS_BPFTOOL
+	bool "host bpftool"
+	select BR2_PACKAGE_HOST_LINUX_TOOLS
+	help
+	  bpftool is a tool for for inspection and simple manipulation
+	  of eBPF programs and maps.
+
+	  These tools are available only from kernel version 4.15.
diff --git a/package/linux-tools/linux-tool-bpftool.mk.in b/package/linux-tools/linux-tool-bpftool.mk.in
index 0c4d3693a3..c5e6fb97db 100644
--- a/package/linux-tools/linux-tool-bpftool.mk.in
+++ b/package/linux-tools/linux-tool-bpftool.mk.in
@@ -5,6 +5,7 @@
 ################################################################################
 
 LINUX_TOOLS += bpftool
+HOST_LINUX_TOOLS += host-bpftool
 
 BPFTOOL_DEPENDENCIES = binutils elfutils
 
@@ -17,6 +18,9 @@ BPFTOOL_DEPENDENCIES += zlib
 endif
 
 BPFTOOL_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
+HOST_BPFTOOL_MAKE_OPTS = $(HOST_MAKE_FLAGS) \
+	CFLAGS="$(HOST_CFLAGS)" \
+	LDFLAGS="$(HOST_LDFLAGS)"
 
 define BPFTOOL_BUILD_CMDS
 	$(Q)if ! grep install $(LINUX_DIR)/tools/bpf/bpftool/Makefile >/dev/null 2>&1 ; then \
@@ -29,9 +33,25 @@ define BPFTOOL_BUILD_CMDS
 		$(BPFTOOL_MAKE_OPTS)
 endef
 
+define HOST_BPFTOOL_BUILD_CMDS
+	$(Q)if ! grep install $(HOST_LINUX_HEADERS_DIR)/tools/bpf/bpftool/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old and does not have install section in the bpf tools." ; \
+		echo "At least kernel 4.15 must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(HOST_LINUX_HEADERS_DIR) \
+		$(HOST_BPFTOOL_MAKE_OPTS) \
+		tools/bpf/bpftool
+endef
+
 define BPFTOOL_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/bpf/bpftool \
 		$(BPFTOOL_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
 		install
 endef
+
+define HOST_BPFTOOL_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(HOST_LINUX_HEADERS_DIR)/tools/bpf/bpftool/bpftool $(HOST_DIR)/usr/sbin/bpftool
+endef
diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index 81b1fbc176..0375883d95 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -21,6 +21,7 @@ include $(sort $(wildcard package/linux-tools/*.mk.in))
 
 # We only need the kernel to be extracted, not actually built
 LINUX_TOOLS_PATCH_DEPENDENCIES = linux
+HOST_LINUX_TOOLS_DEPENDENCIES = host-linux-headers
 
 # Install Linux kernel tools in the staging directory since some tools
 # may install shared libraries and headers (e.g. cpupower).
@@ -34,6 +35,10 @@ LINUX_TOOLS_POST_BUILD_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
 		$(call UPPERCASE,$(tool))_BUILD_CMDS))
 
+HOST_LINUX_TOOLS_POST_BUILD_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
+	$(if $(BR2_PACKAGE_HOST_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+		HOST_$(call UPPERCASE,$(tool))_BUILD_CMDS))
+
 LINUX_TOOLS_POST_INSTALL_STAGING_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
 		$(call UPPERCASE,$(tool))_INSTALL_STAGING_CMDS))
@@ -42,6 +47,10 @@ LINUX_TOOLS_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
 		$(call UPPERCASE,$(tool))_INSTALL_TARGET_CMDS))
 
+HOST_LINUX_TOOLS_POST_INSTALL_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
+	$(if $(BR2_PACKAGE_HOST_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+		HOST_$(call UPPERCASE,$(tool))_INSTALL_CMDS))
+
 define LINUX_TOOLS_LINUX_CONFIG_FIXUPS
 	$(foreach tool,$(LINUX_TOOLS),\
 		$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
@@ -49,6 +58,13 @@ define LINUX_TOOLS_LINUX_CONFIG_FIXUPS
 	)
 endef
 
+define HOST_LINUX_TOOLS_LINUX_CONFIG_FIXUPS
+	$(foreach tool,$(LINUX_TOOLS),\
+		$(if $(BR2_PACKAGE_HOST_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+			$(HOST_$(call UPPERCASE,$(tool))_LINUX_CONFIG_FIXUPS))
+	)
+endef
+
 define LINUX_TOOLS_INSTALL_INIT_SYSTEMD
 	$(foreach tool,$(LINUX_TOOLS),\
 		$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
@@ -72,3 +88,4 @@ define LINUX_TOOLS_INSTALL_INIT_OPENRC
 endef
 
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
