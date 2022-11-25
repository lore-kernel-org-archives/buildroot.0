Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D61C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 16:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 453FF611D3;
	Fri, 25 Nov 2022 16:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 453FF611D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZjmKK1FM5D7; Fri, 25 Nov 2022 16:08:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CE94611D2;
	Fri, 25 Nov 2022 16:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CE94611D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17E8D1BF5DA
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E629C820C8
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E629C820C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rwsrX44ujUDu for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 16:08:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F57B8194A
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F57B8194A
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 16:08:00 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id y6so3324584iof.9
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 08:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2z/VoGPWnYvwHtDlK5X9LfcCaGfQbHxKgTA2z7jz+8w=;
 b=2Rrrq4OXMDb7YYj3lOAyECUD43e0htYcPQXM1dBdFNaqr6ntWovBG5mdU1no2lyBD5
 xNOE/qNfXsDDvK4YsdPmlE5V4zuMD+BJ4QwPnSUB8VKFY8dpAgCgmcpvc+A0iTRmspPF
 yNQ/oij06F7VpsKaVcBw+rtEmHuW++6rXOSnZqMlxXJamNTw8krZY/FxgOW5qD5Ua81/
 dJmPpmJkAXdqiH1YaWIRIdTo8wG/m+vlzknd1Ch+LKMOyVH8atsoiI3/lT/aFa6zlTHT
 usIgPFFRkreci+pesrhI/Kfh7nnjrY16J4ivsL1gYG22E7kV8fnLOE7y0Z0q4PJMQXPY
 6Ing==
X-Gm-Message-State: ANoB5pnAIuGbJY7xxFxS8rtnqmL8xKyz2rIPvKXQEuwtuxvrDdlX3slH
 MHSM5r5l/Db2hGYw9gJWgFD0FSqZU40hYw==
X-Google-Smtp-Source: AA0mqf6u1+UM4+yOBvhmjzLTPqSsM16UM1RD/6prdxjnoKRmsbihDtZUfkxongS37BR5V6pjXft3+g==
X-Received: by 2002:a05:6638:252:b0:363:46aa:76e9 with SMTP id
 w18-20020a056638025200b0036346aa76e9mr9391367jaq.249.1669392479599; 
 Fri, 25 Nov 2022 08:07:59 -0800 (PST)
Received: from james-x399.localdomain (71-218-226-239.hlrn.qwest.net.
 [71.218.226.239]) by smtp.gmail.com with ESMTPSA id
 z28-20020a056638215c00b00363753f4730sm1497384jaj.91.2022.11.25.08.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 08:07:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 09:07:18 -0700
Message-Id: <20221125160724.1725476-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125160724.1725476-1-james.hilliard1@gmail.com>
References: <20221125160724.1725476-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2z/VoGPWnYvwHtDlK5X9LfcCaGfQbHxKgTA2z7jz+8w=;
 b=EC6R2qGTwplBGrEOs7uGiB/k63WRSUj0sJPx3WEC7Nz8wg8NdPC/Q9HhGZVrQuEy6E
 gr3n8WLSQg7GCrjR2ElqppHK5xr60lnuulb8orjyc/DVXdIs/LrZazO+FzFxq5j5+lcX
 iDmdBNQAtJw3C5H77WHR4ZY3VjvW9YiKxhaaDRWf4d6tj+RW2/ch71BW/7j0vWgf3IB6
 On7rsjK7dgbTSjKMiHSeACY8XO0XV0gtdAaoa3Yxo7v+4te3ePZtVfd2RdUOHkOBhMU1
 3v+U/CaP6mYcwqTaL71GidAbMGUc7dsv+OBEXi9FUOgNEuDgOz8Oc6LhvrBn0EZE0Pqs
 dpLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EC6R2qGT
Subject: [Buildroot] [PATCH 2/8] package/cpuinfo: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in            |  1 +
 package/cpuinfo/Config.in    |  9 +++++++++
 package/cpuinfo/cpuinfo.hash |  4 ++++
 package/cpuinfo/cpuinfo.mk   | 17 +++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/cpuinfo/Config.in
 create mode 100644 package/cpuinfo/cpuinfo.hash
 create mode 100644 package/cpuinfo/cpuinfo.mk

diff --git a/package/Config.in b/package/Config.in
index aef80f9ab0..e09fa0b3bd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -465,6 +465,7 @@ endmenu
 	source "package/cc-tool/Config.in"
 	source "package/cdrkit/Config.in"
 	source "package/cpuburn-arm/Config.in"
+	source "package/cpuinfo/Config.in"
 	source "package/crucible/Config.in"
 	source "package/cryptsetup/Config.in"
 	source "package/cwiid/Config.in"
diff --git a/package/cpuinfo/Config.in b/package/cpuinfo/Config.in
new file mode 100644
index 0000000000..137f657d69
--- /dev/null
+++ b/package/cpuinfo/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_CPUINFO
+	bool "cpuinfo"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  CPU INFOrmation library, cpuinfo is a library to detect
+	  essential for performance optimization information about
+	  host CPU.
+
+	  https://github.com/pytorch/cpuinfo
diff --git a/package/cpuinfo/cpuinfo.hash b/package/cpuinfo/cpuinfo.hash
new file mode 100644
index 0000000000..c3f70fa90f
--- /dev/null
+++ b/package/cpuinfo/cpuinfo.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  0936848904943381b2c01321101614776e43d583840ee0f3ceeea1e3fb7405f7  cpuinfo-de2fa78ebb431db98489e78603e4f77c1f6c5c57.tar.gz
+# License files, locally calculated
+sha256  8e7e60636c3aa0cb03571a1a841ce5697f9551ff92b3c426c2561613d15ade70  LICENSE
diff --git a/package/cpuinfo/cpuinfo.mk b/package/cpuinfo/cpuinfo.mk
new file mode 100644
index 0000000000..ab6a0269ec
--- /dev/null
+++ b/package/cpuinfo/cpuinfo.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# cpuinfo
+#
+################################################################################
+
+CPUINFO_VERSION = de2fa78ebb431db98489e78603e4f77c1f6c5c57
+CPUINFO_SITE = $(call github,pytorch,cpuinfo,$(CPUINFO_VERSION))
+CPUINFO_LICENSE = BSD-2-Clause
+CPUINFO_LICENSE_FILES = LICENSE
+CPUINFO_INSTALL_STAGING = YES
+CPUINFO_CONF_OPTS = \
+	-DCPUINFO_BUILD_UNIT_TESTS=OFF \
+	-DCPUINFO_BUILD_MOCK_TESTS=OFF \
+	-DCPUINFO_BUILD_BENCHMARKS=OFF
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
