Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628CFC43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 16:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBFDD80E5F;
	Tue,  7 Jul 2026 16:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FG4uijeW9RbM; Tue,  7 Jul 2026 16:10:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B88C80E54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783440641;
	bh=zqixpx0PisMVIhptD1Ge6hHcZbaniblHMawm76pWSkI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bZ8bTLLCJT8a0o688k8jW/jtXjdca3JN9v8CMc/padVyltcvVW9dZqEMvrJ5EsrW/
	 VkmONSL0pNZHeg0U217O0bH/8h8knCmFpdkPp77/XdMn9Yfr6OYj7nWbM0hQaGtBHb
	 iFDXVBiebmaL1lxuRMzblQErwYZkgusmGvNRxYwgbbya6XkzxT+jy37zKI5iFmN3UK
	 wYHHOU19pJklZ4XAUkNFvNqAkNhDuzeL5wuWLVBx5ilpDEP0w+JRwTkB8rRE2OQZnZ
	 PfYjOEmTb7uH4cwrtPDFnwO15awP5lfOqYGvMQWWdZO8YKcaKkD2qAYRaBjPCVzwih
	 NQO/FJjvxAh7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B88C80E54;
	Tue,  7 Jul 2026 16:10:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 199F02A8
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 16:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BAA280E5B
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 16:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iATZ1cSpBja8 for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 16:10:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=nunes.philippe@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D10380DFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D10380DFF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D10380DFF
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 16:10:36 +0000 (UTC)
Received: from pnunes-ThinkPad.proxad.net (unknown [213.228.1.188])
 (Authenticated sender: nunes.philippe@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 80F6A13F854;
 Tue,  7 Jul 2026 18:10:32 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Philippe Nunes <nunes.philippe@free.fr>
Date: Tue,  7 Jul 2026 18:09:59 +0200
Message-ID: <20260707161000.629475-3-nunes.philippe@free.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707161000.629475-1-nunes.philippe@free.fr>
References: <20260701121937.346945-1-nunes.philippe@free.fr>
 <20260707161000.629475-1-nunes.philippe@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783440634;
 bh=p2otouzJcsWz+XHhmukza1uhnW4XEXn3zrP8G983Dyc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aRsQZVuL/NdRIu8Ek4FhWrlaL9r2IPSTnJwHuT3PWUkjrz8ZQzBbFZSpzFOTa46C2
 5iZxPw1RELJhHufpJuLNubF6z65/x6tgavhDsZ/poDBaZ5PyMZ8HOGSM8nYrteNQTm
 8kCeY24VVMCip1Ehf5kyoVgM0mozaQlPsM7uZJlMGTEFiaUdSrYbpY7S0MtQ6jpFLX
 ocpwu555lSDFd0dtxQYkX+j+LjgxNqd/R5t7nEnDjTyJS1SxKCiJPh08lVDngmtW6R
 NKA9lrju4zsy5MOW3v47SJhOls9IBZreBx7nvbPQRwA/iJBz/4rbCeIIytPm2utSxs
 BUj0Ijm8xc1Zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aRsQZVuL
Subject: [Buildroot] [PATCH v2 2/3] package/libqoriq-rcw: new package
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
From: Philippe Nunes via buildroot <buildroot@buildroot.org>
Reply-To: Philippe Nunes <nunes.philippe@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libqoriq-rcw is a C17 reimplementation of NXP's rcw.py, packaged
as a reusable shared library + pkg-config + public header. It
compiles and decompiles RCW (Reset Configuration Word) binaries
for the pbiformat=2 QorIQ family (LS1028, LS1088, LS2088, LX2160).

Both host and target variants are built. The library uses libmcpp
in-process instead of shelling out to gcc -E, so preprocessing is
hermetic. Built with -Dtests=false (skip cmocka unit tests) and
-Dman=disabled (skip pandoc-generated man page).

Upstream: https://github.com/vjardin/libqoriq-rcw
Signed-off-by: Philippe Nunes <nunes.philippe@free.fr>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/Config.in.host                 |  1 +
 package/libqoriq-rcw/Config.in         | 14 ++++++++++++++
 package/libqoriq-rcw/Config.in.host    | 10 ++++++++++
 package/libqoriq-rcw/libqoriq-rcw.hash |  4 ++++
 package/libqoriq-rcw/libqoriq-rcw.mk   | 23 +++++++++++++++++++++++
 7 files changed, 54 insertions(+)
 create mode 100644 package/libqoriq-rcw/Config.in
 create mode 100644 package/libqoriq-rcw/Config.in.host
 create mode 100644 package/libqoriq-rcw/libqoriq-rcw.hash
 create mode 100644 package/libqoriq-rcw/libqoriq-rcw.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 03fe739986..830ea99cb7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2726,6 +2726,7 @@ N:	Philipp Richter <richterphilipp.pops@gmail.com>
 F:	package/libtorrent-rasterbar/
 
 N:	Philippe Nunes <nunes.philippe@free.fr>
+F:	package/libqoriq-rcw/
 F:	package/mcpp/
 
 N:	Philippe Proulx <eeppeliteloop@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 944f971db7..38563a6520 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1854,6 +1854,7 @@ menu "Hardware handling"
 	source "package/libpciaccess/Config.in"
 	source "package/libpri/Config.in"
 	source "package/libqmi/Config.in"
+	source "package/libqoriq-rcw/Config.in"
 	source "package/libqrtr-glib/Config.in"
 	source "package/libraw1394/Config.in"
 	source "package/librtas/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 50798d142b..e44506198d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -61,6 +61,7 @@ menu "Host utilities"
 	source "package/jq/Config.in.host"
 	source "package/kmod/Config.in.host"
 	source "package/libp11/Config.in.host"
+	source "package/libqoriq-rcw/Config.in.host"
 	source "package/llvm-project/lld/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
diff --git a/package/libqoriq-rcw/Config.in b/package/libqoriq-rcw/Config.in
new file mode 100644
index 0000000000..687e001c2f
--- /dev/null
+++ b/package/libqoriq-rcw/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBQORIQ_RCW
+	bool "libqoriq-rcw"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8  # C17
+	select BR2_PACKAGE_MCPP
+	help
+	  C17 reimplementation of NXP's rcw.py as a shared/static
+	  library. Compiles QorIQ/Layerscape Reset Configuration Word
+	  sources into binary images for the pbiformat=2 SoC family
+	  (LS1028, LS1088, LS2088, LX2160).
+
+	  https://github.com/vjardin/libqoriq-rcw
+
+comment "libqoriq-rcw needs a toolchain w/ gcc >= 8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/libqoriq-rcw/Config.in.host b/package/libqoriq-rcw/Config.in.host
new file mode 100644
index 0000000000..4ce2560d56
--- /dev/null
+++ b/package/libqoriq-rcw/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_LIBQORIQ_RCW
+	bool "host libqoriq-rcw"
+	select BR2_PACKAGE_HOST_MCPP
+	help
+	  C17 reimplementation of NXP's rcw.py as a shared/static
+	  library. Compiles QorIQ/Layerscape Reset Configuration Word
+	  sources into binary images for the pbiformat=2 SoC family
+	  (LS1028, LS1088, LS2088, LX2160).
+
+	  https://github.com/vjardin/libqoriq-rcw
diff --git a/package/libqoriq-rcw/libqoriq-rcw.hash b/package/libqoriq-rcw/libqoriq-rcw.hash
new file mode 100644
index 0000000000..27612f9f7a
--- /dev/null
+++ b/package/libqoriq-rcw/libqoriq-rcw.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  6393cc3139068fa362c5f3a9ec4ae915704e4e848278f4eaa3f7cad465ed9b6b  libqoriq-rcw-1.0.2.tar.gz
+# Locally calculated
+sha256  30a111209bd81aa8d8c110087bff83ba112f82eb4e42630e5cba46cf0daa21ac  LICENSE
diff --git a/package/libqoriq-rcw/libqoriq-rcw.mk b/package/libqoriq-rcw/libqoriq-rcw.mk
new file mode 100644
index 0000000000..124a2ebb0a
--- /dev/null
+++ b/package/libqoriq-rcw/libqoriq-rcw.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# libqoriq-rcw
+#
+################################################################################
+
+LIBQORIQ_RCW_VERSION = 1.0.2
+LIBQORIQ_RCW_SITE = $(call github,vjardin,libqoriq-rcw,v$(LIBQORIQ_RCW_VERSION))
+
+LIBQORIQ_RCW_LICENSE = BSD-3-Clause
+LIBQORIQ_RCW_LICENSE_FILES = LICENSE
+
+LIBQORIQ_RCW_INSTALL_STAGING = YES
+
+LIBQORIQ_RCW_DEPENDENCIES = mcpp
+HOST_LIBQORIQ_RCW_DEPENDENCIES = host-mcpp
+
+# skip cmocka-based unit tests and pandoc-generated man page
+LIBQORIQ_RCW_CONF_OPTS = -Dtests=false -Dman=disabled
+HOST_LIBQORIQ_RCW_CONF_OPTS = -Dtests=false -Dman=disabled
+
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
