Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEEDC77B75
	for <buildroot@archiver.kernel.org>; Mon, 22 May 2023 20:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B028341E64;
	Mon, 22 May 2023 20:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B028341E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IImb_nzLhNL2; Mon, 22 May 2023 20:24:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5430241E21;
	Mon, 22 May 2023 20:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5430241E21
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15E241BF38D
 for <buildroot@lists.busybox.net>; Mon, 22 May 2023 20:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C10AC40112
 for <buildroot@lists.busybox.net>; Mon, 22 May 2023 20:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C10AC40112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gWroVZUGJBTP for <buildroot@lists.busybox.net>;
 Mon, 22 May 2023 20:24:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E9EE40612
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E9EE40612
 for <buildroot@buildroot.org>; Mon, 22 May 2023 20:24:30 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1ae52ce3205so44533465ad.3
 for <buildroot@buildroot.org>; Mon, 22 May 2023 13:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684787070; x=1687379070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8jKAwAZGX02Ea9o5F9CRbggXRPwWFIrpcg75r/q8doU=;
 b=lKYmDVwB6N6ceF6i4N7ejdgUpnriJ4iUU9uKOWXJ1N/q37A6SWNFFoiclijUTPHOxr
 B9/OjwHalF3O46/m32MqQ/chFvLsUcFY91yXW3PUn7QmCzR2tuzN8NMJ7qsqN9M+7n4D
 Vb1cq3lAEYRD1nHBQBK7s/tGnIm5ajNolwWUxcEHx1EC+uGn9IRr1g9qpj1J1g7K8jDj
 9ckXpDenkB+FJMSjKpgup5nOMTh1ICkf1e8KDOr9ZO8VMo9JB/2pmc7BfRD5QH0hdX2R
 HEEufYgNlI/vCDEib22dIJoNgQzbTKOl8QWBXzYTzjbva/GDYGWtQ+vnWrGufqqC/RDZ
 hW/A==
X-Gm-Message-State: AC+VfDzag7ek5TFwriDBnHrl10AE6za611IxNu+Vff1anYTVdMzCe2yl
 GfGE2qHm0JAAMS1ns5oSq0IWS/SpjblTwOVXNVocM6p7Ci4=
X-Google-Smtp-Source: ACHHUZ6Ihx3vnW+mW4Sn4UD5ot1Os1jI3lPJQKUwY9jdxfNus2l2fPROrCDUQGz03dem461YYFDXTw==
X-Received: by 2002:a17:902:ec8a:b0:1a9:9ace:3e74 with SMTP id
 x10-20020a170902ec8a00b001a99ace3e74mr12822559plg.65.1684787069854; 
 Mon, 22 May 2023 13:24:29 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 u13-20020a170902e5cd00b001ac937171e4sm5234413plf.254.2023.05.22.13.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 13:24:29 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 22 May 2023 13:23:46 -0700
Message-Id: <20230522202346.209785-2-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522202346.209785-1-christian@aperture.us>
References: <20230522202346.209785-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1684787070; x=1687379070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8jKAwAZGX02Ea9o5F9CRbggXRPwWFIrpcg75r/q8doU=;
 b=PROgw0qGZj3LwwaWOTBn5zjFxyOXD6AzIQL/9Ef02Wtt7vFfZt6gRtmVf81Mt/F28P
 nYRPffjMCyQQ2j52RqBUsfDpsBZa2LJ+w+Tue7RhDKDzO73bW/axob5S6hjPATkk7O66
 kl9GXNWLhkaICtuV3vFB/HGsafxb9hUkaaT0/Bb4g8nZFBz+m2sAkKVNEsWKMM57sqRh
 nkZ0/bZdm9GqR2Lg7wyK0Tkn18++Q456kNLdH8ZDC+tp7tnp4P9KDD1Fq/XUErHrhVm8
 ypr2J7uYZUF2JpQcpOj2ubFSMBwB45qlRN4Vhya+TGrpfLRz21E9TX1agXnnoHBaKrB8
 eKIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=PROgw0qG
Subject: [Buildroot] [PATCH v3 2/2] package/podman: new package
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
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

podman is a CLI tool for spawning and running containers according to the OCI
specification.

https://github.com/containers/podman

Signed-off-by: Christian Stewart <christian@aperture.us>

---

v1 -> v2:

 - package/podman: bump version to v4.5.0
 - Add cmd/quadlet target as required by the install script.

v2 -> v3:

 - remove duplicate CNI_PLUGINS line in Config.in
 - drop old unnecessary build tags:
   - btrfs_noversion: not needed for btrfs >= 3.16.1
   - containers_image_openpgp: no longer supported
   - exclude_graphdriver_devicemapper: set later in the file
 - Added myself to DEVELOPERS list
 - Added conmon -> libglib2 depends statements
 - Dropped CATATONIT select statement
 - Added CGROUPFS_MOUNT dependency if not using systemd
 - Thanks to Joachim for the review.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 DEVELOPERS                            |  1 +
 package/Config.in                     |  1 +
 package/podman/Config.in              | 58 +++++++++++++++++++++
 package/podman/containers-policy.json | 14 +++++
 package/podman/podman.hash            |  3 ++
 package/podman/podman.mk              | 75 +++++++++++++++++++++++++++
 6 files changed, 152 insertions(+)
 create mode 100644 package/podman/Config.in
 create mode 100644 package/podman/containers-policy.json
 create mode 100644 package/podman/podman.hash
 create mode 100644 package/podman/podman.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7b3287731a..c5de54a637 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -559,6 +559,7 @@ F:	package/moby-buildkit/
 F:	package/mosh/
 F:	package/nerdctl/
 F:	package/pkg-golang.mk
+F:	package/podman/
 F:	package/rtl8821au/
 F:	package/rtl8821cu/
 F:	package/runc/
diff --git a/package/Config.in b/package/Config.in
index 52bc10b91b..492baf25c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2684,6 +2684,7 @@ menu "System tools"
 	source "package/openvmtools/Config.in"
 	source "package/pamtester/Config.in"
 	source "package/petitboot/Config.in"
+	source "package/podman/Config.in"
 	source "package/polkit/Config.in"
 	source "package/powerpc-utils/Config.in"
 	source "package/procps-ng/Config.in"
diff --git a/package/podman/Config.in b/package/podman/Config.in
new file mode 100644
index 0000000000..92f5d6ae3d
--- /dev/null
+++ b/package/podman/Config.in
@@ -0,0 +1,58 @@
+config BR2_PACKAGE_PODMAN
+	bool "podman"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # conmon -> libglib2
+	depends on BR2_USE_MMU # libgpgme, conmon -> libglib2
+	depends on BR2_USE_WCHAR # conmon -> libglib2
+	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime
+	select BR2_PACKAGE_CNI_PLUGINS
+	select BR2_PACKAGE_CONMON
+	select BR2_PACKAGE_CRUN
+	select BR2_PACKAGE_IPTABLES
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGPGME
+	help
+	  podman is a CLI tool for spawning and running containers
+	  according to the OCI specification.
+
+	  https://github.com/containers/podman
+
+if BR2_PACKAGE_PODMAN
+
+config BR2_PACKAGE_PODMAN_DRIVER_BTRFS
+	bool "btrfs filesystem driver"
+	depends on BR2_USE_MMU # btrfs-progs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
+	select BR2_PACKAGE_BTRFS_PROGS
+	help
+	  Build the btrfs filesystem driver.
+
+config BR2_PACKAGE_PODMAN_DRIVER_DEVICEMAPPER
+	bool "devicemapper filesystem driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
+	depends on BR2_USE_MMU # lvm2
+	depends on !BR2_STATIC_LIBS # lvm2
+	select BR2_PACKAGE_LVM2
+	help
+	  Build the devicemapper filesystem driver.
+
+config BR2_PACKAGE_PODMAN_DRIVER_VFS
+	bool "vfs filesystem driver"
+	depends on BR2_USE_WCHAR # gvfs
+	depends on BR2_USE_MMU # gvfs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gvfs
+	depends on !BR2_STATIC_LIBS # gvfs
+	select BR2_PACKAGE_GVFS
+	help
+	  Build the vfs filesystem driver.
+
+endif
+
+comment "podman needs a glibc or musl toolchain w/ threads, wchar"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_USE_MMU
diff --git a/package/podman/containers-policy.json b/package/podman/containers-policy.json
new file mode 100644
index 0000000000..4480eb82b4
--- /dev/null
+++ b/package/podman/containers-policy.json
@@ -0,0 +1,14 @@
+{
+  "default": [
+    {
+    "type": "insecureAcceptAnything"
+  }
+  ],
+  "transports":
+  {
+    "docker-daemon":
+    {
+      "": [{"type":"insecureAcceptAnything"}]
+    }
+  }
+}
diff --git a/package/podman/podman.hash b/package/podman/podman.hash
new file mode 100644
index 0000000000..c011068682
--- /dev/null
+++ b/package/podman/podman.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  830a633630bf6e61f2b8d4ca00efdd9a173ef25cdd49d4a4364c293e088561df  podman-4.5.0.tar.gz
+sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
new file mode 100644
index 0000000000..f888f3ae5e
--- /dev/null
+++ b/package/podman/podman.mk
@@ -0,0 +1,75 @@
+################################################################################
+#
+# podman
+#
+################################################################################
+
+PODMAN_VERSION = 4.5.0
+PODMAN_SITE = $(call github,containers,podman,v$(PODMAN_VERSION))
+PODMAN_LICENSE = Apache-2.0
+PODMAN_LICENSE_FILES = LICENSE
+
+PODMAN_CPE_ID_VENDOR = podman_project
+PODMAN_GOMOD = github.com/containers/podman/v4
+
+PODMAN_BUILD_TARGETS = cmd/podman cmd/rootlessport cmd/quadlet
+PODMAN_DEPENDENCIES += libglib2 libgpgme
+PODMAN_LDFLAGS = \
+	-X $(PODMAN_GOMOD)/libpod/define.gitCommit=$(PODMAN_VERSION)
+PODMAN_TAGS = exclude_graphdriver_zfs
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+PODMAN_TAGS += systemd
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+PODMAN_DEPENDENCIES += libapparmor
+PODMAN_TAGS += apparmor
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+PODMAN_TAGS += seccomp
+PODMAN_DEPENDENCIES += libseccomp host-pkgconf
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+PODMAN_TAGS += selinux
+PODMAN_DEPENDENCIES += libselinux
+endif
+
+ifeq ($(BR2_PACKAGE_PODMAN_DRIVER_BTRFS),y)
+PODMAN_DEPENDENCIES += btrfs-progs
+else
+PODMAN_TAGS += exclude_graphdriver_btrfs
+endif
+
+ifeq ($(BR2_PACKAGE_PODMAN_DRIVER_DEVICEMAPPER),y)
+PODMAN_DEPENDENCIES += lvm2
+else
+PODMAN_TAGS += exclude_graphdriver_devicemapper
+endif
+
+ifeq ($(BR2_PACKAGE_PODMAN_DRIVER_VFS),y)
+PODMAN_DEPENDENCIES += gvfs
+else
+PODMAN_TAGS += exclude_graphdriver_vfs
+endif
+
+define PODMAN_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr \
+		install.bin
+	$(INSTALL) -d -m 700 $(TARGET_DIR)/etc/cni
+	$(INSTALL) -d -m 700 $(TARGET_DIR)/etc/cni/net.d
+	$(INSTALL) -D -m 644 $(@D)/cni/87-podman-bridge.conflist \
+		$(TARGET_DIR)/etc/cni/net.d/87-podman-bridge.conflist
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/containers
+	$(INSTALL) -D -m 644 $(PODMAN_PKGDIR)/containers-policy.json \
+		$(TARGET_DIR)/etc/containers/policy.json
+endef
+
+define PODMAN_INSTALL_INIT_SYSTEMD
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr \
+		install.systemd
+endef
+
+$(eval $(golang-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
