Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30925E77180
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 14:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90CF940719;
	Sun,  8 Dec 2024 14:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yUBUWbeJY5O2; Sun,  8 Dec 2024 14:38:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13F7D406CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13F7D406CA;
	Sun,  8 Dec 2024 14:38:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E53B5979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBCF081BC5
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNNHBAVV-aau for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:38:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A21A881BB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A21A881BB4
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A21A881BB4
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:31 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa551d5dd72so64041066b.3
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 06:38:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733668709; x=1734273509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QzacwWNkIb2TlKDI34zEAKqLPu/oPCxJVUafJ6+whQM=;
 b=PD4aRZgXlCIdc1HekazH3tFWVnvltVt4XxigPK0JuoR6j6P7N5jwlrUdl/dQNUwnBL
 bK9m/05GBCGAAHU8C7F46KI06NUg2K28wINWVp1lMhibLWEJKqFhIJ+jaiFO/eaN4eA8
 3gYZU0lhfHda8FUH1o6y3wwXUqZAnvaP/KYHCVjWAMgtVd+ofjtA/2qnsJcr3gvoMj4U
 FxYx/5EZ5FHr4c3ywtWKBeo9IvSJLCnJik21VNXCkq5JvZtFSppZYvb2BpiF9hdnx373
 X5GCHvy8wPJbPLPIENqX/w60x6vI6rcJJWn/j649tFq/7KN0R53VtbjGYc1am5WY6CM5
 ciaw==
X-Gm-Message-State: AOJu0YzPQc5yLaxIMrX/ruY6EfEEaVJz6hY/Vq3fJQ5pHo6oW2VVO+9o
 hyt53iqUC49rUhV34pxSJA5Uud9+gaovFu1gGQEFEcFY9nKqHlKIVZJtxQ==
X-Gm-Gg: ASbGncvDjdOT1EPLggm0PzjkHbqJY4rnB7paFof2kw1iz1c6/PN/KEiU2eZv8bYmKMU
 AIxPHY2i5nD4SEg3VFMiHuPojzWqHmBaDsnZmiXfs9m9GhsMOErxntFRFJKA717+zc9paBOO6vy
 QmA0uO7WnaXxuk1kdVxWwmZi4CXaB/XI1bGgnJ0q/NM+snegzuzzhBdV43T8tIyjsor8UUe4oaW
 Bc1v6IEZSiMYGHhyW1RIGd54MdRetapjnuIvuASJ+I=
X-Google-Smtp-Source: AGHT+IGIhXnZ1+sq/C4vmS9q4x4sz8Dx4E/9WaIQvngDRKEicdGaHagvgms1ZhkpfK0wyQnI/+npFw==
X-Received: by 2002:a17:907:3fa8:b0:a9a:8216:2f4d with SMTP id
 a640c23a62f3a-aa639fa5dfamr341064566b.3.1733668709142; 
 Sun, 08 Dec 2024 06:38:29 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa666cf5743sm204660366b.65.2024.12.08.06.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 06:38:28 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sun,  8 Dec 2024 16:37:55 +0200
Message-ID: <20241208143802.1048266-5-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208143802.1048266-1-olteanv@gmail.com>
References: <20241208143802.1048266-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733668709; x=1734273509; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QzacwWNkIb2TlKDI34zEAKqLPu/oPCxJVUafJ6+whQM=;
 b=UAIlhhArifytjPON22AlAKSQLoY0oUjKEZLuju+6HU/yWllm/A1f6Gcki6zgeZjPNM
 WivHtHpcEacuDxf/LUVkzlnA+YYZ8/hwGH7fmsBWYnlITv3mvmXXUWNsF6h3VBxLVLP9
 A6nVMQK3C+JPhV5PyqIBhGKbAOdF5gh031m6ueUfV6bIY7/kBpqJhObhaLyU2684YhD9
 ZEctmMWUw2aJdKMSf75tbWyHNy/QgWL67PwEJE9aBzPK3240JN5dvF40dK0BLJW0jwrs
 DiTrD7OHEeeMIL3vrdATkUTgKe7zHjmQ/83MDi4B5TTT4uNxq8vRj98uI43u+PuIdqwL
 hiQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UAIlhhAr
Subject: [Buildroot] [PATCH v2 04/11] package/qoriq-mc-utils: new package
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

The configuration files for the MC firmware binary are distributed
through a separate repository on GitHub, and need a different package.
They are licensed differently than the firmware itself, and unlike the
firmware, they are customizable.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: none

 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/qoriq-mc-utils/Config.in           | 35 ++++++++++++++++++++++
 package/qoriq-mc-utils/qoriq-mc-utils.hash |  3 ++
 package/qoriq-mc-utils/qoriq-mc-utils.mk   | 22 ++++++++++++++
 5 files changed, 62 insertions(+)
 create mode 100644 package/qoriq-mc-utils/Config.in
 create mode 100644 package/qoriq-mc-utils/qoriq-mc-utils.hash
 create mode 100644 package/qoriq-mc-utils/qoriq-mc-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 68c8af0ddc15..44628db3bef5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3304,6 +3304,7 @@ F:	configs/ts5500_defconfig
 N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
 F:	package/qoriq-mc-binary/
+F:	package/qoriq-mc-utils/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index 36337834f284..52b28871e96d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -457,6 +457,7 @@ menu "Firmware"
 	source "package/qoriq-ddr-phy-binary/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/qoriq-mc-binary/Config.in"
+	source "package/qoriq-mc-utils/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
diff --git a/package/qoriq-mc-utils/Config.in b/package/qoriq-mc-utils/Config.in
new file mode 100644
index 000000000000..bb45ffbc9ca7
--- /dev/null
+++ b/package/qoriq-mc-utils/Config.in
@@ -0,0 +1,35 @@
+config BR2_PACKAGE_QORIQ_MC_UTILS
+	bool "qoriq-mc-utils"
+	help
+	  The Management Complex (MC) is a key component of the networking
+	  subsystem named DPAA2 (Data Path Acceleration Architecture, second
+	  version) in some NXP Layerscape SoCs.
+
+	  The MC firmware is configured through two distinct files named DPL
+	  and DPC, which are customizable by the end user. Example
+	  configuration files for NXP reference boards are distributed through
+	  this package, and are frequently patched to produce the configuration
+	  required in other scenarios.
+
+	  https://github.com/nxp-qoriq/mc-utils
+	  https://www.nxp.com/webapp/Download?colCode=DPAA2UM # sign in required
+
+if BR2_PACKAGE_QORIQ_MC_UTILS
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_DPC
+	string "Data Path Configuration (DPC) file"
+	help
+	  The DPC file contains the settings defining the behavior of the MC
+	  firmware. Its source code follows the device tree syntax and is
+	  compiled to a device tree blob, which is the file that must be
+	  specified here.
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_DPL
+	string "Data Path Layout (DPL) file"
+	help
+	  The DPL file contains a description of the initial networking objects
+	  created by the MC firmware when it boots. Its source code follows the
+	  device tree syntax and is compiled to a device tree blob, which is
+	  the file that must be specified here.
+
+endif
diff --git a/package/qoriq-mc-utils/qoriq-mc-utils.hash b/package/qoriq-mc-utils/qoriq-mc-utils.hash
new file mode 100644
index 000000000000..f0234b9d1ff8
--- /dev/null
+++ b/package/qoriq-mc-utils/qoriq-mc-utils.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  1d3f4a6b2661cff9cfb5d4fcba3b181eb6febdd88a127fa069e306f51d778fc5  qoriq-mc-utils-10.39.0.tar.gz
+sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-mc-utils/qoriq-mc-utils.mk b/package/qoriq-mc-utils/qoriq-mc-utils.mk
new file mode 100644
index 000000000000..d4fc5e27385e
--- /dev/null
+++ b/package/qoriq-mc-utils/qoriq-mc-utils.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# qoriq-mc-utils
+#
+################################################################################
+
+QORIQ_MC_UTILS_VERSION = 10.39.0
+QORIQ_MC_UTILS_SITE = $(call github,nxp-qoriq,mc-utils,mc_release_$(QORIQ_MC_UTILS_VERSION))
+QORIQ_MC_UTILS_LICENSE = BSD-3-Clause
+QORIQ_MC_UTILS_INSTALL_IMAGES = YES
+QORIQ_MC_UTILS_INSTALL_TARGET = NO
+
+define QORIQ_MC_UTILS_BUILD_CMDS
+	$(MAKE) -C $(@D)/config/
+endef
+
+define QORIQ_MC_UTILS_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D $(@D)/config/$(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPC)) $(BINARIES_DIR)/dpc.dtb
+	$(INSTALL) -D $(@D)/config/$(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPL)) $(BINARIES_DIR)/dpl.dtb
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
