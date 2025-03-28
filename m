Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20803C36013
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4DF0834DE;
	Fri, 28 Mar 2025 18:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ylLFXq04VuXu; Fri, 28 Mar 2025 18:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3C3782CFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3C3782CFD;
	Fri, 28 Mar 2025 18:05:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C0931B8
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF85380D04
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bRjQP3P1Y4Kv for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:05:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54A1080CCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54A1080CCB
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54A1080CCB
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:05:03 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43d64e6c83eso2577555e9.0
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185101; x=1743789901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HEhx8sN6f+8kN+S0+LKR5cjGhgxTiA1SgwpelTjYLgI=;
 b=VHmCpEFfBpYZlIcNMt6I+sZf64EebfGxJw+TV0vwj5t536pog7uFAEBa0L4JjjJ6IN
 TLFoQRQ8QwXc91HosY1QpyD33Co1uVH8k+b9MnGOK2XJqZ3WMqvKkJA0dRBYWmT+Y0/j
 kdPQPS7CiddTXdbXg3U03tLaSzTWQO7bNZDpvcjjusiVubJRO45Lmu/NmPSoWiaBYjWR
 sq1SlscZ7l0tQsuQwNJi93/kFgx/NBntm5m8w7P7cQgRIeYR+u2ZuIm86qI9qQJV0/CZ
 i36CAvRgyHVTRd+XpZSCzQkPIQAywH2JVGjktGRyw4j7BKkhFQmd+Dc4SkezdXJzotWM
 WYyw==
X-Gm-Message-State: AOJu0Yz+7vIgB0D1pTPJ0Z0E7pqXz0EkjI0zrPVI199AJ5C4wflVJ7QR
 hIPbP6JfPhwQ+NxcvsKC7lmBlVQ4MMgJML2Yx696lrIa40Evcriat4MloIAu
X-Gm-Gg: ASbGncvQvxyU5237FatLE3MtxzmDQLX+c1kruJa9pdu6ftySwSGCSRkVlxsW21iQrMk
 V42jngnTgExHj9aEOSfTYNdq4VDfY9WpCrRzoUB+mDbDvYsXL1LlluAyfJZv3lmX/6MMQgLQXtx
 usMDgFsP4VAEpL39tQnBK+yPtPWi1lF//Q46PcwoqyXF04RJere3jWXLf6Zvygwy3ote3NwU+uS
 lU1+QSTVyz2tEMHmlnoQ+t8EVcpFZJtXM48ZqOn2WoGg2fXo3XG+wDwGypg2kgb4VZYsbjRhk0U
 Kfh0lwSdiYjtNzBzutKDjwLYVqLMIoce2o6cGauRKIPVJooJ
X-Google-Smtp-Source: AGHT+IEx17r8TyBBWDe8ApOO8ecVs6Mrep3IakJXWeNTCXMN6iGqfQmm3JEu8no+PnC6aiSLU4AB1g==
X-Received: by 2002:a05:600c:1ca9:b0:439:88bb:d00b with SMTP id
 5b1f17b1804b1-43db8516c5emr1910065e9.5.1743185100742; 
 Fri, 28 Mar 2025 11:05:00 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:04:59 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:24 +0200
Message-ID: <20250328180427.3434693-17-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180427.3434693-1-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185101; x=1743789901; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HEhx8sN6f+8kN+S0+LKR5cjGhgxTiA1SgwpelTjYLgI=;
 b=BqVJR7wJzw1m89AwpnbZkywWMOAgfqEo6OosobgrkPM7hMXPtQwNknz6fxJzPACOgp
 UrYzV11nX+GJ2nHYGjPkccztOh5XtuYbajp2/Amxk/w1ZXHi8oYPjxigb47ZSMIBoCu2
 /biYmOybiQtXtTTMKiXruLC2pdirOW+uAfW446K0HJRf2E6r1RskBgC9n6LFRP34eVoQ
 N8qRO7TGGBDj85y0F+nu35iCNrpk8C3xVEaRO3hM0zw3oX6bP0hwgz90DdTCkrUipNIf
 j2/LuMf/0ufPRp7N5tvfzcUQJd2ASsLnaW0qEiJQMBk3NNz7oum1bIQLwc3zg9ZPX7Mz
 9txg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BqVJR7wJ
Subject: [Buildroot] [PATCH v2 16/18] package/qoriq-restool: new package
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Introduce a package for the restool program, which permits the user to
modify the network configuration of the DPAA2 subsystem and create one
that is adequate to their use case.

We integrate the master branch, which is the lf-6.12.3-1.0.0 tag plus
commit 14a9058c772b ("manpage: it should be optional"). It was pointed
out on previous patch submissions that the "make install" target also
converts man pages from Markdown to groff using pandoc, and apart from
the fact that Buildroot doesn't want manpages, pandoc is also too heavy
to drag into the build system. So that feedback was considered valid and
the patch is included here via upstream.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
---
v1->v2: integrate a patch from Vincent

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
index cd67a04b2961..4288172e8670 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3373,6 +3373,7 @@ N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
 F:	package/qoriq-mc-binary/
 F:	package/qoriq-mc-utils/
+F:	package/qoriq-restool/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index 754c9e76c26c..40b4bb5307ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -593,6 +593,7 @@ endmenu
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
index 000000000000..1081be2f5b1f
--- /dev/null
+++ b/package/qoriq-restool/qoriq-restool.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  75c8cf7192eb54f50ff59047931a9b3210aade5d25d25c027a11eb7e659e8b21  qoriq-restool-14a9058c772b7b556e756ad8fd62a6762cde58df.tar.gz
+sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-restool/qoriq-restool.mk b/package/qoriq-restool/qoriq-restool.mk
new file mode 100644
index 000000000000..23ea9c7e310f
--- /dev/null
+++ b/package/qoriq-restool/qoriq-restool.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# qoriq-restool
+#
+################################################################################
+
+QORIQ_RESTOOL_VERSION = 14a9058c772b7b556e756ad8fd62a6762cde58df
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
