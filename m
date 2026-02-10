Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DCAEB2705
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 19:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12DD040268;
	Tue, 10 Feb 2026 19:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LB0Zie-hnbfd; Tue, 10 Feb 2026 19:21:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EDBC4029A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770751291;
	bh=+Rrbx9fz3NNzzT3Se5f2Z+jgEIMhhwgrREUJV4uli8Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F/nA4bgeLtMrAsEd5bfO3WgJacSMS3qk51C0+fNvE2YugtThyR05+GeeeronC6e1m
	 MaRyE9qEWZLmu8fWkEZjS4ib5OqmKAGbm2fn1WXj5/WdsaUvgBR4qtSemH2GyiNn2s
	 ivg83FNVM3Vg+0J/g5Q9ReMB8o8OrCx9U8UHKbFqnaVVbwWQIBt11cVje9gCmQiOLX
	 gceA0TORPAMIdSi28Ba9E63wHsY9plESAb/+CV+upTOCRJCaNk8I69TPvsRjkVFOXv
	 EmaADiV0jHCpL5dEw5HIpqiUpOO62kfrYBACWgJZopqBiP2TMXX32zQ8uZvhumVy2+
	 VieqxVUdmyRPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EDBC4029A;
	Tue, 10 Feb 2026 19:21:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FC33F2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 19:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3079B83D13
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 19:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbFUTJFBfEyW for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 19:21:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0F7F883D0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F7F883D0A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F7F883D0A
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 19:21:27 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 4752D2C831B3;
 Tue, 10 Feb 2026 20:21:25 +0100 (CET)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Marcus Hoffmann <bubu@bubu1.eu>
Date: Tue, 10 Feb 2026 20:21:29 +0100
Message-ID: <20260210192130.2755696-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210192130.2755696-1-buildroot@bubu1.eu>
References: <20260210192130.2755696-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770751285; bh=VjDxXmtRbewxf5DhUm86Wv7zCez2zwStkm2h/QxAja0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=B9P5TUv8khW2RvnCqljjuR6ZUtqjxzcrCGxh2CATXuVm2fBFq8WwAD6ctG7xfal+t
 wkffKsUKFioHIr3bhbZ/M+tgYZ1287yDGENOZAlhB63lL5HdAaS1bKHngooVBG62/f
 ke/IxyNiAoWaXlJaBoRaL+uSoqsvcQTu+/ULFN4SZA1/3fth3WcA+kxoom6acSKJFv
 GMm2f8Y79z5pFo8khsGx/X9elv7LvMyI7EvtOPdP6SIjy1+yH+L0KnvcS2YaA++jDi
 w2saWmSmFbPHe4D+q716W3jjrJmJwRChg4s2TrNpIVGfvy+XO1n3Q4cStgASD3Qjz+
 6yVVNo1eCr/MQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=B9P5TUv8
Subject: [Buildroot] [PATCH 2/2] package/nethogs: switch to meson build
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add two patches from upstream that are required to get meson builds to
work.

Disable building (and installing) libnethogs, as it has currently no
consumer. It wasn't available previously either.

This fixes linker errrors in static builds when libnl is also built
(which is a dependency of libpcap but the linking flags from pkgconfig
are not picked up in the handwritten makefiles).

Fixes:
 * https://autobuild.buildroot.net/results/9f8/9f8e9214b8f1d62e1638c42d3dcca482c02c16c5/
 * https://autobuild.buildroot.net/results/eea/eea5023d2732e6b8c1be0e3f4e5d9b28954f0a60/
 * https://autobuild.buildroot.net/results/f59/f59f789add493337da7d92e3372a450f74d2c8f3/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...ild-remove-unused-ncurses-dependency.patch | 35 ++++++++++++++++
 ...n-fix-build-with-libnethogs-disabled.patch | 41 +++++++++++++++++++
 package/nethogs/nethogs.mk                    | 11 +----
 3 files changed, 78 insertions(+), 9 deletions(-)
 create mode 100644 package/nethogs/0002-src-meson.build-remove-unused-ncurses-dependency.patch
 create mode 100644 package/nethogs/0003-meson-fix-build-with-libnethogs-disabled.patch

diff --git a/package/nethogs/0002-src-meson.build-remove-unused-ncurses-dependency.patch b/package/nethogs/0002-src-meson.build-remove-unused-ncurses-dependency.patch
new file mode 100644
index 0000000000..45e410796b
--- /dev/null
+++ b/package/nethogs/0002-src-meson.build-remove-unused-ncurses-dependency.patch
@@ -0,0 +1,35 @@
+From 974378443bdaec7206370291ffafc08afa54cfbc Mon Sep 17 00:00:00 2001
+From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
+Date: Wed, 4 Feb 2026 15:31:34 +0100
+Subject: [PATCH] src/meson.build: remove unused ncurses++ dependency
+
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+Upstream: https://github.com/raboof/nethogs/commit/92954b33067facb43fc783b4e9541d577e82f9d3
+---
+ src/meson.build | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 03f1b58..19788b3 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -24,7 +24,6 @@ if get_option('enable-nethogs-app').enabled()
+     ])
+   ]
+ 
+-  cursespp_dep = dependency('ncurses++', required: true)
+   curses_dep = dependency('ncurses', required: true)
+ 
+   executable('nethogs',
+@@ -33,7 +32,7 @@ if get_option('enable-nethogs-app').enabled()
+     cpp_args: c_args,
+     c_args: c_args,
+     install: true,
+-    dependencies : [project_deps, cursespp_dep, curses_dep]
++    dependencies : [project_deps, curses_dep]
+   )
+ endif
+ 
+-- 
+2.53.0
+
diff --git a/package/nethogs/0003-meson-fix-build-with-libnethogs-disabled.patch b/package/nethogs/0003-meson-fix-build-with-libnethogs-disabled.patch
new file mode 100644
index 0000000000..c5c0d93b8d
--- /dev/null
+++ b/package/nethogs/0003-meson-fix-build-with-libnethogs-disabled.patch
@@ -0,0 +1,41 @@
+From 0ed34d8ccb5d36a027ef03a7d6de294590bb1999 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 25 Jan 2025 16:05:20 +0000
+Subject: [PATCH] meson: fix build with libnethogs disabled
+
+Fix `meson.build:43:19: ERROR: Unknown variable "libnethogs".`.
+
+While src/ has this correct, the top-level meson.build wasn't right.
+
+[Marcus: Backported to v0.8.8]
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+Upstream: https://github.com/raboof/nethogs/commit/5afce747f142f6df6a264ab368c99f47050d9984
+---
+ meson.build | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 81d7b59..36bd24c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -38,9 +38,11 @@ subdir('src')
+ #############################
+ ## Pkgconfig definition    ##
+ #############################
+-pkgconfig = import('pkgconfig')
+-pkgconfig_install_dir = join_paths(get_option('libdir'), 'pkgconfig')
+-pkgconfig.generate(libnethogs,
+-                   requires: ['libpcap'],
+-                   version: version
+-                   )
++if get_option('enable-libnethogs').enabled()
++  pkgconfig = import('pkgconfig')
++  pkgconfig_install_dir = join_paths(get_option('libdir'), 'pkgconfig')
++  pkgconfig.generate(libnethogs,
++                     requires: ['libpcap'],
++                     version: version
++                     )
++endif
+-- 
+2.53.0
+
diff --git a/package/nethogs/nethogs.mk b/package/nethogs/nethogs.mk
index 74387d7397..773c769ff2 100644
--- a/package/nethogs/nethogs.mk
+++ b/package/nethogs/nethogs.mk
@@ -9,13 +9,6 @@ NETHOGS_SITE = $(call github,raboof,nethogs,v$(NETHOGS_VERSION))
 NETHOGS_LICENSE = GPL-2.0+
 NETHOGS_LICENSE_FILES = COPYING
 NETHOGS_DEPENDENCIES = libpcap ncurses
+NETHOGS_CONF_OPTS += -Denable-libnethogs=disabled
 
-define NETHOGS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) nethogs
-endef
-
-define NETHOGS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/src/nethogs $(TARGET_DIR)/usr/sbin/nethogs
-endef
-
-$(eval $(generic-package))
+$(eval $(meson-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
