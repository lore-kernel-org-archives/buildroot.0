Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F15CCA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06E73416D8;
	Mon, 11 Aug 2025 16:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XO2tPT_0TZe; Mon, 11 Aug 2025 16:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 262B0416DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 262B0416DA;
	Mon, 11 Aug 2025 16:56:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5A3E154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABE9061491
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ab5PbzBlj8Bs for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:56:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7376B61490
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7376B61490
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7376B61490
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:09 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-af94440f4ecso74455966b.1
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754931367; x=1755536167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MP8vFYBh1iheBK/pPLESPhv3+Ja4HL8ebfio7QGvD1I=;
 b=lDv7xnM1NH+txCeE/DTHWd5oHkFQ1zwptSZVafgzgW4yHuxsBITok6OzybMwSA89Nq
 n0u7B/t7REnYOjMh1FXDdoC9TSQzGnGKjuf/iIROvUi7LYbIjAxr1DFMOyKpOCbpf03D
 K9jyV/GGMf5PJLaXHlitaZAFbxnhgc4dCyx8wJvefm4uv9qpzCrmkviwhPRSAfngq9NR
 YF+Hw6oFMAv4FjTfV5x4PyO0/mO0k1Yx7ToFTg8ARfsCOvFQpne6EZjTAPYaFxrz+xFz
 O3ohxsdZ8tQ8n1UTpDGCKzhZnH87QjBE1E48R+mm8awobYRChdYDF8tlgH7EKmFpqELt
 RWrg==
X-Gm-Message-State: AOJu0YyJMKdT/wSjUlUP8Y7sV7GXItot18iHcdJkraIfduwdY7/voOHF
 dCkth2taUsE0doquE7naaXIr6F9j4XyTSFJg35noOCpIiDMpXQcDOAtLovtRdw==
X-Gm-Gg: ASbGncszrSBxTl+n+Ygt1w2ocZ4c5923f6Ax7HafpWKWElDzk0KcAHvZNAfHZmug4Xr
 BmxwrjFVmBC9h4/9Vw5ikKRrQZey4m65iKHpFY9+ynze7IREFf+DvtlX7/Yju/Qa+NgiqWiSu53
 dmO/iizGAuCx05cvioUuB4Cq0rMga6OwvwK64Y73r5AhD5FBpos3ChB2Ey5fbLUAayzhZ5V5LlI
 E7NFSWtyvSTdn7xTf/94O7xoMofK1izsa2JFpMlDKC3xFTwXCAtY6MZ4PwW/mSlFNE6PSXQ6Tr5
 upjyZDRKm/Qd2Eq0U4Kwl02R4IsCwSV61jY5uO4IAB5lYGOputh06E8HmofNL0GoGw18IhcPCNh
 PBU6G4rRFERTf9rfZdPA=
X-Google-Smtp-Source: AGHT+IHSP9Q2Dvepi9vPHlWSBj2ih5268rNd3JK4wxKJ35OzGPIQsSHiyOcJKSAoSEr9CLv9LK/t8g==
X-Received: by 2002:a17:907:3d05:b0:adb:2ce8:686a with SMTP id
 a640c23a62f3a-af9deb0eff0mr368669466b.12.1754931366835; 
 Mon, 11 Aug 2025 09:56:06 -0700 (PDT)
Received: from skbuf.lan ([2a02:2f04:d005:3b00:15ff:6865:527:c8f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766e2sm2044629166b.27.2025.08.11.09.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:56:05 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Arnout Vandecappelle <arnout@mind.be>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 11 Aug 2025 19:55:30 +0300
Message-ID: <20250811165531.1533913-11-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811165531.1533913-1-olteanv@gmail.com>
References: <20250811165531.1533913-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754931367; x=1755536167; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MP8vFYBh1iheBK/pPLESPhv3+Ja4HL8ebfio7QGvD1I=;
 b=ExjYYUgFTFkUky5BTJWqCC/JrhnIExWGfs2YVYs7m11APfz3AgLfqMnU+5oPmHSSWu
 XmwhsPbVVZiCSKg8epxHPS5MQlylWairnWvZ1oXnHn/m3L1TfE7AjrMCmq9n31jCl4nS
 ZIut4ghWZHkxtkgxprn5GUAMaprVpD8tpBm+nnG8OC2bn3qxqpsGqF82anCffl4S5LZi
 oV37zk3+TnpfsFLaTyGsHNgv0vpgm0BkUzMBAbK9A31TOClhUCbKHvTC/4+1UjBwXkJh
 1AloSyJtKE/g5puTB06Uwf7C8kMfMXIfjj00LWd0ui7OTSZu5gUA5v4zg3E8G0Px5VGS
 WxYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ExjYYUgF
Subject: [Buildroot] [PATCH v3 10/11] package/qoriq-restool: new package
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

Introduce a package for the restool program, which permits the user to
modify the network configuration of the DPAA2 subsystem and create one
that is adequate to their use case.

We integrate the lf-6.12.20-2.0.0 release tag, which contains some extra
fixups specifically made for the Buildroot integration:
- commit 14a9058c772b ("manpage: it should be optional"): It was pointed
  out on previous patch submissions that the "make install" target also
  converts man pages from Markdown to groff using pandoc, and apart from
  the fact that Buildroot doesn't want manpages, pandoc is also too
  heavy to drag into the build system. So that feedback was considered
  valid and the patch is included here via upstream.
- commit 6d6b9d8c200c ("dpdmux: remove unused dpdmux_create_options
  array") addresses a build error
- commit 66d941a0160d ("Adapt BITS_PER_LONG and GENMASK() definitions
  for 32-bit compatibility") addresses a build error on 32-bit builds
- commit 8f73f2600111 ("Print 64-bit counters using PRIu64 from
  inttypes.h") addresses a build error on 32-bit builds

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
---
v2->v3: integrate upstream a patch which fixes 32-bit builds
v1->v2: integrate upstream a patch from Vincent which avoids building
        man pages

 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/qoriq-restool/Config.in          | 22 +++++++++++++++++++++
 package/qoriq-restool/qoriq-restool.hash |  3 +++
 package/qoriq-restool/qoriq-restool.mk   | 25 ++++++++++++++++++++++++
 5 files changed, 52 insertions(+)
 create mode 100644 package/qoriq-restool/Config.in
 create mode 100644 package/qoriq-restool/qoriq-restool.hash
 create mode 100644 package/qoriq-restool/qoriq-restool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 12a41597afb0..1b5b3e87ea04 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3432,6 +3432,7 @@ F:	package/qoriq-ddr-phy-binary/
 F:	package/qoriq-firmware-inphi/
 F:	package/qoriq-mc-binary/
 F:	package/qoriq-mc-utils/
+F:	package/qoriq-restool/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index 137f74ed82ce..ccf76af1cc21 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -598,6 +598,7 @@ endmenu
 	source "package/pru-software-support/Config.in"
 	source "package/pulseview/Config.in"
 	source "package/qoriq-cadence-dp-firmware/Config.in"
+	source "package/qoriq-restool/Config.in"
 	source "package/raspi-gpio/Config.in"
 	source "package/rdma-core/Config.in"
 	source "package/read-edid/Config.in"
diff --git a/package/qoriq-restool/Config.in b/package/qoriq-restool/Config.in
new file mode 100644
index 000000000000..dbe0934d4dd3
--- /dev/null
+++ b/package/qoriq-restool/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_QORIQ_RESTOOL
+	bool "qoriq-restool"
+	help
+	  The DPAA2 architecture in Layerscape SoCs consists of
+	  networking resources that can be assembled into various
+	  nuggets of functionality, called "objects" (DPMAC, DPNI,
+	  DPDMUX, DPSW etc), by the Management Complex (MC) firmware.
+
+	  The MC firmware reads a file called Data Path Layout (DPL)
+	  which describes the set of networking objects it should
+	  create statically, at boot time.
+
+	  The restool program is able to talk to the Management
+	  Complex at runtime and permits the dynamic reconfiguration
+	  of networking objects, as well as saving the current
+	  configuration into a new DPL file. Without the restool
+	  program, the only possible networking configuration is
+	  that specified in the boot-time DPL file.
+
+	  https://github.com/nxp-qoriq/restool
+	  # sign in required
+	  https://www.nxp.com/webapp/Download?colCode=DPAA2UM
diff --git a/package/qoriq-restool/qoriq-restool.hash b/package/qoriq-restool/qoriq-restool.hash
new file mode 100644
index 000000000000..5e11f60d0e74
--- /dev/null
+++ b/package/qoriq-restool/qoriq-restool.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  efc3c21c04adef30d7903e6ce4923ca085dad7e53351ce21b6bfafd681ae8674  qoriq-restool-lf-6.12.20-2.0.0.tar.gz
+sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-restool/qoriq-restool.mk b/package/qoriq-restool/qoriq-restool.mk
new file mode 100644
index 000000000000..2e02e00cdb1c
--- /dev/null
+++ b/package/qoriq-restool/qoriq-restool.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# qoriq-restool
+#
+################################################################################
+
+QORIQ_RESTOOL_VERSION = lf-6.12.20-2.0.0
+QORIQ_RESTOOL_SITE = $(call github,nxp-qoriq,restool,$(QORIQ_RESTOOL_VERSION))
+QORIQ_RESTOOL_LICENSE = BSD-3-Clause or GPL-2.0-or-later
+QORIQ_RESTOOL_LICENSE_FILES = COPYING
+
+QORIQ_RESTOOL_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
+	CROSS_COMPILE="$(TARGET_CROSS)"
+
+define QORIQ_RESTOOL_BUILD_CMDS
+	cd $(@D) && $(TARGET_MAKE_ENV) $(MAKE) $(QORIQ_RESTOOL_MAKE_OPTS)
+endef
+
+define QORIQ_RESTOOL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) MANPAGE="" $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
+		prefix=/usr install
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
