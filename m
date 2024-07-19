Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800C0C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 06:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C66160E8C;
	Fri, 19 Jul 2024 06:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bonnmYFNpkBr; Fri, 19 Jul 2024 06:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8D59608AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8D59608AA;
	Fri, 19 Jul 2024 06:32:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DD2B1BF362
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 06:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3694D81F59
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 06:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8cxfSRDRkeC for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 06:32:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C3FA181F53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3FA181F53
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3FA181F53
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 06:32:43 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-8138e2f2f69so58095539f.0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 23:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721370762; x=1721975562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yGs/hKD42B+hpDyHgtCc39OYNWalxscYhKbEAdEAtf0=;
 b=l7TZrx3m8QhcMUWs2HJUTTOEOMQ4f8UO4DAfEdmMu+gasi8AN9MCca4E6DArUO1Z/Q
 3sf7GDxcUyd594PM5U1mA/kwUWL+8zg80ILkffTcTqvKWQESXj1FQaqOGSsYp9/cbk3/
 13VwSfBVg4cLSScbfuQqSzLHocnZS+icqKYwuts5ph1fY6hkeobYNGUJp8nkViIKJw89
 gWo4qGsH+x/xuvhwOF18BSS7ujhFsa02tyFO38SQX/+/LX24UkGtiMkxdfCPOGbgk4lk
 U2mBs91yP6AGxmLz3U0L/242v96rSVh5YfQzQniozlCmoShx47PfMaHJAcUal3ajhxIY
 v1ag==
X-Gm-Message-State: AOJu0YzwqyE+hU0w6sXbtcnT8FqZippq3+zgix2lgck5HUNxRrP0Zb6J
 Syrmyjtn6UzOzcyVtQ77dt04kENrDiEu9/WbXzFrUFxgI770wIiYHQDgKQ==
X-Google-Smtp-Source: AGHT+IEFbMkcgowqDgEyIdx1YkTq4kW07DI4hjhmjL/Z8pyYFlkHp60N1eKJcm9UkQj+6wTGQ5XmAQ==
X-Received: by 2002:a05:6602:2cce:b0:803:5d04:2d2c with SMTP id
 ca18e2360f4ac-81710bd217emr1062245239f.11.1721370762435; 
 Thu, 18 Jul 2024 23:32:42 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-819ac79ab26sm29587239f.22.2024.07.18.23.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 23:32:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 00:32:34 -0600
Message-Id: <20240719063235.3823015-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719063235.3823015-1-james.hilliard1@gmail.com>
References: <20240719063235.3823015-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721370762; x=1721975562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yGs/hKD42B+hpDyHgtCc39OYNWalxscYhKbEAdEAtf0=;
 b=aCXINXIrrfwwGCsHg/Dpmm3Z6wiU5LL0bLKVXS73f9QRwy5UYm9J9VzpJ1iAQX+s+q
 qusCCfMu7I3nGgLp4dyUS9Sg0sMioimPG4S5xwGVvMDRB//yckghsJAtZOliUA8ftcO4
 cfMbYr4OvaE0QgnB9AqlhugHdh1jqsFE+O6vXAPTSUwbyM7Ji4wq6lWtUjtArpLj1akr
 zJryx8gAmQosmO3s33KJ1oLIIQBXtZCIb3SwfXKTijPQjHTcTCUMLpLj7b7lMiR8zwio
 BedG+nr5bthgadfm+smmD/6C+bBkaLDaxhWTqWkavuGIp4rVGo7w5fBMfikKKtFnSd/n
 DHqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aCXINXIr
Subject: [Buildroot] [PATCH v4 5/6] package/fwupd-efi: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport some patches fixing the python shebang and allowing one
to disable the use of genpeimg since we use host-python-pefile.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v3 -> v4:
  - select BR2_PACKAGE_HOST_PYTHON_USWID
Changes v2 -> v3:
  - add python shebang fix
  - disable genpeimg binary usage
  - set objcopy path
  - add host-python-pefile host-python-uswid deps
Changes v1 -> v2:
  - use gitlab for efi_sbat_distro_url
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...disabling-the-use-of-genpeimg-binary.patch | 41 ++++++++
 ...-shebang-paths-and-add-python-option.patch | 95 +++++++++++++++++++
 package/fwupd-efi/Config.in                   |  9 ++
 package/fwupd-efi/fwupd-efi.hash              |  3 +
 package/fwupd-efi/fwupd-efi.mk                | 28 ++++++
 7 files changed, 178 insertions(+)
 create mode 100644 package/fwupd-efi/0001-Allow-enabling-disabling-the-use-of-genpeimg-binary.patch
 create mode 100644 package/fwupd-efi/0002-Fix-python3-shebang-paths-and-add-python-option.patch
 create mode 100644 package/fwupd-efi/Config.in
 create mode 100644 package/fwupd-efi/fwupd-efi.hash
 create mode 100644 package/fwupd-efi/fwupd-efi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c4f1565edd..e686dd7060 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1489,6 +1489,7 @@ F:	package/apcupsd/
 F:	package/bpftool/
 F:	package/cloudflared/
 F:	package/exfatprogs/
+F:	package/fwupd-efi/
 F:	package/fxdiv/
 F:	package/gensio/
 F:	package/lua-std-debug/
diff --git a/package/Config.in b/package/Config.in
index f2e10b2b5e..c07544bb21 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -520,6 +520,7 @@ endmenu
 	source "package/fmtools/Config.in"
 	source "package/freeipmi/Config.in"
 	source "package/freescale-imx/Config.in"
+	source "package/fwupd-efi/Config.in"
 	source "package/fxload/Config.in"
 	source "package/gcnano-binaries/Config.in"
 	source "package/gpm/Config.in"
diff --git a/package/fwupd-efi/0001-Allow-enabling-disabling-the-use-of-genpeimg-binary.patch b/package/fwupd-efi/0001-Allow-enabling-disabling-the-use-of-genpeimg-binary.patch
new file mode 100644
index 0000000000..e6e460a3b7
--- /dev/null
+++ b/package/fwupd-efi/0001-Allow-enabling-disabling-the-use-of-genpeimg-binary.patch
@@ -0,0 +1,41 @@
+From fb1cf079346a2838cc44f7116cb4a790e40cc5bf Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 2 Jul 2024 15:08:18 -0600
+Subject: [PATCH] Allow enabling/disabling the use of genpeimg binary
+
+In some cases we may want to force the use of python3-pefile instead
+of genpeimg such as when cross compiling, add a feature option to
+allow disabling genpeimg.
+
+Upstream: https://github.com/fwupd/fwupd-efi/commit/fb1cf079346a2838cc44f7116cb4a790e40cc5bf
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ meson.build       | 2 +-
+ meson_options.txt | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index a3ce068..a5612a6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -17,7 +17,7 @@ prefix = get_option('prefix')
+ libdir = join_paths(prefix, get_option('libdir'))
+ libexecdir = join_paths(prefix, get_option('libexecdir'))
+ 
+-genpeimg = find_program ('genpeimg', required: false)
++genpeimg = find_program ('genpeimg', required: get_option('genpeimg'))
+ 
+ efi_app_location = join_paths(libexecdir, 'fwupd', 'efi')
+ host_cpu = host_machine.cpu_family()
+diff --git a/meson_options.txt b/meson_options.txt
+index 26161e1..588ae29 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -7,3 +7,4 @@ option('efi_sbat_distro_summary', type : 'string', value : '', description : 'SB
+ option('efi_sbat_distro_pkgname', type : 'string', value : '', description : 'SBAT distribution package name, e.g. fwupd')
+ option('efi_sbat_distro_version', type : 'string', value : '', description : 'SBAT distribution version, e.g. fwupd-1.5.6.fc33')
+ option('efi_sbat_distro_url', type : 'string', value : '', description : 'SBAT distribution URL, e.g. https://src.fedoraproject.org/rpms/fwupd')
++option('genpeimg', type : 'feature', description : 'Use genpeimg to add NX support to binaries')
+-- 
+2.34.1
+
diff --git a/package/fwupd-efi/0002-Fix-python3-shebang-paths-and-add-python-option.patch b/package/fwupd-efi/0002-Fix-python3-shebang-paths-and-add-python-option.patch
new file mode 100644
index 0000000000..9747565182
--- /dev/null
+++ b/package/fwupd-efi/0002-Fix-python3-shebang-paths-and-add-python-option.patch
@@ -0,0 +1,95 @@
+From 1cd1ff0216d5beb2a2523031398d4dba7d12729d Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 2 Jul 2024 14:51:26 -0600
+Subject: [PATCH] Fix python3 shebang paths and add python option.
+
+Using absolute paths can result in the wrong python3 binary being
+used, such as when cross compiling using a non-system python3.
+
+Use the normal python3 env shebang instead.
+
+Also add a meson option to allow overriding the python path.
+
+Upstream: https://github.com/fwupd/fwupd-efi/commit/1cd1ff0216d5beb2a2523031398d4dba7d12729d
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ contrib/reformat-code.py | 2 +-
+ efi/generate_binary.py   | 2 +-
+ efi/generate_sbat.py     | 2 +-
+ efi/meson.build          | 4 ++--
+ meson.build              | 7 +++++++
+ meson_options.txt        | 1 +
+ 6 files changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/contrib/reformat-code.py b/contrib/reformat-code.py
+index 65a4ac4..ff6014d 100755
+--- a/contrib/reformat-code.py
++++ b/contrib/reformat-code.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ #
+ # Copyright (C) 2017 Dell Inc.
+ #
+diff --git a/efi/generate_binary.py b/efi/generate_binary.py
+index 443472a..a4611bb 100755
+--- a/efi/generate_binary.py
++++ b/efi/generate_binary.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ #
+ # Copyright (C) 2021 Javier Martinez Canillas <javierm@redhat.com>
+ # Copyright (C) 2021 Richard Hughes <richard@hughsie.com>
+diff --git a/efi/generate_sbat.py b/efi/generate_sbat.py
+index 6c904e5..b9b80ac 100755
+--- a/efi/generate_sbat.py
++++ b/efi/generate_sbat.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ #
+ # Copyright (C) 2021 Javier Martinez Canillas <javierm@redhat.com>
+ # Copyright (C) 2021 Richard Hughes <richard@hughsie.com>
+diff --git a/efi/meson.build b/efi/meson.build
+index 75ade7a..008ba3d 100644
+--- a/efi/meson.build
++++ b/efi/meson.build
+@@ -1,5 +1,5 @@
+-generate_sbat = find_program('generate_sbat.py', native: true)
+-generate_binary = find_program('generate_binary.py', native: true)
++generate_sbat = [python3, files('generate_sbat.py')]
++generate_binary = [python3, files('generate_binary.py')]
+ 
+ # get source version, falling back
+ git = find_program('git', required : false)
+diff --git a/meson.build b/meson.build
+index a5612a6..5836213 100644
+--- a/meson.build
++++ b/meson.build
+@@ -19,6 +19,13 @@ libexecdir = join_paths(prefix, get_option('libexecdir'))
+ 
+ genpeimg = find_program ('genpeimg', required: get_option('genpeimg'))
+ 
++python3path = get_option('python')
++if python3path == ''
++  python3 = import('python').find_installation('python3')
++else
++  python3 = find_program(python3path)
++endif
++
+ efi_app_location = join_paths(libexecdir, 'fwupd', 'efi')
+ host_cpu = host_machine.cpu_family()
+ if host_cpu == 'x86'
+diff --git a/meson_options.txt b/meson_options.txt
+index 588ae29..5f6f521 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -8,3 +8,4 @@ option('efi_sbat_distro_pkgname', type : 'string', value : '', description : 'SB
+ option('efi_sbat_distro_version', type : 'string', value : '', description : 'SBAT distribution version, e.g. fwupd-1.5.6.fc33')
+ option('efi_sbat_distro_url', type : 'string', value : '', description : 'SBAT distribution URL, e.g. https://src.fedoraproject.org/rpms/fwupd')
+ option('genpeimg', type : 'feature', description : 'Use genpeimg to add NX support to binaries')
++option('python', type : 'string', description : 'the absolute path of the python3 binary')
+-- 
+2.34.1
+
diff --git a/package/fwupd-efi/Config.in b/package/fwupd-efi/Config.in
new file mode 100644
index 0000000000..7d3ad6a4a8
--- /dev/null
+++ b/package/fwupd-efi/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_FWUPD_EFI
+	bool "fwupd-efi"
+	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
+	select BR2_PACKAGE_GNU_EFI
+	select BR2_PACKAGE_HOST_PYTHON_USWID
+	help
+	  EFI Application used by uefi-capsule plugin in fwupd.
+
+	  https://github.com/fwupd/fwupd-efi
diff --git a/package/fwupd-efi/fwupd-efi.hash b/package/fwupd-efi/fwupd-efi.hash
new file mode 100644
index 0000000000..35dc9625ca
--- /dev/null
+++ b/package/fwupd-efi/fwupd-efi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  afd0805a2ad081a7caff2ef5bc004ce3a0147b538015e8eca966341716b1260e  fwupd-efi-1.6.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/fwupd-efi/fwupd-efi.mk b/package/fwupd-efi/fwupd-efi.mk
new file mode 100644
index 0000000000..45eeb8d824
--- /dev/null
+++ b/package/fwupd-efi/fwupd-efi.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# fwupd-efi
+#
+################################################################################
+
+FWUPD_EFI_VERSION = 1.6
+FWUPD_EFI_SITE = https://github.com/fwupd/fwupd-efi/releases/download/$(FWUPD_EFI_VERSION)
+FWUPD_EFI_SOURCE = fwupd-efi-$(FWUPD_EFI_VERSION).tar.xz
+FWUPD_EFI_LICENSE = LGPL-2.1+
+FWUPD_EFI_LICENSE_FILES = COPYING
+FWUPD_EFI_INSTALL_STAGING = YES
+FWUPD_EFI_DEPENDENCIES = host-python-pefile host-python-uswid gnu-efi
+FWUPD_EFI_CONF_OPTS = \
+	-Defi-libdir=$(STAGING_DIR)/usr/lib \
+	-Defi-ldsdir=$(STAGING_DIR)/usr/lib \
+	-Defi-includedir=$(STAGING_DIR)/usr/include/efi \
+	-Defi_sbat_fwupd_generation=1 \
+	-Defi_sbat_distro_id=buildroot \
+	-Defi_sbat_distro_summary=Buildroot \
+	-Defi_sbat_distro_pkgname=fwupd-efi \
+	-Defi_sbat_distro_version=fwupd-efi-$(FWUPD_EFI_VERSION) \
+	-Defi_sbat_distro_url=https://gitlab.com/buildroot.org/buildroot/-/tree/master/package/fwupd-efi \
+	-Dgenpeimg=disabled \
+	-Dpython="$(HOST_DIR)/bin/python3"
+FWUPD_EFI_MESON_EXTRA_BINARIES = objcopy='$(TARGET_OBJCOPY)'
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
