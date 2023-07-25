Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56735C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 17:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11737610D0;
	Tue, 25 Jul 2023 17:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11737610D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TjO6Qs-hSCg3; Tue, 25 Jul 2023 17:35:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2423D610FD;
	Tue, 25 Jul 2023 17:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2423D610FD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 613961BF317
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3971C41574
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3971C41574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CIk3LCPmul30 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 17:33:59 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08B0C4026A
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 17:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08B0C4026A
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbc0609cd6so47352285e9.1
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 10:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690306437; x=1690911237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVw6WYJkNdOST3COGbfot1xkPXG3CRqQObohebQU9xE=;
 b=CM//TmTcSjQO3zulhoj/9lBVJH0Sbkn7cT4Q3fdz3BphLL/qefa3ImIwq+ZpXTP/ex
 ze0P/6dCL1bRUQ3OxflLo+K5WbsRQ2TsPcuGljkAoOesCtK9nuZvT3WS/bvyVAqNGrAt
 CZHAhn/2mCRYaly0Y7ZE3BDRkWp4he+cQqW55EOsrAZm2hy+8GiRLHjKEnqgVnUHClLQ
 oyJVEwMNtQQcqz+kBicfGO5JE8rkWBpc3s+u9dnbzr76uz5eMK5rEBCa9e8NQXGs7IOG
 /qPu8yzAXv7GHMMWWX26XrSyh28Jd8Cvv97NcROoMFwBkPoaHWqCI+9vcZlmywjovn2S
 iznQ==
X-Gm-Message-State: ABy/qLZSDbuvLh6ElBLS9btduh/aJqG4s3kF22QQzo4BpDaL4dbot9EW
 tZZMNIAfiYISNfm1Qhb2YNGU5svrDrNnn+i7J/c=
X-Google-Smtp-Source: APBJJlH2Koc6H+OFPNBUmg0CqMBEfnbTswrKEZS7unZn2YlfTDHhETwBkZUew7nFa4kznqZ/nWGPjg==
X-Received: by 2002:a5d:5591:0:b0:313:f0d7:a46 with SMTP id
 i17-20020a5d5591000000b00313f0d70a46mr8989882wrv.3.1690306436934; 
 Tue, 25 Jul 2023 10:33:56 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a5d61c4000000b00316eb7770b8sm11721541wrv.5.2023.07.25.10.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 10:33:56 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 19:31:00 +0200
Message-Id: <20230725173102.543874-9-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725173102.543874-1-sebastian.weyer@smile.fr>
References: <20230725173102.543874-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690306437; x=1690911237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVw6WYJkNdOST3COGbfot1xkPXG3CRqQObohebQU9xE=;
 b=2BJEIrKGjmzkmXkdVAj5aNsZzyQT3FYtswd8eH/yljyqQfiAUibuiZi4Hovy9FVQIV
 L6oDgS+wDsIezw+i7tWJc9XrW5Aj7v9PvTSP84TXWEJ+zZSNlw1EJ+7myNlAu9DYTZjl
 cqNN2bJgcht3nzSyRCcsXekZpviel7Ov2tn7/YdrDmwief8OOmP4UiwaucsulYqrURuw
 H4a/1AExp6LNwId9/fwlOUeRdl13v3G5sedk/Sl2Kk1SiihJQ/MvdwOMtigl7pXwsWcK
 GI3NEodm281iVI2sWwIMEdZNHpWDLTqeTH72PpuonEzAowYxiZYShnvguo7DZYCbJjad
 sNaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=2BJEIrKG
Subject: [Buildroot] [PATCH v2 8/9] package/opencl-icd-loader: new package
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: multipart/mixed; boundary="===============4640229556735915790=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4640229556735915790==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

With this package it is possible to have multiple implementations of
OpenCL at the same time. This package provides a libOpenCL.so file that
captures the OpenCL API calls and forwards it to the correct
implementation of OpenCL. OpenCL implementations can be manually
registered by creating a file containing its full file path in
/etc/OpenCL/vendors/<implementation>.icd[1]

This package is required by certain OpenCL implementations, for example
Mesa3D's implementation if it is not built in standalone mode.

[1] https://github.com/KhronosGroup/OpenCL-ICD-Loader#registering-icds

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/opencl-icd-loader/Config.in           | 12 ++++++++++++
 .../opencl-icd-loader/opencl-icd-loader.hash  |  3 +++
 .../opencl-icd-loader/opencl-icd-loader.mk    | 19 +++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/opencl-icd-loader/Config.in
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.hash
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 38f46b4ac3..6af31d447e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2604,6 +2604,7 @@ F:	package/ripgrep/
 
 N:	Sebastian Weyer <sebastian.weyer@smile.fr>
 F:	package/opencl-headers
+F:	package/opencl-icd-loader
 F:	package/rust-bindgen
 
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
diff --git a/package/Config.in b/package/Config.in
index fc73cd1727..2b7446386b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1639,6 +1639,7 @@ menu "Graphics"
 	source "package/menu-cache/Config.in"
 	source "package/opencl-clhpp/Config.in"
 	source "package/opencl-headers/Config.in"
+	source "package/opencl-icd-loader/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
 	source "package/opencv4-contrib/Config.in"
diff --git a/package/opencl-icd-loader/Config.in b/package/opencl-icd-loader/Config.in
new file mode 100644
index 0000000000..405dc5401a
--- /dev/null
+++ b/package/opencl-icd-loader/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_OPENCL_ICD_LOADER
+	bool "OpenCL-ICD-Loader"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
+	select BR2_PACKAGE_OPENCL_HEADERS
+	help
+	  OpenCL defines an Installable Client Driver (ICD) mechanism to
+	  allow developers to build applications against an Installable
+	  Client Driver loader (ICD loader) rather than linking their
+	  applications against a specific OpenCL implementation.
+
+	  https://github.com/KhronosGroup/OpenCL-ICD-Loader
diff --git a/package/opencl-icd-loader/opencl-icd-loader.hash b/package/opencl-icd-loader/opencl-icd-loader.hash
new file mode 100644
index 0000000000..d028e3d856
--- /dev/null
+++ b/package/opencl-icd-loader/opencl-icd-loader.hash
@@ -0,0 +1,3 @@
+# locally generated
+sha256  173bdc4f321d550b6578ad2aafc2832f25fbb36041f095e6221025f74134b876  OpenCL-ICD-Loader-2023.04.17.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/opencl-icd-loader/opencl-icd-loader.mk b/package/opencl-icd-loader/opencl-icd-loader.mk
new file mode 100644
index 0000000000..d3d94b9cb5
--- /dev/null
+++ b/package/opencl-icd-loader/opencl-icd-loader.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# opencl-icd-loader
+#
+################################################################################
+
+OPENCL_ICD_LOADER_VERSION = 2023.04.17
+OPENCL_ICD_LOADER_SOURCE = OpenCL-ICD-Loader-$(OPENCL_ICD_LOADER_VERSION).tar.gz
+OPENCL_ICD_LOADER_SITE = $(call github,KhronosGroup,OpenCL-ICD-Loader,v$(OPENCL_ICD_LOADER_VERSION))
+OPENCL_ICD_LOADER_LICENSE = Apache-2.0
+OPENCL_ICD_LOADER_LICENSE_FILES = LICENSE
+OPENCL_ICD_LOADER_INSTALL_STAGING = YES
+
+OPENCL_ICD_LOADER_DEPENDENCIES = opencl-headers
+
+OPENCL_ICD_LOADER_CONF_OPTS += -DOPENCL_ICD_LOADER_HEADERS_DIR=$(STAGING_DIR)/usr/include
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.34.1


--===============4640229556735915790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4640229556735915790==--
