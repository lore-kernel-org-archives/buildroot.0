Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FA8C77B7F
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 01:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09E2142C33;
	Fri, 12 May 2023 01:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09E2142C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEvZWlcWeKKf; Fri, 12 May 2023 01:50:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D3F942C2E;
	Fri, 12 May 2023 01:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D3F942C2E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 373C91BF8B4
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 01:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FFD67019C
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 01:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FFD67019C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PuPoESPFj0fX for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 01:50:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C05060F58
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C05060F58
 for <buildroot@buildroot.org>; Fri, 12 May 2023 01:50:45 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1aaec6f189cso64860845ad.3
 for <buildroot@buildroot.org>; Thu, 11 May 2023 18:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683856244; x=1686448244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jmH/GQCr8hRQi5t0+zeEYggo8bzUyf7EdSM1cBuSKrA=;
 b=bwLt1q3dFJ96p+B94PJHEEokzy1+/0aQJdvNIqJazweHwr+b1YEaoj9K9iORh9xM6a
 kx91HUU9tzu5hi2TZQSWaAjizOIRNMGjRKzFU6ZZXvh/K6fR48CvyhKj4ivJFijjwe8/
 k5Si4yLWbYMpWMrNdSlPa3/44fP/m7aORl44OlWukhr0PFtOFYAbsfvZr5kjyRX9mT7w
 7GfD5N1TOqR/qxaLfKlJYf7zHKt+FZ/1r/0awz+W4EWL24m10lOAcRfhlyF37aKhrtNk
 xRjd1z06hqsr0831VyXg7km79HMVUQa9sAl3bq2jakO20shuUACc2YiYdQTznNZpZdzr
 ltDA==
X-Gm-Message-State: AC+VfDzn6xUkaddRXCEWywC+WVh8DLDL6M1j1P3G7ZgzTvnME4EcCy9J
 jLdjuHf8bnrDdnP6wQevnrOrqoTED/8kErcemqDKhBKH
X-Google-Smtp-Source: ACHHUZ7oCAZ+E4b1pNo1Ht9v5Ui8vmQtN1EVfMawaAfwcC20+HHC9ONSXnvdb6Yifd5DGu935FVARA==
X-Received: by 2002:a17:903:264b:b0:1ad:dd1a:6415 with SMTP id
 je11-20020a170903264b00b001addd1a6415mr1355494plb.11.1683856244495; 
 Thu, 11 May 2023 18:50:44 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 jn22-20020a170903051600b001a80ad9c599sm6588618plb.294.2023.05.11.18.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 18:50:43 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 18:40:56 -0700
Message-Id: <20230512014056.2107657-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1683856244; x=1686448244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jmH/GQCr8hRQi5t0+zeEYggo8bzUyf7EdSM1cBuSKrA=;
 b=hoZRgV9ElqDp+I+mSo1jqLDc3fSkMvMS/qBHrm5WwReaoyy/l3UUcbUfWi6vog6/vk
 JO0RIwAZTy3FDfHx44HbVVIPTVpXPSrADwqvLRz3v+ljNwNq0YLsgIAdTPbNtHNqlq6g
 oUgQ5s+hcV2OsPxJp7v6g+h8/bg+hAy4OcW945B9gG30HqOm1R7Gc96IrSG5LrEMyG6I
 ABYKG4AHuWAKdbTTUMXv1BV81qDKswpBPLl58DzfsACtBDo/SOoUU4lctktF4cJeSQ6r
 quq3iVinPHx3PmOI/1cL8veBojJ5Y773Smnoh/NZTfuRZ6ZEpARg4RYtmiOz0r15DRCd
 dpCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=hoZRgV9E
Subject: [Buildroot] [PATCH v1 1/1] package/crio: new package
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
Cc: Christian Stewart <christian@aperture.us>,
 Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

crio implements the Kubelet Container Runtime Interface (CRI) using OCI
conformant runtimes like runc or podman.

https://github.com/cri-o/cri-o/

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/Config.in      |  1 +
 package/crio/Config.in | 54 ++++++++++++++++++++++++++++
 package/crio/crio.hash |  3 ++
 package/crio/crio.mk   | 82 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 140 insertions(+)
 create mode 100644 package/crio/Config.in
 create mode 100644 package/crio/crio.hash
 create mode 100644 package/crio/crio.mk

diff --git a/package/Config.in b/package/Config.in
index 420ebaa370..0b9d87470e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2635,6 +2635,7 @@ menu "System tools"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
+	source "package/crio/Config.in"
 	source "package/crun/Config.in"
 	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
diff --git a/package/crio/Config.in b/package/crio/Config.in
new file mode 100644
index 0000000000..35a38c587e
--- /dev/null
+++ b/package/crio/Config.in
@@ -0,0 +1,54 @@
+config BR2_PACKAGE_CRIO
+	bool "crio"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # iproute2, __kernel_{u,}long_t
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	depends on BR2_USE_MMU # libgpgme, iproute2, fork()
+	select BR2_PACKAGE_IPROUTE2
+	select BR2_PACKAGE_IPTABLES
+	select BR2_PACKAGE_LIBGPGME
+	help
+	  crio implements the Kubelet Container Runtime Interface (CRI)
+	  using OCI conformant runtimes like runc or podman.
+
+	  https://github.com/cri-o/cri-o/
+
+if BR2_PACKAGE_CRIO
+
+config BR2_PACKAGE_CRIO_DRIVER_BTRFS
+	bool "btrfs filesystem driver"
+	depends on BR2_USE_MMU # btrfs-progs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
+	select BR2_PACKAGE_BTRFS_PROGS
+	help
+	  Build the btrfs filesystem driver.
+
+config BR2_PACKAGE_CRIO_DRIVER_DEVICEMAPPER
+	bool "devicemapper filesystem driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
+	depends on BR2_USE_MMU # lvm2
+	depends on !BR2_STATIC_LIBS # lvm2
+	select BR2_PACKAGE_LVM2
+	help
+	  Build the devicemapper filesystem driver.
+
+config BR2_PACKAGE_CRIO_DRIVER_OSTREE
+	bool "ostree storage driver"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libostree, libgpgme, libgpg-error
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libostree, libglib2
+	depends on BR2_USE_WCHAR # libostree, libglib2
+	depends on BR2_USE_MMU # libostree, e2fsprogs, libglib2, libgpgme
+	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
+	depends on !BR2_TOOLCHAIN_USES_MUSL # libostree
+	select BR2_PACKAGE_LIBOSTREE
+	help
+	  Build the ostree storage driver.
+
+endif
+
+comment "crio needs a glibc or musl toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/crio/crio.hash b/package/crio/crio.hash
new file mode 100644
index 0000000000..2cad8f8bb8
--- /dev/null
+++ b/package/crio/crio.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  8fd7c84ff74eff0a65e090bb9619f36508e461f6925f92a5b8886b759f2347d9  crio-1.27.0.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/crio/crio.mk b/package/crio/crio.mk
new file mode 100644
index 0000000000..042c369799
--- /dev/null
+++ b/package/crio/crio.mk
@@ -0,0 +1,82 @@
+################################################################################
+#
+# crio
+#
+################################################################################
+
+CRIO_VERSION = 1.27.0
+CRIO_SITE = $(call github,cri-o,cri-o,v$(CRIO_VERSION))
+CRIO_LICENSE = Apache-2.0
+CRIO_LICENSE_FILES = LICENSE
+
+CRIO_CPE_ID_VENDOR = kubernetes
+CRIO_CPE_ID_PRODUCT = cri-o
+
+CRIO_BUILD_TARGETS = cmd/crio cmd/crio-status
+CRIO_DEPENDENCIES += libgpgme
+CRIO_LDFLAGS = \
+	-X $(CRIO_GOMOD)/internal/version.Version=$(CRIO_VERSION)
+CRIO_TAGS = exclude_graphdriver_zfs
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+CRIO_TAGS += systemd
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+CRIO_DEPENDENCIES += libapparmor
+CRIO_TAGS += apparmor
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+CRIO_TAGS += seccomp
+CRIO_DEPENDENCIES += libseccomp host-pkgconf
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+CRIO_TAGS += selinux
+CRIO_DEPENDENCIES += libselinux
+endif
+
+ifeq ($(BR2_PACKAGE_CRIO_DRIVER_BTRFS),y)
+CRIO_DEPENDENCIES += btrfs-progs
+else
+CRIO_TAGS += exclude_graphdriver_btrfs
+endif
+
+ifeq ($(BR2_PACKAGE_CRIO_DRIVER_DEVICEMAPPER),y)
+CRIO_DEPENDENCIES += lvm2
+else
+CRIO_TAGS += exclude_graphdriver_devicemapper
+endif
+
+ifeq ($(BR2_PACKAGE_CRIO_DRIVER_OSTREE),y)
+CRIO_DEPENDENCIES += libostree
+CRIO_TAGS += ostree
+endif
+
+define CRIO_BUILD_PINNS
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" STRIP="$(TARGET_STRIP)" \
+		-C $(@D)/pinns ../bin/pinns
+endef
+CRIO_POST_BUILD_HOOKS += CRIO_BUILD_PINNS
+
+define CRIO_INSTALL_TARGET_CMDS
+	$(HOST_GO_COMMON_ENV) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc \
+		OPT_CNI_BIN_DIR=$(TARGET_DIR)/opt/cni/bin install.bin-nobuild
+	$(INSTALL) -d -m 700 $(TARGET_DIR)/etc/cni
+	$(INSTALL) -d -m 700 $(TARGET_DIR)/etc/cni/net.d
+	$(INSTALL) -D -m 644 $(@D)/contrib/cni/10-crio-bridge.conflist \
+		$(TARGET_DIR)/etc/cni/net.d/10-crio-bridge.conflist
+endef
+
+define CRIO_INSTALL_INIT_SYSTEMD
+	$(HOST_GO_COMMON_ENV) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc \
+		OPT_CNI_BIN_DIR=$(TARGET_DIR)/opt/cni/bin install.systemd
+	$(SED) 's,/usr/local/bin,/usr/bin,g' \
+		$(TARGET_DIR)/usr/lib/systemd/system/{crio,crio-wipe}.service
+endef
+
+$(eval $(golang-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
