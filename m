Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C544C43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 16:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41B8A605CF;
	Tue,  7 Jul 2026 16:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwHcoGqnRTl0; Tue,  7 Jul 2026 16:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FB56607A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783440646;
	bh=9FzQuR3Hxry2KB6giK81irmav2m6Bi2bwzfwnQG66MI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eO3SWdla7SXt08aZn0ZzF4ylDbAWSKlIQl0h+ZJqb7eYT4jafyY6uFRnDVPZpSnA5
	 2rRyhKa0sEBbsxgLkpVwcNIXkCtItzoS9swsZ6ByUcY+t45DjB8Ma1TDViRfBaf3PW
	 psYnhqv+2jNRgioD3PgW3F5XwV2i1hQuo7MY8d++tHPwhEwZ0W3J0HtbaZTtW5pBd/
	 TSoMFsUeyP2bMumeXevfcLj/89eN9P658bqionSGQqL8HV1tHcmOsVsg63/CaBBbXj
	 rAWSZzkuB9uL3270tXMi9q3dtcDqBzxcb4JkFZMbDup1SCc27hLBhy5X0bhmo0LP7y
	 iR9oMy19CqceA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FB56607A0;
	Tue,  7 Jul 2026 16:10:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3092315
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 16:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D89F56069C
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 16:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wf6Hh43K04DH for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 16:10:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=nunes.philippe@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A9F76082C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A9F76082C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A9F76082C
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 16:10:41 +0000 (UTC)
Received: from pnunes-ThinkPad.proxad.net (unknown [213.228.1.188])
 (Authenticated sender: nunes.philippe@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 01FAC13F854;
 Tue,  7 Jul 2026 18:10:36 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Philippe Nunes <nunes.philippe@free.fr>, Vincent Jardin <vjardin@free.fr>
Date: Tue,  7 Jul 2026 18:10:00 +0200
Message-ID: <20260707161000.629475-4-nunes.philippe@free.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707161000.629475-1-nunes.philippe@free.fr>
References: <20260701121937.346945-1-nunes.philippe@free.fr>
 <20260707161000.629475-1-nunes.philippe@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783440640;
 bh=gVKOIL9qYCBpUuuboLKY+dW1TNEA9PJpKEfnnr3ejlE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K24qf6+k7dyaXertsIQc1182C557wGn6NKm/jzaKq5flsvKha9+Ccgel1RJS+ym0Z
 ok7Ux2jkLH4sJ8vEY96OtaruraGpL67PUX0xw1fCvEzmezGY3TRNtmMu0oSQouVOOE
 wT9fDKb0ZeaQ0axCvypd9EdDTpmGS1pMB21aeKeXKZiZzkE5g5MpupG8XaA93Qq17J
 r+tR6s5exTsZxPh4xMSmn4gAaDiLcSTxu7pyW9eEdNF4Dx93iDTPgzr1CUVgmvtMiC
 SkwkpdOYdwc9PYz4amOew3pIDPXvN+McBpL7ZNS0l+62sSA6ohHBVrF/GMYi3yxsvO
 evUB9gV379q5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K24qf6+k
Subject: [Buildroot] [PATCH v2 3/3] package/qoriq-rcw-c: new package
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
pbiformat=2 QorIQ family (LS1028, LS1088, LS2088, LX2160). Both
host and target variants are built: the target variant provides
recovery modes (--dump / --dump-flash) that need to run on the
board itself.

The "-c" suffix distinguishes this from the existing host-qoriq-rcw
package which wraps NXP's rcw.py reference; the installed binary
is qoriq-rcw.

Upstream: https://github.com/vjardin/qoriq-rcw

Suggested-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Philippe Nunes <nunes.philippe@free.fr>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/Config.in.host               |  1 +
 package/qoriq-rcw-c/Config.in        | 13 +++++++++++++
 package/qoriq-rcw-c/Config.in.host   | 10 ++++++++++
 package/qoriq-rcw-c/qoriq-rcw-c.hash |  4 ++++
 package/qoriq-rcw-c/qoriq-rcw-c.mk   | 22 ++++++++++++++++++++++
 7 files changed, 52 insertions(+)
 create mode 100644 package/qoriq-rcw-c/Config.in
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
diff --git a/package/Config.in b/package/Config.in
index 38563a6520..fe515e46c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -444,6 +444,7 @@ menu "Firmware"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/qoriq-mc-binary/Config.in"
 	source "package/qoriq-mc-utils/Config.in"
+	source "package/qoriq-rcw-c/Config.in"
 	source "package/qoriq-restool/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
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
diff --git a/package/qoriq-rcw-c/Config.in b/package/qoriq-rcw-c/Config.in
new file mode 100644
index 0000000000..86f33f1598
--- /dev/null
+++ b/package/qoriq-rcw-c/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_QORIQ_RCW_C
+	bool "qoriq-rcw-c (C implementation)"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8  # libqoriq-rcw uses C17
+	select BR2_PACKAGE_LIBQORIQ_RCW
+	help
+	  C CLI on top of libqoriq-rcw for the pbiformat=2 SoC family
+	  (LS1028, LS1088, LS2088, LX2160). Compiles RCW sources into
+	  binary images and provides recovery modes on live hardware.
+
+	  https://github.com/vjardin/qoriq-rcw
+
+comment "qoriq-rcw-c needs a toolchain w/ gcc >= 8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/qoriq-rcw-c/Config.in.host b/package/qoriq-rcw-c/Config.in.host
new file mode 100644
index 0000000000..f531e0b797
--- /dev/null
+++ b/package/qoriq-rcw-c/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_QORIQ_RCW_C
+	bool "host qoriq-rcw-c (C implementation)"
+	select BR2_PACKAGE_HOST_LIBQORIQ_RCW
+	help
+	  C CLI on top of libqoriq-rcw for the pbiformat=2 SoC family
+	  (LS1028, LS1088, LS2088, LX2160). Avoids pulling in host
+	  Python (the host-qoriq-rcw package wraps NXP's rcw.py Python
+	  reference).
+
+	  https://github.com/vjardin/qoriq-rcw
diff --git a/package/qoriq-rcw-c/qoriq-rcw-c.hash b/package/qoriq-rcw-c/qoriq-rcw-c.hash
new file mode 100644
index 0000000000..95353df2dc
--- /dev/null
+++ b/package/qoriq-rcw-c/qoriq-rcw-c.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  977d501752045533fa725fe93e6e21b8cbbdf118da8944a939e9932ee1160529  qoriq-rcw-1.0.1.tar.gz
+# Locally calculated
+sha256  30a111209bd81aa8d8c110087bff83ba112f82eb4e42630e5cba46cf0daa21ac  LICENSE
diff --git a/package/qoriq-rcw-c/qoriq-rcw-c.mk b/package/qoriq-rcw-c/qoriq-rcw-c.mk
new file mode 100644
index 0000000000..395bc37984
--- /dev/null
+++ b/package/qoriq-rcw-c/qoriq-rcw-c.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# qoriq-rcw-c
+#
+################################################################################
+
+QORIQ_RCW_C_VERSION = 1.0.1
+QORIQ_RCW_C_SITE = $(call github,vjardin,qoriq-rcw,v$(QORIQ_RCW_C_VERSION))
+QORIQ_RCW_C_SOURCE = qoriq-rcw-$(QORIQ_RCW_C_VERSION).tar.gz
+
+QORIQ_RCW_C_LICENSE = BSD-3-Clause
+QORIQ_RCW_C_LICENSE_FILES = LICENSE
+
+QORIQ_RCW_C_DEPENDENCIES = libqoriq-rcw
+HOST_QORIQ_RCW_C_DEPENDENCIES = host-libqoriq-rcw
+
+# skip the pandoc-rendered man page (pandoc requires a full Haskell runtime)
+QORIQ_RCW_C_CONF_OPTS = -Dman=disabled
+HOST_QORIQ_RCW_C_CONF_OPTS = -Dman=disabled
+
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
