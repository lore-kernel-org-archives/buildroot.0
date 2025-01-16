Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D01C02183
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 20:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FD01417F4;
	Thu, 16 Jan 2025 20:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v256Enhf-js6; Thu, 16 Jan 2025 20:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6629410DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6629410DE;
	Thu, 16 Jan 2025 20:48:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F0C331
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 20:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09AA6410DE
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 20:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id it0wS9tIPtPc for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 20:48:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73C0D4174C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73C0D4174C
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73C0D4174C
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 20:48:55 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a8146a8ddaso4050025ab.1
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 12:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737060534; x=1737665334;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KnpXaSDPM67vBZmm8i/Dtp2O4oFV31PwFj8u2oRTnUM=;
 b=XuxB7VSUOYWMQhIR99SuvyI+g+jgKLh62UnjxWEZuqhbdszdaSa7oRanKms6UBtjw0
 0L7TAbzIIu6r2sa+wFqcBYWaaS3NzS17IB+5WED482i4WFD4MB75ooHSWBEYCSEa+ewt
 C9FikB0Vv2X8BqQEPzEQglOVgbFFm/qk2M4j3A4sk8rUN21/VcSqRgQMmUH7vZBYMpjH
 kKZmHpiNIMqibbY0KXeRl+7CIpxLUmcR+pzTiDUUmWwPL16icSXMrwAE29rNf7dWMXBM
 vNafzQhuaCtwKCi19xYWw5wOri2iNbbgp+Kkw0+oQZJyVqkeqsXz4ZOeSC5rX/0U1VsC
 mksg==
X-Gm-Message-State: AOJu0YwWp+EMp7UTKa7SGN1wHGf5gLy557t0fsMiLUEj9A7R0ctFQwP+
 5qh7Csu546DJ+ex8O6tMo+pvKn1urNcwOISs8FboZIBYzKu1vGKoDLXbTRx+
X-Gm-Gg: ASbGncu2RwM9iwaPmN7P5X85ZimLtYCWL5GYHIHKI+xgmx74AgAv7JMAvMzrLQN0PeZ
 wQTK0JQupbBYNfC2i2oahX9Ypv6Bf1PyMbsbwfJXOTHQclz4YLiw0ZnFSPkJYiFpdw+xjuUgarG
 QHL5vf209w7Xb8LDFWxYf9ARHy88NRnsgZrkMEQg6KActJJsEUn215nwLQCbYjNrlvVdJJCzjMT
 PAb4Wf4Nzi+InIyQCTLCVVIEueIwUmoGGVanwOrb9TU6vMh3Z/HfSUPWTnKcB4rDbwiNYSh+C0/
 Qubo76MV1+W5o5kOpss/OHNtRcAK+lE=
X-Google-Smtp-Source: AGHT+IGnnGzIfvMABYkIkKNgwecCnloVSfWlnEo4DLoE/qduPX7wsQboFxL4z+If160nzw3XkbJ+1Q==
X-Received: by 2002:a05:6e02:1a47:b0:3a7:98c4:86a9 with SMTP id
 e9e14a558f8ab-3cf744947d0mr547975ab.20.1737060534022; 
 Thu, 16 Jan 2025 12:48:54 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea754409c7sm227952173.30.2025.01.16.12.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 12:48:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 16 Jan 2025 13:48:52 -0700
Message-Id: <20250116204852.1896100-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737060534; x=1737665334; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KnpXaSDPM67vBZmm8i/Dtp2O4oFV31PwFj8u2oRTnUM=;
 b=nQfruH4M5XI1EKBvbgXikjEYAklHfinLz0CR8S4T6pz1UxJn8k/ozybuKERiKO0Mnp
 hLPDvVpV1Ui6nJ/YHDAMmGobOfZkGlP2Q1L88HZRgIQVsNgwSKHdU5CHg004khIS4SWR
 p5h2J1cUARBJSjQNlM7rtcdbHmvMFAXU+o2357r1V/BNrtAcGCx9N8/eAWf5vtnli1Nt
 9u3b0tIXYvzvz9zEIwGgtne/EXngof+fyn7apNucBjYglYDNb1Rsf9Gxn4R6xMzS0Poq
 QYSgc7dEqPHJoWokpWjZ5bU6HTZHwxB53xLMRBfuVOWL3PWKqGMNnpBOqTY3EZa86XzE
 fhMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nQfruH4M
Subject: [Buildroot] [PATCH 1/1] package/fwupd-efi: bump to version 1.7
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

Drop patches which are now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...disabling-the-use-of-genpeimg-binary.patch | 41 --------
 ...-shebang-paths-and-add-python-option.patch | 95 -------------------
 package/fwupd-efi/fwupd-efi.hash              |  2 +-
 package/fwupd-efi/fwupd-efi.mk                |  5 +-
 4 files changed, 3 insertions(+), 140 deletions(-)
 delete mode 100644 package/fwupd-efi/0001-Allow-enabling-disabling-the-use-of-genpeimg-binary.patch
 delete mode 100644 package/fwupd-efi/0002-Fix-python3-shebang-paths-and-add-python-option.patch

diff --git a/package/fwupd-efi/0001-Allow-enabling-disabling-the-use-of-genpeimg-binary.patch b/package/fwupd-efi/0001-Allow-enabling-disabling-the-use-of-genpeimg-binary.patch
deleted file mode 100644
index e6e460a3b7..0000000000
--- a/package/fwupd-efi/0001-Allow-enabling-disabling-the-use-of-genpeimg-binary.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From fb1cf079346a2838cc44f7116cb4a790e40cc5bf Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 2 Jul 2024 15:08:18 -0600
-Subject: [PATCH] Allow enabling/disabling the use of genpeimg binary
-
-In some cases we may want to force the use of python3-pefile instead
-of genpeimg such as when cross compiling, add a feature option to
-allow disabling genpeimg.
-
-Upstream: https://github.com/fwupd/fwupd-efi/commit/fb1cf079346a2838cc44f7116cb4a790e40cc5bf
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- meson.build       | 2 +-
- meson_options.txt | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index a3ce068..a5612a6 100644
---- a/meson.build
-+++ b/meson.build
-@@ -17,7 +17,7 @@ prefix = get_option('prefix')
- libdir = join_paths(prefix, get_option('libdir'))
- libexecdir = join_paths(prefix, get_option('libexecdir'))
- 
--genpeimg = find_program ('genpeimg', required: false)
-+genpeimg = find_program ('genpeimg', required: get_option('genpeimg'))
- 
- efi_app_location = join_paths(libexecdir, 'fwupd', 'efi')
- host_cpu = host_machine.cpu_family()
-diff --git a/meson_options.txt b/meson_options.txt
-index 26161e1..588ae29 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -7,3 +7,4 @@ option('efi_sbat_distro_summary', type : 'string', value : '', description : 'SB
- option('efi_sbat_distro_pkgname', type : 'string', value : '', description : 'SBAT distribution package name, e.g. fwupd')
- option('efi_sbat_distro_version', type : 'string', value : '', description : 'SBAT distribution version, e.g. fwupd-1.5.6.fc33')
- option('efi_sbat_distro_url', type : 'string', value : '', description : 'SBAT distribution URL, e.g. https://src.fedoraproject.org/rpms/fwupd')
-+option('genpeimg', type : 'feature', description : 'Use genpeimg to add NX support to binaries')
--- 
-2.34.1
-
diff --git a/package/fwupd-efi/0002-Fix-python3-shebang-paths-and-add-python-option.patch b/package/fwupd-efi/0002-Fix-python3-shebang-paths-and-add-python-option.patch
deleted file mode 100644
index 9747565182..0000000000
--- a/package/fwupd-efi/0002-Fix-python3-shebang-paths-and-add-python-option.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 1cd1ff0216d5beb2a2523031398d4dba7d12729d Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 2 Jul 2024 14:51:26 -0600
-Subject: [PATCH] Fix python3 shebang paths and add python option.
-
-Using absolute paths can result in the wrong python3 binary being
-used, such as when cross compiling using a non-system python3.
-
-Use the normal python3 env shebang instead.
-
-Also add a meson option to allow overriding the python path.
-
-Upstream: https://github.com/fwupd/fwupd-efi/commit/1cd1ff0216d5beb2a2523031398d4dba7d12729d
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- contrib/reformat-code.py | 2 +-
- efi/generate_binary.py   | 2 +-
- efi/generate_sbat.py     | 2 +-
- efi/meson.build          | 4 ++--
- meson.build              | 7 +++++++
- meson_options.txt        | 1 +
- 6 files changed, 13 insertions(+), 5 deletions(-)
-
-diff --git a/contrib/reformat-code.py b/contrib/reformat-code.py
-index 65a4ac4..ff6014d 100755
---- a/contrib/reformat-code.py
-+++ b/contrib/reformat-code.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python3
-+#!/usr/bin/env python3
- #
- # Copyright (C) 2017 Dell Inc.
- #
-diff --git a/efi/generate_binary.py b/efi/generate_binary.py
-index 443472a..a4611bb 100755
---- a/efi/generate_binary.py
-+++ b/efi/generate_binary.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python3
-+#!/usr/bin/env python3
- #
- # Copyright (C) 2021 Javier Martinez Canillas <javierm@redhat.com>
- # Copyright (C) 2021 Richard Hughes <richard@hughsie.com>
-diff --git a/efi/generate_sbat.py b/efi/generate_sbat.py
-index 6c904e5..b9b80ac 100755
---- a/efi/generate_sbat.py
-+++ b/efi/generate_sbat.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python3
-+#!/usr/bin/env python3
- #
- # Copyright (C) 2021 Javier Martinez Canillas <javierm@redhat.com>
- # Copyright (C) 2021 Richard Hughes <richard@hughsie.com>
-diff --git a/efi/meson.build b/efi/meson.build
-index 75ade7a..008ba3d 100644
---- a/efi/meson.build
-+++ b/efi/meson.build
-@@ -1,5 +1,5 @@
--generate_sbat = find_program('generate_sbat.py', native: true)
--generate_binary = find_program('generate_binary.py', native: true)
-+generate_sbat = [python3, files('generate_sbat.py')]
-+generate_binary = [python3, files('generate_binary.py')]
- 
- # get source version, falling back
- git = find_program('git', required : false)
-diff --git a/meson.build b/meson.build
-index a5612a6..5836213 100644
---- a/meson.build
-+++ b/meson.build
-@@ -19,6 +19,13 @@ libexecdir = join_paths(prefix, get_option('libexecdir'))
- 
- genpeimg = find_program ('genpeimg', required: get_option('genpeimg'))
- 
-+python3path = get_option('python')
-+if python3path == ''
-+  python3 = import('python').find_installation('python3')
-+else
-+  python3 = find_program(python3path)
-+endif
-+
- efi_app_location = join_paths(libexecdir, 'fwupd', 'efi')
- host_cpu = host_machine.cpu_family()
- if host_cpu == 'x86'
-diff --git a/meson_options.txt b/meson_options.txt
-index 588ae29..5f6f521 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -8,3 +8,4 @@ option('efi_sbat_distro_pkgname', type : 'string', value : '', description : 'SB
- option('efi_sbat_distro_version', type : 'string', value : '', description : 'SBAT distribution version, e.g. fwupd-1.5.6.fc33')
- option('efi_sbat_distro_url', type : 'string', value : '', description : 'SBAT distribution URL, e.g. https://src.fedoraproject.org/rpms/fwupd')
- option('genpeimg', type : 'feature', description : 'Use genpeimg to add NX support to binaries')
-+option('python', type : 'string', description : 'the absolute path of the python3 binary')
--- 
-2.34.1
-
diff --git a/package/fwupd-efi/fwupd-efi.hash b/package/fwupd-efi/fwupd-efi.hash
index 35dc9625ca..42f9eb83ff 100644
--- a/package/fwupd-efi/fwupd-efi.hash
+++ b/package/fwupd-efi/fwupd-efi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  afd0805a2ad081a7caff2ef5bc004ce3a0147b538015e8eca966341716b1260e  fwupd-efi-1.6.tar.xz
+sha256  96d4fc45467159b2664ce86ee7d5030e265fdb4d4a4d774080654d2f5b1561ff  fwupd-efi-1.7.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/fwupd-efi/fwupd-efi.mk b/package/fwupd-efi/fwupd-efi.mk
index 45eeb8d824..fbff5a9043 100644
--- a/package/fwupd-efi/fwupd-efi.mk
+++ b/package/fwupd-efi/fwupd-efi.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-FWUPD_EFI_VERSION = 1.6
-FWUPD_EFI_SITE = https://github.com/fwupd/fwupd-efi/releases/download/$(FWUPD_EFI_VERSION)
-FWUPD_EFI_SOURCE = fwupd-efi-$(FWUPD_EFI_VERSION).tar.xz
+FWUPD_EFI_VERSION = 1.7
+FWUPD_EFI_SITE = $(call github,fwupd,fwupd-efi,$(FWUPD_EFI_VERSION))
 FWUPD_EFI_LICENSE = LGPL-2.1+
 FWUPD_EFI_LICENSE_FILES = COPYING
 FWUPD_EFI_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
