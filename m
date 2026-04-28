Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48440FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 17:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C230D60EDF;
	Tue, 28 Apr 2026 17:17:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SF9aLalI48z5; Tue, 28 Apr 2026 17:17:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4C0B60EED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777396652;
	bh=DZ+/reAQiMB5hZRJoXCPletL4ima1IGT6ufoGqm82lA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=D/zqE3HsrmgDU3zj2pnlCrEZxNVv3/xGT7Dv/nubIs2FL1EGRbYMr+/VTj8awRFa2
	 CTT3NxWIfU6iVWx1M2Dn/cP027QwcvmNh2k+z165CMu6z5x0VpggokYggRcJj+eww0
	 FU/K4ii6xKlUzN/ylnz4e3fZ5X7OCEknwLaMeSHQZGtkTUDm+rMts4Ojl2b1CpgFSr
	 WaSkIb+h9+Aey9H2Yro6Ijt5i0sMXIdtpvfKDkQwKEgyIEEyZC0y0Nvnzdi0cvkWfO
	 x/Tqb3Fm0NdffrjC16gSutvexaxkVTmIVD8l9mXcky9hQu4cTx3tAi7XZJQR0JNp9F
	 gyOpx/1QfGccg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4C0B60EED;
	Tue, 28 Apr 2026 17:17:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A86AE231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BBFB60EDF
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsdMv1kXxIoN for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 17:17:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 79D4460EED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79D4460EED
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79D4460EED
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:17:28 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id
 af79cd13be357-8e8c0c2d2bcso823117285a.1
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 10:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777396647; x=1778001447;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NlSiMeeuJEaBJiU7VvLS3u9d8oH6wRoUZPQMoKE01B0=;
 b=GrehgX7qY53JAuzFXMSnqiOBjjMHMc+2qAJwALhAfs8/nqMXyUFG7z0oJdyIVVPrz4
 +emZFHww7s7Tan+owYoVa6GgR1FcFm28qqTUeW0qDp/rDKvjTmDhAdnrPF1pUiT5K/pa
 /Ycy3siP5TWXZdXmhWOpL+GaZRT7P4wE/fZvpazmshdtF/V4VlnYKX7Ahot+UzZuCuox
 GVs23zafEhSRTQ1xCSyrpQAHSwSBG5SRt1tgt00nI8vZ7HVnwfHNltvC33Ope9h8gYE9
 C/adNT3GJ7NUsLmNonmGeYLnpnrcHaqmXQ2+KQOvhx5Yx5aMBz6LU6QsQH0Rf7AHq7W6
 PeSA==
X-Gm-Message-State: AOJu0YyeCQGOb59rmmfIVm/B4xjmwkiEDy4aBCp5cmuY+vFxWYe/0iGC
 gp7bno92mFVsr/dtYBryHsp8ZptaCPsh7l27j/WuarMF1M9oZVevgwc0WSznYrxB7LEgT/6c
X-Gm-Gg: AeBDieth+z1TKzr3AnRU8zD52/7Ck2ny6gxsjIc4fPTcOpq+s3zTDML2+Gh3/wyqeNl
 qt38YrQlNTV8wUNNCJknrTOHRkWz8FXCO+v4XEq5zqu3GyjeKFThCTsSXfPE8wpXkqZilBLWC2T
 s7gbu2K9VFWsGr5+Gc003B+SfyCEqeZZXt/yLRzlpSCKyVL1sycqTaNVXfZiKFM8FcHaRsPgM41
 NVZ181Rl53eDVWh74w19zK7IsE3far81hmeKccl4WmgM+bvgnOmWyorKrb8yCidRZwAA4b557q6
 xRDVnTc1jBltrMMvIFuYG9bU1KdCxZe3DX2XOO/20C6MoVa8BuCn/IknrefhQB3a9J2GlBIEdpp
 Amp+8RuWvE0Y8f++cM50s+NnEg8sjogKMia++n7Sn0shOsSf79hAjGrDuY3/vUtIWJxs3kodDsH
 hUUMzIQnkCPepln4XmMC+4F6RC0Ao3VGbP5GYsLFlpAFotjxG88kFxbg7QNL2v7l50QBPEW98RG
 iaj0QFtfFrBxkknMTBT
X-Received: by 2002:a05:620a:4623:b0:8cd:b315:7399 with SMTP id
 af79cd13be357-8f7d990279cmr560578385a.46.1777396646572; 
 Tue, 28 Apr 2026 10:17:26 -0700 (PDT)
Received: from precialexwin
 (bras-base-mtrlpq0313w-grc-01-76-65-67-233.dsl.bell.ca. [76.65.67.233])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8f86831cf01sm159624785a.34.2026.04.28.10.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 10:17:26 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 13:16:52 -0400
Message-ID: <20260428171652.2544-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777396647; x=1778001447; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NlSiMeeuJEaBJiU7VvLS3u9d8oH6wRoUZPQMoKE01B0=;
 b=fMeFQVTunrUiyUWh3nv6G0LXXaSWipwPas6F1tGXtvK9wRu4F1vlX1+IZYu+Xvp4h5
 pHb1bxlWZxsHEyJXuGAzipOIF+tp0cmzsn8HAH8RnbI4EvhPVaR7FcRSPrZwRHfycI59
 32hk7p7DDAcWcLRQpmnCl30scLSQjBj26tXy2/eo6c9I0zpl2YO79zODOZuvBY6vX8vW
 oP4yp6wsunJlV3y6SJvBgDeE6Fj0IKDR+zkoIsDfYJWf+AavVpuOWa2hi3XM5uJfrwIN
 NaQY3BaacuMqsah3oUrF0PyGiCfFhMii5ELhFSvBpgDZl0nceeb9mQ2vkvQFtTa/AFDM
 E6KQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=fMeFQVTu
Subject: [Buildroot] [PATCH 01/13] package/python-cpu-load-generator: new
 package
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
Cc: Alexandre Ondet <frcomdev@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexandre Ondet <frcomdev@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-cpu-load-generator/Config.in        |  6 ++++++
 .../python-cpu-load-generator.hash                 |  4 ++++
 .../python-cpu-load-generator.mk                   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-cpu-load-generator/Config.in
 create mode 100644 package/python-cpu-load-generator/python-cpu-load-generator.hash
 create mode 100644 package/python-cpu-load-generator/python-cpu-load-generator.mk

diff --git a/package/Config.in b/package/Config.in
index 9cae377fb5..407966b37c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1059,6 +1059,7 @@ menu "External python modules"
 	source "package/python-construct/Config.in"
 	source "package/python-contourpy/Config.in"
 	source "package/python-couchdb/Config.in"
+	source "package/python-cpu-load-generator/Config.in"
 	source "package/python-crayons/Config.in"
 	source "package/python-crc/Config.in"
 	source "package/python-crc16/Config.in"
diff --git a/package/python-cpu-load-generator/Config.in b/package/python-cpu-load-generator/Config.in
new file mode 100644
index 0000000000..fceb6fdb32
--- /dev/null
+++ b/package/python-cpu-load-generator/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CPU_LOAD_GENERATOR
+	bool "python-cpu-load-generator"
+	help
+	  Generate a configurable CPU load for testing and benchmarking.
+
+	  https://pypi.org/project/cpu-load-generator/
diff --git a/package/python-cpu-load-generator/python-cpu-load-generator.hash b/package/python-cpu-load-generator/python-cpu-load-generator.hash
new file mode 100644
index 0000000000..6cf8c4dac4
--- /dev/null
+++ b/package/python-cpu-load-generator/python-cpu-load-generator.hash
@@ -0,0 +1,4 @@
+# From https://pypi.org/pypi/cpu-load-generator/1.2.0/json
+sha256  41586edd59e5d9e75a39a0c8c86e8baa8eac0550dc4dab8c0bef9eeac328b8af  cpu-load-generator-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  0de0992ffa96771645e251c62628bcb546ffaf1c13d5a42240a9a17941101e9e  LICENCE
diff --git a/package/python-cpu-load-generator/python-cpu-load-generator.mk b/package/python-cpu-load-generator/python-cpu-load-generator.mk
new file mode 100644
index 0000000000..f81170d8b8
--- /dev/null
+++ b/package/python-cpu-load-generator/python-cpu-load-generator.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cpu-load-generator
+#
+################################################################################
+
+PYTHON_CPU_LOAD_GENERATOR_VERSION = 1.2.0
+PYTHON_CPU_LOAD_GENERATOR_SOURCE = cpu-load-generator-$(PYTHON_CPU_LOAD_GENERATOR_VERSION).tar.gz
+PYTHON_CPU_LOAD_GENERATOR_SITE = https://files.pythonhosted.org/packages/source/c/cpu-load-generator
+PYTHON_CPU_LOAD_GENERATOR_SETUP_TYPE = setuptools
+PYTHON_CPU_LOAD_GENERATOR_LICENSE = MIT
+PYTHON_CPU_LOAD_GENERATOR_LICENSE_FILES = LICENCE
+
+$(eval $(python-package))
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
