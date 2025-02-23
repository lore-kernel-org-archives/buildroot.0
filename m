Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4693CC021B3
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 21:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E81574073B;
	Sun, 23 Feb 2025 21:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_zVKlIpQGyI; Sun, 23 Feb 2025 21:14:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 039E440713
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 039E440713;
	Sun, 23 Feb 2025 21:14:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F9A9920
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1256860BB4
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r77elknxCVk6 for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 21:14:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C021B60BBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C021B60BBC
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C021B60BBC
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38f2b7ce2e5so2151369f8f.2
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740345276; x=1740950076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RT659ux7LmaeaiY+PHjIIACx96sgG/b3VFLSc5gxLDY=;
 b=wTj+FQXJuGL6qEsYBT9C1lVsKotiEP7dElbi2PKK9zAg50RiFDZDrveRxXBOIlHGp2
 SXNEJqMG0Js15XvsKehNaL2Z3EO7rWg13axzfkZV5wZoSenxUiU6iltx1ThyLPdVn+lG
 MlNwp6t8OKWtoQjYoSNSAE6+0Hk899YbhmNEoT29T30DUC/FltAtOrhQOggS6bjHlSsk
 Kj82hsxNzBUCqrtEZXCw8ah8+gG16GwSRhWr5bcPBtCjz2UxkRKnCCwxPlRRVd2Pt826
 YAen1y9CQRbktq1C/pmC8yQ4lfrUqKEiuIcUlbgWSGDZg6+x8ma4CQxpsj/KxIrsKDO1
 6M6w==
X-Gm-Message-State: AOJu0Yzji/nhhk6XRo7zXKHtM0fXo2xsPA65WASQv85kMn1vlc/LDxtI
 ArfNxp7v9XzR7vGfKj0jc5TaVzelU7ZI7BxEjbnjv827yOjOk9kjICK1HA==
X-Gm-Gg: ASbGncs6imeN6KNnjrh4tpbFjqLJpitdgOAA9wctjcJzzBBsBStQfhYprvAaw8hYAV+
 qRNWf4pWc5SkRuxvk3lZ51+UfHbiRMfmT01kIq0/ZPbrb7Ea1KENvmwLqv8302Vcio8RM6T4RiR
 /O9WqDy7gTUGhtUWrqp22U8H0j9VSUYvV/DxhHqP60qjL4vp426jkUgOEJWtCczgrAm32jVY9zu
 KXYQPKW/HFR4xT/g/1NUUgJ4VtAPDNHsMeXtQlQDJMBKXbhkWXvSPFevSAwElnmL8njF3g9DW+/
 3MBHm/wSB42T6wrTcwkE1Y8sNybnH4aHysnk
X-Google-Smtp-Source: AGHT+IExm8G5uZRThUDKvQWi0jKwtoU5uWmiEqhgJ0adllnEvdjPFjwTgkDnRTNsYQg/Mqp7q8x0vQ==
X-Received: by 2002:a5d:5702:0:b0:38d:e584:e944 with SMTP id
 ffacd0b85a97d-38f6e97ae22mr8137917f8f.25.1740345276424; 
 Sun, 23 Feb 2025 13:14:36 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b030be5esm86757955e9.30.2025.02.23.13.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 13:14:36 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Date: Sun, 23 Feb 2025 22:14:32 +0100
Message-ID: <0b81afc88de83cff85611098eb06873eed0b997e.1740345268.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740345268.git.yann.morin.1998@free.fr>
References: <cover.1740345268.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740345276; x=1740950076; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RT659ux7LmaeaiY+PHjIIACx96sgG/b3VFLSc5gxLDY=;
 b=VTd17B1DaOAAIsK0KsZPQSaPtg9DLf4gZh0vbFF9u7oHG33kyR4l9Uv4nTmNWPEmOU
 vOxmc4/yj1a9krcSELzqr7TUCKTCFfldfuLVF4OBCTgYeBwF2BinrcNoL65yTH3KVOd6
 YkqtFShKuRnun3izIzs07/5thFFMHDrRmuDgVRvzPmhUqYc81xgIXKT6iSPisX5LMXLP
 w9Lb92oTVNtft2Jgx859niI9595xZ1Y6vUIH4LAbCWl4f0inynGQh2FcLmoROjLUESEv
 Zg1WA/N9LzylD7LxneMby+ztV/zNk/IvDRAN6ZPJMvPfmOnGZsGA49UY+r/m98rfuuoE
 jQFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VTd17B1D
Subject: [Buildroot] [PATCH 8/8] package/podman: new package
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

Podman is a container manager not unlike Docker, but is daemon-less.

Similalry to docker-engine, quite a few kernel config options are
required; as they are very similar in goals and features, the options
from docker-engine ahve been duplicated for podma. As that was not
enough, a few additoinal options have been added after trial-and-error
testing.

The documentation [0] states that seccomp can be disabled (i.e. not
enabled), but we were unable to start a container without seccomp
support in podman. So we make that mandatory.

Similar to Docker, podman can inject a minimalist init as PID1 in
containers, and like Docker, this is optional; podman however can only
use catatonit as such an init. Given the size of catatonit (1.3% that
of podman!), we do not bother to make it optional, and always enable it.

podman requires at least two config files; they can be either per-user
or system-wide:
  - policy.json [1]: defines what signature to accept to validate
    images; without one such file, podman just refuses to pull images;
  - registries.conf [2]: defines where to pull iamges from; without it,
    podman does not know how to pull un-qualified images (i.e. images
    where the registry is not specified in the path, and which Docker
    would fetch from the Docker Hub, e.g. "busybox:latest").

For those two files, we provide a very minimal default that allows
pulling unqualified images from the Docker Hub, as is traditional, and
that allows pulling images which signature can't be verified. Providing
actual files is going to be use-case dependent, and interested parties
will have to provide their own confoig files, e.g. in a rootfs overlay.

Finally, we add a runtime test for podman. The official busybox image on
the Docker Hub supports a lot of architectures, of which armv7 which we
use for this runtime test. Finding a small image that also supports
armv7 on other registries was a bit of a challenge; we eventually found
one busybox image on quay.io, but it is not an official busybox image;
still, it fits the bill, so we use it.

[0] https://podman.io/docs/installation#get-source-code
[1] https://github.com/containers/image/blob/main/docs/containers-policy.json.5.md
[2] https://github.com/containers/image/blob/main/docs/containers-registries.conf.5.md

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
---
 package/Config.in                            |   1 +
 package/podman/Config.in                     |  38 ++++++
 package/podman/podman.hash                   |   2 +
 package/podman/podman.mk                     | 109 ++++++++++++++++
 package/podman/policy.json                   |   7 ++
 package/podman/registries.conf               |   1 +
 support/testing/tests/package/test_podman.py | 124 +++++++++++++++++++
 7 files changed, 282 insertions(+)
 create mode 100644 package/podman/Config.in
 create mode 100644 package/podman/podman.hash
 create mode 100644 package/podman/podman.mk
 create mode 100644 package/podman/policy.json
 create mode 100644 package/podman/registries.conf
 create mode 100644 support/testing/tests/package/test_podman.py

diff --git a/package/Config.in b/package/Config.in
index 6e38f0ef33..fadd867cf0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2867,6 +2867,7 @@ menu "System tools"
 	source "package/openvmtools/Config.in"
 	source "package/pamtester/Config.in"
 	source "package/petitboot/Config.in"
+	source "package/podman/Config.in"
 	source "package/polkit/Config.in"
 	source "package/powerpc-utils/Config.in"
 	source "package/procps-ng/Config.in"
diff --git a/package/podman/Config.in b/package/podman/Config.in
new file mode 100644
index 0000000000..b2c5aacefe
--- /dev/null
+++ b/package/podman/Config.in
@@ -0,0 +1,38 @@
+config BR2_PACKAGE_PODMAN
+	bool "podman"
+	depends on BR2_USE_MMU  # catatonit, conmon, btrfs-progs, libgpgme
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS  # host-go
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # netavark
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17  # libseccomp
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # conmon, btrfs-progs
+	depends on BR2_USE_WCHAR  # conmon
+	select BR2_PACKAGE_HOST_GO
+	select BR2_PACKAGE_CA_CERTIFICATES  # runtime
+	select BR2_PACKAGE_CATATONIT  # runtime
+	select BR2_PACKAGE_CGROUPFS_V2_MOUNT if !BR2_PACKAGE_CGROUPFS_MOUNT && !BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_CONMON  # runtime
+	select BR2_PACKAGE_IPTABLES  # runtime
+	select BR2_PACKAGE_LIBGPGME
+	select BR2_PACKAGE_LIBSECCOMP
+	select BR2_PACKAGE_NETAVARK  # runtime
+	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN  # runtime
+	help
+	  The best free & open source container tools
+
+	  Manage containers, pods, and images with Podman. Seamlessly
+	  work with containers and Kubernetes from your local
+	  environment.
+
+	  https://podman.io/
+
+comment "podman needs a toolchain w/ headers >= 3.17, threads, wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR
diff --git a/package/podman/podman.hash b/package/podman/podman.hash
new file mode 100644
index 0000000000..546427525f
--- /dev/null
+++ b/package/podman/podman.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  e5cae3433931e6d6259b72d8d6513661f70cb083ea338068604c47fff5666127  podman-v5.4.0-git4-go2.tar.gz
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
new file mode 100644
index 0000000000..a04ce92f11
--- /dev/null
+++ b/package/podman/podman.mk
@@ -0,0 +1,109 @@
+################################################################################
+#
+# podman
+#
+################################################################################
+
+PODMAN_VERSION = v5.4.0
+PODMAN_SITE = https://github.com/containers/podman
+PODMAN_SITE_METHOD = git
+
+PODMAN_DEPENDENCIES = host-pkgconf libgpgme
+
+PODMAN_GOMOD = github.com/containers/podman/v5
+PODMAN_BUILD_TARGETS = cmd/podman
+PODMAN_TAGS = selinux
+
+# https://podman.io/docs/installation#get-source-code mandates that flag be
+# set, as device-mapper is not officially supported.
+PODMAN_TAGS += exclude_graphdriver_devicemapper
+
+# This is supposedly optional, but a basic (busybox:latest) image does not
+# even start without seccomp support
+PODMAN_DEPENDENCIES += libseccomp
+PODMAN_TAGS += seccomp
+
+ifeq ($(BR2_PACKAGE_BTRFS_PROGS),y)
+PODMAN_DEPENDENCIES += btrfs-progs
+define PODMAN_LINUX_CONFIG_FIXUPS_BTRFS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BTRFS_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BTRFS_FS_POSIX_ACL)
+endef
+else
+PODMAN_TAGS += exclude_graphdriver_btrfs
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+PODMAN_DEPENDENCIES += libapparmor
+PODMAN_TAGS += apparmor
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_SUBORDINATE_IDS),y)
+PODMAN_DEPENDENCIES += shadow
+PODMAN_TAGS += libsubid
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+PODMAN_DEPENDENCIES += systemd
+PODMAN_TAGS += systemd
+endif
+
+define PODMAN_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CPUSETS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_POSIX_MQUEUE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_FREEZER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_PIDS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_BPF)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NAMESPACES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_UTS_NS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPC_NS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PID_NS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SECCOMP)
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
+	$(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
+	$(PODMAN_LINUX_CONFIG_FIXUPS_BTRFS)
+endef
+
+define PODMAN_CONFIG
+	$(Q)$(INSTALL) -D -m 0644 \
+		$(PODMAN_PKGDIR)/registries.conf \
+		$(TARGET_DIR)/etc/containers/registries.conf
+	$(Q)$(INSTALL) -D -m 0644 \
+		$(PODMAN_PKGDIR)/policy.json \
+		$(TARGET_DIR)/etc/containers/policy.json
+endef
+PODMAN_POST_INSTALL_TARGET_HOOKS += PODMAN_CONFIG
+
+define PODMAN_HELPERS
+	$(Q)mkdir -p $(TARGET_DIR)/usr/libexec/podman
+	$(Q)ln -sf ../../bin/netavark $(TARGET_DIR)/usr/libexec/podman/netavark
+	$(Q)ln -sf ../../bin/catatonit $(TARGET_DIR)/usr/libexec/podman/catatonit
+endef
+PODMAN_POST_INSTALL_TARGET_HOOKS += PODMAN_HELPERS
+
+$(eval $(golang-package))
diff --git a/package/podman/policy.json b/package/podman/policy.json
new file mode 100644
index 0000000000..9333053f93
--- /dev/null
+++ b/package/podman/policy.json
@@ -0,0 +1,7 @@
+{
+  "default": [
+    {
+      "type": "insecureAcceptAnything"
+    }
+  ]
+}
diff --git a/package/podman/registries.conf b/package/podman/registries.conf
new file mode 100644
index 0000000000..d44d892da3
--- /dev/null
+++ b/package/podman/registries.conf
@@ -0,0 +1 @@
+unqualified-search-registries = ["docker.io"]
diff --git a/support/testing/tests/package/test_podman.py b/support/testing/tests/package/test_podman.py
new file mode 100644
index 0000000000..ba6d615849
--- /dev/null
+++ b/support/testing/tests/package/test_podman.py
@@ -0,0 +1,124 @@
+import infra.basetest
+import json
+import os
+
+
+class TestPodman(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_PACKAGE_CA_CERTIFICATES=y
+        BR2_PACKAGE_PODMAN=y
+        BR2_PACKAGE_HOST_GO_BIN=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        kernel_file = os.path.join(self.builddir, 'images', 'zImage')
+        dtb_file = os.path.join(self.builddir, 'images', 'vexpress-v2p-ca9.dtb')
+        ext2_file = os.path.join(self.builddir, 'images', 'rootfs.ext2')
+        self.emulator.boot(
+            arch='armv5',
+            kernel=kernel_file,
+            kernel_cmdline=[
+                'root=/dev/mmcblk0',
+                'rootwait',
+                'console=ttyAMA0',
+            ],
+            options=[
+                '-M', 'vexpress-a9',
+                '-dtb', dtb_file,
+                '-drive', f'file={ext2_file},if=sd,format=raw',
+            ]
+        )
+        self.emulator.login()
+
+        # The podman binary is huge, so it takes time to load...
+        # Next calls will be faster, though, as it is going to be cached.
+        self.assertRunOk('podman --version', timeout=30)
+
+        # Check for an empty image storage
+        output, exit_code = self.emulator.run('podman image ls --format "{{ json }}"')
+        img_info = json.loads("".join(output))
+        self.assertEqual(len(img_info), 0, f"{len(img_info)} image(s) already present")
+
+        # Pull an image; it can take time: network, hash checksums...
+        self.assertRunOk('podman image pull busybox:1.37.0', timeout=60)
+        output, exit_code = self.emulator.run('podman image ls --format "{{ json }}"')
+        img_info = json.loads("".join(output))
+        self.assertEqual(len(img_info), 1, f"{len(img_info)} image(s), expecting 1")
+        self.assertTrue("Id" in img_info[0], '"Id" not in img_info[0]')
+        self.assertTrue("Digest" in img_info[0], '"Digest" not in img_info[0]')
+        self.assertEqual(img_info[0]["Names"][0], "docker.io/library/busybox:1.37.0")
+
+        output, _ = self.emulator.run('echo ${br_container}')
+        self.assertEqual(output[0], "", "Already in a container")
+
+        # Spawn the container; that can take a bit of time
+        self.assertRunOk(
+            "podman container run --rm -ti -e PS1 -e br_container=podman busybox:1.37.0",
+            timeout=60,
+        )
+        # Twist! The command above is still running, but the shell it
+        # started exposes the same prompt we expect. This is all what we want.
+        output, _ = self.emulator.run('echo ${br_container}')
+        self.assertEqual(output[0], "podman", "Not in a podman container")
+
+        # Check that pid1 is the shell
+        output, _ = self.emulator.run('readlink /proc/1/exe')
+        self.assertEqual(output[0], "/bin/sh", f"PID1 is {output[0]}, should be /bin/sh")
+
+        # Exit the container
+        self.assertRunOk("exit 0")
+        # Twist, take two! We are now back to the shell in the VM.
+        output, _ = self.emulator.run('echo ${br_container}')
+        self.assertEqual(output[0], "", "Still in a container")
+
+        # Spawn a container, round two, but with an injected init this time
+        self.assertRunOk("podman container run --rm -ti -e PS1 --init -e br_container=podman busybox:1.37.0", timeout=60)
+        output, _ = self.emulator.run('echo ${br_container}')
+        self.assertEqual(output[0], "podman", "Not in a podman container")
+
+        # Check that pid1 is the init injected by podman
+        output, _ = self.emulator.run('readlink /proc/1/exe')
+        self.assertEqual(output[0], "/run/podman-init", f"PID1 is {output[0]}, should be /run/podman-init")
+
+        # Exit the container
+        self.assertRunOk("exit 0")
+        output, _ = self.emulator.run('echo ${br_container}')
+        self.assertEqual(output[0], "", "Still in a container")
+
+        # Remove the image
+        self.assertRunOk('podman image rm busybox:1.37.0')
+        output, exit_code = self.emulator.run('podman image ls --format "{{ json }}"')
+        img_info = json.loads("".join(output))
+        self.assertEqual(len(img_info), 0, f"{len(img_info)} image(s) still present, expecting 0")
+
+        # Use an image from another registry, spawn without pulling first
+        self.assertRunOk(
+            "podman container run --rm -ti -e PS1 -e br_container=podman quay.io/prometheus/busybox:latest",
+            timeout=60,
+        )
+        output, _ = self.emulator.run('echo ${br_container}')
+        self.assertEqual(output[0], "podman", "Not in a podman container")
+        self.assertRunOk("exit 0")
+        output, _ = self.emulator.run('echo ${br_container}')
+        self.assertEqual(output[0], "", "Still in a container")
+        self.assertRunOk('podman image prune -af')
+        output, exit_code = self.emulator.run('podman image ls --format "{{ json }}"')
+        img_info = json.loads("".join(output))
+        self.assertEqual(len(img_info), 0, f"{len(img_info)} image(s) still present, expecting 0")
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
