Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC299CA0EFF
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 17:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 004AA607F5;
	Sat, 30 Aug 2025 17:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CN8q1FUwMt0t; Sat, 30 Aug 2025 17:33:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4BA4607E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4BA4607E7;
	Sat, 30 Aug 2025 17:33:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E37C7D2
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 17:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5B5740785
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 17:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kqc_wgCoSjOv for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 17:33:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DAA9840899
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAA9840899
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAA9840899
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 17:33:48 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45b6f4d2c87so3020345e9.3
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 10:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756575226; x=1757180026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ncaODfT/qwBHMqbhcvdTj8/AwRpCzOSiOKnltInQgAs=;
 b=whNKxo0KDsm77qLUkJjVl2m7FeAF6sP3U33Ebajudk4vB+4lo5aOlhhzy4GHh+RGlj
 FvQORrzskcs/3ke0z8Apb55zZed8jrQtPjrZ2e2ONM8LiuU3QTvften6cdh3ek6peDju
 6yGdFQXCfnwZz8SwxPH0C2X5cnkKJHvWU5/r3avs6X9w0G5i8g20by71dUVMbHxHAgXB
 FwVpEv3yFI+dOM09odj9h/TQWEk41VFS1T5cVG8j/hPT5Jqud1WdGuvNYPJ3GY4ygjbx
 1eMb6vE6V6Amgv+3szMHwDodjKLcQWLAR+mhCxJfXhgNT2o13o1n4BVsh1Holl8qPnAs
 tRRw==
X-Gm-Message-State: AOJu0YwTOUhKY4nkeQTaX2dXWRT3nVLKMSqM7xAyg9tvfP8WDRnkN/u6
 tkIvaxQlmPIW9pP6cIFjxrazpSCKCrpB+VJM8TaRBbaQWvE1CzdZ9CA4RBB4sA==
X-Gm-Gg: ASbGncvKMYCP4y8AiyalbGaz234r8lQoEwCBx50ToXBx3Qao3I6EJJQkBeDImALvTaU
 cdZXOnqRKkZ0NbX+rtVmtZyfX93BJW4wqipYF0rWBAx/Hvffl4cpIZ65v8T01ltPgiN/whRvCYa
 0YawKk1g10iiFCQCUMgA18bZZZcZhmW30tvf+DiCz2KWJ1ril1RL4mQtA7JKW/uXtp02t+eESgb
 IOYawE/MnIF5YmmLl9Fg6G++vaef/k7/W5oZezPLsHrlNffKsYnBRrYFFs0QEn2NUCGBsIRtz/H
 qHYPp1339M2KQ1aLQ7AHXArKUKPvyOLjDMO6+OLCbMpmuOtMU5kczEdDWxzHOyVHio6eEvhFUqn
 1qaVHFpY2KQS3uan8pPMOx/Ir3cEjlVLQ7weGegji6g==
X-Google-Smtp-Source: AGHT+IEWnfFlhmz7HEB1WGoqjgn+HA59mq1muIGoFjS2MVmYE9H4LJyvpMVSwfnlzuT2rzk1rqkNIw==
X-Received: by 2002:a05:600c:6992:b0:458:bc3f:6a93 with SMTP id
 5b1f17b1804b1-45b81eb0a99mr21380195e9.2.1756575226107; 
 Sat, 30 Aug 2025 10:33:46 -0700 (PDT)
Received: from skbuf.lan ([2a02:2f04:d005:3b00:1070:b6c0:5550:91d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6b99sm166708545e9.4.2025.08.30.10.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Aug 2025 10:33:45 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sat, 30 Aug 2025 20:33:12 +0300
Message-ID: <20250830173313.164981-2-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830173313.164981-1-olteanv@gmail.com>
References: <20250830173313.164981-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756575226; x=1757180026; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ncaODfT/qwBHMqbhcvdTj8/AwRpCzOSiOKnltInQgAs=;
 b=df8n+CrhzoouhhmLTclC0n1iezGRw7AWRivkfG5Bq8dSFZcyYIhmIan5rcbHlYhCpu
 dpLs6SFUxClaYstNY0t/uukqgJSkBmHr6Im1ERh5zBUxsf1ksB67GkeGZvLlUYE45ewM
 JXDoIT2MVuKIjC5G7fXFO9he+n3qFH3oEkecYGLiZtL26nXxa0KBd4nrNJ735MfDNk3v
 qcUUyFJWjYr7APC5HIfyuTrsfZ+Z2EyMiau+TfwTE2Ck71CRfB/6v9VFa2LZBV3ompjN
 Eq7La5Rc5/l+cmzwU5WAfzzElQGuT8bclYILTJV0Y/xAoCRlo/yqQFQWBPz/HM8bfP43
 DXzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=df8n+Crh
Subject: [Buildroot] [PATCH v4 1/2] package/qoriq-restool: new package
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

We integrate the master branch, which is effectively the
lf-6.12.20-2.0.0 release tag, plus some extra fixups specifically made
for the Buildroot integration:
- commit b44748ed0bb3 ("Avoid use of non-portable __WORDSIZE when
  defining BITS_PER_LONG")
- commit b4a734f3512b ("restool: fix format string for 64 bit time_t in
  parse_obj_command()")

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
---
v3->v4:
- integrate upstream patches which fix musl builds and 64-bit time_t on
  32-bit
- fix _LICENSE_FILES variable (it is named LICENSE, not COPYING) and its
  hash
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
index 87a26b43888d..cd46cec92824 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3435,6 +3435,7 @@ F:	package/qoriq-ddr-phy-binary/
 F:	package/qoriq-firmware-inphi/
 F:	package/qoriq-mc-binary/
 F:	package/qoriq-mc-utils/
+F:	package/qoriq-restool/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index 1c4dcf2c7576..d4678d7f0e2b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -597,6 +597,7 @@ endmenu
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
index 000000000000..72a34473f21e
--- /dev/null
+++ b/package/qoriq-restool/qoriq-restool.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  2879f14c9dd810e92d4c51c7f1a3e6705a5a585c2445e507f63e39872ac6237d  qoriq-restool-lf-6.12.20-2.0.0-3-gb44748e.tar.gz
+sha256  ddc794a75f11c3bd01015f16b9776064a894015e7a1603541283ccbc2e1c3a40  LICENSE
diff --git a/package/qoriq-restool/qoriq-restool.mk b/package/qoriq-restool/qoriq-restool.mk
new file mode 100644
index 000000000000..52a622f70e03
--- /dev/null
+++ b/package/qoriq-restool/qoriq-restool.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# qoriq-restool
+#
+################################################################################
+
+QORIQ_RESTOOL_VERSION = lf-6.12.20-2.0.0-3-gb44748e
+QORIQ_RESTOOL_SITE = $(call github,nxp-qoriq,restool,$(QORIQ_RESTOOL_VERSION))
+QORIQ_RESTOOL_LICENSE = BSD-3-Clause or GPL-2.0-or-later
+QORIQ_RESTOOL_LICENSE_FILES = LICENSE
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
