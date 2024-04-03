Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9279DCD1294
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 09:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BC6D8208D;
	Wed,  3 Apr 2024 09:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fi5t_fkE1o_O; Wed,  3 Apr 2024 09:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E4018208F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E4018208F;
	Wed,  3 Apr 2024 09:21:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AD971BF271
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75A4A820A3
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MvBybOai1cbS for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 09:21:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 86D2C82087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86D2C82087
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86D2C82087
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 09:21:53 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 0E1CBC3F1A
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 09:21:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F27D8FF808;
 Wed,  3 Apr 2024 09:21:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 11:14:39 +0200
Message-ID: <20240403091952.653698-2-thomas.bonnefille@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403091952.653698-1-thomas.bonnefille@bootlin.com>
References: <20240403091952.653698-1-thomas.bonnefille@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712136106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=01tybVtU5oT/hGzgeTAQ7NEQ2tJeH1L3IvlP4slTkJk=;
 b=nVlGj6chs7tDOb5TBmyyS0l5HN5CTxHnqkhGMByvDfv0FAxmLwhOuhMMCMpN8k9Z1u4Mvs
 lpQv2eymyNWPe4DewF6tA/d1oqIxG+VQwOMTNNh1zdqnrpAmJ0rIcx3eTTyqcAdKxRWj6C
 elz8qhxfcLW29w84I6eDleuNLAkubI74vWsoKEROdUYfWz/Yc+uJovO56YzBNXZWbWt7QX
 4//W3s32twb2T4xS0mgy3+pl8BSkIFi/Xlc5zmTmnZpQUYHC6lDK+bdljyWnOdXZBayHYx
 UbFFNWh8uOOmMvE5Kd/2pUTCLhvOuBk9Jkpvh3ot/HJF/wBaXEQCODMVPc1hMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nVlGj6ch
Subject: [Buildroot] [PATCH 1/2] package/starfive_spltool: new package
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new package for the Starfive SPL tool. It is used to
add header to the Secondary Program Loader for board based on the
Starfive JH7110 SoC.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 DEVELOPERS                                    |  3 +++
 package/Config.in.host                        |  1 +
 package/starfive-spltool/Config.in.host       |  8 ++++++++
 .../starfive-spltool.hash                     |  2 ++
 package/starfive-spltool/starfive-spltool.mk  | 20 +++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/starfive-spltool/Config.in.host
 create mode 100644 package/starfive-spltool/JH7110_VF2_515_v5.11.3/starfive-spltool.hash
 create mode 100644 package/starfive-spltool/starfive-spltool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6b38db0857..b8ec27f623 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2953,6 +2953,9 @@ N:	Thijs Vermeir <thijsvermeir@gmail.com>
 F:	package/ranger/
 F:	package/x265/
 
+N:	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+F:	package/starfive-spltool/
+
 N:	Thomas Claveirole <thomas.claveirole@green-communications.fr>
 F:	package/fcgiwrap/
 F:	package/openlayers/
diff --git a/package/Config.in.host b/package/Config.in.host
index 9543a22ffc..986b2854d0 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -107,6 +107,7 @@ menu "Host utilities"
 	source "package/sentry-cli/Config.in.host"
 	source "package/sloci-image/Config.in.host"
 	source "package/squashfs/Config.in.host"
+	source "package/starfive-spltool/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
 	source "package/swugenerator/Config.in.host"
diff --git a/package/starfive-spltool/Config.in.host b/package/starfive-spltool/Config.in.host
new file mode 100644
index 0000000000..afb2777ca6
--- /dev/null
+++ b/package/starfive-spltool/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_STARFIVE_SPLTOOL
+	bool "host starfive-spltool"
+	depends on BR2_riscv
+	help
+	  Add header to the Secondary Program Loader with the 3rd party
+	  software given by Starfive-Tech for their SoCs.
+
+	  https://github.com/starfive-tech/soft_3rdpart/tree/JH7110_VisionFive2_devel/spl_tool
diff --git a/package/starfive-spltool/JH7110_VF2_515_v5.11.3/starfive-spltool.hash b/package/starfive-spltool/JH7110_VF2_515_v5.11.3/starfive-spltool.hash
new file mode 100644
index 0000000000..55835de310
--- /dev/null
+++ b/package/starfive-spltool/JH7110_VF2_515_v5.11.3/starfive-spltool.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  f5466225021fbe4e983cc85f32ce11d92ad30689b18e0d1390d16f6bfab74477  starfive-spltool-JH7110_VF2_515_v5.11.3.tar.gz
diff --git a/package/starfive-spltool/starfive-spltool.mk b/package/starfive-spltool/starfive-spltool.mk
new file mode 100644
index 0000000000..559df35074
--- /dev/null
+++ b/package/starfive-spltool/starfive-spltool.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# starfive-spltool
+#
+################################################################################
+
+STARFIVE_SPLTOOL_VERSION = JH7110_VF2_515_v5.11.3
+STARFIVE_SPLTOOL_SITE = $(call github,starfive-tech,soft_3rdpart,$(STARFIVE_SPLTOOL_VERSION))
+STARFIVE_SPLTOOL_LICENSE = GPL-2.0+
+STARFIVE_SPLTOOL_FILES = spl_tool/LICENSE
+
+define HOST_STARFIVE_SPLTOOL_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)/spl_tool
+endef
+
+define HOST_STARFIVE_SPLTOOL_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/spl_tool/spl_tool $(HOST_DIR)/bin/spl_tool
+endef
+
+$(eval $(host-generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
