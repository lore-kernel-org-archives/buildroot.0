Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFB8EA71B3
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 01:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54AB040C88;
	Mon, 20 Apr 2026 01:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAMbpIWcYEmO; Mon, 20 Apr 2026 01:51:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DFA140CFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776649906;
	bh=1UrAq3rhnRlyf488ppUaF2Y2rjCgyHqJA0kRb3y+KdU=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hEiESw9h5RTcnDt5ewCFxVle8f8e1sQZoPhUkfsTw0PuZ1n5FnZFbMSGmqn0K4ejj
	 lb2fe4Ua2ei/iuqoVKnXu/T5PbGOSDZ/LH6Xvg1V5mBrBl30l28oW1BpgEyWyrdDSL
	 ku6szwEOe3R3buANDPEncwjKQFuOMCehLXArD1vWjF6PkF3vgvcoZZ0rDcvdhR6Xkg
	 MKBhJwUfYRNudP8D6wSD+W8VYVmenB/qiklnE+1aSzpY7munxoSz7YBZ2PncQ/dV2/
	 7wWy5CnzyO6fZnrKKTeMI4aUW/mmvNNkarPJejWRbJCw0QzpIRNmsYjESwvZ/C6VL5
	 T832gt6VtsW6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DFA140CFB;
	Mon, 20 Apr 2026 01:51:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05BBC355
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 01:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF47961028
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 01:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5efchNtKJVo for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 01:51:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB63361027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB63361027
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB63361027
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 01:51:43 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488c2690057so23883185e9.0
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 18:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776649901; x=1777254701;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MhoAoh6695YffWAwiN6NIXB9UMw3/o7CgHDZv8Q4gh4=;
 b=mqZAdM/3ovolqNxIxOD/ZSOQELOuv1LDWLKkVOC8Z8EXzXGOtUB1S+bF1nS41SKLU0
 OGlgAlBc6b/ZwX+7b3iggwGnFX3wufS8U60HEQCLUvnbZknulET5TdBawbA4gzharPl9
 zPkpxFSxfx/0+Lp/ouZe/qN6dmm/6w9wbGNL/ojHoHypYjDwsl43g1Tj9ZLuRngLORgR
 XJgEcrvyOoIPObqIfuWCvMQDPdtacvhTWyysvUmYaDgXw6VslK4dSJVczFHCXuevhuri
 aF2stFMssIpmuOX5B6FGHuFLXog8fWSWFcxqSC7pb/qyx/6tDav/fyZKAKqWhkYHBKu5
 f/8g==
X-Gm-Message-State: AOJu0YyKKx/R5L8WPFcuf41voa5kfMBJIpsxnoSVolugCneCp9A6lWzi
 liRvJUAYvTLndqnjAqXY6DWS+2PZhBU02WzwmFiewY5Z/7zrmCIOHYSO
X-Gm-Gg: AeBDieu5+zef2eqLx//y2njP6Jrag9ipMEVwXpmE+wxjGjsf/mLQyf3wJper/o6Z9uO
 rbA5vuiE1OV3Md1ZBJDO2/TXRc/+keg/NpIiW9Mi85IQvrwpBTXuFMHy+gaVggiIgA6qRzp8H6P
 CpZmcxNjELipmH/65ZByKPE/6theA7ywPtKE5jnhAsnw0tN3UhtqAkysDRMnZkQNyQElKon6Zat
 GkHXapeATOk466e2VPEl4J11US9bOtGX1ZHbcWfnxjQG6fLAxXHMwXUtyb00UOu4GywmhY3hYb4
 olHNUkvsQnsAzKXIuSVb2u9v6witDkATW8u/+cCWgngKROjcISMoM8yYH9YoN4Kk8C22rhGk8z+
 qai+SaV4qiipF8WiBI0M9pDIE8nq6TLGs+JNpvQ4QklJ/kHiB/aJPtTQDPNrF9/M0lWW48K0VIY
 R3AlMkFNXIPtmPL5V/x2+Ub2xcF3MQqfkc255xOW1ZYzKt8HDWnoNK2inMNvOz2f+fHVNURG6df
 9ooc3nqc5FKiH6JyD3DmK0GCsxaKxRzhhzA8EnchW1v0T95LRqhsJDxir4TQWDw7PTZMBZxrXZl
 lhlwVb7jcLmFloyvwWbX6hEej85lCcS9TwnZwYmoVGBkVpxsPi+FhgcTPPA1VFbg1OCKYvaneFl
 7cr2tndQxVOX8Z0Q=
X-Received: by 2002:a05:600c:c04a:b0:487:12c:e7e1 with SMTP id
 5b1f17b1804b1-488fb750840mr117072695e9.11.1776649901240; 
 Sun, 19 Apr 2026 18:51:41 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com.
 [86.170.11.80]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891df9e50asm22230925e9.0.2026.04.19.18.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Apr 2026 18:51:40 -0700 (PDT)
From: Christopher Obbard <obbardc@gmail.com>
Date: Mon, 20 Apr 2026 02:51:33 +0100
MIME-Version: 1.0
Message-Id: <20260420-wip-obbardc-add-package-dtui-v4-1-5be457a32cce@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKSG5WkC/43NTQ6CMBCG4auQrq2hQ6HFlfcwLkpn0Ik/kKKoI
 dzdwoq4weX7ZfLMIDoKTJ3YJYMI1HPHzT2G3iTCn939RJIxtoAUcgVKyxe3sqkqF9BLhyhb5y8
 unuHjybIGl3sLpiQEEYk2UM3vmT8cY5+5ezThM3/r1bT+CfdKKmktEtTGWsBif7o5vm59cxMT3
 MMSK1cwiJjRujZFkWqf0y+WLTDIV7AsYlXmU/SWMlJmiY3j+AW3RFw/YgEAAA==
X-Change-ID: 20251214-wip-obbardc-add-package-dtui-f2a5c8279ed2
To: buildroot@buildroot.org
Cc: Christopher Obbard <obbardc@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3976; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=HFgp8fJGEQHahCXqg0w4H/TIab7LiRh+HZ9Q/pmmT1U=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBp5YamcF8I7HAlFnOJrckB71xUS4od2tEAU1Caf
 AFLmQVN4ICJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaeWGpgAKCRBjTcTwaHBG
 +A98D/9wIDWdYbeG/eMDR2gopF9N9caGp/VmK+OMJm8aRXuH596xALedPRv76BWFZGRrUD65tih
 MgRqV8qZwlcmUBW1NB6PjOatVrR2qRM9ue/ahuXlL/ViRsLHovg4ZLMcpV3Ej63F+oRRETr+o0H
 Ibw353uNGcotp0pc3DwYgEe4KLgcuY/+hkntfJMe/N7sWfxogHIaIqRSQL7QliPcJcU5A+TYhtN
 0AHSdqOg5kXuRzTk/g94sEtmEkSlC89Mi+Q4pkOuft6flHiwEv2dAF3tUJ7yaIcx6iMX57aaw9v
 b4Ymrx+gdBSZiil7ZS4ZdPygHL2bB3lj4dsdJK3ohQZf+iV1HZ898nAwjC9sHU3VJc09xh3LBVe
 tjSzaorGMPrxvjhJEo18JT23FWNqLH27PGr0ihs1uCvbMewKXgBok2/rtza3eu44AW3KQL/LgWu
 TDZNCn62Ev18xMTZrZyLnF2N39I27164K+baKDVTaM0uCIFo6m5X3JVMtKQaRCeavEJspSoAD7h
 +z2JiR5CFMQw/Ex3XLHTlj6uobOgKk55PJmIv5P0OcQYU0j7ieQePZN6rK2FjPs2RjsOkAyJYeV
 vjs0bo66HoP1w1vm5OGp6NfNHcfSc6m7arChpTPz1myUntndxfrkOadgoWzZMvio08Bj/HcYsmR
 TH6nxAWMVtui+tA==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776649901; x=1777254701; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MhoAoh6695YffWAwiN6NIXB9UMw3/o7CgHDZv8Q4gh4=;
 b=m8lnL//52g+kfthHLGWGgkwEUlBI2h7+BW+CUbMYgKVSCPywQoaWwrGmRQLwLL5Qm0
 vV8Ruab1iF2N2MWWmJyvaSrtpeuv4um/2AJKudp1DLAw1//WB+eAxtJLePiDFg+7i8LC
 +UlXCNJgVXBTw26pd/czZhiss5PIyXrhl8skA3ZhjvOaej+J3zzdCtJb9z19etR/TG4R
 V5pbmPQQ94UavsBG746RDgUtrrHSA2LHkRZ136hmMkO4vVLqnQFbLDado06nQNYZWCaa
 DFydqpfA+PHzGYOfq4yKNHt503hnmAXVK1qbehiZ1z58is6YVayXLSLaYRmeDZaMo+kD
 ZmKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=m8lnL//5
Subject: [Buildroot] [PATCH v4] package/dtui: new package
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

DTUI is a small TUI for introspecting the state of the system/session
D-Bus. It shows current services and lets you introspect objects and
their interfaces.

This package is built with Rust/Cargo.

Upstream: https://github.com/Troels51/dtui
License: MIT
Signed-off-by: Christopher Obbard <obbardc@gmail.com>
---
Changes in v4:
- Rebase on top of buildroot 2026.02.
- Add extra depends for dbus to Config.in.
- Update description to start with "dbus is ...".
- Link to v3: https://lore.kernel.org/r/20251225-wip-obbardc-add-package-dtui-v3-1-b3c0dc8e3e17@gmail.com

Changes in v3:
- Add prefix "package/" to patch title.
- Chnage upstream version to v3.0.0 (v3.0.1 is unreleased on crates.io).
- Link to v2: https://lore.kernel.org/r/20251219-wip-obbardc-add-package-dtui-v2-1-744f76604c5e@gmail.com

Changes in v2:
- Rebase on latest buildroot master.
- Add entry to DEVELOPERS.
- Remove useless variable DTUI_CARGO_BIN.
- Change upstream tarball filename from dtui-3.0.1.tar.gz to dtui-3.0.1-cargo4.tar.gz.
- Link to v1: https://lore.kernel.org/r/20251214-wip-obbardc-add-package-dtui-v1-1-88de2f7882d6@gmail.com
---
 DEVELOPERS             |  3 +++
 package/Config.in      |  1 +
 package/dtui/Config.in | 13 +++++++++++++
 package/dtui/dtui.hash |  3 +++
 package/dtui/dtui.mk   | 13 +++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..439fa31afb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -697,6 +697,9 @@ F:	package/perl-sys-mmap/
 F:	package/perl-time-parsedate/
 F:	package/perl-x10/
 
+N:	Christopher Obbard <obbardc@gmail.com>
+F:	package/dtui/
+
 N:	Clayton Shotwell <clayton.shotwell@collins.com>
 F:	package/audit/
 F:	package/checkpolicy/
diff --git a/package/Config.in b/package/Config.in
index 371a1c33e1..c0f52cfcf4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2799,6 +2799,7 @@ menu "System tools"
 	source "package/docker-credential-acr-env/Config.in"
 	source "package/docker-credential-gcr/Config.in"
 	source "package/docker-engine/Config.in"
+	source "package/dtui/Config.in"
 	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
diff --git a/package/dtui/Config.in b/package/dtui/Config.in
new file mode 100644
index 0000000000..524407d272
--- /dev/null
+++ b/package/dtui/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_DTUI
+	bool "dtui"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  dtui is a minimal TUI for introspecting the state of the
+	  system/session D-Bus. It shows current services and lets
+	  you introspect objects and their interfaces.
+
+	  https://github.com/Troels51/dtui
diff --git a/package/dtui/dtui.hash b/package/dtui/dtui.hash
new file mode 100644
index 0000000000..18ed484f44
--- /dev/null
+++ b/package/dtui/dtui.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  8ccdf97b0b9e949cff11abf0ed505a409bd04f52161a782707ab15b94f622efb  dtui-3.0.0-cargo4.tar.gz
+sha256  b7b3cd0d92fc6638f0a7bd2306d715c747d040c6d851ed821a45c5538663e57a  LICENSE
diff --git a/package/dtui/dtui.mk b/package/dtui/dtui.mk
new file mode 100644
index 0000000000..fad5f818b4
--- /dev/null
+++ b/package/dtui/dtui.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# dtui
+#
+################################################################################
+
+DTUI_VERSION = 3.0.0
+DTUI_SITE = $(call github,Troels51,dtui,v$(DTUI_VERSION))
+
+DTUI_LICENSE = MIT
+DTUI_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))

---
base-commit: 52ee2f5644da5389634b2465f1dc31deb5a4807c
change-id: 20251214-wip-obbardc-add-package-dtui-f2a5c8279ed2

Best regards,
-- 
Christopher Obbard <obbardc@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
