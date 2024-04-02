Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CECC6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 03:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C305D60A40;
	Tue,  2 Apr 2024 03:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGuBYhP2YysJ; Tue,  2 Apr 2024 03:53:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B282D60A43
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B282D60A43;
	Tue,  2 Apr 2024 03:53:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 389021BF288
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 03:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24FF360A43
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 03:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mExGmR_gsIF for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 03:53:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.45;
 helo=esa6.hgst.iphmx.com; envelope-from=prvs=815b40e96=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B827A60A40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B827A60A40
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B827A60A40
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 03:53:09 +0000 (UTC)
X-CSE-ConnectionGUID: 58UDKn+yQ5qTG7E1c7TXTg==
X-CSE-MsgGUID: zdZS4/TlSmasS3WCLB/Zlw==
X-IronPort-AV: E=Sophos;i="6.07,173,1708358400"; d="scan'208";a="13008791"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2024 11:53:08 +0800
IronPort-SDR: 0gaffesMhqNRVlibzYY7AnFlAVHuAxWXvPPXT2p8FR/EY8kesouBicpfT4yl8rW7Wsf/PNT+rq
 xJudFd6T7zDw==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Apr 2024 20:01:45 -0700
IronPort-SDR: iHi/M/g20ha3typ8aSoOPeqgreVZqarWteMvMZGGo3a5Tl4WLxllARit769I18H+RtuNhgMZit
 2NkPyppTKlmQ==
WDCIronportException: Internal
Received: from unknown (HELO fedora.wdc.com) ([10.225.165.103])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Apr 2024 20:53:06 -0700
To: buildroot@buildroot.org
Date: Tue,  2 Apr 2024 13:51:41 +1000
Message-ID: <20240402035140.71770-2-wilfred.mallawa@wdc.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1712029989; x=1743565989;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zzz8ZGS7bwig2MVKS8C2KwjzQd3HUr127AJwWRTn730=;
 b=aijXQF5D0N3ZpOf1jn2SBLsa400Ue39+0L7Wx7WyXNnBBbz8LK2tZkZ4
 lg9N9QvwB9WuJ73eP0mzqHdftq4Kd+BPRyZ702OSaOUbXOAc9MHuSpt2b
 ElSEG8RGJiHrf+cF0tj0kDb9BxCcJgFTvL264eboYmCYof4cDHV3zNNlW
 gH3blxueX7LckBd3yrXBRhDjwmIq8N29z1mjms4vUrtLv5re4W72DmQyx
 k1xRjUEpEI/0kh+GznlG5TKhhf8qcySkZV9kwMCgPk+gkrWlJzAfA7sNO
 pwugkJzL8tq66BHd5U40tcMNB855s03f7VhGDqrT3qtuJ2COxAFBGCG5S
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=aijXQF5D
Subject: [Buildroot] [PATCH v2 1/1] package/spdm-utils: new package
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
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>, alistair.francis@wdc.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
Changes in V2:                                                   
        - Added required python3 dependencies
        - Now depends on `udev` instead of selecting `eudev`
        - Now depends on `libspdm`
        - Hook define moved below the hook, stylistically similar to
            other packages
        - Removed cargo package re-vendoring as we aren't patching
        - Changed certificate/manifest installation path to be system wide.

 package/Config.in                  |  1 +
 package/spdm-utils/Config.in       | 24 ++++++++++++++++++++
 package/spdm-utils/spdm-utils.hash |  2 ++
 package/spdm-utils/spdm-utils.mk   | 36 ++++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 package/spdm-utils/Config.in
 create mode 100644 package/spdm-utils/spdm-utils.hash
 create mode 100644 package/spdm-utils/spdm-utils.mk

diff --git a/package/Config.in b/package/Config.in
index 410fe0f493..9572a884e7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2698,6 +2698,7 @@ comment "Utilities"
 	source "package/screen/Config.in"
 	source "package/screenfetch/Config.in"
 	source "package/sexpect/Config.in"
+	source "package/spdm-utils/Config.in"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
 	source "package/time/Config.in"
diff --git a/package/spdm-utils/Config.in b/package/spdm-utils/Config.in
new file mode 100644
index 0000000000..b96365451f
--- /dev/null
+++ b/package/spdm-utils/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_SPDM_UTILS
+	bool "spdm-utils"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on BR2_USE_WCHAR # eudev
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_MMU # eudev
+	depends on !BR2_STATIC_LIBS  # python3
+	depends on BR2_USE_MMU  # eudev, python3
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_LIBSPDM
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_EUDEV
+	select BR2_PACKAGE_PYTHON3
+	help
+	  SPDM-Utils is a Linux application designed to support,
+	  test and develop SPDM requesters and responders.
+	  SPDM-Utils uses libspdm as the backend to perform SPDM
+	  communication. SPDM-Utils currently supports the
+	  PCIe Data Object Exchange (DOE) Capability.
+
+	  https://github.com/westerndigitalcorporation/spdm-utils
diff --git a/package/spdm-utils/spdm-utils.hash b/package/spdm-utils/spdm-utils.hash
new file mode 100644
index 0000000000..aaa243315e
--- /dev/null
+++ b/package/spdm-utils/spdm-utils.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  3f06f087220b126262a2becf68c9e06a59d8d613816f82a168c81093de087d1a  spdm-utils-0.3.0.tar.gz
diff --git a/package/spdm-utils/spdm-utils.mk b/package/spdm-utils/spdm-utils.mk
new file mode 100644
index 0000000000..4176f61871
--- /dev/null
+++ b/package/spdm-utils/spdm-utils.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# spdm-utils
+#
+################################################################################
+
+SPDM_UTILS_VERSION = 0.3.0
+SPDM_UTILS_SITE = $(call github,westerndigitalcorporation,spdm-utils,v$(SPDM_UTILS_VERSION))
+SPDM_UTILS_LICENSE = Apache-2.0 or MIT
+SPDM_UTILS_DEPENDENCIES += pciutils libspdm openssl udev
+
+# Note that we also copy `setup_certs.sh` and `generate_certs.sh`.
+# `setup_certs.sh` shall be used by a responder to regenerate it's mutable
+# certificate chain. `generate_certs.sh` can be used to generate a new
+# certificate chain, which maybe useful in testing and development.
+define SPDM_UTILS_INSTALL_CERTS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/local/spdm_certs
+	cp -r $(@D)/certs/generate_certs.sh $(TARGET_DIR)/usr/local/spdm_certs
+	cp -r $(@D)/certs/openssl.cnf $(TARGET_DIR)/usr/local/spdm_certs
+	cp -r $(@D)/certs/setup_certs.sh $(TARGET_DIR)/usr/local/spdm_certs
+
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/local/spdm_certs/slot0
+	cp $(@D)/certs/slot0/immutable.der $(TARGET_DIR)/usr/local/spdm_certs/slot0
+	cp $(@D)/certs/slot0/device.cert.der $(TARGET_DIR)/usr/local/spdm_certs/slot0
+	cp $(@D)/certs/slot0/device.der $(TARGET_DIR)/usr/local/spdm_certs/slot0
+	cp $(@D)/certs/slot0/device.key $(TARGET_DIR)/usr/local/spdm_certs/slot0
+	cp $(@D)/certs/slot0/param.pem $(TARGET_DIR)/usr/local/spdm_certs/slot0
+	cp $(@D)/certs/slot0/bundle_responder.certchain.der $(TARGET_DIR)/usr/local/spdm_certs/slot0
+
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/local/spdm_manifest/
+	cp $(@D)/manifest/manifest.out.cbor $(TARGET_DIR)/usr/local/spdm_manifest/
+endef
+
+SPDM_UTILS_POST_INSTALL_TARGET_HOOKS += SPDM_UTILS_INSTALL_CERTS
+
+$(eval $(cargo-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
