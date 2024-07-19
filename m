Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C2FC3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 07:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15A4060E8D;
	Fri, 19 Jul 2024 07:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1UG5IlkRL7T; Fri, 19 Jul 2024 07:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3B2960A47
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3B2960A47;
	Fri, 19 Jul 2024 07:05:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1108F1BF575
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 07:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 092CB81F6C
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 07:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnlZ3R42c0VL for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 07:05:01 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 19 Jul 2024 07:05:01 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8CD5A81DF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CD5A81DF5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.45;
 helo=esa6.hgst.iphmx.com; envelope-from=prvs=923d17285=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CD5A81DF5
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 07:05:01 +0000 (UTC)
X-CSE-ConnectionGUID: lbdksKP8TuaoKL41lU8z9A==
X-CSE-MsgGUID: 2uYoZT0LQZak1epw2ceIrg==
X-IronPort-AV: E=Sophos;i="6.09,220,1716220800"; d="scan'208";a="22253796"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Jul 2024 14:57:55 +0800
IronPort-SDR: 669a0090_ekQlQzefsMfWzK/VWCz20UPwle90Irc1tDWJ8vR1LuiIqzP
 a1LfnQpwGRfAsHt2ukdGngbKSk5egQuL5SRcXKA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2024 22:58:40 -0700
WDCIronportException: Internal
Received: from unknown (HELO fedora.wdc.com) ([10.225.165.83])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Jul 2024 23:57:53 -0700
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 16:48:33 +1000
Message-ID: <20240719064832.3106137-2-wilfred.mallawa@wdc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1721372701; x=1752908701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HsmoD/w9CNLcs+JGnqdTQFvWE6KD15rxCRIUncThews=;
 b=q16gJl4jtyGk3hif0V5WLC/YcS6kBfe0Mys++4FC/vnPkJgN53GHT/Is
 RIN3ACl+zcgEL8Bwv5RoXea2p1XkKntTs0ZAq/bG0q1Y/UwX4xo4p8MwA
 k+4sO60XPm7IZ+DnYbAhRchN7LarQaiwhEcntGFg0IGb+rd+dFIM2a/if
 E4Gk7bmlvf6WyNKPbzQ2kdojUeLeNWSzuG9fxPQ9zIz/NJcDFWqNdiepV
 ybf9cCzus2A51KL4NLf8A7FEjOrMD0f+xXPYb29lz/9GIy2s7R7ENfs05
 CJ9/B0Y0JmNYLdTv1KGXIkYDLQUub+sXXPW8KiGLmM1qHD77nYWcwwvY6
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=q16gJl4j
Subject: [Buildroot] [PATCH v3 1/1] package/spdm-utils: new package
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
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@wdc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Wilfred Mallawa <wilfred.opensource@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
Changes in V3:
	- Added `host-clang` as an `spdm-utils` dependency
		- `spdm-utils` uses the `bindgen` crate that requires
		  libclang.
	- Remove Python3 (it is not required)
	- Copy SPDM certificates/manifest and scripts to `usr/share/spdm`
	- Use less verbose syntax for copying
	- Update `spdm-utils.hash` to work with the new Cargo
	  infrastructure.
	- Update `spdm-utils` to latest release.
		- This means the certificates source paths have slightly
		  changed since V2.

 DEVELOPERS                         |  4 +++
 package/Config.in                  |  1 +
 package/spdm-utils/Config.in       | 24 +++++++++++++
 package/spdm-utils/spdm-utils.hash |  2 ++
 package/spdm-utils/spdm-utils.mk   | 55 ++++++++++++++++++++++++++++++
 5 files changed, 86 insertions(+)
 create mode 100644 package/spdm-utils/Config.in
 create mode 100644 package/spdm-utils/spdm-utils.hash
 create mode 100644 package/spdm-utils/spdm-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c4f1565edd..582aabd071 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -151,6 +151,7 @@ F:	board/sifive/
 F:	boot/opensbi/
 F:	configs/hifive_unleashed_defconfig
 F:	package/libspdm/
+F:	package/spdm-utils/
 F:	package/xen/
 
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
@@ -3280,6 +3281,9 @@ F:	package/uclibc/
 F:	package/uclibc-ng-test/
 F:	support/testing/tests/package/test_ruby.py
 
+N:	Wilfred Mallawa <wilfred.opensource@gmail.com>
+F:	package/spdm-utils/
+
 N:	Will Newton <will.newton@gmail.com>
 F:	package/enchant/
 F:	package/erlang/
diff --git a/package/Config.in b/package/Config.in
index f2e10b2b5e..eaf05f76b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2739,6 +2739,7 @@ comment "Utilities"
 	source "package/screen/Config.in"
 	source "package/screenfetch/Config.in"
 	source "package/sexpect/Config.in"
+	source "package/spdm-utils/Config.in"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
 	source "package/time/Config.in"
diff --git a/package/spdm-utils/Config.in b/package/spdm-utils/Config.in
new file mode 100644
index 0000000000..074d453cbf
--- /dev/null
+++ b/package/spdm-utils/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_SPDM_UTILS
+	bool "spdm-utils"
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-clang
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_LIBSPDM
+	help
+	  SPDM-Utils is a Linux application designed to support,
+	  test and develop SPDM requesters and responders.
+	  SPDM-Utils uses libspdm as the backend to perform SPDM
+	  communication. SPDM-Utils currently supports the
+	  PCIe Data Object Exchange (DOE) Capability.
+
+	  https://github.com/westerndigitalcorporation/spdm-utils
+
+comment "spdm-utils needs udev /dev management"
+	depends on BR2_PACKAGE_LIBSPDM_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_HAS_UDEV
+
+comment "spdm-utils requires host gcc >= 7"
+	depends on !BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/spdm-utils/spdm-utils.hash b/package/spdm-utils/spdm-utils.hash
new file mode 100644
index 0000000000..0f923b6ad0
--- /dev/null
+++ b/package/spdm-utils/spdm-utils.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  2816ff5ed5f27d565708441259ba295b32ae1ed3fe1366730e76f7bedde5e783  spdm-utils-0.6.0-cargo2.tar.gz
diff --git a/package/spdm-utils/spdm-utils.mk b/package/spdm-utils/spdm-utils.mk
new file mode 100644
index 0000000000..4cec71fb1c
--- /dev/null
+++ b/package/spdm-utils/spdm-utils.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# spdm-utils
+#
+################################################################################
+
+SPDM_UTILS_VERSION = 0.6.0
+SPDM_UTILS_SITE = $(call github,westerndigitalcorporation,spdm-utils,v$(SPDM_UTILS_VERSION))
+SPDM_UTILS_LICENSE = Apache-2.0 or MIT
+SPDM_UTILS_DEPENDENCIES = udev host-clang pciutils libspdm
+
+# Note that we also copy `setup_certs.sh` and `generate_certs.sh`.
+# `setup_certs.sh` shall be used by a responder to regenerate it's mutable
+# certificate chain. `generate_certs.sh` can be used to generate a new
+# certificate chain, which maybe useful in testing and development.
+SPDM_UTILS_CERT_SCRIPTS = \
+		generate_certs.sh \
+		setup_certs.sh
+
+SPDM_UTILS_ALIAS_CERTS = \
+		openssl.cnf \
+		slot0/immutable.der \
+		slot0/device.cert.der \
+		slot0/device.der \
+		slot0/device.key \
+		slot0/bundle_responder.certchain.der
+
+# Used to generate SPDM Device Alias certificate model certificates,
+# required by `setup_certs.sh`
+SPDM_UTILS_GENERIC_CERTS = \
+		slot0/param.pem \
+		slot0/end_requester.req \
+		slot0/end_requester.key \
+		slot0/end_responder.key \
+		slot0/end_responder.req
+
+define SPDM_UTILS_INSTALL_CERTS
+	$(foreach f,$(SPDM_UTILS_CERT_SCRIPTS),
+		$(INSTALL) -D -m 0755 $(@D)/certs/$(f) $(TARGET_DIR)/usr/share/spdm/certs/$(f)
+	)
+	$(INSTALL) -D -m 0644 $(@D)/certs/openssl.cnf $(TARGET_DIR)/usr/share/spdm/certs/$(f)
+
+	$(foreach f,$(SPDM_UTILS_ALIAS_CERTS),
+		$(INSTALL) -D -m 0644 $(@D)/certs/alias/$(f) $(TARGET_DIR)/usr/share/spdm/certs/alias/$(f)
+	)
+
+	$(foreach f,$(SPDM_UTILS_GENERIC_CERTS),
+		$(INSTALL) -D -m 0644 $(@D)/certs/$(f) $(TARGET_DIR)/usr/share/spdm/certs/$(f)
+	)
+	$(INSTALL) -D -m 0644 $(@D)/manifest/manifest.out.cbor $(TARGET_DIR)/usr/share/spdm/manifest/manifest.out.cbor
+endef
+
+SPDM_UTILS_POST_INSTALL_TARGET_HOOKS += SPDM_UTILS_INSTALL_CERTS
+
+$(eval $(cargo-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
