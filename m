Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC92D1BDFF
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFE4060DEE;
	Wed,  3 Dec 2025 22:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SIdtxFWmHHMX; Wed,  3 Dec 2025 22:03:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3CD660E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799414;
	bh=YV5ngAqn6sWPIvUPx9m4QFWJKuAsOEutbXOZZYBHg/g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KU7s0aR49na8k8Uy5r7JKYY2BDDNzXk6amI/3OUUhOmDVXcb7OTIM7gH3Q6TQigWG
	 Vpht4WDu6aanf/FvBIOeqQk6TlXhPn3GC2I4xmt6wrW8LvXYnZGYRrAije6T+itaf1
	 psa5a96g8Lp/FoJxB/59iN57expjd2VV0oqjlvgFIPx6GMZJMlvNIdNsE96kEqtvAT
	 Bnb82epgj+kDuK1qwaTJofbrpe+rHfl70CX3rqS50dTywi3xhqNH7gAjB/LD8qVaGZ
	 J1hDKJPej/4jdMsOmDWjolw7RPdRwbGo2vAWEYN+OpPIBQzV62Y2s08D78J6LAohjN
	 na5VVzkxQFckQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3CD660E74;
	Wed,  3 Dec 2025 22:03:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FAEBD3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5593C84239
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQajupqmhQyr for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:03:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E2CF8221B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E2CF8221B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E2CF8221B
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:03:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 855D4A4C79CE;
 Wed,  3 Dec 2025 22:59:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqh-000000002OS-0xki;
 Wed, 03 Dec 2025 21:57:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:12 +0100
Message-ID: <20251203215723.2323032-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799145;
 bh=1nfkH3dVR4QNAP+HF6LFfl5HVHzIAQisP9QOXGX0lGo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nQFqOscmvhP67n1pV14ciQ3yIsOpFTWNply8rwBtgCQ3IPIZh0hrbg8EM9SBbLQqs
 G/MZSie5DcjNerVNXm1Vir5nZDbS6UeAEPqXI8/gZc0k9AEFCCPEykCO+F9BnLHIGW
 pR4fkSpO7mrlDsV6D5Hq1LLziPaqju6SsOK69stPUm+g3ii3s05HnL75KNUvqw1BbO
 OI+jLqiFLb+Q8K50ULwIrt7uJRrH53w1WoXilHEuyym3hE55sSb8NGkTmAzKbrdHJn
 SLfF6DCZrwXw0v4S0HT7hNrin4fOyQKpUchWiI0EAmjY0EdatLuRVoMazr6fe7O9Mw
 gsvL3v+yB6Q2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=nQFqOscm
Subject: [Buildroot] [PATCH/next 05/16] package/gcr: bump version to 4.4.0.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ Ascani <rj.ascani@gmail.com>,
 Daniel Nicoletti <dantti12@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which is included in this release.

Added dependency to libsecret and switched to gtk4.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...wn-kw-argument-in-gnome.generate_gir.patch | 64 -------------------
 package/gcr/Config.in                         |  1 +
 package/gcr/gcr.hash                          |  5 +-
 package/gcr/gcr.mk                            | 19 +++---
 5 files changed, 14 insertions(+), 76 deletions(-)
 delete mode 100644 package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 495915745e..394c0523c3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -400,7 +400,6 @@ package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch lib_patch.Upstream
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch lib_patch.Upstream
 package/gcc/8.4.0/0004-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
-package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch lib_patch.Upstream
 package/gdb/14.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
 package/gdb/14.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
 package/gdb/14.2/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
diff --git a/package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch b/package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch
deleted file mode 100644
index a1d4e1b46f..0000000000
--- a/package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8 Mon Sep 17 00:00:00 2001
-From: Jakub Jirutka <jakub@jirutka.cz>
-Date: Wed, 12 Jan 2022 00:24:20 +0100
-Subject: [PATCH] meson: Fix unknown kw argument in gnome.generate_gir
-
-This argument has been removed in Meson 0.61.0:
-
-    gck/meson.build:130:2: ERROR: gnome.generate_gir got unknown keyword arguments "packages"
-
-https://github.com/mesonbuild/meson/commit/f8fc5cb860465718fe7c79a1bf1fe00659f138de:
-
-> The packages argument to gnome.generate_gir was allowed, but never did anything, so stop passing it.
-
-Fixes #89
-
-[aperez@igalia.com: backport from upstream]
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[yann.morin.1998@free.fr: make it an actual backport]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- gck/meson.build | 1 -
- gcr/meson.build | 1 -
- ui/meson.build  | 1 -
- 3 files changed, 3 deletions(-)
-
-diff --git a/gck/meson.build b/gck/meson.build
-index 756b486..a21a1e9 100644
---- a/gck/meson.build
-+++ b/gck/meson.build
-@@ -131,7 +131,6 @@ if get_option('introspection')
-     sources: gck_gir_sources,
-     namespace: 'Gck',
-     nsversion: '@0@'.format(gck_major_version),
--    packages: gck_deps,
-     export_packages: 'gck-@0@'.format(gck_major_version),
-     includes: [ 'GObject-2.0', 'Gio-2.0' ],
-     header: 'gck/gck.h',
-diff --git a/gcr/meson.build b/gcr/meson.build
-index 2233a44..c83641b 100644
---- a/gcr/meson.build
-+++ b/gcr/meson.build
-@@ -190,7 +190,6 @@ if get_option('introspection')
-     sources: [ gcr_base_public_sources, gcr_base_headers ],
-     namespace: 'Gcr',
-     nsversion: '@0@'.format(gcr_major_version),
--    packages: gcr_base_deps,
-     export_packages: 'gcr-base-@0@'.format(gcr_major_version),
-     includes: [
-       'GObject-2.0',
-diff --git a/ui/meson.build b/ui/meson.build
-index e656ea2..32ee057 100644
---- a/ui/meson.build
-+++ b/ui/meson.build
-@@ -152,7 +152,6 @@ if get_option('introspection')
-     export_packages: 'gcr-ui-@0@'.format(gcr_major_version),
-     identifier_prefix: 'Gcr',
-     symbol_prefix: 'gcr',
--    packages: gcr_ui_deps,
-     includes: [
-       'GObject-2.0',
-       'Gio-2.0',
--- 
-2.25.1
-
diff --git a/package/gcr/Config.in b/package/gcr/Config.in
index dbc22cf478..751accb723 100644
--- a/package/gcr/Config.in
+++ b/package/gcr/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_GCR
 	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2_DEPENDS # runtime
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSECRET
 	select BR2_PACKAGE_P11_KIT
 	help
 	  Library for cryptographic UIs and accessing PKCS#11 modules.
diff --git a/package/gcr/gcr.hash b/package/gcr/gcr.hash
index f6cc44e97d..1a67849f86 100644
--- a/package/gcr/gcr.hash
+++ b/package/gcr/gcr.hash
@@ -1,3 +1,4 @@
-# From https://download.gnome.org/sources/gcr/3.40/gcr-3.40.0.sha256sum
-sha256  b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5  gcr-3.40.0.tar.xz
+# From https://download.gnome.org/sources/gcr/4.4/gcr-4.4.0.1.sha256sum
+sha256  0c3c341e49f9f4f2532a4884509804190a0c2663e6120360bb298c5d174a8098  gcr-4.4.0.1.tar.xz
+# Locally computed
 sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index 3a8c01729f..e0fa48030a 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-GCR_VERSION_MAJOR = 3.40
-GCR_VERSION = $(GCR_VERSION_MAJOR).0
+GCR_VERSION_MAJOR = 4.4
+GCR_VERSION = $(GCR_VERSION_MAJOR).0.1
 GCR_SITE = https://download.gnome.org/sources/gcr/$(GCR_VERSION_MAJOR)
 GCR_SOURCE = gcr-$(GCR_VERSION).tar.xz
 GCR_DEPENDENCIES = \
 	host-pkgconf \
 	libgcrypt \
 	libglib2 \
+	libsecret \
 	p11-kit \
 	$(TARGET_NLS_DEPENDENCIES)
 GCR_INSTALL_STAGING = YES
@@ -34,14 +35,14 @@ else
 GCR_CONF_OPTS += -Dintrospection=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
-GCR_DEPENDENCIES += libgtk3
-GCR_CONF_OPTS += -Dgtk=true
-else ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
-GCR_DEPENDENCIES += libgtk3
-GCR_CONF_OPTS += -Dgtk=true
+ifeq ($(BR2_PACKAGE_LIBGTK4_X11),y)
+GCR_DEPENDENCIES += libgtk4
+GCR_CONF_OPTS += -Dgtk4=true
+else ifeq ($(BR2_PACKAGE_LIBGTK4_WAYLAND),y)
+GCR_DEPENDENCIES += libgtk4
+GCR_CONF_OPTS += -Dgtk4=true
 else
-GCR_CONF_OPTS += -Dgtk=false
+GCR_CONF_OPTS += -Dgtk4=false
 endif
 
 $(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
