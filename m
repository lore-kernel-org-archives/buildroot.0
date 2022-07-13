Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CEAC43334
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 16:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B21E8409E7;
	Wed, 13 Jul 2022 16:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B21E8409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cgn_FHzR1Q_z; Wed, 13 Jul 2022 16:33:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A98D1405AE;
	Wed, 13 Jul 2022 16:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A98D1405AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A302E1BF35B
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 16:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 793BC41975
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 16:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 793BC41975
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I8thFhoBX04T for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 16:33:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CA5C41902
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CA5C41902
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 16:33:38 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-10bec750eedso14676012fac.8
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 09:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IxsS5F8gFCXIqs75Ll8dVS8DXsqJoOi30gpS9kFoJNU=;
 b=sLcgYnegY10JMJ9BoCyt1IBOAmKGDZwGtOKM/CGHnDMyqjHmsb4l4sHrLOxbw3GZll
 QT1EmfBQL62621XCH6a1MRv4KpWL0pyP3D1T0h6xkKvT85jPsBPnf2ZjDxjnEKLAZ6J6
 QK5ccmQRTJLpc1q/HteyU5jhQHpz7PYgHyNjoacvOt/mMVATgcA82YkkMcogUDDbB60f
 yAavgwp7DXkUXCNLUJx+B3agdyBzxLczimVp4LCj6rqgLFOqHbT5lu6UVm+QMDeM8TLW
 Tj3/SffN4OO1dn+lDb3G4DLqnnIwP6pjNLCwEeG/SFn3Qa115gKSwIVZFdUoKg6sog4g
 4wWw==
X-Gm-Message-State: AJIora8cLSQT6CsGLb5OLM8NvocxUiwW15045me7bG2JLvFAe8b08qJk
 Aw+zOLRkF3rnDGd195K37PfEfGma2fQtEg==
X-Google-Smtp-Source: AGRyM1szXbrrunPWeVGaYdaTEXLBgbff4yKTNIuAXB40vdm0dFsQOWL6McfYGwMX8e7JfF2qZPKetg==
X-Received: by 2002:a05:6870:23a3:b0:101:a0da:f478 with SMTP id
 e35-20020a05687023a300b00101a0daf478mr4912514oap.181.1657730017739; 
 Wed, 13 Jul 2022 09:33:37 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:9851:da7e:97fa:f32f])
 by smtp.gmail.com with ESMTPSA id
 bi3-20020a056808188300b0033a169f9282sm2256987oib.52.2022.07.13.09.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 09:33:37 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Jul 2022 13:33:32 -0300
Message-Id: <20220713163332.3079691-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IxsS5F8gFCXIqs75Ll8dVS8DXsqJoOi30gpS9kFoJNU=;
 b=MDeAfjJdZ4zRueSVu5UiyZB0q36YQYVTbR4UE28jQNItOPb/WahlmSdb4qaFcU7V0U
 aMEihGbU2M+BEqK7KJxjulb68nHkCq8D3Ll9D6kcyfzt6xeMfOtdUnHc0/TWdyDaIiiR
 voNDJ6XoHBVBVkW8AKkNQbFaCo324XF7kODOknHoOn3ko7cH2NasOcA5DK8iUYf6KVlB
 4YZUoTQYUbL9sBGh9ainrWrmvKa+cEEQflkllh/TYsUDNHGBgb+wIvXc+ZYhr1EqAz0U
 dlgJJC8vzJuzqMTTqOvdlo4b0HnK8I5nsthxBplHupsK9GjPcvAqsns5q+sygARe86XC
 LP2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MDeAfjJd
Subject: [Buildroot] [PATCH] package/crucible: new package
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
Cc: andrea.barisani@withsecure.com, Fabio Estevam <festevam@gmail.com>,
 andrej.rosano@withsecure.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

crucible is a useful tool that allows reading and writing
to the i.MX fuses via the Linux NVMEM framework.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/crucible/Config.in     |  8 ++++++++
 package/crucible/crucible.hash |  2 ++
 package/crucible/crucible.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)
 create mode 100644 package/crucible/Config.in
 create mode 100644 package/crucible/crucible.hash
 create mode 100644 package/crucible/crucible.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0afd697b6c..4eab444a43 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -862,6 +862,7 @@ F:	configs/wandboard_defconfig
 F:	configs/warp7_defconfig
 F:	configs/warpboard_defconfig
 F:	package/atest/
+F:	package/crucible/
 F:	package/kmscube/
 
 N:	Fabio Porcedda <fabio.porcedda@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 230aa7a2c2..652577faf6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -455,6 +455,7 @@ endmenu
 	source "package/cc-tool/Config.in"
 	source "package/cdrkit/Config.in"
 	source "package/cpuburn-arm/Config.in"
+	source "package/crucible/Config.in"
 	source "package/cryptsetup/Config.in"
 	source "package/cwiid/Config.in"
 	source "package/dahdi-linux/Config.in"
diff --git a/package/crucible/Config.in b/package/crucible/Config.in
new file mode 100644
index 0000000000..06f7d5913c
--- /dev/null
+++ b/package/crucible/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CRUCIBLE
+	bool "crucible"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  Crucible is a One-Time-Programmable (OTP) fusing tool for the
+	  i.MX family.
+	  
+	  https://github.com/usbarmory/crucible
diff --git a/package/crucible/crucible.hash b/package/crucible/crucible.hash
new file mode 100644
index 0000000000..ad8a2cb35c
--- /dev/null
+++ b/package/crucible/crucible.hash
@@ -0,0 +1,2 @@
+sha256  51e911ce5e2a9f182a737b71f6e2bbf46fb80bb3252220cd99ffaf54d38e6c64  crucible-v2022.05.25.tar.gz
+sha256  d88514630470aec9fa7abdc990a1e0a8751a752321bffa868188c49009d64d59  LICENSE
diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
new file mode 100644
index 0000000000..e9038f8cff
--- /dev/null
+++ b/package/crucible/crucible.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# crucible
+#
+################################################################################
+
+CRUCIBLE_VERSION = v2022.05.25
+CRUCIBLE_SITE = $(call github,usbarmory,crucible,$(CRUCIBLE_VERSION))
+CRUCIBLE_LICENSE = GPL-3.0
+CRUCIBLE_LICENSE_FILES = LICENSE
+CRUCIBLE_GOMOD = ./cmd/crucible
+
+$(eval $(golang-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
