Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28FCC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Jun 2022 16:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8714F40A8E;
	Thu, 16 Jun 2022 16:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8uwhwmLG-vMF; Thu, 16 Jun 2022 16:34:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE6C340134;
	Thu, 16 Jun 2022 16:34:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5524A1BF44C
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 16:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50A1C41BAB
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 16:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NivAMSbkgk3q for <buildroot@lists.busybox.net>;
 Thu, 16 Jun 2022 16:34:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C2BF41BA6
 for <buildroot@buildroot.org>; Thu, 16 Jun 2022 16:34:31 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id kq6so3768655ejb.11
 for <buildroot@buildroot.org>; Thu, 16 Jun 2022 09:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B/7X6QqyPlmsm1RRSa2cJN24BfrKoCU9j7mhgMQyeQU=;
 b=WNKXMTbGHQBQ7lLZSH65yJXyOlemo9yskHRoJJPM8Tg1fDQfUYpsAMH16YnJy/vxE4
 tqWeDtcndgUEN5h/OIELJXQdt+nHhHumv4nDrBfkPGpeWAu29S/76j4LZWyZX0CTeXWv
 Z6ZYegKu1RAUuaT2YhEJFEzJAw4F0w+rkcCEHz9Lq+WmRluHe4yM0G9Aj/FChnQQhc/J
 y57mdes5RB1S/dLWpXUmVJYG0MMortGbY4kQxvZFslQ29IrZAnnrQziPcMNVRxsX7eHw
 nq6KWcgPu0301uexQaTPLB64nnOBNWyJQ9KLK9UL8l0yjCun9P1VvRJRHkfrw/ms3yBD
 aYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B/7X6QqyPlmsm1RRSa2cJN24BfrKoCU9j7mhgMQyeQU=;
 b=anrrmpP5ftGGWe+pYvBaR2W03F1LA//82168CCmC1rZHD/nIXCK1+4zTufpObv9EXE
 C3Y+eXKGnTJPX1Os6gi4kWzjvMQtohn6+g4kubdh/0UQV62/PsKhIHDQsYMxdKFdYTRS
 mnieNFsChr+GO1olGUC3n4yvEg5HTkyPZ1shIxSEOv4B9UDDbse3VWhLNKYkO1CBF1sD
 A9j9l15nVpCeIUNsFFY7iBG6rM3W0FImBshtRYLDvpKjjFUnq8tG+2tUP4a10Fmpcibt
 sy4p9aUMBb+okmrLpUtovyjB+ocnqTQuRMrJKry8SOrL2P9HV8sBnM27oKgIk8f8rPrI
 K9bw==
X-Gm-Message-State: AJIora+rEi4Haul/YEWeaw9LiYAaCr2u4U3HCNGFxPaBxRQXYVN610e0
 aNB7pT9M+bf8Byc/PJgieCNNZVLfjmNLqvr+
X-Google-Smtp-Source: AGRyM1sYofo6Bu8vZmWs45EIT+FmYo7X+KHFLIe8s9m4seubePt5loRzivtsXV/QjOQacecmLnOZJA==
X-Received: by 2002:a17:906:730f:b0:711:db1a:fdb0 with SMTP id
 di15-20020a170906730f00b00711db1afdb0mr5278832ejc.54.1655397269730; 
 Thu, 16 Jun 2022 09:34:29 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:41a4:2c00:5e48:90c:7bda:e6d5])
 by smtp.gmail.com with ESMTPSA id
 kz9-20020a17090777c900b00711edab7622sm979489ejc.40.2022.06.16.09.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 09:34:29 -0700 (PDT)
X-Google-Original-From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Jun 2022 18:33:09 +0200
Message-Id: <20220616163309.5271-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616084356.14943-1-raphael.pavlidis@gmail.com>
References: <20220616084356.14943-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/cni-plugins: new package
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
From: Raphael Pavlidis via buildroot <buildroot@buildroot.org>
Reply-To: Raphael Pavlidis <raphael.pavlidis@googlemail.com>
Cc: Anisse Astier <anisse@astier.eu>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cni-plugins contains some reference networking plugins, maintained by
the CNI team.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
Changes v1 -> v2:
  - change BR2_PACKAGE_CNI_PLUGINS from config to menuconfig
  - turn on all plugins by default 

 package/Config.in                    |   1 +
 package/cni-plugins/Config.in        | 108 +++++++++++++++++++++++++++
 package/cni-plugins/cni-plugins.hash |   3 +
 package/cni-plugins/cni-plugins.mk   |  77 +++++++++++++++++++
 4 files changed, 189 insertions(+)
 create mode 100644 package/cni-plugins/Config.in
 create mode 100644 package/cni-plugins/cni-plugins.hash
 create mode 100644 package/cni-plugins/cni-plugins.mk

diff --git a/package/Config.in b/package/Config.in
index 3b089166da..2100a08ca8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1781,6 +1781,7 @@ menu "Networking"
 	source "package/bluez5_utils-headers/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/cgic/Config.in"
+	source "package/cni-plugins/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/curlpp/Config.in"
 	source "package/czmq/Config.in"
diff --git a/package/cni-plugins/Config.in b/package/cni-plugins/Config.in
new file mode 100644
index 0000000000..9ce13f4bbe
--- /dev/null
+++ b/package/cni-plugins/Config.in
@@ -0,0 +1,108 @@
+menuconfig BR2_PACKAGE_CNI_PLUGINS
+	bool "cni-plugins"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	help
+	  Some reference and example networking plugins, maintained by the CNI team.
+
+	  https://github.com/containernetworking/plugins
+
+if BR2_PACKAGE_CNI_PLUGINS
+
+config BR2_PACKAGE_CNI_PLUGINS_BRIDGE
+	bool "bridge"
+	default y
+	help
+	  Creates a bridge, adds the host and the container to it.
+
+config BR2_PACKAGE_CNI_PLUGINS_IPVLAN
+	bool "ipvlan"
+	default y
+	help
+	  Adds an ipvlan interface in the container.
+
+config BR2_PACKAGE_CNI_PLUGINS_LOOPBACK
+	bool "loopback"
+	default y
+	help
+	  Set the state of loopback interface to up.
+
+config BR2_PACKAGE_CNI_PLUGINS_MACVLAN
+	bool "macvlan"
+	default y
+	help
+	  Creates a new MAC address, forwards all traffic to that to the container.
+
+config BR2_PACKAGE_CNI_PLUGINS_PTP
+	bool "ptp"
+	default y
+	help
+	  Creates a veth pair.
+
+config BR2_PACKAGE_CNI_PLUGINS_VLAN
+	bool "vlan"
+	default y
+	help
+	  Creates a veth pair.
+
+config BR2_PACKAGE_CNI_PLUGINS_HOST_DEVICE
+	bool "host-device"
+	default y
+	help
+	  Move an already-existing device into a container.
+
+config BR2_PACKAGE_CNI_PLUGINS_DHCP
+	bool "dhcp"
+	default y
+	help
+	  Runs a daemon on the host to make DHCP requests on behalf of the
+	  container.
+
+config BR2_PACKAGE_CNI_PLUGINS_HOST_LOCAL
+	bool "host-local"
+	default y
+	help
+	  Maintains a local database of allocated IPs.
+
+config BR2_PACKAGE_CNI_PLUGINS_STATIC
+	bool "static"
+	default y
+	help
+	  Allocate a single static IPv4/IPv6 address to container. It's useful in
+	  debugging purpose.
+
+config BR2_PACKAGE_CNI_PLUGINS_TUNING
+	bool "tuning"
+	default y
+	help
+	  Tweaks sysctl parameters of an existing interface.
+
+config BR2_PACKAGE_CNI_PLUGINS_PORTMAP
+	bool "portmap"
+	default y
+	help
+	  An iptables-based portmapping plugin. Maps ports from the host's address
+	  space to the container.
+
+config BR2_PACKAGE_CNI_PLUGINS_BANDWIDTH
+	bool "bandwidth"
+	default y
+	help
+	  Allows bandwidth-limiting through use of traffic control tbf
+	  (ingress/egress).
+
+config BR2_PACKAGE_CNI_PLUGINS_SBR
+	bool "sbr"
+	default y
+	help
+	  A plugin that configures source based routing for an interface (from which
+	  it is chained).
+
+config BR2_PACKAGE_CNI_PLUGINS_FIREWALL
+	bool "firewall"
+	default y
+	help
+	  A firewall plugin which uses iptables or firewalld to add rules to allow
+	  traffic to/from the container.
+
+endif # BR2_PACKAGE_CNI_PLUGINS
diff --git a/package/cni-plugins/cni-plugins.hash b/package/cni-plugins/cni-plugins.hash
new file mode 100644
index 0000000000..c987e1ff45
--- /dev/null
+++ b/package/cni-plugins/cni-plugins.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  c86c44877c47f69cd23611e22029ab26b613f620195b76b3ec20f589367a7962  cni-plugins-1.1.1.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/cni-plugins/cni-plugins.mk b/package/cni-plugins/cni-plugins.mk
new file mode 100644
index 0000000000..02abcd283c
--- /dev/null
+++ b/package/cni-plugins/cni-plugins.mk
@@ -0,0 +1,77 @@
+################################################################################
+#
+# cni-plugins
+#
+################################################################################
+
+CNI_PLUGINS_VERSION = 1.1.1
+CNI_PLUGINS_SITE = $(call github,containernetworking,plugins,v$(CNI_PLUGINS_VERSION))
+CNI_PLUGINS_LICENSE = Apache-2.0
+CNI_PLUGINS_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_CNI_PLUGINS_BRIDGE),y)
+CNI_PLUGINS_BUILD_TARGETS += plugins/main/bridge
+endif
+
+ifeq ($(BR2_PACKAGE_CNI_PLUGINS_IPVLAN),y)
+CNI_PLUGINS_BUILD_TARGETS += plugins/main/ipvlan
+endif
+
+ifeq ($(BR2_PACKAGE_CNI_PLUGINS_LOOPBACK),y)
+CNI_PLUGINS_BUILD_TARGETS += plugins/main/loopback
+endif
+
+ifeq ($(BR2_PACKAGE_CNI_PLUGINS_MACVLAN),y)
+CNI_PLUGINS_BUILD_TARGETS += plugins/main/macvlan
+endif
+
+ifeq ($(BR2_PACKAGE_CNI_PLUGINS_PTP),y)
+CNI_PLUGINS_BUILD_TARGETS += plugins/main/ptp
+endif
+
+ifeq ($(BR2_PACKAGE_CNI_PLUGINS_VLAN),y)
+CNI_PLUGINS_BUILD_TARGETS += plugins/main/vlan
+endif
+
+ifeq ($(BR2_PACKAGE_CNI_PLUGINS_HOST_DEVICE),y)
+CNI_PLUGINS_BUILD_TARGETS += plugins/main/host-device
+endif
+
+ifeq ($(BR2_PACKAGE_CNI_PLUGINS_DHCP),y)
+CNI_PLUGINS_BUILD_TARGETS += plugins/ipam/dhcp
+endif
+
+ifeq ($(BR2_PACKAGE_CNI_PLUGINS_HOST_LOCAL),y)
+CNI_PLUGINS_BUILD_TARGETS += plugins/ipam/host-local
+endif
+
+ifeq ($(BR2_PACKAGE_CNI_PLUGINS_STATIC),y)
+CNI_PLUGINS_BUILD_TARGETS += plugins/ipam/static
+endif
+
+ifeq ($(BR2_PACKAGE_CNI_PLUGINS_TUNING),y)
+CNI_PLUGINS_BUILD_TARGETS += plugins/meta/tuning
+endif
+
+ifeq ($(BR2_PACKAGE_CNI_PLUGINS_PORTMAP),y)
+CNI_PLUGINS_BUILD_TARGETS += plugins/meta/portmap
+endif
+
+ifeq ($(BR2_PACKAGE_CNI_PLUGINS_BANDWIDTH),y)
+CNI_PLUGINS_BUILD_TARGETS += plugins/meta/bandwidth
+endif
+
+ifeq ($(BR2_PACKAGE_CNI_PLUGINS_SBR),y)
+CNI_PLUGINS_BUILD_TARGETS += plugins/meta/sbr
+endif
+
+ifeq ($(BR2_PACKAGE_CNI_PLUGINS_FIREWALL),y)
+CNI_PLUGINS_BUILD_TARGETS += plugins/meta/firewall
+endif
+
+define CNI_PLUGINS_INSTALL_TARGET_CMDS
+	$(INSTALL) -d  $(TARGET_DIR)/usr/libexec/cni
+	$(INSTALL) -D -m 0755 $(@D)/bin/* $(TARGET_DIR)/usr/libexec/cni/
+endef
+
+$(eval $(golang-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
