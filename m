Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E152C28B30
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 19:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C56F83B88;
	Sat, 15 Mar 2025 19:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GpJ2ET7-mJD; Sat, 15 Mar 2025 19:57:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 278AA83B8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 278AA83B8D;
	Sat, 15 Mar 2025 19:57:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33BD7EA
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B6B7400EC
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9MmMpechXa5 for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 19:57:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3E9540423
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3E9540423
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3E9540423
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:18 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so2954076f8f.2
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742068637; x=1742673437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fREqTQuh7qTDonGBNWYJqo6kDnK1ue3OopDOZl5aXXo=;
 b=vpw1+Tm7pOC+enXjxj2no6mrrXmSWIZzCS6T1VGd82Ly/6FJSgv8qQrB5WvJj0R1n4
 n8LJ9HdolIzXPR4pLEJB3yCGUHdXhOqxsP5tWa/4eIaYz3tXBFrx5/GFLfqS2WZqhIgn
 EM/z1Z14SjTq+ICj9K6QzN/71TzYXoUmzt9ohFkFCxrb/rrQgb+SgH2nP9gyPhDf/1bF
 6o28FWPwaJMP1i/651btsoD0NUOCp9JlBEHd2rsQ9uby5Hb8sJYXItn13B0UV22BkeIV
 XA+zul1olDFf0SHrR4h8ZODxx4w0/sswFtt6ivvuAOPsYRfYAOL7m5+8srjNOAUuEQY6
 Jw5w==
X-Gm-Message-State: AOJu0YwlEubpYxbiZu1cqOWaaXLZ4674aSSYxTRiFTrUTFU03u9akVOJ
 L1V04/bH1Tk3k6Dzr8aytGXcssT7C2rfr2hklR+vC9tDB3rrdZBRW2f/4Q==
X-Gm-Gg: ASbGncueABLxosd8pUCx4+Y1HvNsFYuIa3RK0xWG7vzhJ9Uay5iiKWcTWbQvnqwqqtV
 hRm5/Uk+gvNkLk9Kkd8ObqSrl/EVYJXc+e/jcYu34nktFmltZ+xDV/X/jc9UH/PaqlhkIOi33mG
 Icox9fOxPguwGrOgf/qkaDOXiko0YPQV/GqykwSsv0c4v85+w98lTY8ccWpjZ/te89pY7HHp5Sq
 qZ/0VZvkflPE2pe7e6mJIitk7QwDs6XMzPkSlQMHz3eMgrVTPpmpjVoL38augLIerNVijBWAJ6i
 LGONatSX4MCexM/h7FaYWHJHb2FZHvt6TdeWUq2RkJiayPAWItab3P4=
X-Google-Smtp-Source: AGHT+IHuE2zgfbJimoeDO301NzUlPzz1DDKqjtFGYfNAY5WoPzmtRlNE6y4Sk/u8+qvMWZfCZ+x8yA==
X-Received: by 2002:a5d:64c7:0:b0:391:1388:64b7 with SMTP id
 ffacd0b85a97d-3971ef3b3f3mr8876806f8f.46.1742068636667; 
 Sat, 15 Mar 2025 12:57:16 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975afesm9756836f8f.47.2025.03.15.12.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 12:57:16 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sat, 15 Mar 2025 20:57:07 +0100
Message-ID: <06b71820f810552fd7387287e073bdc994c4c7e4.1742068624.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1742068624.git.yann.morin.1998@free.fr>
References: <cover.1742068624.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742068637; x=1742673437; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fREqTQuh7qTDonGBNWYJqo6kDnK1ue3OopDOZl5aXXo=;
 b=Vm3w58sWEouRLjd0Ilk60erZMA0fS8M5QOLSO5vZO9s94wVSwMXd+J47nlDF+visTd
 p8MxOhwDc2gcJeRI+U0nINJj3gAgfFoDjAMi8nMHx07+BkV+78eJQT5RxKO64dHkc9DE
 jipkCFeAr8aGlnpl/0Qhx4077/hYBnRaTgXfKI1qen2PUVA5Tf1qWgb+b0ZFvUTOtfNc
 fZY7kFi1vXolv25AEw7T8/ehXj84hsWHMsT4VHkt1FmhPX1Wb03H5IqczPhg+mLUQR0c
 Ib9YlhqpbjYmIQTppcMGGI4NOF3K6PE3desx6MUjyHcAmn+uehzrGiS39ApuOp8EUTDn
 KN3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vm3w58sW
Subject: [Buildroot] [PATCH 09/14 v4] package/netavark: new package
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

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Olivain <ju.o@free.fr>

---
Changes v1 -> v2:
  - add licensing information  (Julien)

changes v3 -> v4;
  - carry the iptables options
  - support nftables an alternative to iptables  (Raphael)
---
 package/Config.in              |  1 +
 package/netavark/Config.in     | 12 +++++
 package/netavark/netavark.hash |  3 ++
 package/netavark/netavark.mk   | 92 ++++++++++++++++++++++++++++++++++
 4 files changed, 108 insertions(+)
 create mode 100644 package/netavark/Config.in
 create mode 100644 package/netavark/netavark.hash
 create mode 100644 package/netavark/netavark.mk

diff --git a/package/Config.in b/package/Config.in
index 7d8540869d..2e081b84d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2560,6 +2560,7 @@ endif
 	source "package/ndisc6/Config.in"
 	source "package/net-tools/Config.in"
 	source "package/netatalk/Config.in"
+	source "package/netavark/Config.in"
 	source "package/netcalc/Config.in"
 	source "package/netcat/Config.in"
 	source "package/netcat-openbsd/Config.in"
diff --git a/package/netavark/Config.in b/package/netavark/Config.in
new file mode 100644
index 0000000000..cf7b731141
--- /dev/null
+++ b/package/netavark/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_NETAVARK
+	bool "netavark"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_IPTABLES if !BR2_PACKAGE_NFTABLES  # runtime
+	select BR2_PACKAGE_NFTABLES_JSON if BR2_PACKAGE_NFTABLES && !BR2_PACKAGE_IPTABLES
+	help
+	  Netavark is a rust based network stack for containers. It
+	  is being designed to work with Podman but is also applicable
+	  for other OCI container management applications.
+
+	  https://github.com/containers/netavark
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
new file mode 100644
index 0000000000..585763be42
--- /dev/null
+++ b/package/netavark/netavark.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  09471bd116fdebfd3f7a8100b37809e3a306d0f18e5feee8445ed1e01a22e0aa  netavark-v1.14.0-git4-cargo2.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
new file mode 100644
index 0000000000..c96912ef5a
--- /dev/null
+++ b/package/netavark/netavark.mk
@@ -0,0 +1,92 @@
+################################################################################
+#
+# netavark
+#
+################################################################################
+
+NETAVARK_VERSION = v1.14.0
+NETAVARK_SITE = https://github.com/containers/netavark
+NETAVARK_SITE_METHOD = git
+
+NETAVARK_LICENSE = Apache-2.0
+NETAVARK_LICENSE_FILES = LICENSE
+
+# For protoc
+NETAVARK_DEPENDENCIES = host-protobuf
+
+NETAVARK_CARGO_ENV = PROTOC=$(HOST_DIR)/bin/protoc
+
+# In case only nftables is enabled, use that as the firwewall backend
+ifeq ($(BR2_PACKAGE_IPTABLES).$(BR2_PACKAGE_NFTABLES),.y)
+define NETAVARK_CONFIG_NFTABLES
+	$(Q)mkdir -p $(TARGET_DIR)/etc/containers/containers.conf.d/
+	printf '[network]\nfirewall_driver = "nftables"\n' \
+		> $(TARGET_DIR)/etc/containers/containers.conf.d/50-buildroot-nftables.conf
+endef
+NETAVARK_POST_INSTALL_TARGET_HOOKS += NETAVARK_CONFIG_NFTABLES
+
+# See https://github.com/containers/netavark/issues/1057#issuecomment-2286149984
+define NETAVARK_LINUX_CONFIG_FIXUPS_NFTABLES
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NUMGEN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FLOW_OFFLOAD)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CONNLIMIT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_LOG)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_LIMIT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REDIR)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_TUNNEL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_QUEUE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_QUOTA)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_COMPAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_HASH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_XFRM)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_SOCKET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_TPROXY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_SYNPROXY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_DUP_NETDEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FWD_NETDEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_NETDEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_NETDEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_DUP_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_COMPAT_ARP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_DUP_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_BRIDGE_META)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_BRIDGE_REJECT)
+endef
+endif
+
+define NETAVARK_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_ADDRTYPE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_COMMENT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_CONNTRACK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MARK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_IPVS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE_NETFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_VETH)
+	$(NETAVARK_LINUX_CONFIG_FIXUPS_NFTABLES)
+endef
+
+$(eval $(cargo-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
