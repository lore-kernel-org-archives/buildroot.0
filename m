Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33334C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 05:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E4E740472;
	Sun, 21 Aug 2022 05:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E4E740472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bDcqiYdJyLqi; Sun, 21 Aug 2022 05:35:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 958CA4014C;
	Sun, 21 Aug 2022 05:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 958CA4014C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7F61BF29D
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 05:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB14382868
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 05:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB14382868
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i8x3dp4YE9XB for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 05:35:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1776082864
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1776082864
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 05:35:50 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id w138so4981795pfc.10
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 22:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=VBhHrpu6vkseqQM9RH0AX84vZ8tWpNeXlHVldlIlwbw=;
 b=HBnHNl0jEFMr+LJr3iyE515Xf0jml1i8n3UbaG4XeIpGCH1eDU5CzOSYZq6LHBh+UA
 HvM47YmVWoXLZEFwCWU56sVoQLDEK65To05gqxNIHcStWuzs4e8Z7fWHeuVj1943qWsl
 +acy4unKwWOWtmRJviZijZcpCucUPUmvPb4dp66WLdj+Z+oLBThlJgcBpCqYsYL6w+tj
 MH9cMEAC7LOW0cirh4EgxTs/uayuvz1WOu4nPJql2daS8Ul1itZ7AX50w+iv44Ldt+wq
 zjtHV8pbpF7IXqtgIgb20+hs6dSJehFiJG7mYLwELRKtWBk4MNZeqInD6zG7hvmv1NPN
 nnaA==
X-Gm-Message-State: ACgBeo19AGiqvZK8eV7GHT8WiAC2RyOOszog23c4FcRgggqg6TEiOnol
 bd2zC50h6I21pyA2lgOpEkq4UAFW3XvwqQ==
X-Google-Smtp-Source: AA6agR79h+KCDJ8jBsHfux7Kz2wArLiRp/XBg2jy0WiMkZGYZifxx5suu+NVIlouy4JK9Q9Px4qlYA==
X-Received: by 2002:a63:1a09:0:b0:415:fa9a:ae57 with SMTP id
 a9-20020a631a09000000b00415fa9aae57mr12060764pga.181.1661060150016; 
 Sat, 20 Aug 2022 22:35:50 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 t3-20020a170902d14300b0016f1319d2a7sm5705540plt.297.2022.08.20.22.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Aug 2022 22:35:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 20 Aug 2022 22:35:47 -0700
Message-Id: <20220821053547.667311-1-christian@paral.in>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/cni-plugins: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Container Networking Interface plugins.

https://github.com/containernetworking/plugins

Dependency of podman.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/cni-plugins/Config.in        | 16 +++++++++
 package/cni-plugins/cni-plugins.hash |  3 ++
 package/cni-plugins/cni-plugins.mk   | 51 ++++++++++++++++++++++++++++
 5 files changed, 72 insertions(+)
 create mode 100644 package/cni-plugins/Config.in
 create mode 100644 package/cni-plugins/cni-plugins.hash
 create mode 100644 package/cni-plugins/cni-plugins.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..bc02190365 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -530,6 +530,7 @@ F:	package/python-pylibftdi/
 N:	Christian Stewart <christian@paral.in>
 F:	package/batman-adv/
 F:	package/containerd/
+F:	package/cni-plugins/
 F:	package/delve/
 F:	package/docker-cli/
 F:	package/docker-engine/
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
index 0000000000..e01cadc026
--- /dev/null
+++ b/package/cni-plugins/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_CNI_PLUGINS
+	bool "cni-plugins"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	depends on BR2_USE_MMU
+	help
+	  Container Networking Interface plugins.
+
+	  https://github.com/containernetworking/plugins
+
+comment "cni-plugins needs a glibc or musl toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/cni-plugins/cni-plugins.hash b/package/cni-plugins/cni-plugins.hash
new file mode 100644
index 0000000000..fc3b5a7ead
--- /dev/null
+++ b/package/cni-plugins/cni-plugins.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c86c44877c47f69cd23611e22029ab26b613f620195b76b3ec20f589367a7962  cni-plugins-1.1.1.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/cni-plugins/cni-plugins.mk b/package/cni-plugins/cni-plugins.mk
new file mode 100644
index 0000000000..b30937095a
--- /dev/null
+++ b/package/cni-plugins/cni-plugins.mk
@@ -0,0 +1,51 @@
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
+CNI_PLUGINS_BUILD_TARGETS = \
+	plugins/ipam/dhcp \
+	plugins/main/bridge \
+	plugins/main/host-device \
+	plugins/main/ipvlan \
+	plugins/main/loopback \
+	plugins/main/macvlan \
+	plugins/main/ptp \
+	plugins/main/vlan \
+	plugins/meta/bandwidth \
+	plugins/meta/firewall \
+	plugins/meta/portmap \
+	plugins/meta/tuning \
+	plugins/meta/vrf
+CNI_PLUGINS_INSTALL_BINS = $(CNI_PLUGINS_BUILD_TARGETS)
+
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+CNI_PLUGINS_DEPENDENCIES += libapparmor
+CNI_PLUGINS_TAGS += apparmor
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+CNI_PLUGINS_TAGS += seccomp
+CNI_PLUGINS_DEPENDENCIES += libseccomp host-pkgconf
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+CNI_PLUGINS_TAGS += selinux
+CNI_PLUGINS_DEPENDENCIES += libselinux
+endif
+
+define CNI_PLUGINS_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/opt/cni/bin
+	$(foreach d,$(CNI_PLUGINS_INSTALL_BINS),\
+		$(INSTALL) -D -m 0755 $(@D)/bin/$$(basename $(d)) \
+			$(TARGET_DIR)/opt/cni/bin
+	)
+endef
+
+$(eval $(golang-package))
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
