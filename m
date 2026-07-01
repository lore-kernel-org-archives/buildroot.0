Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08374C44502
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 12:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF96760F0A;
	Wed,  1 Jul 2026 12:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WvcIZTSpulBS; Wed,  1 Jul 2026 12:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C41AE60FEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782908402;
	bh=Oizzv1w03ftHSdlp8z4Zf4PGY3NwQ3JfBC3/x7qhqGQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hsPHqpm0IMU+0j41vtZipvGXPZVrqhRaiqZoE2a7Wn3VyhCWvzXs2VmG0kwp5vKk+
	 cS/eaTRGl3lidBQ2lUoELqISKq6qPefBFcK8aF2V6vCavk822alLoYGm4RHApIf1wQ
	 bbblxEVAGp5V+KZVAUqvW6PNFQ3Q4xKgTSuLhDctJtnyFfoOpOzf9AJquzTWIXesx6
	 5Ca2B6Nfry/gyUxk9GezoTSmIzyNpJeBQ/Va1AKjdO+jf9PTPaC1lNHcu0yOc3M1eW
	 SlL5ANnMolzM6LqkTCh3dcCr5aLBsjb+10jAflR/PO10sCVWqzw2PSa25nDC35bXax
	 sYpQ50ARkpnUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C41AE60FEA;
	Wed,  1 Jul 2026 12:20:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B09AB2D5
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1E6A405CA
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6gSZM0A5vD0 for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 12:20:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=nunes.philippe@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 972DC40207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 972DC40207
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 972DC40207
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:20:00 +0000 (UTC)
Received: from pnunes-ThinkPad.proxad.net (unknown
 [IPv6:2a01:e0a:ad7:ca0:5e8f:f9af:2d01:45e3])
 (Authenticated sender: nunes.philippe@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id DD0C82003DA;
 Wed,  1 Jul 2026 14:19:56 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Philippe Nunes <nunes.philippe@free.fr>
Date: Wed,  1 Jul 2026 14:19:37 +0200
Message-ID: <20260701121937.346945-4-nunes.philippe@free.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121937.346945-1-nunes.philippe@free.fr>
References: <20260701121937.346945-1-nunes.philippe@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1782908399;
 bh=fETPw8Qeif4H+uaCXo2WIXqtSTOpDgf9lXGQw7Eu3xM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DX4DHmH4QGoUASeTCLHejZU5Roko3634DUIOiNe/JKOCCK94IdFQKYquITZuArsGa
 pf034DIEusTW4fK0/ToOEPUagR2yriwDT7yhQfBg2gfJbYy0So3vmmUHP8hUKkEcvn
 9qUtf1tAgh6TRzVWx2wn3HDMxdia1/ShZFeau6aqSnFo1v/i/o+yfTVRbGq8EaH58M
 H1aR3F/vQg7qFoybYVa3YuLujfh/ZyBcOGuJMJUmTBrMpor/l+xwNXOq3YrBXprZxp
 T+K15jMhiVvduwy28N4RD6IiGsmv5onbgMURUPrKY9JfqPkIwVWPl7Mh9WAB3htDEC
 B4W/9aMk1CsLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DX4DHmH4
Subject: [Buildroot] [PATCH 3/3] package/qoriq-rcw-c: new package
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

qoriq-rcw-c is a C reimplementation of NXP's rcw.py CLI for the
pbiformat=2 QorIQ family (LS1028, LS1088, LS2088, LX2160). Built on
top of libqoriq-rcw, it compiles a .rcw source file (preprocessed
in-process via libmcpp) to the binary RCW + PBI image consumed by
the SoC bootrom.

Beyond the rcw.py reference, qoriq-rcw-c adds two recovery features:

  --dump        read the live RCW from /dev/mem on a running board
                (post-PLL-lock RCWSR state; no PBI commands)
  --dump-flash  recover the PBL preamble + PBI commands from the
                bootrom slot(s) in NOR / SD / eMMC

Built as a host-only meson package with -Dman=disabled to skip the
pandoc-based man page (host packages don't install man pages anyway,
and pandoc is a heavy Haskell-runtime build dep). The 'man' feature
option landed upstream in v1.0.1; we pin to v1.0.1.

The "-c" suffix in the Buildroot package name distinguishes the
independent C implementation from the existing host-qoriq-rcw
package, which wraps NXP's rcw.py reference. The upstream project
itself is just "qoriq-rcw"; the suffix is purely a Buildroot-side
disambiguator (the installed binary is still named qoriq-rcw).

Upstream: https://github.com/vjardin/qoriq-rcw

Signed-off-by: Philippe Nunes <nunes.philippe@free.fr>
---
 DEVELOPERS                           |  1 +
 package/Config.in.host               |  1 +
 package/qoriq-rcw-c/Config.in.host   | 19 +++++++++++++++++++
 package/qoriq-rcw-c/qoriq-rcw-c.hash |  5 +++++
 package/qoriq-rcw-c/qoriq-rcw-c.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/qoriq-rcw-c/Config.in.host
 create mode 100644 package/qoriq-rcw-c/qoriq-rcw-c.hash
 create mode 100644 package/qoriq-rcw-c/qoriq-rcw-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 830ea99cb7..36edb3a767 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2728,6 +2728,7 @@ F:	package/libtorrent-rasterbar/
 N:	Philippe Nunes <nunes.philippe@free.fr>
 F:	package/libqoriq-rcw/
 F:	package/mcpp/
+F:	package/qoriq-rcw-c/
 
 N:	Philippe Proulx <eeppeliteloop@gmail.com>
 F:	package/babeltrace2/
diff --git a/package/Config.in.host b/package/Config.in.host
index e44506198d..5192f4b18d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -102,6 +102,7 @@ menu "Host utilities"
 	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/qoriq-rcw/Config.in.host"
+	source "package/qoriq-rcw-c/Config.in.host"
 	source "package/qt6/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
diff --git a/package/qoriq-rcw-c/Config.in.host b/package/qoriq-rcw-c/Config.in.host
new file mode 100644
index 0000000000..f8ca8d0de6
--- /dev/null
+++ b/package/qoriq-rcw-c/Config.in.host
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_HOST_QORIQ_RCW_C
+	bool "host qoriq-rcw-c (C implementation)"
+	select BR2_PACKAGE_HOST_LIBQORIQ_RCW
+	help
+	  C CLI built on top of libqoriq-rcw -- a faster drop-in
+	  replacement for NXP's rcw.py for the pbiformat=2 SoC family
+	  (LS1028, LS1088, LS2088, LX2160).
+
+	  Adds two capabilities beyond rcw.py:
+	    --dump          read live RCW from /dev/mem on a running
+	                    board (post-PLL-lock RCWSR state, no PBI)
+	    --dump-flash    recover PBL + PBI from the bootrom slot(s)
+	                    in NOR / SD / eMMC
+
+	  Naming note: the existing host-qoriq-rcw package consumes
+	  the upstream NXP rcw.py reference implementation; the "-c"
+	  suffix here distinguishes the independent C implementation.
+
+	  https://github.com/vjardin/qoriq-rcw
diff --git a/package/qoriq-rcw-c/qoriq-rcw-c.hash b/package/qoriq-rcw-c/qoriq-rcw-c.hash
new file mode 100644
index 0000000000..911a2c2e63
--- /dev/null
+++ b/package/qoriq-rcw-c/qoriq-rcw-c.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  977d501752045533fa725fe93e6e21b8cbbdf118da8944a939e9932ee1160529  qoriq-rcw-1.0.1.tar.gz
+
+# Locally calculated
+sha256  30a111209bd81aa8d8c110087bff83ba112f82eb4e42630e5cba46cf0daa21ac  LICENSE
diff --git a/package/qoriq-rcw-c/qoriq-rcw-c.mk b/package/qoriq-rcw-c/qoriq-rcw-c.mk
new file mode 100644
index 0000000000..a8258b121e
--- /dev/null
+++ b/package/qoriq-rcw-c/qoriq-rcw-c.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# qoriq-rcw-c
+#
+################################################################################
+
+# The upstream project is named "qoriq-rcw"; the "-c" suffix in the
+# Buildroot package name distinguishes it from the existing
+# host-qoriq-rcw package (which wraps NXP's rcw.py reference).
+QORIQ_RCW_C_VERSION = 1.0.1
+QORIQ_RCW_C_SITE = $(call github,vjardin,qoriq-rcw,v$(QORIQ_RCW_C_VERSION))
+QORIQ_RCW_C_SOURCE = qoriq-rcw-$(QORIQ_RCW_C_VERSION).tar.gz
+
+QORIQ_RCW_C_LICENSE = BSD-3-Clause
+QORIQ_RCW_C_LICENSE_FILES = LICENSE
+
+HOST_QORIQ_RCW_C_DEPENDENCIES = host-libqoriq-rcw
+
+# Skip the pandoc-rendered man page: pandoc is a heavy Haskell-
+# runtime build-time tool typically absent from packagers' minimal
+# images, and host packages don't install man pages anyway. The
+# 'man' feature option landed upstream in v1.0.1.
+HOST_QORIQ_RCW_C_CONF_OPTS = -Dman=disabled
+
+$(eval $(host-meson-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
