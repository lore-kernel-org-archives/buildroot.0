Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB57AECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 12:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 119AA403D0;
	Sun,  4 Sep 2022 12:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 119AA403D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9utfilF3scim; Sun,  4 Sep 2022 12:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 156BB40386;
	Sun,  4 Sep 2022 12:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 156BB40386
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 111D91BF3FC
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 12:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE46340386
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 12:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE46340386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RuCviT8Rc0iu for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 12:54:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 245C040339
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 245C040339
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 12:54:12 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id bj12so12190544ejb.13
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 05:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=edW5valKkOX4P/eYsyNxcfuMndrHTfOP3WMQO0tmFmw=;
 b=1sVwxhhSkQlWFoH323mIxICMzDpzQT3Ot2ayz70wMPInWf6oHjbuTP7wTNYNI0b8ok
 NX/T1XONgZPAfEL2Y8kw5G8AGOK6y9Y13bmbLfKpTWo6PoNZC/03uwKePISqpjtaq+zk
 bxAzP5zTPLIog1Q/2mmeJG/8sLPwY6jOmnscKv0SjkznFk8peubaFnCspftzB8ItXoNK
 km1bGqtrUhBQEZ1udrcwOb3ctWVZ9AZkn+He0FaDIcE4u4AMZeEUYpOrnSYBNKUiMCoy
 Lbu9Oip6fZ1OsNDgt3R0wBn9hj546df0+vWByDBUEFqJQpCE4OF5I9wy+YYuX8MhppF3
 oA3w==
X-Gm-Message-State: ACgBeo3GtzoMmQNWlvcOiTZ5cz8OU+AmJZPIJZfYxjEuuvb+dfEoRI9M
 QIHAOytrqYeh1C439HMuxa+ohlM5jLyAJwVb
X-Google-Smtp-Source: AA6agR6Ar9EdI0ClhRZ7aYzs6G8hszSL4/4WeL87/bNFk1j1icg5lOgzm/NR3QGrJcZP5VGqus89Ow==
X-Received: by 2002:a17:906:8479:b0:73d:da77:8fbe with SMTP id
 hx25-20020a170906847900b0073dda778fbemr30235795ejc.373.1662296051257; 
 Sun, 04 Sep 2022 05:54:11 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a50c446000000b004476c19d126sm4774788edf.38.2022.09.04.05.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 05:54:10 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 14:53:59 +0200
Message-Id: <20220904125359.18844-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616163309.5271-1-raphael.pavlidis@gmail.com>
References: <20220616163309.5271-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=edW5valKkOX4P/eYsyNxcfuMndrHTfOP3WMQO0tmFmw=;
 b=N9e6ajx3ThqPISeO0KNWaBr8CdRrej9F1jfDX+0cbTOeBKCdA9WqmnsrGlQhj6NQNY
 PiJwD0N4aukLKpdE1YFf9qdmBCi0vHx/PJ6SKZI8X6ZkMnD9B7EaK4TGLPI672AP12eS
 JSGfZTX0yy1Tm0OEdRkHUOS1/T9JcD0Ej2BHiWMeq/YSqyDDcu5cJKO/QsJ1d7TVBDe9
 y5T+LW/Rz00/DWR3iZx6qyIrB6cy6340SeBdov2VsnrYM8Ux1FsHsuljUzjNTs6Uie8H
 i97GXHhMd+sjPba7c3P42kVlZSIvrVOWvBcIlcu9Q+l7HGYWjwp/7QrxvdfKy9OR7OiQ
 9zRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=N9e6ajx3
Subject: [Buildroot] [PATCH v3 1/1] package/cni-plugins: new package
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
Changes v2 -> v3:
  - DEVELOPERS: add Raphael Pavlids for cni-plugins

Changes v1 -> v2:
  - change BR2_PACKAGE_CNI_PLUGINS from config to menuconfig
  - turn on all plugins by default

 DEVELOPERS                           |   3 +
 package/Config.in                    |   1 +
 package/cni-plugins/Config.in        | 108 +++++++++++++++++++++++++++
 package/cni-plugins/cni-plugins.hash |   3 +
 package/cni-plugins/cni-plugins.mk   |  77 +++++++++++++++++++
 5 files changed, 192 insertions(+)
 create mode 100644 package/cni-plugins/Config.in
 create mode 100644 package/cni-plugins/cni-plugins.hash
 create mode 100644 package/cni-plugins/cni-plugins.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..208330881c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2506,6 +2506,9 @@ F:	support/testing/tests/package/test_python_jmespath.py
 F:	support/testing/tests/package/test_python_rsa.py
 F:	support/testing/tests/package/test_python_s3transfer.py
 
+N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
+F:	package/cni-plugins/
+
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
 F:	package/paho-mqtt-cpp/
diff --git a/package/Config.in b/package/Config.in
index d1c098c48f..00e9a5a99f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1812,6 +1812,7 @@ menu "Networking"
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
