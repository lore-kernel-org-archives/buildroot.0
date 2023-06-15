Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53F8EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 13:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5821841937;
	Thu, 15 Jun 2023 13:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5821841937
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gj78_ouiMpZZ; Thu, 15 Jun 2023 13:45:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71ACB4191C;
	Thu, 15 Jun 2023 13:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71ACB4191C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1281BF30B
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01C8C60A47
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01C8C60A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3UblKDUuIl3E for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 13:43:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2216A607C7
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2216A607C7
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 13:43:54 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3090d3e9c92so7644032f8f.2
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686836632; x=1689428632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LoLHMxrONnOydXvyDdfuJuKGkhtCQkfg2DLQvU+NsXs=;
 b=UsImpZvYT/pjtPnkbNheHfV+V4cL6Uzh2/FuWFGumlO/dbD2HgtHBWR0dfvvhofPBJ
 CJrO6jxloDeMjQRPtXi51Nm7gRwBVa8Lz1+hbKGB+zWlXP62kT4DjWkh3fu9rnwGG3ES
 VwMiOnD+VpfBYR0Of8Yd3zpRwG2a6KFm8dWdXdcI3cvpGUzAY5nJKsaoYxYquK2FGqHN
 XzQz9Jf+LUfTjB0FaVhhIz+9Stz8rp2Cfdzh0GwNUOxuscWX8TUBJuKEtAfZDOBbyCur
 2Z3t7Bxk92ijN3GUZi5OO0P0XSj38pakw774+xu0PLpc92ZXsw63ZtdCpYL9tL9kkuMb
 o+5A==
X-Gm-Message-State: AC+VfDxMRPSBFEOiBiFdF+k6kI3T8NiIGLXYXKgWy/mLIxHg/epLookL
 /+YH4BZ/EaaS4JYGNqsqy+EMfD8JTLfqok7RBO0=
X-Google-Smtp-Source: ACHHUZ5A5SMSCWJAP6MYIZA3BF3lTMkWZ0YiNFr+KDpADXSo3BWixLO/Baur0ikHJA7DPHqcdtS1aw==
X-Received: by 2002:a5d:4e50:0:b0:311:1390:7b55 with SMTP id
 r16-20020a5d4e50000000b0031113907b55mr1981212wrt.68.1686836632078; 
 Thu, 15 Jun 2023 06:43:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:31f3:6562:63d2:17f])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b0030b5d203e7esm21129602wru.97.2023.06.15.06.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 06:43:51 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 15:43:11 +0200
Message-Id: <20230615134315.494330-8-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615134315.494330-1-sebastian.weyer@smile.fr>
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686836632; x=1689428632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LoLHMxrONnOydXvyDdfuJuKGkhtCQkfg2DLQvU+NsXs=;
 b=zf3F6Bj28O/Kbieyauy70vltkw+E6rubJfOFBIkLr7NkUPNig9CR2W6duqT9OWvhah
 TvlUPBWx3iwVQJ80p8bMVXS3Ftux9IiGUz5fESTE+hy0z1zd9t5EBUCD18G/TSjgKZ1x
 FEOk5RRXtrtI093W2JJCmdTXs6G8/L7LPXt6PSNeslERKkXRUzyekDCyGVVmPtlNcmwe
 Zebsko+QoNb4+XPBh5vBORNbQahgH0auSBCWlhi4AzmHTfl5pRU6STCESMf6SP8A3HQl
 W3NBl3jWCIRLTPi+Mq/QaRnRimNp59+W7QGYhMtAwHkTADTI4obsZQBAuyBRQTRgyX8E
 QZ2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=zf3F6Bj2
Subject: [Buildroot] [PATCH v4 07/10] package/llvm-project/llvm-cmake: new
 package
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>,
 Sebastian Weyer <sebastian.weyer@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

This is a small host package containing shared cmake modules
that are needed by various projects during configuration.
For example llvm 15 needs it.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
v3: - force llvm-cmake version to 15.0.3 since LLVM_PROJECT_VERSION is
      still at 11.1.0
    - Keep cp as install command since there is no CMakefiles.txt
    - Add License information sinec it come from llvm-project
---
 package/llvm-project/llvm-cmake/llvm-cmake.hash |  2 ++
 package/llvm-project/llvm-cmake/llvm-cmake.mk   | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.hash
 create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.mk

diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
new file mode 100644
index 0000000000..862c5d92e8
--- /dev/null
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -0,0 +1,2 @@
+# locally calculated
+sha256  21cf3f52c53dc8b8972122ae35a5c18de09c7df693b48b5cd8553c3e3fed090d  cmake-15.0.3.src.tar.xz
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.mk b/package/llvm-project/llvm-cmake/llvm-cmake.mk
new file mode 100644
index 0000000000..b305797891
--- /dev/null
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# llvm-cmake
+#
+################################################################################
+
+LLVM_CMAKE_VERSION = 15.0.3
+LLVM_CMAKE_SITE = $(LLVM_PROJECT_SITE)
+LLVM_CMAKE_SOURCE = cmake-$(LLVM_CMAKE_VERSION).src.tar.xz
+LLVM_CMAKE_LICENSE = Apache-2.0 with exceptions
+
+define HOST_LLVM_CMAKE_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/lib/cmake/llvm
+	cp -Rv $(@D)/Modules/* $(HOST_DIR)/lib/cmake/llvm
+endef
+
+$(eval $(host-generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
