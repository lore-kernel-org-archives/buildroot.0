Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E3EEB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 12:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AA1682324;
	Wed, 12 Jul 2023 12:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AA1682324
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CCwyBnYQtXtk; Wed, 12 Jul 2023 12:52:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2352182871;
	Wed, 12 Jul 2023 12:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2352182871
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1960B1BF3C1
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 12:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E62A9409EA
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 12:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E62A9409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6PGeDuADN6Pm for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 12:52:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B78C40150
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B78C40150
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 12:52:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="161006287"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jul 2023 05:52:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 12 Jul 2023 05:52:01 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 12 Jul 2023 05:51:59 -0700
To: <buildroot@buildroot.org>
Date: Wed, 12 Jul 2023 13:51:53 +0100
Message-ID: <20230712125154.1361000-2-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
References: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1689166350; x=1720702350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ks7LVJL/qk/g/zK8MGCFUixLqA7zrxe5QF93m0pFPxg=;
 b=pbuxoWAafTp5+V3j/AMLtPysTx2Cw6d66+XbC8PhgZiwQNrqCu+WxBPU
 t8rZlKOZH0RAgYduHqKAu/lJp935KIP5/U1VuJ/uS4WNxuQf96P3M+zqE
 JYycs9sdnydzGvfjXhHaw6149svgawMDOWfDKmWMlWLy0U5un4mGGlLxV
 k4gbkEJ0LRn8RtQc+tp8vWuArCdXnaQUBza4nGvcqNwgrD6WmIpplYuvy
 lqJTfbyEXOFP1T2phCs+lxPVFWYT9BAiyHThmoJA1lhOTurMJKf8j0cmy
 04K8t/G1399B716LqPKAee7kvEopiDnKFipVicCasQPLJEnEjCkTsY1hW
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=pbuxoWAa
Subject: [Buildroot] [PATCH v3 1/2] package/microchip-hss-payload-generator:
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
 DEVELOPERS                                    |  3 +++
 package/Config.in.host                        |  1 +
 .../Config.in.host                            | 11 ++++++++
 .../microchip-hss-payload-generator.mk        | 25 +++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/microchip-hss-payload-generator/Config.in.host
 create mode 100644 package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0918e9f721..2f039a2405 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1459,6 +1459,9 @@ F:	package/pangomm/
 F:	package/rpm/
 F:	package/yad/
 
+N:	Jamie Gibbons <jamie.gibbons@microchip.com>
+F:	package/microchip-hss-payload-generator
+
 N:	Jan Heylen <jan.heylen@nokia.com>
 F:	package/opentracing-cpp/
 
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
index 0000000000..6584692729
--- /dev/null
+++ b/package/microchip-hss-payload-generator/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR
+	bool "host microchip-hss-payload-generator"
+	help
+	  Microchip PolarFire SoC Payload Generator. This tool creates a
+	  formatted payload image for the HSS zero-stage bootloader on
+	  PolarFire SoC, given a configuration file and a set of ELF
+	  binaries. The configuration file is used to map the ELF
+	  binaries or binary blobs to the individual application harts
+	  (U54s).
+
+	  https://github.com/polarfire-soc/hart-software-services.git
diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
new file mode 100644
index 0000000000..df62e121e7
--- /dev/null
+++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# microchip-hss-payload-generator
+#
+################################################################################
+
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2023.06
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_SITE = $(call github,polarfire-soc,hart-software-services,v$(HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION))
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE = MIT
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE_FILES = LICENSE.md
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_DEPENDENCIES = host-elfutils host-libyaml host-openssl
+
+define HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_BUILD_CMDS
+	$(MAKE) -C $(@D)/tools/hss-payload-generator \
+		HOST_INCLUDES="$(HOST_CPPFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)"
+endef
+
+define HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_INSTALL_CMDS
+	$(INSTALL) -D -m 755 \
+		$(@D)/tools/hss-payload-generator/hss-payload-generator \
+		$(HOST_DIR)/bin/hss-payload-generator
+endef
+
+$(eval $(host-generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
