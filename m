Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B409C77B61
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 08:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34904404ED;
	Tue, 25 Apr 2023 08:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34904404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQAEWZAHAe8T; Tue, 25 Apr 2023 08:15:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37C7140328;
	Tue, 25 Apr 2023 08:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37C7140328
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9659E1BF32C
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 08:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D1F46080A
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 08:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D1F46080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQioeUnPHxzA for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 08:15:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 657B360741
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 657B360741
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 08:15:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.99,225,1677567600"; d="scan'208";a="222431444"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Apr 2023 01:15:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 25 Apr 2023 01:15:33 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 25 Apr 2023 01:15:31 -0700
To: <buildroot@buildroot.org>
Date: Tue, 25 Apr 2023 09:14:43 +0100
Message-ID: <20230425081444.1441521-2-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425081444.1441521-1-jamie.gibbons@microchip.com>
References: <20230425081444.1441521-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1682410535; x=1713946535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cLk4AkX6dx1ehUZZmsDvd4ERkI/b5ETIZOSRD8OVaJA=;
 b=rWE6agxNH240bZRr9q5uwIrshkvIvxjXAY44qqTbVVuTiq6cpKvu85UL
 K4f2lq7lZWnKlrFVCNHGl1gJBfH4LknxXAvKHnGNn8eRo8aDsyGZiDoUB
 NvIurCDY+j9ESgatBpeVk7k06B2QijzwL+JW6hltKrscLVLCFZa5cRmhM
 zhfVKRxIAarftyeFmO1tro2OjYxH35ixYw9+AaYhK2TgJVE0Dgv6cStVC
 CcOzvFIG+eDllarwlO322Nv43+yzu+Wpn8cBn+jmmwGzBaMkYPVJOpp8o
 jmrsB8vJrtaYFZS1dVau54QqOiDn8OEpJC2/swdCAuPDZ5EnXAOJrQ8uc
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=rWE6agxN
Subject: [Buildroot] [PATCH 1/2] package/microchip-hss-payload-generator:
 add host package
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, Jamie
 Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Buildroot icicle kit configuration uses the Hart Software Service's
(HSS) payload generator tool. This tool creates a formatted payload
image for the HSS zero-stage bootloader on PolarFire SoC, given a
configuration file and a set of ELF binaries. The configuration
file is used to map the ELF binaries or binary blobs to the
individual application harts (U54s). Add the HSS payload generator as a
host package to support this.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Reviewed-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 package/Config.in.host                        |  1 +
 .../Config.in.host                            |  8 +++++++
 .../microchip-hss-payload-generator.mk        | 22 +++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/microchip-hss-payload-generator/Config.in.host
 create mode 100644 package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index dcadbfdfc1..42856c09df 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -58,6 +58,7 @@ menu "Host utilities"
 	source "package/mender-artifact/Config.in.host"
 	source "package/meson-tools/Config.in.host"
 	source "package/mfgtools/Config.in.host"
+	source "package/microchip-hss-payload-generator/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/moby-buildkit/Config.in.host"
 	source "package/mosquitto/Config.in.host"
diff --git a/package/microchip-hss-payload-generator/Config.in.host b/package/microchip-hss-payload-generator/Config.in.host
new file mode 100644
index 0000000000..7e0bbad719
--- /dev/null
+++ b/package/microchip-hss-payload-generator/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR
+	bool "HSS Payload Generator"
+	help
+	  Microchip PolarFire SoC Payload Generator. This tool creates a formatted
+	  payload image for the HSS zero-stage bootloader on PolarFire SoC, given a
+	  configuration file and a set of ELF binaries. The configuration file is
+	  used to map the ELF binaries or binary blobs to the individual application
+	  harts (U54s).
diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
new file mode 100644
index 0000000000..ca5f59e0f1
--- /dev/null
+++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
@@ -0,0 +1,22 @@
+################################################################################
+ #
+ # Microchip Hart Software Services
+ #
+################################################################################
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = v2023.02
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_SITE = $(call github,polarfire-soc,hart-software-services,$(HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION))
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_INSTALL_STAGING = NO
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_INSTALL_TARGET = YES
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE = MIT
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE_FILES = LICENSE.md
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_DEPENDENCIES = host-elfutils host-libyaml
+
+define HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_BUILD_CMDS
+        $(MAKE) -C $(@D)/tools/hss-payload-generator HOST_INCLUDES=-I$(HOST_DIR)/include/ LDFLAGS="$(HOST_LDFLAGS) -Wl,-rpath,$(HOST_DIR)/lib -L$(HOST_DIR)/lib"
+endef
+
+define HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_INSTALL_CMDS
+		$(INSTALL) -D -m 755 $(@D)/tools/hss-payload-generator/hss-payload-generator $(HOST_DIR)/bin/hss-payload-generator
+endef
+
+$(eval $(host-generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
