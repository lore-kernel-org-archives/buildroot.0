Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA581C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6943381FC2;
	Tue, 25 Jul 2023 13:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6943381FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zGphBvYqHjFb; Tue, 25 Jul 2023 13:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 846B481FCE;
	Tue, 25 Jul 2023 13:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 846B481FCE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 297ED1BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03C8440B91
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03C8440B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewS54-85ETDf for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:51:20 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6E674016F
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6E674016F
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fd2f298712so23919295e9.2
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690293078; x=1690897878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lb1D/FTfy+CErfn10D+Z7ayv8gKPsJFsdYPfluVxPA4=;
 b=RToEQFajcqOMRC1V4rMs6/qJ9QfwnOGh4uVQGoirHUvb0QFZsXKZ0CjqR+llGcMR2J
 /AX6MZXg3eqO3vEZ8zvjS1RjQhlpg2tkZgIgQhgpZBPwxUbjgucSu2c+PAvZo/ynQK8z
 BnpDNkEZTSU3B2ZPrw9o+yt/gIQ0TaB1v1zaL91BV90f7qPxnzq080hUis+GxWgkfoLa
 U3fdtswIuh+bRkF2epTFliRqQlURJ/GSJE+GmjfsXZ7ltYjReZUXS0UYVdn1obwbGHxa
 6OxHHQZuTeKSyIqoulO2wUHMLktTWaylUQKikG/RfBO3wPUWBfwpaovn81GZ8PdI122p
 DOcw==
X-Gm-Message-State: ABy/qLYXLrqAmMWhj+vpSC7yI7YhLYkdBcmoUFsfZwqBX5BAYjmDepVq
 7Z0RoDyHRbTRLMBFXofFxjf4hHyI2nCpMtM7pz0=
X-Google-Smtp-Source: APBJJlH4x+3tdbwpJe+ZoJzigsS18VOk6pIny2rP14hXfYIPI1TFfLdoujKJuVyMdyd+AL4+w0Hhjw==
X-Received: by 2002:a5d:68ce:0:b0:311:3fdc:109d with SMTP id
 p14-20020a5d68ce000000b003113fdc109dmr8102021wrw.1.1690293077852; 
 Tue, 25 Jul 2023 06:51:17 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d6150000000b00313e59cb371sm16604581wrt.12.2023.07.25.06.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:51:17 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 15:50:59 +0200
Message-Id: <20230725135105.536310-5-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725135105.536310-1-sebastian.weyer@smile.fr>
References: <20230725135105.536310-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690293078; x=1690897878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lb1D/FTfy+CErfn10D+Z7ayv8gKPsJFsdYPfluVxPA4=;
 b=nFtFIM0bCyDA99F6euVep9eEBG/LZbAZ6sgM4FoJ81lkWsDu2NjU8o45UM7gdlomRj
 aXpiPuMPaMg19yPuJmPB1wErXuVs+mmiIWaof5PPqssa+xm00OM82kpxcTzO7VpQN/qB
 QdYjsHpHYvqGlesWz8Tnzmlv+ji1faFBPPxFxw3LaZ6L89emQVp1a94MdFQ7R8bfmN8u
 LbFql0ClVi0ORJJNK8uP7brYl7rS1MEHSx+SrEI6pQ6lY0HRqAdgWmBW2j8PCUBrPJQV
 n3aJd0giuMImUPWFngpdM2mSRAvUuuJMeUZ12YHBA+N8+hEV+QcOAMI0eHgoPHm6HLbm
 SJog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=nFtFIM0b
Subject: [Buildroot] [PATCH 4/9] package/spirv-headers: new package
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

These headers are required to build the pacakge spirv-tools which is
requried by mesa3d for building rusticl:

https://docs.mesa3d.org/rusticl.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 package/Config.in                        |  1 +
 package/spirv-headers/Config.in          |  6 ++++++
 package/spirv-headers/spirv-headers.hash |  2 ++
 package/spirv-headers/spirv-headers.mk   | 15 +++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/spirv-headers/Config.in
 create mode 100644 package/spirv-headers/spirv-headers.hash
 create mode 100644 package/spirv-headers/spirv-headers.mk

diff --git a/package/Config.in b/package/Config.in
index 1e551d17c4..931b0cc21e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -326,6 +326,7 @@ comment "Graphic applications"
 	source "package/pngquant/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
+	source "package/spirv-headers/Config.in"
 	source "package/stellarium/Config.in"
 	source "package/sway/Config.in"
 	source "package/tesseract-ocr/Config.in"
diff --git a/package/spirv-headers/Config.in b/package/spirv-headers/Config.in
new file mode 100644
index 0000000000..fd20f301d4
--- /dev/null
+++ b/package/spirv-headers/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SPIRV_HEADERS
+	bool "spirv-headers"
+	help
+	  Machine-readable files for the SPIR-V Registry
+
+	  https://www.khronos.org/registry/spir-v
diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
new file mode 100644
index 0000000000..b83959f7a4
--- /dev/null
+++ b/package/spirv-headers/spirv-headers.hash
@@ -0,0 +1,2 @@
+sha256  71668e18ef7b318b06f8c466f46abad965b2646eaa322594cd015c2ac87133e6  spirv-headers-1.3.246.1.tar.gz
+sha256  9b243f6f0bf44e295ff411a0f7b7642d1d0dff7cdc42507e9f7206f439e51b5a  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
new file mode 100644
index 0000000000..11119ac6b2
--- /dev/null
+++ b/package/spirv-headers/spirv-headers.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# spirv-headers
+#
+################################################################################
+
+SPIRV_HEADERS_VERSION = 1.3.246.1
+SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,sdk-$(SPIRV_HEADERS_VERSION))
+SPIRV_HEADERS_LICENSE = MIT
+SPIRV_HEADERS_LICENSE_FILES = LICENSE
+
+SPIRV_HEADERS_INSTALL_STAGING = YES
+SPIRV_HEADERS_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
