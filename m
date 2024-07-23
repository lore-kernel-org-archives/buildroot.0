Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58974C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 02:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA4D9605F4;
	Tue, 23 Jul 2024 02:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1d1FmM_vXTym; Tue, 23 Jul 2024 02:38:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C62D86071D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C62D86071D;
	Tue, 23 Jul 2024 02:38:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2000E1BF489
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 02:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18031810CE
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 02:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8mZouAN8BCY for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 02:38:33 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 23 Jul 2024 02:38:32 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE5778108C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE5778108C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=9275aa34a=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE5778108C
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 02:38:32 +0000 (UTC)
X-CSE-ConnectionGUID: SPtmQM8uTUOzCUNDSz62Tw==
X-CSE-MsgGUID: GkySRuWlQAaGpP6s9f6A1Q==
X-IronPort-AV: E=Sophos;i="6.09,229,1716220800"; d="scan'208";a="22404034"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jul 2024 10:31:25 +0800
IronPort-SDR: 669f0815_kIstTvpG3aSjUvwRduDlT6wngixvPY1Ti2aZ97J0Psd4qiW
 1WzKH3Y7FKTwHI8sytEMFJIq/g/kR6JUV/+BtNw==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jul 2024 18:32:05 -0700
WDCIronportException: Internal
Received: from unknown (HELO fedora.wdc.com) ([10.225.165.90])
 by uls-op-cesaip02.wdc.com with ESMTP; 22 Jul 2024 19:31:22 -0700
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 12:26:24 +1000
Message-ID: <20240723022623.37350-2-wilfred.mallawa@wdc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1721702313; x=1753238313;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ISWe0cqBkI6jwLZYg3LcCiDlrLnMoFdClW9h27CmaLM=;
 b=Vw3B39cEDa0Zt+Mxnhf6OPagr93pgXmdPwfx/jrS/iYm1Z4tdDGdNqs7
 /eA1y9CWy6INKkbS7+Z4MQVHECYvFNEWPk7uAI/iVBZGhfDPREQ+9+QOz
 5hzJCG90o9iepG5fUqE7joM+fZ+70O91Em7IlISoyVJPC2nY6y+bRRuUk
 J6muLONB59C0hFGXJKMLkVlKiusobr9rZ9XvF9kHXdNKkWR5lucXkZWW2
 8WmC/WJub7YR5s/vQDkuNqfGbP557FTvRKKegvuQHt+FQ6+fGga+Fgvpo
 fXa5FVXxjvhrCe/C2l24mdx4ZKSGVXE1zMNMJ8M4csK+QVmIKpQUpYijw
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=Vw3B39cE
Subject: [Buildroot] [PATCH v4 1/1] package/spdm-utils: new package
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
Changes in V2 -> V4
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
	- Added `ruby` as a host dependency
	- SPDM-Utils requires the `cbor-diag` ruby gem to be available
	  on the host, ensure it is installed in `HOST_DIR/usr/bin`.
		- NOTE: I'm not sure if there's a better way to install
		  this? had to use `check-package DoNotInstallToHostdirUsr` to
		  omit `check-package warning`
	- Updates DEVELOPERS list
	- No longer copy `generate_certs.sh` script, it is not required.

 DEVELOPERS                         |  4 ++
 package/Config.in                  |  1 +
 package/spdm-utils/Config.in       | 24 ++++++++++++
 package/spdm-utils/spdm-utils.hash |  2 +
 package/spdm-utils/spdm-utils.mk   | 61 ++++++++++++++++++++++++++++++
 5 files changed, 92 insertions(+)
 create mode 100644 package/spdm-utils/Config.in
 create mode 100644 package/spdm-utils/spdm-utils.hash
 create mode 100644 package/spdm-utils/spdm-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3650321d6f..dade9385f6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -151,6 +151,7 @@ F:	board/sifive/
 F:	boot/opensbi/
 F:	configs/hifive_unleashed_defconfig
 F:	package/libspdm/
+F:	package/spdm-utils/
 F:	package/xen/
 
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
@@ -3288,6 +3289,9 @@ F:	package/uclibc/
 F:	package/uclibc-ng-test/
 F:	support/testing/tests/package/test_ruby.py
 
+N:	Wilfred Mallawa <wilfred.opensource@gmail.com>
+F:	package/spdm-utils/
+
 N:	Will Newton <will.newton@gmail.com>
 F:	package/enchant/
 F:	package/erlang/
diff --git a/package/Config.in b/package/Config.in
index a0d78518b6..cfc22ef8ca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2740,6 +2740,7 @@ comment "Utilities"
 	source "package/screen/Config.in"
 	source "package/screenfetch/Config.in"
 	source "package/sexpect/Config.in"
+	source "package/spdm-utils/Config.in"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
 	source "package/time/Config.in"
diff --git a/package/spdm-utils/Config.in b/package/spdm-utils/Config.in
new file mode 100644
index 0000000000..a2ea4d7f2e
--- /dev/null
+++ b/package/spdm-utils/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_SPDM_UTILS
+	bool "spdm-utils"
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-clang, host-ruby
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
index 0000000000..706c69ef5b
--- /dev/null
+++ b/package/spdm-utils/spdm-utils.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# spdm-utils
+#
+################################################################################
+
+SPDM_UTILS_VERSION = 0.6.0
+SPDM_UTILS_SITE = $(call github,westerndigitalcorporation,spdm-utils,v$(SPDM_UTILS_VERSION))
+SPDM_UTILS_LICENSE = Apache-2.0 or MIT
+SPDM_UTILS_DEPENDENCIES = udev host-clang host-ruby pciutils libspdm
+SPDM_UTILS_CBOR_DIAG_VERSION = 0.8.7
+
+SPDM_UTILS_ALIAS_CERTS = \
+		openssl.cnf \
+		slot0/immutable.der \
+		slot0/device.cert.der \
+		slot0/device.der \
+		slot0/device.key \
+		slot0/bundle_responder.certchain.der
+
+# Used to generate SPDM Alias certificate model certificates,
+# required by `setup_certs.sh`
+SPDM_UTILS_GENERIC_CERTS = \
+		slot0/param.pem \
+		slot0/end_requester.req \
+		slot0/end_requester.key \
+		slot0/end_responder.key \
+		slot0/end_responder.req
+
+# SPDM-Utils expects the following certificates to be present for SPDM
+# functionality, make sure they are all copied.
+#
+# `setup_certs.sh` shall be used by a responder to regenerate it's mutable
+# certificate chain, typically on start up.
+define SPDM_UTILS_INSTALL_CERTS
+	$(INSTALL) -D -m 0755 $(@D)/certs/setup_certs.sh $(TARGET_DIR)/usr/share/spdm/certs/setup_certs.sh
+	$(INSTALL) -D -m 0644 $(@D)/certs/openssl.cnf $(TARGET_DIR)/usr/share/spdm/certs/openssl.cnf
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
+# SPDM-Utils uses the `cbor-diag` ruby gem to encode/decode SPDM measurement
+# manifests. It is checked at compile time by SPDM-Utils, as such it must
+# be available in the host environment.
+# `--bindir` allows the respective  binaries to be placed at the specified path.
+define SPDM_UTILS_INSTALL_CBOR_DIAG
+	# check-package DoNotInstallToHostdirUsr
+	$(HOST_DIR)/bin/gem install -v $(SPDM_UTILS_CBOR_DIAG_VERSION) --bindir $(HOST_DIR)/usr/bin cbor-diag
+endef
+
+SPDM_UTILS_POST_INSTALL_TARGET_HOOKS += SPDM_UTILS_INSTALL_CERTS
+SPDM_UTILS_PRE_BUILD_HOOKS += SPDM_UTILS_INSTALL_CBOR_DIAG
+
+$(eval $(cargo-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
