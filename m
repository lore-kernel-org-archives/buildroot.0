Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4C6C44502
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 12:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B039D83B2A;
	Wed,  1 Jul 2026 12:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sm3eYLdkn3Ny; Wed,  1 Jul 2026 12:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6FD18415A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782908397;
	bh=+UEve+mV6bVWTSS1kPp36s9r0bDSrk4cWfGqUl6NdQU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hKlqXBtzy6S97srBGPWb/0yiFFxoqR8QnpVacc8XVNkPt2OXidiO7kHYV2Vg0C3Oe
	 ttO69/OfKwlsxr6FKeEGqPFYwcs9YLM4ACX4/eHs1076tgwpYpBV291USgJzGdqsEE
	 Scf3nTU2+3i/r64L/jRgjLGy8fh5LorSvRpC7uEzlV8ujGzv94Z9T8BcOAOsF/S6Fq
	 jOYR7mjz6pdi7gtWNQlVyNhDi60eFMofmoT6y/p1kn2tRVkBJ/AYGDcBzRWQKbpzXQ
	 lvERCubf2CjZJjDujs8xy3NvOWhdvwFllrlS/TvHEVcIeve6p1epx187qDIYexr0RQ
	 uCaULK4zDsV7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6FD18415A;
	Wed,  1 Jul 2026 12:19:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F08942EB
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFD80614D1
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7HFhIvnWm2f for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 12:19:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=nunes.philippe@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CCC1760FEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCC1760FEA
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCC1760FEA
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:19:54 +0000 (UTC)
Received: from pnunes-ThinkPad.proxad.net (unknown
 [IPv6:2a01:e0a:ad7:ca0:5e8f:f9af:2d01:45e3])
 (Authenticated sender: nunes.philippe@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0E3282003DD;
 Wed,  1 Jul 2026 14:19:51 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Philippe Nunes <nunes.philippe@free.fr>
Date: Wed,  1 Jul 2026 14:19:36 +0200
Message-ID: <20260701121937.346945-3-nunes.philippe@free.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121937.346945-1-nunes.philippe@free.fr>
References: <20260701121937.346945-1-nunes.philippe@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1782908393;
 bh=U0d/B0jiE+FKDwx7TN42lvcMiwdg79sn+ICbRoXSTSo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LCAHAu0JKmkMKseHfdTM/Orcdt8O2PcrO01y+b7LiEEDf3AodeT46w9dnf0HTvQs3
 +Qih0w0nkSIZp4ltFzl0l3sy75yghQBBoKP8gaDsC0z47tQ63mjcFxL4UBXZ1RwKvJ
 gFDgRh7qkWbrWS5qkN33PZCWOgzIhJm8qrTdfe4G1lXO2syiqFUMC01+AEIKgARIaW
 1/05O4Qfv8R7DiKtnB9P14gvsMOxk9rMpPDaJG/3tBRDe5nqtIq0wuT9U87t7CtHWe
 W8Z9XBwVEdnJoUVYaZCVrGpYJ3KFCSOk+ft0bpak+KkdlsA+6L0QCJkNM9TpST2LmO
 YpYrFu4nRJeww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LCAHAu0J
Subject: [Buildroot] [PATCH 2/3] package/libqoriq-rcw: new package
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

libqoriq-rcw is a C17 reimplementation of NXP's rcw.py for the
pbiformat=2 QorIQ family (LS1028, LS1088, LS2088, LX2160). It compiles
and decompiles RCW (Reset Configuration Word) binaries used by the
SoC bootrom, and exposes the same functionality as a reusable shared
library + pkg-config + public header.

Built as a host-only meson package with -Dtests=false -Dman=disabled.
The upstream tests/ subdir links libcmocka (only validates library
internals -- never executed by Buildroot), and the man-page step
requires pandoc (heavy Haskell-runtime tool typically absent from
packagers' minimal images). The 'tests' option landed upstream in
v1.0.1, the 'man' feature option in v1.0.2; we pin to v1.0.2.

Depends on host-mcpp for in-process C preprocessor support; the
library uses libmcpp instead of shelling out to gcc -E so that the
preprocessing of .rcw sources is hermetic and self-contained.

Upstream: https://github.com/vjardin/libqoriq-rcw

Signed-off-by: Philippe Nunes <nunes.philippe@free.fr>
---
 DEVELOPERS                             |  1 +
 package/Config.in.host                 |  1 +
 package/libqoriq-rcw/Config.in.host    | 14 +++++++++++++
 package/libqoriq-rcw/libqoriq-rcw.hash |  5 +++++
 package/libqoriq-rcw/libqoriq-rcw.mk   | 27 ++++++++++++++++++++++++++
 5 files changed, 48 insertions(+)
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
diff --git a/package/libqoriq-rcw/Config.in.host b/package/libqoriq-rcw/Config.in.host
new file mode 100644
index 0000000000..42c09ec329
--- /dev/null
+++ b/package/libqoriq-rcw/Config.in.host
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_HOST_LIBQORIQ_RCW
+	bool "host libqoriq-rcw"
+	select BR2_PACKAGE_HOST_MCPP
+	help
+	  C17 reimplementation of NXP's rcw.py as a shared/static
+	  library. Compiles QorIQ/Layerscape Reset Configuration Word
+	  (RCW) sources into binary images for the pbiformat=2 SoC
+	  family (LS1028, LS1088, LS2088, LX2160). Produces
+	  byte-identical output to rcw.py for those SoCs.
+
+	  Used by the host-qoriq-rcw-c CLI for the actual compile,
+	  --dump, --dump-flash, and decompile operations.
+
+	  https://github.com/vjardin/libqoriq-rcw
diff --git a/package/libqoriq-rcw/libqoriq-rcw.hash b/package/libqoriq-rcw/libqoriq-rcw.hash
new file mode 100644
index 0000000000..17a4b5cc10
--- /dev/null
+++ b/package/libqoriq-rcw/libqoriq-rcw.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  6393cc3139068fa362c5f3a9ec4ae915704e4e848278f4eaa3f7cad465ed9b6b  libqoriq-rcw-1.0.2.tar.gz
+
+# Locally calculated
+sha256  30a111209bd81aa8d8c110087bff83ba112f82eb4e42630e5cba46cf0daa21ac  LICENSE
diff --git a/package/libqoriq-rcw/libqoriq-rcw.mk b/package/libqoriq-rcw/libqoriq-rcw.mk
new file mode 100644
index 0000000000..6cbec14969
--- /dev/null
+++ b/package/libqoriq-rcw/libqoriq-rcw.mk
@@ -0,0 +1,27 @@
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
+HOST_LIBQORIQ_RCW_DEPENDENCIES = host-mcpp
+
+# Skip both the cmocka-based unit tests and the pandoc-rendered man
+# page. The tests/ subdir links libcmocka and only validates the
+# library implementation itself (CRC, bit-packing, parse/decompile
+# round-trips); Buildroot never executes them. The man-page step
+# requires pandoc, a heavy Haskell-runtime tool typically absent
+# from packagers' minimal images, and host packages don't install
+# man pages anyway. The 'tests' option landed upstream in v1.0.1,
+# the 'man' feature option in v1.0.2.
+HOST_LIBQORIQ_RCW_CONF_OPTS = -Dtests=false -Dman=disabled
+
+$(eval $(host-meson-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
