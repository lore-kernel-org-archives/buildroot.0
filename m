Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885EAC19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 10:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C02BA41511;
	Fri,  7 Mar 2025 10:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_wBli0lSREL; Fri,  7 Mar 2025 10:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A03D41512
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A03D41512;
	Fri,  7 Mar 2025 10:09:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 399D9944
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 10:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B0DD4015F
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 10:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lINjTVV_eenL for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 10:09:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=208.88.110.44;
 helo=mail.savoirfairelinux.com;
 envelope-from=luc.beaufils@savoirfairelinux.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 88CD140025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88CD140025
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88CD140025
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 10:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id BA95A9C8A9C;
 Fri,  7 Mar 2025 05:00:09 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id AYekwLkCHsrB; Fri,  7 Mar 2025 05:00:07 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id C88BC9C8AB3;
 Fri,  7 Mar 2025 05:00:07 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com C88BC9C8AB3
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ggBZ-9W9JzNw; Fri,  7 Mar 2025 05:00:07 -0500 (EST)
Received: from jean.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net
 [80.15.101.118])
 by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 2B31E9C8A9C;
 Fri,  7 Mar 2025 05:00:07 -0500 (EST)
From: Luc BEAUFILS <luc.beaufils@savoirfairelinux.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perrot <thomas.perrot@bootlin.com>,
 Luc BEAUFILS <luc.beaufils@savoirfairelinux.com>
Date: Fri,  7 Mar 2025 10:59:04 +0100
Message-Id: <20250307095904.19075-3-luc.beaufils@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307095904.19075-1-luc.beaufils@savoirfairelinux.com>
References: <20250307095904.19075-1-luc.beaufils@savoirfairelinux.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
 t=1741341607; bh=njshF7kUi2Mc0bkhN0d1mzadfUTFnQIpmKi4vIE00H8=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=P+hHqg6I7QKcxNeUO1/BVoAfp58ZJW5NOodtnTOiyY3sUCU1C7MivWPJ1BtJYcT8v
 yGAw28S/r0TFYT4oFm1HsGZfwsNNmdl0Dr8QpP4NHYtwzFKbXIlhwRzMtgKnemgSN2
 SVKsD4z1mzgUNXCmvKYNEgbCGK4MITOBd3VBNMsAobhv/lQzC6RTAXMrB/HJtVgHkA
 uJzwpUq8rmKp3Rnx+x7YpHIC0GthgznCIboGHMtcSs5JdqYZyoG8ub8VeK0MvR1dYA
 ZBaVwVAxezmU0ccOXNcAptOwi6KF3YooAZX5LSzRUI9FvS9Bb8i5FkaA1Nt6ZAy2or
 0N26tED+90LMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=savoirfairelinux.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=P+hHqg6I
Subject: [Buildroot] [PATCH v2 2/2] package/imx-cst: add new package
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

From: Thomas Perrot <thomas.perrot@bootlin.com>

This package provides i.MX Code Signing Tools uses to sign i.MX
bootloader to enable secure boot (HABv4 and AHAB).

The initial work was done by Thomas Perrot for the 3.3.1+dfsg-2
version. It has been updated to the 3.4.0+dfsg version.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Luc BEAUFILS <luc.beaufils@savoirfairelinux.com>
---
 package/Config.in.host         |  1 +
 package/imx-cst/Config.in.host |  9 ++++++
 package/imx-cst/imx-cst.hash   |  3 ++
 package/imx-cst/imx-cst.mk     | 50 ++++++++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 package/imx-cst/Config.in.host
 create mode 100644 package/imx-cst/imx-cst.hash
 create mode 100644 package/imx-cst/imx-cst.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index bf04f5fa97..f4271d0be8 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -52,6 +52,7 @@ menu "Host utilities"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imagemagick/Config.in.host"
+	source "package/imx-cst/Config.in.host"
 	source "package/imx-mkimage/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jh71xx-tools/Config.in.host"
diff --git a/package/imx-cst/Config.in.host b/package/imx-cst/Config.in.host
new file mode 100644
index 0000000000..b5318aa941
--- /dev/null
+++ b/package/imx-cst/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_IMX_CST
+	bool "host imx-cst"
+	depends on BR2_arm || BR2_aarch64 # Only relevant for i.MX targets
+	help
+	  I.MX code signing tool provides software code signing
+	  support designed that integrate the HABv4 and AHAB
+	  library.
+
+	  https://www.nxp.com/webapp/sps/download/license.jsp?colCode=IMX_CST_TOOL
diff --git a/package/imx-cst/imx-cst.hash b/package/imx-cst/imx-cst.hash
new file mode 100644
index 0000000000..c5c3ced2ac
--- /dev/null
+++ b/package/imx-cst/imx-cst.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  52ee3cee3bc500a42095f73c4584e223b4b9d2dfc1cd3e5df965c5952eba8c8d  imx-code-signing-tool_3.4.0+dfsg.orig.tar.xz
+sha256  c52ee1b0736fa8140742949f310fb084333140b11e8208257ec5446fb10ac776  LICENSE.bsd3
diff --git a/package/imx-cst/imx-cst.mk b/package/imx-cst/imx-cst.mk
new file mode 100644
index 0000000000..a3f1cdf6a4
--- /dev/null
+++ b/package/imx-cst/imx-cst.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# imx-cst
+#
+################################################################################
+
+# debian/3.4.0-dfsg
+IMX_CST_VERSION = 3.4.0+dfsg
+IMX_CST_SOURCE = imx-code-signing-tool_$(IMX_CST_VERSION).orig.tar.xz
+IMX_CST_SITE = https://deb.debian.org/debian/pool/main/i/imx-code-signing-tool
+IMX_CST_LICENSE = BSD-3-Clause
+IMX_CST_LICENSE_FILES = LICENSE.bsd3
+
+HOST_IMX_CST_DEPENDENCIES = host-byacc host-flex host-openssl
+
+ifneq ($(filter %64,$(HOSTARCH)),)
+HOST_IMX_CST_OSTYPE = linux64
+else
+HOST_IMX_CST_OSTYPE = linux32
+endif
+
+HOST_CFLAGS += -Wno-error=unused-result
+
+# We don't use HOST_CONFIGURE_OPTS when building cst, because we need
+# to preserve the CFLAGS/LDFLAGS used by their Makefile.
+define HOST_IMX_CST_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) \
+		OSTYPE=$(HOST_IMX_CST_OSTYPE) \
+		OPENSSL_PATH=$(HOST_DIR)/include/openssl \
+		ENCRYPTION=yes \
+		AR="$(HOSTAR)" \
+		CC="$(HOSTCC)" \
+		LD="$(HOSTCC)" \
+		OBJCOPY="$(HOSTOBJCOPY)" \
+		RANLIB="$(HOSTRANLIB)" \
+		EXTRACFLAGS="$(HOST_CFLAGS) $(HOST_CPPFLAGS)" \
+		EXTRALDFLAGS="$(HOST_LDFLAGS)" \
+		-C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		COPTS="$(HOST_CFLAGS) $(HOST_CPPFLAGS) $(HOST_LDFLAGS)" \
+		-C $(@D)/add-ons/hab_csf_parser
+endef
+
+define HOST_IMX_CST_INSTALL_CMDS
+	$(INSTALL) -D -m 755 $(@D)/code/obj.$(HOST_IMX_CST_OSTYPE)/cst $(HOST_DIR)/bin/cst
+	$(INSTALL) -D -m 755 $(@D)/code/obj.$(HOST_IMX_CST_OSTYPE)/srktool $(HOST_DIR)/bin/srktool
+	$(INSTALL) -D -m 755 $(@D)/add-ons/hab_csf_parser/csf_parser $(HOST_DIR)/bin/csf_parser
+endef
+
+$(eval $(host-generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
