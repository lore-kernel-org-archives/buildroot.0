Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B938C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 22:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E37EA61197;
	Thu, 28 Apr 2022 22:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-TnrTnio8Pz; Thu, 28 Apr 2022 22:06:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C681660B5C;
	Thu, 28 Apr 2022 22:06:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5BEB1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 945C383403
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7E5GKhsF-Kwm for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 22:06:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 781138333E
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 22:06:02 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id e194so7933889iof.11
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 15:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1iXhksOFIzYnyZc+5BegXtZ7sT71H8Q/rTD+0bSBKOA=;
 b=EoBZoJkfyPHs7bWXM5+qR0sLHu1WYuXxITZGPl+8ZvILGGuWIgFEwpZvbJoIWc+qsF
 QQJTLLzmu/CDqkzuVm/+2qQ3ymB5V0YEVG4ccaHmg/v11N4wCEnRr0ViXhvES8Kgqmbj
 fflcLR6I9EifC4Qcj53gBXPVxH1+FyJwLm/rli/bDaH7Rqxfh4xzpl+WBLLL13y2NxAt
 Nf54K2QKlfcu5y19x54zY/USGOPP36SpjhbmScPieH8yXOeboIAKYbtnhBG4yWCv3po+
 5K5nWicSvLrGsekHkU5rFApkAlhXFP9/DQJxP7CwP59Wg+C2O/X4VVBuMSRPPii262ex
 dUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1iXhksOFIzYnyZc+5BegXtZ7sT71H8Q/rTD+0bSBKOA=;
 b=Ee25txJnut94GoWWTyr4HiSJ6iF14r4x7ihxKfD9g1hCUJV/WteE6qFHdrUpHyFst6
 GO1u4K6Un1brjLBsfQs8JKihDQnH1pVHVlVP4JkRnUr0mE03VyI0TZZKOp4F6CA2wJzT
 XKzQmRa7mZA/uRFz/WdDA0PCKYtzElCiwn2oyKPhc3tZZ7l6PDuQndKyVNDmgudzJ7j5
 xqAHb+P2aETjil9JmmU6RDHKoaf7ld4C7WIe2yN5rldwIfNQDZiHc9cfWz79+xWCIIRp
 washd0ZtEKfuDhCq4p2CTel4RpjL7nfZAHluBvLENlMgL9E/9HWHjlR9fxDBF8hAluXG
 Gtxw==
X-Gm-Message-State: AOAM531OhwLMPfnXabujsjM1mc4NWQUczz6V/pQMfg9a783qUrRhjz0M
 Bujehcp2lyZK0qL8ywppQIf6rg2GEqw=
X-Google-Smtp-Source: ABdhPJwZ+LudL40Ffur2siISdGEP8bBY/CTHecI8UpEMXd1+zw7XkKkOxGkBmXHIimJtKY4QbWSFvg==
X-Received: by 2002:a05:6602:194:b0:64f:caa4:f9e0 with SMTP id
 m20-20020a056602019400b0064fcaa4f9e0mr14953719ioo.1.1651183561399; 
 Thu, 28 Apr 2022 15:06:01 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 123-20020a6b1581000000b00657b48baeb8sm635769iov.41.2022.04.28.15.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 15:06:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 16:05:57 -0600
Message-Id: <20220428220559.1236052-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/pkg-python: deduplicate common
 env/opts variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There are many varibles shared via setuptools, distutils and pep517,
combine those common env/opts variables to make them easier to
maintain.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk | 95 +++++++++++++++++++------------------------
 1 file changed, 42 insertions(+), 53 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index e9de5cb8d3..852ab25619 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -33,78 +33,76 @@ PKG_PYTHON_HOST_PLATFORM = linux-$(PKG_PYTHON_ARCH)
 PKG_PYTHON_SYSCONFIGDATA_PATH = $(PYTHON3_PATH)/_sysconfigdata__linux_*.py
 PKG_PYTHON_SYSCONFIGDATA_NAME = `{ [ -e $(PKG_PYTHON_SYSCONFIGDATA_PATH) ] && basename $(PKG_PYTHON_SYSCONFIGDATA_PATH) .py; } || true`
 
-# Target distutils-based packages
-PKG_PYTHON_DISTUTILS_ENV = \
+# Target python packages
+PKG_PYTHON_ENV = \
+	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
+	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
+	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	PATH=$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
-	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	PYTHONPATH="$(PYTHON3_PATH)" \
 	PYTHONNOUSERSITE=1 \
-	SETUPTOOLS_USE_DISTUTILS=stdlib \
-	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
-	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
-	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
 
+# Host python packages
+HOST_PKG_PYTHON_ENV = \
+	PATH=$(BR_PATH) \
+	PYTHONNOUSERSITE=1 \
+	$(HOST_CONFIGURE_OPTS)
+
+# Target distutils-based packages
+PKG_PYTHON_DISTUTILS_ENV = \
+	$(PKG_PYTHON_ENV) \
+	SETUPTOOLS_USE_DISTUTILS=stdlib \
+
 PKG_PYTHON_DISTUTILS_BUILD_OPTS = \
 	--executable=/usr/bin/python
 
-PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
+PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--prefix=/usr \
+	--prefix=/usr
+
+PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
+	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
 	--root=$(TARGET_DIR)
 
 PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
-	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--prefix=/usr \
+	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
 	--root=$(STAGING_DIR)
 
 # Host distutils-based packages
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
-	PATH=$(BR_PATH) \
-	PYTHONNOUSERSITE=1 \
-	SETUPTOOLS_USE_DISTUTILS=stdlib \
-	$(HOST_CONFIGURE_OPTS)
+	$(HOST_PKG_PYTHON_ENV) \
+	SETUPTOOLS_USE_DISTUTILS=stdlib
 
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
-	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
-	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
-	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
-	PATH=$(BR_PATH) \
-	$(TARGET_CONFIGURE_OPTS) \
-	PYTHONPATH="$(PYTHON3_PATH)" \
-	PYTHONNOUSERSITE=1 \
-	SETUPTOOLS_USE_DISTUTILS=stdlib \
-	_python_sysroot=$(STAGING_DIR) \
-	_python_prefix=/usr \
-	_python_exec_prefix=/usr
+	$(PKG_PYTHON_ENV) \
+	SETUPTOOLS_USE_DISTUTILS=stdlib
 
-PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
+PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr \
 	--executable=/usr/bin/python \
-	--single-version-externally-managed \
+	--single-version-externally-managed
+
+PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
+	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
 	--root=$(TARGET_DIR)
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
-	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--prefix=/usr \
-	--executable=/usr/bin/python \
-	--single-version-externally-managed \
+	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
 	--root=$(STAGING_DIR)
 
 # Host setuptools-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
-	PATH=$(BR_PATH) \
-	PYTHONNOUSERSITE=1 \
-	SETUPTOOLS_USE_DISTUTILS=stdlib \
-	$(HOST_CONFIGURE_OPTS)
+	$(HOST_PKG_PYTHON_ENV) \
+	SETUPTOOLS_USE_DISTUTILS=stdlib
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR) \
@@ -113,28 +111,21 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 
 # Target pep517-based packages
 PKG_PYTHON_PEP517_ENV = \
-	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
-	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
-	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
-	PATH=$(BR_PATH) \
-	$(TARGET_CONFIGURE_OPTS) \
-	PYTHONPATH="$(PYTHON3_PATH)" \
-	PYTHONNOUSERSITE=1 \
-	_python_sysroot=$(STAGING_DIR) \
-	_python_prefix=/usr \
-	_python_exec_prefix=/usr
+	$(PKG_PYTHON_ENV)
 
-PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
+PKG_PYTHON_PEP517_INSTALL_OPTS = \
 	--interpreter=/usr/bin/python \
-	--script-kind=posix \
+	--script-kind=posix
+
+PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
+	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
 	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(TARGET_DIR)/usr/bin \
 	--data=$(TARGET_DIR)/usr
 
 PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
-	--interpreter=/usr/bin/python \
-	--script-kind=posix \
+	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
 	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(STAGING_DIR)/usr/bin \
@@ -142,9 +133,7 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
 
 # Host pep517-based packages
 HOST_PKG_PYTHON_PEP517_ENV = \
-	PATH=$(BR_PATH) \
-	PYTHONNOUSERSITE=1 \
-	$(HOST_CONFIGURE_OPTS)
+	$(HOST_PKG_PYTHON_ENV)
 
 HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
 	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
