Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A72C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 17:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A95F161117;
	Tue, 25 Jul 2023 17:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A95F161117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VAx9YvN5A1l5; Tue, 25 Jul 2023 17:34:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C267A61104;
	Tue, 25 Jul 2023 17:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C267A61104
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9ED711BF317
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8100D40981
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8100D40981
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Icn1Qyp0doZp for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 17:33:56 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2304F40632
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 17:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2304F40632
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbc54cab6fso47220125e9.0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 10:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690306433; x=1690911233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LWnybChdS3mnXne6M8VecegH2r2V2gs3uTxUvqBYt6k=;
 b=lZ5Nc3UMKVo7YLLfQSJvIVWOxmv+Yytzb2vJV0RGvjB5CV6cPdP/OJ6+8zGufXLJop
 lsTWHNIJR2dVpydkqA5B7QemBhhuhjskokfugXqnus+DhnRXCNJP25o9elr4ZQ7awxu0
 u4Z+CT5JYIQnkSL3jh0SnhkOS3C34o5JNlNdF6toKBuMs6mURWuPnMfkkflaJI9WkTfI
 aU6GkLQkoTKPZkFVW8y+buz/MlztQs6wlzUFr1oBEJ2fnkmvNPVXb3h1B/+v2k+YhU7G
 T7JI2KcMabkDFjlzWW6CF2OSNriQZ8iC3rsq7b5Xr5d6oCuj4JihWLqT8Vi9wW8dykJB
 zi3g==
X-Gm-Message-State: ABy/qLYWv0XOS0VPTcafZWMSoqgmYnMLK0zxQJwIf2saXbwvHD5JAWYp
 44jZe8Abjj2/INnhwOP3UmWVq+oT08rsCMWEq8c=
X-Google-Smtp-Source: APBJJlG9RnYuquAdFCAXgYREnfo5sP0myhnxKbGibp5Y9WqPEfKDST5XYgEj9m60/oTM9OCEcxSKog==
X-Received: by 2002:a1c:7710:0:b0:3f6:91c:4e86 with SMTP id
 t16-20020a1c7710000000b003f6091c4e86mr9030383wmi.3.1690306433611; 
 Tue, 25 Jul 2023 10:33:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a5d61c4000000b00316eb7770b8sm11721541wrv.5.2023.07.25.10.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 10:33:53 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 19:30:57 +0200
Message-Id: <20230725173102.543874-6-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725173102.543874-1-sebastian.weyer@smile.fr>
References: <20230725173102.543874-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690306433; x=1690911233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWnybChdS3mnXne6M8VecegH2r2V2gs3uTxUvqBYt6k=;
 b=ccy9hiWiDcsZJDFdz4Xe5vneuK3MRBlYsFI+0GyqWKfVOey/cejmrC2DOhHApZ89+4
 HsznWEZB98Sh0Fw36imYNPPXOa0yupX1Ol5MhsghIPkUu2JuKpNeUdP6X0vEsKsGO7Xy
 tP/klf1QUYyHecAEOSo2MndRPCnyrSZ2fGbaaBHBjSKv3kIqkZ767K61AkFbTZPr1yfT
 ronP6ly3C/Nvouolop7HlxWZF7DXSg1jLHDSLdAz5vuPz+9RQsW2pXI2LSfIExY4x/G1
 39w12frY3U/23dQfEN+p0zPPZI9XPIa0mVKMI8dE9tTHxa5kG2YGFbNxhFaNKVyNZQjT
 7pAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=ccy9hiWi
Subject: [Buildroot] [PATCH v2 5/9] package/spirv-tools: new package
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
Cc: Romain Naour <romain.naour@smile.fr>, Samuel Martin <s.martin49@gmail.com>,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Naour <romain.naour@smile.fr>

This package is required by mesa3d for building rusticl:

https://docs.mesa3d.org/rusticl.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 package/Config.in                    |  1 +
 package/spirv-tools/Config.in        | 12 ++++++++++++
 package/spirv-tools/spirv-tools.hash |  2 ++
 package/spirv-tools/spirv-tools.mk   | 22 ++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/spirv-tools/Config.in
 create mode 100644 package/spirv-tools/spirv-tools.hash
 create mode 100644 package/spirv-tools/spirv-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 931b0cc21e..aa917264d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -327,6 +327,7 @@ comment "Graphic applications"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
 	source "package/spirv-headers/Config.in"
+	source "package/spirv-tools/Config.in"
 	source "package/stellarium/Config.in"
 	source "package/sway/Config.in"
 	source "package/tesseract-ocr/Config.in"
diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
new file mode 100644
index 0000000000..21b3852779
--- /dev/null
+++ b/package/spirv-tools/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_SPIRV_TOOLS
+	bool "spirv-tools"
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_USE_MMU # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on !BR2_STATIC_LIBS # python3
+	select BR2_PACKAGE_PYTHON3
+	help
+	  The SPIR-V Tools project provides an API and commands for
+	  processing SPIR-V modules.
+
+	  https://github.com/KhronosGroup/SPIRV-Tools
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
new file mode 100644
index 0000000000..6861f543ea
--- /dev/null
+++ b/package/spirv-tools/spirv-tools.hash
@@ -0,0 +1,2 @@
+sha256  645c4585c207cbdfda81a09f8ab180773c18df50fad9644d2d9a53b4464c692b  spirv-tools-1.3.246.1.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
new file mode 100644
index 0000000000..758c01343c
--- /dev/null
+++ b/package/spirv-tools/spirv-tools.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# spirv-tools
+#
+################################################################################
+
+SPIRV_TOOLS_VERSION = 1.3.246.1
+SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,sdk-$(SPIRV_TOOLS_VERSION))
+SPIRV_TOOLS_LICENSE = Apache-2.0
+SPIRV_TOOLS_LICENSE_FILES = LICENSE
+
+SPIRV_TOOLS_DEPENDENCIES = python3 spirv-headers
+
+SPIRV_TOOLS_INSTALL_STAGING = YES
+
+SPIRV_TOOLS_CONF_OPTS = \
+    -DSPIRV-Headers_SOURCE_DIR=${STAGING_DIR}/usr \
+    -DSPIRV_TOOLS_BUILD_STATIC=OFF \
+    -DBUILD_SHARED_LIBS=ON \
+    -DSPIRV_SKIP_TESTS=ON \
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
